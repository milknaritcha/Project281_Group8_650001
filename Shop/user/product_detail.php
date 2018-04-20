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

$colname_product = "-1";

if (isset($_GET['id'])) {
  $colname_product = $_GET['id'];
}
mysql_select_db($database_mydbshop, $mydbshop);
$query_product = sprintf("SELECT products.pro_id, products.cat_id, products.pro_name, products.price, products.quantity, products.details, products.images, categories.cat_name FROM products, categories WHERE products.cat_id=categories.cat_id  AND products.pro_id=%s", GetSQLValueString($colname_product, "int"));
$product = mysql_query($query_product, $mydbshop) or die(mysql_error());
$row_product = mysql_fetch_assoc($product);
$totalRows_product = mysql_num_rows($product);

mysql_select_db($database_mydbshop, $mydbshop);
$query_products = "SELECT products.pro_id, products.cat_id, products.sup_id, products.pro_name, products.price, products.quantity, products.details, products.images, categories.cat_name FROM products, categories WHERE categories.cat_id=products.cat_id";
$products = mysql_query($query_products, $mydbshop) or die(mysql_error());
$row_products = mysql_fetch_assoc($products);
$totalRows_products = mysql_num_rows($products);
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
		<link href="themes/css/main.css" rel="stylesheet"/>
		<link href="themes/css/jquery.fancybox.css" rel="stylesheet"/>
				
		<!-- scripts -->
		<script src="themes/js/jquery-1.7.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>				
		<script src="themes/js/superfish.js"></script>	
		<script src="themes/js/jquery.scrolltotop.js"></script>
		<script src="themes/js/jquery.fancybox.js"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>		
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					
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
					<a href="index.php" class="logo pull-left"><img src="themes/images/logo.png" class="site_logo" alt=""></a>
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
				<h4><span>Product Detail</span></h4>
			</section>
			<section class="main-content">				
				<div class="row">						
					<div class="span9">
						<div class="row">
							<div class="span4">
								<a href="#" class="thumbnail" data-fancybox-group="group1" title="Description 1"><img alt="" src="../Admin/img-products/<?php echo $row_product['images']; ?>"></a>												
								<ul class="thumbnails small">								
									<li class="span1">
										<a href="themes/images/ladies/2.jpg" class="thumbnail" data-fancybox-group="group1" title="Description 2"><img src="themes/images/ladies/2.jpg" alt=""></a>
									</li>								
									<li class="span1">
										<a href="themes/images/ladies/3.jpg" class="thumbnail" data-fancybox-group="group1" title="Description 3"><img src="themes/images/ladies/3.jpg" alt=""></a>
									</li>													
									<li class="span1">
										<a href="themes/images/ladies/4.jpg" class="thumbnail" data-fancybox-group="group1" title="Description 4"><img src="themes/images/ladies/4.jpg" alt=""></a>
									</li>
									<li class="span1">
										<a href="themes/images/ladies/5.jpg" class="thumbnail" data-fancybox-group="group1" title="Description 5"><img src="themes/images/ladies/5.jpg" alt=""></a>
									</li>
								</ul>
							</div>
							<div class="span5">
                            
								<address>
									<strong>Product Code:</strong> <span>Product <?php echo $row_product['pro_id']; ?></span><br>
									<strong>Availability:</strong> <?php if($row_product['quantity']>0){?><span>In Stock</span><?php }else{?><span>Sold Out</span> <?php }?><br>								
								</address>									
								<h4><strong>Price: ฿<?php echo $row_product['price']; ?></strong></h4>
							</div>
							<div class="span5">
                            <form class="form-inline" action="products.php">
								
									<button class="btn btn-inverse" type="submit">Back</button>
								</form>
							</div>							
						</div>
						<div class="row">
							<div class="span9">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active"><a href="#home">Description</a></li>
									<li class=""><a href="#profile">Additional Information</a></li>
								</ul>							 
								<div class="tab-content">
									<div class="tab-pane active" id="home"><?php echo $row_product['details']; ?></div>
									<div class="tab-pane" id="profile">
										<table class="table table-striped shop_attributes">	
											<tbody>
												<tr class="">
													<th>Size</th>
													<td>Large, Medium, Small, X-Large</td>
												</tr>		
												<tr class="alt">
													<th>Colour</th>
													<td>Orange, Yellow</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>							
							</div>						
							<div class="span9">	
								<br>
								<h4 class="title">
									<span class="pull-left"><span class="text"><strong>Related</strong> Products</span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel-1" data-slide="prev"></a><a class="right button" href="#myCarousel-1" data-slide="next"></a>
									</span>
								</h4>
								<div id="myCarousel-1" class="carousel slide">
									<div class="carousel-inner">
										<div class="active item">
											<ul class="thumbnails listing-products">
												<?php do { if($row_product['pro_id']!=$row_products['pro_id'])?>
                                                	
                                                    <li class="span3">
                                                        <div class="product-box">
                                                          <span class="sale_tag"></span>												
                                                          <a href="product_detail.php?id=<?php echo $row_products['pro_id']; ?>"><img alt="" src="../Admin/img-products/<?php echo $row_products['images']; ?>"></a><br/>
                                                          <a href="product_detail.php?id=<?php echo $row_products['pro_id']; ?>" class="title"><?php echo $row_products['pro_name']; ?></a><br/>
                                                          <a href="#" class="category"><?php echo $row_products['cat_name']; ?></a>
                                                          <p class="price">$<?php echo $row_products['price']; ?></p>
                                                      </div>
                                                    </li>
                                                      <?php } while ($row_products = mysql_fetch_assoc($products)); ?>   
																		
											</ul>
										</div>
										<div class="item">
											<ul class="thumbnails listing-products">
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>												
														<a href="product_detail.php"><img alt="" src="themes/images/ladies/1.jpg"></a><br/>
														<a href="product_detail.php" class="title">Fusce id molestie massa</a><br/>
														<a href="#" class="category">Phasellus consequat</a>
														<p class="price">฿341</p>
													</div>
												</li>       
												<li class="span3">
													<div class="product-box">												
														<a href="product_detail.php"><img alt="" src="themes/images/ladies/2.jpg"></a><br/>
														<a href="product_detail.php">Praesent tempor sem</a><br/>
														<a href="#" class="category">Erat gravida</a>
														<p class="price">฿28</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>												
														<a href="product_detail.php"><img alt="" src="themes/images/ladies/3.jpg"></a><br/>
														<a href="product_detail.php" class="title">Wuam ultrices rutrum</a><br/>
														<a href="#" class="category">Suspendisse aliquet</a>
														<p class="price">฿341</p>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="span3 col">
						<div class="block">	
							<ul class="nav nav-list">
								<li class="nav-header">SUB CATEGORIES</li>
								<li><a href="products.php">Nullam semper elementum</a></li>
								<li class="active"><a href="products.php">Phasellus ultricies</a></li>
								<li><a href="products.php">Donec laoreet dui</a></li>
								<li><a href="products.php">Nullam semper elementum</a></li>
								<li><a href="products.php">Phasellus ultricies</a></li>
								<li><a href="products.php">Donec laoreet dui</a></li>
							</ul>
							<br/>
							<ul class="nav nav-list below">
								<li class="nav-header">MANUFACTURES</li>
								<li><a href="products.php">Adidas</a></li>
								<li><a href="products.php">Nike</a></li>
								<li><a href="products.php">Dunlop</a></li>
								<li><a href="products.php">Yamaha</a></li>
							</ul>
						</div>
						<div class="block">
							<h4 class="title">
								<span class="pull-left"><span class="text">Randomize</span></span>
								<span class="pull-right">
									<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
								</span>
							</h4>
							<div id="myCarousel" class="carousel slide">
								<div class="carousel-inner">
									<div class="active item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">
													<span class="sale_tag"></span>												
													<a href="product_detail.php"><img alt="" src="themes/images/ladies/7.jpg"></a><br/>
													<a href="product_detail.php" class="title">Fusce id molestie massa</a><br/>
													<a href="#" class="category">Suspendisse aliquet</a>
													<p class="price">$261</p>
												</div>
											</li>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">												
													<a href="product_detail.php"><img alt="" src="themes/images/ladies/8.jpg"></a><br/>
													<a href="product_detail.php" class="title">Tempor sem sodales</a><br/>
													<a href="#" class="category">Urna nec lectus mollis</a>
													<p class="price">$134</p>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="block">								
							<h4 class="title"><strong>Best</strong> Seller</h4>								
							<ul class="small-product">
								<li>
									<a href="#" title="Praesent tempor sem sodales">
										<img src="themes/images/ladies/1.jpg" alt="Praesent tempor sem sodales">
									</a>
									<a href="#">Praesent tempor sem</a>
								</li>
								<li>
									<a href="#" title="Luctus quam ultrices rutrum">
										<img src="themes/images/ladies/2.jpg" alt="Luctus quam ultrices rutrum">
									</a>
									<a href="#">Luctus quam ultrices rutrum</a>
								</li>
								<li>
									<a href="#" title="Fusce id molestie massa">
										<img src="themes/images/ladies/3.jpg" alt="Fusce id molestie massa">
									</a>
									<a href="#">Fusce id molestie massa</a>
								</li>   
							</ul>
						</div>
					</div>
				</div>
			</section>			
			<section id="footer-bar">
				<div class="row">
					<div class="span3">
						<h4>Navigation</h4>
						<ul class="nav">
							<li><a href="./index.php">Homepage</a></li>  
							<li><a href="./about.php">About Us</a></li>
							<li><a href="./contact.php">Contac Us</a></li>
							<li><a href="./cart.php">Your Cart</a></li>
							<li><a href="./register.php">Login</a></li>							
						</ul>					
					</div>
					<div class="span4">
						<h4>My Account</h4>
						<ul class="nav">
							<li><a href="#">My Account</a></li>
							<li><a href="#">Order History</a></li>
							<li><a href="#">Wish List</a></li>
							<li><a href="#">Newsletter</a></li>
						</ul>
					</div>
					<div class="span5">
						<p class="logo"><img src="themes/images/logo.png" class="site_logo" alt=""></p>
						<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. the  Lorem Ipsum has been the industry's standard dummy text ever since the you.</p>
						<br/>
						<span class="social_icons">
							<a class="facebook" href="#">Facebook</a>
							<a class="twitter" href="#">Twitter</a>
							<a class="skype" href="#">Skype</a>
							<a class="vimeo" href="#">Vimeo</a>
						</span>
					</div>					
				</div>	
			</section>
			<section id="copyright">
				<span>Copyright 2013 bootstrappage template  All right reserved.</span>
			</section>
		</div>
		<script src="themes/js/common.js"></script>
		<script>
			$(function () {
				$('#myTab a:first').tab('show');
				$('#myTab a').click(function (e) {
					e.preventDefault();
					$(this).tab('show');
				})
			})
			$(document).ready(function() {
				$('.thumbnail').fancybox({
					openEffect  : 'none',
					closeEffect : 'none'
				});
				
				$('#myCarousel-2').carousel({
                    interval: 2500
                });								
			});
		</script>
    </body>
</html>
<?php
mysql_free_result($product);

mysql_free_result($products);
?>
