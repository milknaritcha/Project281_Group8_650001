<?php
//initialize the session
if (!isset($_SESSION)) {
  session_start();
}

// ** Logout the current user. **
$logoutAction = $_SERVER['PHP_SELF']."?doLogout=true";
if ((isset($_SERVER['QUERY_STRING'])) && ($_SERVER['QUERY_STRING'] != "")){
  $logoutAction .="&". htmlentities($_SERVER['QUERY_STRING']);
}

if ((isset($_GET['doLogout'])) &&($_GET['doLogout']=="true")){
  //to fully log out a visitor we need to clear the session varialbles
  $_SESSION['MM_Username'] = NULL;
  $_SESSION['MM_UserGroup'] = NULL;
  $_SESSION['PrevUrl'] = NULL;
  unset($_SESSION['MM_Username']);
  unset($_SESSION['MM_UserGroup']);
  unset($_SESSION['PrevUrl']);
	
  $logoutGoTo = "login.php";
  if ($logoutGoTo) {
    header("Location: $logoutGoTo");
    exit;
  }
}
?>
<?php
if (!isset($_SESSION)) {
  session_start();
}
$MM_authorizedUsers = "admin";
$MM_donotCheckaccess = "false";

// *** Restrict Access To Page: Grant or deny access to this page
function isAuthorized($strUsers, $strGroups, $UserName, $UserGroup) { 
  // For security, start by assuming the visitor is NOT authorized. 
  $isValid = False; 

  // When a visitor has logged into this site, the Session variable MM_Username set equal to their username. 
  // Therefore, we know that a user is NOT logged in if that Session variable is blank. 
  if (!empty($UserName)) { 
    // Besides being logged in, you may restrict access to only certain users based on an ID established when they login. 
    // Parse the strings into arrays. 
    $arrUsers = Explode(",", $strUsers); 
    $arrGroups = Explode(",", $strGroups); 
    if (in_array($UserName, $arrUsers)) { 
      $isValid = true; 
    } 
    // Or, you may restrict access to only certain users based on their username. 
    if (in_array($UserGroup, $arrGroups)) { 
      $isValid = true; 
    } 
    if (($strUsers == "") && false) { 
      $isValid = true; 
    } 
  } 
  return $isValid; 
}

$MM_restrictGoTo = "login.php";
if (!((isset($_SESSION['MM_Username'])) && (isAuthorized("",$MM_authorizedUsers, $_SESSION['MM_Username'], $_SESSION['MM_UserGroup'])))) {   
  $MM_qsChar = "?";
  $MM_referrer = $_SERVER['PHP_SELF'];
  if (strpos($MM_restrictGoTo, "?")) $MM_qsChar = "&";
  if (isset($_SERVER['QUERY_STRING']) && strlen($_SERVER['QUERY_STRING']) > 0) 
  $MM_referrer .= "?" . $_SERVER['QUERY_STRING'];
  $MM_restrictGoTo = $MM_restrictGoTo. $MM_qsChar . "accesscheck=" . urlencode($MM_referrer);
  header("Location: ". $MM_restrictGoTo); 
  exit;
}
?>
<?php require_once('../Connections/mydbshop.php'); ?>
<?php
if (!function_exists("GetSQLValueString")) {
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  if (PHP_VERSION < 6) {
    $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
  }

  $theValue = function_exists("mysql_real_escape_string") ? mysql_real_escape_string($theValue) : mysql_escape_string($theValue);

  switch ($theType) {
    case "text":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;    
    case "long":
    case "int":
      $theValue = ($theValue != "") ? intval($theValue) : "NULL";
      break;
    case "double":
      $theValue = ($theValue != "") ? doubleval($theValue) : "NULL";
      break;
    case "date":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;
    case "defined":
      $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
      break;
  }
  return $theValue;
}
}

$maxRows_products = 10;
$pageNum_products = 0;
if (isset($_GET['pageNum_products'])) {
  $pageNum_products = $_GET['pageNum_products'];
}
$startRow_products = $pageNum_products * $maxRows_products;

mysql_select_db($database_mydbshop, $mydbshop);
$query_products = "SELECT * FROM products";
$query_limit_products = sprintf("%s LIMIT %d, %d", $query_products, $startRow_products, $maxRows_products);
$products = mysql_query($query_limit_products, $mydbshop) or die(mysql_error());
$row_products = mysql_fetch_assoc($products);


if (isset($_GET['totalRows_products'])) {
  $totalRows_products = $_GET['totalRows_products'];
} else {
  $all_products = mysql_query($query_products);
  $totalRows_products = mysql_num_rows($all_products);
}
$totalPages_products = ceil($totalRows_products/$maxRows_products)-1;
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../css/topmenu.css" />
<link rel="stylesheet" href="../css/table.css" />

<title>Shop</title>
</head>

<body>
	<div class="top">
    	<a href="#รายการสินค้า" class="active">รายการสินค้า</a>
        <a href="categories.php">หมวดหมู่สินค้า</a>
        <a href="#โปรโมชั่น">แจ้งโปรโมชั่น</a>
        <a href="#ไปที่ร้านค้า">ไปที่ร้านค้า</a>
        <a href="<?php echo $logoutAction ?>">ออกจากระบบ</a>
    </div>
    <br />
    <br />
	<div class="bodyshop">
    	<div align="center">
        	<a href="addproducts.php"><button type="submit" class="button button1" >เพิ่มรายการสินค้า</button></a>
        </div>
        <br />
        <?php if($row_products['pro_id']!=null){?>
        <div align="center">
      <table>
          <tr>
            <th>รหัสสินค้า</th>
            <th>ชื่อสินค้า</th>
            <th>ราคาสินค้า</th>
            <th>จำนวนสินค้า</th>
            <th>คำสั่ง</th>
          </tr>
          <?php do { ?>
            <tr>
              <td><?php echo $row_products['pro_id']; ?></td>
              <td><?php echo $row_products['pro_name']; ?></td>
              <td><?php echo $row_products['price']; ?></td>
              <td><?php echo $row_products['quantity']; ?></td>
              <td><button type="submit">แก้ไข</button><button type="submit">ลบ</button></td>
            </tr>
            <?php } while ($row_products = mysql_fetch_assoc($products)); ?>
        </table>
        <?php }?>
        </div>
    </div>
</body>
</html>
<?php
mysql_free_result($products);
?>
