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

$currentPage = $_SERVER["PHP_SELF"];

$maxRows_categories = 10;
$pageNum_categories = 0;
if (isset($_GET['pageNum_categories'])) {
  $pageNum_categories = $_GET['pageNum_categories'];
}
$startRow_categories = $pageNum_categories * $maxRows_categories;

mysql_select_db($database_mydbshop, $mydbshop);
$query_categories = "SELECT * FROM categories";
$query_limit_categories = sprintf("%s LIMIT %d, %d", $query_categories, $startRow_categories, $maxRows_categories);
$categories = mysql_query($query_limit_categories, $mydbshop) or die(mysql_error());
$row_categories = mysql_fetch_assoc($categories);

if (isset($_GET['totalRows_categories'])) {
  $totalRows_categories = $_GET['totalRows_categories'];
} else {
  $all_categories = mysql_query($query_categories);
  $totalRows_categories = mysql_num_rows($all_categories);
}
$totalPages_categories = ceil($totalRows_categories/$maxRows_categories)-1;

$queryString_categories = "";
if (!empty($_SERVER['QUERY_STRING'])) {
  $params = explode("&", $_SERVER['QUERY_STRING']);
  $newParams = array();
  foreach ($params as $param) {
    if (stristr($param, "pageNum_categories") == false && 
        stristr($param, "totalRows_categories") == false) {
      array_push($newParams, $param);
    }
  }
  if (count($newParams) != 0) {
    $queryString_categories = "&" . htmlentities(implode("&", $newParams));
  }
}
$queryString_categories = sprintf("&totalRows_categories=%d%s", $totalRows_categories, $queryString_categories);
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
        <li class="active"><a href="categories.php">หมวดหมู่สินค้า</a></li>
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
    <?php if($row_categories!=null){?>
    <label style="float:left">สินค้าลำดับที่ <?php echo ($startRow_categories + 1) ?> - <?php echo min($startRow_categories + $maxRows_categories, $totalRows_categories) ?> จาก <?php echo $totalRows_categories ?> (ทั้งหมด)</label>
    <?php }?>
    <button class="w3-button w3-green" style="float:right" type="button" onClick="window.location.href='categories-add.php'">เพิ่มหมวดหมู่</button>
    <br>
    <br>
    <?php if($row_categories!=null){?>
    <div class="w3-container">
          <table class="w3-table-all">
            <thead>
              <tr class="w3-green">
                <th><label>ลำดับหมวดหมู่</label></th>
                <th><label>ชื่อหมวดหมู่</label></th>
                <th><label>คำสั่ง</label></th>
              </tr>
            </thead>
            <?php do { ?>
            <tr>
              <td><label><?php echo $row_categories['cat_id']; ?></label></td>
              <td><label><?php echo $row_categories['cat_name']; ?></label></td>
              <td><button class="w3-button w3-gray" type="button" onClick="window.location.href='categories-edit.php?id=<?php echo $row_categories['cat_id']; ?>'">แก้ไข</button><button class="w3-button w3-red" onClick="window.location.href='categories-delete.php?id=<?php echo $row_categories['cat_id']; ?>'">ลบ</button></td>
            </tr>
              <?php } while ($row_categories = mysql_fetch_assoc($categories)); ?>
          </table>
      </div>
      <br>
      <br>
      <div class="w3-bar">
      <label>หน้าที่ :</label>
      <?php if ($pageNum_categories > 0) { // Show if not first page ?>
            <a href="<?php printf("%s?pageNum_categories=%d%s", $currentPage, max(0, $pageNum_categories - 1), $queryString_categories); ?>" class="w3-button w3-hover-green">&laquo;</a>
            <?php } // Show if not first page ?>
      <?php 
	  for($i = 0;$i<=$totalPages_categories;$i++){
		  echo '<a href="?pageNum_categories=',$i,'" class="w3-button w3-hover-green">',($i+1) ,'</a>';
	  }
	  ?>
	  <?php if ($pageNum_categories < $totalPages_categories) { // Show if not last page ?>
            <a href="<?php printf("%s?pageNum_categories=%d%s", $currentPage, min($totalPages_categories, $pageNum_categories + 1), $queryString_categories); ?>" class="w3-button w3-hover-green">&raquo;</a>
            <?php } // Show if not last page ?>
      </div>
<?php }?>
	<br>
    <br>
    </div>
    <div class="col-sm-2 sidenav" style="background-color:#FFF">
    </div>
  </div>
</div>
</body>
</html>
<?php
mysql_free_result($categories);
?>
