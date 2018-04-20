<?php require_once('../Connections/mydbshop.php'); ?>
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
	
  $logoutGoTo = "index.php";
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

$MM_restrictGoTo = "index.php";
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

$editFormAction = $_SERVER['PHP_SELF'];
if (isset($_SERVER['QUERY_STRING'])) {
  $editFormAction .= "?" . htmlentities($_SERVER['QUERY_STRING']);
}

if ((isset($_POST["MM_update"])) && ($_POST["MM_update"] == "form1")) {
  $updateSQL = sprintf("UPDATE suppliers SET sup_name=%s, address=%s, phone=%s, contact_name=%s, website=%s WHERE sup_id=%s",
                       GetSQLValueString($_POST['sup_name'], "text"),
                       GetSQLValueString($_POST['address'], "text"),
                       GetSQLValueString($_POST['phone'], "text"),
                       GetSQLValueString($_POST['contact'], "text"),
                       GetSQLValueString($_POST['website'], "text"),
                       GetSQLValueString($_POST['sup_id'], "int"));

  mysql_select_db($database_mydbshop, $mydbshop);
  $Result1 = mysql_query($updateSQL, $mydbshop) or die(mysql_error());

  $updateGoTo = "suppliers.php";
  if (isset($_SERVER['QUERY_STRING'])) {
    $updateGoTo .= (strpos($updateGoTo, '?')) ? "&" : "?";
    $updateGoTo .= $_SERVER['QUERY_STRING'];
  }
  header(sprintf("Location: %s", $updateGoTo));
}

$colname_suppliers = "-1";
if (isset($_GET['id'])) {
  $colname_suppliers = $_GET['id'];
}
mysql_select_db($database_mydbshop, $mydbshop);
$query_suppliers = sprintf("SELECT * FROM suppliers WHERE sup_id = %s", GetSQLValueString($colname_suppliers, "int"));
$suppliers = mysql_query($query_suppliers, $mydbshop) or die(mysql_error());
$row_suppliers = mysql_fetch_assoc($suppliers);
$totalRows_suppliers = mysql_num_rows($suppliers);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/w3.css">
  <script src="../js/jquery.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
  <style>
input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}
</style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="products.php">รายการสินค้า</a></li>
        <li><a href="categories.php">หมวดหมู่สินค้า</a></li>
        <li class="active"><a href="suppliers.php">ผู้จัดส่งสินค้า</a></li>
        <li><a href="send-news.php">แจ้งรายการโปรโมชั่น</a></li>
        <li><a href="../user/index.php">ไปที่ร้านค้า</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<?php echo $logoutAction ?>"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">
<br>
<br>  
  <div class="row content">
    <div class="col-sm-2 sidenav" style="background-color:#FFF">
    </div>
    <div class="col-sm-8 text-center">
   	  <div class="w3-container w3-green">
          <h2>แก้ไขผู้จัดส่งสินค้า</h2>
        </div>
      <form method="post" name="form1" action="<?php echo $editFormAction; ?>" class="w3-container">
        <p>
          <label style="float:left">ชื่อผู้จัดส่งสินค้า</label>
          <input name="sup_name" class="w3-input" type="text" placeholder="กรุณากรอกชือผู้จัดส่งสินค้า" required value="<?php echo $row_suppliers['sup_name']; ?>"></p>
          <p>
          <label style="float:left">ที่อยู่</label>
          <textarea name="address" class="w3-input" type="text" placeholder="กรุณากรอกที่อยู่" rows="5" required><?php echo $row_suppliers['address']; ?></textarea></p>
          <p>
          <label style="float:left">เบอร์โทรศัพท์</label>
          <input name="phone" class="w3-input" type="tel" placeholder="กรุณากรอกเบอร์โทรศัพท์" required value="<?php echo $row_suppliers['phone']; ?>"></p>
          <p>
          <label style="float:left">บุคคลในการติดต่อ</label>
          <input name="contact" class="w3-input" type="text" placeholder="กรุณากรอกชื่อบุคคลในการติดต่อ" required value="<?php echo $row_suppliers['contact_name']; ?>"></p>
          <label style="float:left">เว็บไซต์</label>
          <p>
          <label style="float:left">เว็บไซต์</label>
          <input name="website" class="w3-input" type="text" placeholder="กรุณากรอกเว็บไซต์" value="<?php echo $row_suppliers['website']; ?>"></p>
          <button type="submit" class="w3-btn w3-green">บันทึก</button><button type="button" class="w3-btn w3-red" onClick="window.location.href='suppliers.php'">ยกเลิก</button>
        <input type="hidden" name="MM_update" value="form1">
        <input type="hidden" name="sup_id" value="<?php echo $row_suppliers['sup_id']; ?>">
      </form>
      <p>&nbsp;</p>
    </div>
    <div class="col-sm-2 sidenav" style="background-color:#FFF">
    </div>
  </div>
</div>
</body>
</html>
<?php
mysql_free_result($suppliers);
?>
