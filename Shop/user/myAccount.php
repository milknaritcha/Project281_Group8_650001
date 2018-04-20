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
	
  $logoutGoTo = "products.php";
  if ($logoutGoTo) {
    header("Location: $logoutGoTo");
    exit;
  }
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Bootstrap E-commerce Templates</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">      
		<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">		
		<link href="themes/css/bootstrappage.css" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="themes/css/flexslider.css" rel="stylesheet"/>
		<link href="themes/css/main.css" rel="stylesheet"/>

		<!-- scripts -->
		<script src="themes/js/jquery-1.7.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>				
		<script src="themes/js/superfish.js"></script>	
		<script src="themes/js/jquery.scrolltotop.js"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
        <?php
		if($_POST) {
					
			$email = $_POST['email'];
			$class = ' class="err"';
			if(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
				echo "<script>alert('รูปแบบของอีเมลไม่ถูกต้อง');window.location='myAccount.php'</script>";
			}
			else {
				if($_POST['subscribe']=="subscribe") {
					$sql = "SELECT COUNT(*) FROM newsletter WHERE email = '$email'";
					$rs = mysql_query($mydbshop, $sql);
					$data = mysql_fetch_array($rs);
					if($data[0] != 0) {
						echo "<script>alert('อีเมลนี้ เป็นสมาชิกอยู่แล้ว');window.location='myAccount.php'</script>";
					}
					else {
						$sql = "INSERT INTO newsletter VALUES('$email', CURRENT_DATE())";
						mysql_query($sql, $mydbshop);
						echo "<script>alert('สมัครรับข่าวสารเสร็จเรียบร้อย');window.location='myAccount.php'</script>";
						$class = "";
					}
				}
				else if($_POST['subscribe']=="unsubscribe") {
					$sql = "DELETE FROM newsletter WHERE email = '$email'";
					echo "<script>alert('ยกเลิกรับข่าวสารเสร็จเรียบร้อย');window.location='myAccount.php'</script>";
					mysql_query($sql, $mydbshop);
				}
			}
			mysql_close($mydbshop);
		}
		?>
	</head>
    <body>		
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<form  class="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="eg. T-sirt">
					</form>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<?php if($_SESSION!=null){?>
                        	<li><a href="myAccount.php">My Account</a></li>		
                        	<?php }?>	
							<li><a href="cart.php">Your Cart</a></li>
							<li><a href="checkout.php">Checkout</a></li>
                            <?php if($_SESSION!=null){?>				
							<li><a href="<?php echo $logoutAction ?>">Logout</a></li>
                            <?php }else{?>
                            <li><a href="register.php">Login</a></li>
                            <?php }?>		
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="index.html" class="logo pull-left"><img src="themes/images//logo.png" class="site_logo" alt=""></a>
					<nav id="menu" class="pull-right">
						<ul>
							<li><a href="products_show.php?id=เสื้อ">shirts</a></li>															
							<li><a href="products_show.php?id=กางเกง">jeans</a></li>			
							<li><a href="products_show.php?id=รองเท้า">shoes</a></li>							
							<li><a href="products_show.php?id=กระเป๋า">bag</a></li>
							<li><a href="products.php">ALL PRODUCTS</a></li>
						</ul>
					</nav>
				</div>
			</section>			
			<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pageBanner.png" alt="New products" >
				<h4><span>NOTIFICATION</span></h4>
			</section>			
			<section class="main-content" >				
				<div class="row">
                				
					<div class="span7" align="center" style="margin-left:250px">					
						<h4 class="title"><span class="text"><strong>Notification</strong> Form</span></h4>
						<form method="POST" class="form-stacked" name="register">
							<fieldset>
								<div class="control-group">
									
									<div class="controls">
										<input name="email" type="text" placeholder="Enter your email" class="input-xlarge">
									</div>
								</div>
								<div class="control-group">
									<div class="controls">
										<input type="radio" name="subscribe" value="subscribe" checked>
                                        <label>สมัครรับข่าวสารทางอีเมล</label>
                                        <input type="radio" name="subscribe" value="unsubscribe">
                                        <label>ยกเลิกรับข่าวสาร</label>
									</div>
								</div>
													                            
								<div class="control-group">
									
								</div>
								<hr>
								<div class="actions"><input tabindex="9" class="btn btn-inverse large" type="submit" value="SAVE"></div>
							</fieldset>
							<input type="hidden" name="MM_insert" value="register">
						</form>					
					</div>				
				</div>
			</section>			
			
			<section id="copyright">
				<span>Copyright 2013 bootstrappage template  All right reserved.</span>
			</section>
		</div>
		<script src="themes/js/common.js"></script>
		<script>
			$(document).ready(function() {
				$('#checkout').click(function (e) {
					document.location.href = "checkout.html";
				})
			});
		</script>		
    </body>
</html>