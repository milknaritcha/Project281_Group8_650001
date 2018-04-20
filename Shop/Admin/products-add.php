<?php require_once('../Connections/mydbshop.php'); ?>
<?php include("dw-upload.inc.php"); ?>
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

if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "insert")) {
  $insertSQL = sprintf("INSERT INTO products (cat_id, sup_id, pro_name, price, quantity, details, images) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                       GetSQLValueString($_POST['cat_id'], "int"),
                       GetSQLValueString($_POST['sup_id'], "int"),
                       GetSQLValueString($_POST['pro_name'], "text"),
                       GetSQLValueString($_POST['price'], "int"),
                       GetSQLValueString($_POST['quantity'], "int"),
                       GetSQLValueString($_POST['details'], "text"),
                       GetSQLValueString(dwUpload($_FILES['images']), "text"));

  mysql_select_db($database_mydbshop, $mydbshop);
  $Result1 = mysql_query($insertSQL, $mydbshop) or die(mysql_error());

  $insertGoTo = "products.php";
  if (isset($_SERVER['QUERY_STRING'])) {
    $insertGoTo .= (strpos($insertGoTo, '?')) ? "&" : "?";
    $insertGoTo .= $_SERVER['QUERY_STRING'];
  }
  header(sprintf("Location: %s", $insertGoTo));
}

$maxRows_products = 1;
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

mysql_select_db($database_mydbshop, $mydbshop);
$query_categories = "SELECT * FROM categories";
$categories = mysql_query($query_categories, $mydbshop) or die(mysql_error());
$row_categories = mysql_fetch_assoc($categories);
$totalRows_categories = mysql_num_rows($categories);

mysql_select_db($database_mydbshop, $mydbshop);
$query_suppliers = "SELECT * FROM suppliers";
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
        <li class="active"><a href="products.php">รายการสินค้า</a></li>
        <li><a href="categories.php">หมวดหมู่สินค้า</a></li>
        <li><a href="suppliers.php">ผู้จัดส่งสินค้า</a></li>
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
          <h2>เพิ่มรายการสินค้า</h2>
        </div>
      <form method="POST" action="<?php echo $editFormAction; ?>" name="insert" class="w3-container" enctype="multipart/form-data">
          <p>
          <label style="float:left">ชื่อรายการสินค้า</label>
          <input name="pro_name" class="w3-input" type="text" placeholder="กรุณากรอกชื่อรายการสินค้า" required></p>
          <p>
          <label style="float:left">หมวดหมู่สินค้า</label>
            <select name="cat_id" class="w3-input" >
              <option value="null" selected>กรุณาเลือกหมวดหมู่</option>
			  <?php do { ?>
              <option value="<?php echo $row_categories['cat_id']; ?>"><?php echo $row_categories['cat_name']; ?></option>
			  <?php } while ($row_categories = mysql_fetch_assoc($categories)); ?>
          </select></p>
        <p>
          <label style="float:left">ผู้จัดส่งสินค้า</label>
            <select name="sup_id" class="w3-input" >
              <option value="null" selected>กรุณาเลือกผู้จัดส่งสินค้า</option>
                <?php do { ?>
              <option value="<?php echo $row_suppliers['sup_id']; ?>"><?php echo $row_suppliers['sup_name']; ?></option>
                <?php } while ($row_suppliers = mysql_fetch_assoc($suppliers)); ?>
            </select></p>
            <p>
          <label style="float:left">ราคาสินค้า</label>
          <input name="price" class="w3-input" type="text" placeholder="กรุณากรอกราคาสินค้า" required></p>
           <p>
          <label style="float:left">จำนวนสินค้า</label>
          <input name="quantity" class="w3-input" type="text" placeholder="กรุณากรอกจำนวนสินค้า" required></p>
           <p>
          <label style="float:left">รายละเอียดสินค้า</label>
          <textarea name="details" class="w3-input" type="text" placeholder="กรุณากรอกรายละเอียดสินค้า" ></textarea></p>
          <p>
          <label style="float:left">รูปภาพสินค้า</label>
          <input name="images" class="w3-input" type="file" placeholder="กรุณากรอกรายละเอียดสินค้า" ></p>
        <input type="hidden" name="MM_insert" value="insert">
          <button type="submit" class="w3-btn w3-green">บันทึก</button><button type="button" class="w3-btn w3-red" onClick="window.location.href='products.php'">ยกเลิก</button>
        </form>
    </div>
    <div class="col-sm-2 sidenav" style="background-color:#FFF">
    </div>
  </div>
</div>
</body>
</html>
<?php
mysql_free_result($products);

mysql_free_result($categories);

mysql_free_result($suppliers);
?>
