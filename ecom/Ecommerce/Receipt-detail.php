<?php 
session_start();
error_reporting(0);
include('includes/config.php');
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- Meta -->
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
	    <meta name="keywords" content="MediaCenter, Template, eCommerce">
	    <meta name="robots" content="all">

	    <title>Receipt Detail</title>
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
	    <link rel="stylesheet" href="assets/css/main.css">
	    <link rel="stylesheet" href="assets/css/green.css">
	    <link rel="stylesheet" href="assets/css/owl.carousel.css">
		<link rel="stylesheet" href="assets/css/owl.transitions.css">
		<!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
		<link href="assets/css/lightbox.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/animate.min.css">
		<link rel="stylesheet" href="assets/css/rateit.css">
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

		<!-- Demo Purpose Only. Should be removed in production -->
		<link rel="stylesheet" href="assets/css/config.css">

		<link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
		<link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
		<link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
		<link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
		<link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		<link rel="shortcut icon" href="assets/images/favicon.ico">
	<script language="javascript" type="text/javascript">
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
 if(popUpWin)
{
if(!popUpWin.closed) popUpWin.close();
}
popUpWin = open(URLStr,'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width='+600+',height='+600+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}

</script>

	</head>
    <body class="cnt-home">
	
		
	
		<!-- ============================================== HEADER ============================================== -->
<header class="header-style-1">
<?php include('includes/top-header.php');?>
<?php include('includes/main-header.php');?>
<?php include('includes/menu-bar.php');?>
</header>
<!-- ============================================== HEADER : END ============================================== -->
<div class="breadcrumb">
	<div class="container">
		<div class="breadcrumb-inner">
			<ul class="list-inline list-unstyled">
				<li><a href="#">Home</a></li>
				<li class='active'>Receipt Detail</li>
			</ul>
		</div><!-- /.breadcrumb-inner -->
	</div><!-- /.container -->
</div><!-- /.breadcrumb -->

<div class="body-content outer-top-xs">
	<div class="container">
		<div class="row inner-bottom-sm">
			<div class="shopping-cart">
				<div class="col-md-12 col-sm-12 shopping-cart-table ">
	<div class="table-responsive">
<form name="cart" method="post">	
<?php 
$orderid=$_GET['id'];
$ret = mysqli_query($con,"select * from orders");
$num=mysqli_num_rows($ret);
$d = 1;
if($num>0)
{
$query=mysqli_query($con,"select orders.price as price ,products.productImage1 as pimg1,products.productName as pname,orders.productId as opid,orders.quantity as qty,products.productPrice as pprice,orders.paymentMethod as paym,orders.orderDate as odate,orders.id as orderid from orders join products on orders.productId=products.id where orders.orderid='$orderid' and orders.paymentMethod is not null");
$cnt=1;
while($row=mysqli_fetch_array($query))
{
$d = $row['orderDate'];
} }  ?>
   <div align="center"><label for="text" style="font-size:30px">Receipt</label></div>
      <table>
      <tr>
      <td width="600px">
      <label for="text" style="font-size:22px">Merchant Services</label><br><label for="text" style="font-size:22px">Shopping Milk</label>
      </td>
      <td>
      <label for="text" style="font-size:22px">Customer details</label><br><label for="text" style="font-size:22px"><?php echo htmlentities($_SESSION['username']);?></label>      </td>
      </tr>
      
      </table>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="cart-romove item">#</th>
               <th class="cart-qty item">Quantity</th>
					<th class="cart-product-name item">Product Name</th>
					<th class="cart-sub-total item">Price Per unit</th>
					<th class="cart-sub-total item">Total Price</th>
				</tr>
			</thead><!-- /thead -->
			
			<tbody>
<?php 
$orderid=$_GET['id'];
$ret = mysqli_query($con,"select * from orders");
$num=mysqli_num_rows($ret);
$p = 0;
if($num>0)
{
$query=mysqli_query($con,"select orders.price as price ,products.productImage1 as pimg1,products.productName as pname,orders.productId as opid,orders.quantity as qty,products.productPrice as pprice,orders.paymentMethod as paym,orders.orderDate as odate,orders.id as orderid from orders join products on orders.productId=products.id where orders.orderid='$orderid' and orders.paymentMethod is not null");
$cnt=1;
$v = 0;
while($row=mysqli_fetch_array($query))
{
?>
				<tr>
					<td><?php echo $cnt;?></td>
					<td class="cart-product-quantity">
						<?php echo $qty=$row['qty']; ?>   
		            </td>
					<td class="cart-product-name-info">
						<h4 class='cart-product-description'><a href="product-details.php?pid=<?php echo $row['opid'];?>">
						<?php echo $row['pname'];?></a></h4>
						
						
					</td>
					<td class="cart-product-sub-total"><?php echo $price=$row['pprice']; ?>  </td>
					<td class="cart-product-sub-total"><?php echo $price=$row['pprice']*$row['qty']; ?>  </td>
               <?php $p += ($row['pprice']*$row['qty']);$v += (($row['pprice']*$row['qty'])*7/100)?>
				</tr>
<?php $cnt=$cnt+1;} } else { ?>
				<tr><td colspan="8">Either order id is invalid</td></tr>
				<?php } ?>
			</tbody><!-- /tbody -->
		</table><!-- /table --><div class="col-md-4 col-sm-12 estimate-ship-tax">
	</div>
</div>


<div class="col-md-4 col-sm-12 estimate-ship-tax">
	<table class="table table-bordered" hidden="hidden">
		<thead>
			<tr >
				<th>
					
				</th>
			</tr>
		</thead>
		<tbody>
				<tr >
					<td>
						<div class="form-group">
						
		
						</div>
					
					</td>
				</tr>
		</tbody><!-- /tbody -->
	</table><!-- /table -->
</div>
<div class="col-md-4 col-sm-12 cart-shopping-total">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>
					
					<div class="cart-grand-total">
					Price<span class="inner-left-md"><?php echo ($p); ?></span><br>
               Vat 7%<span class="inner-left-md"><?php echo $v; ?></span><br>
                  Price Total<span class="inner-left-md"><?php echo ($p+$v); ?></span>
					</div>
				</th>
			</tr>
		</thead><!-- /thead -->
	</table>
</div>			</div>
		</div> 

		</div><!-- /.shopping-cart -->
		</div> <!-- /.row -->
		</form>
		<!-- ============================================== BRANDS CAROUSEL ============================================== -->
<?php echo include('includes/brands-slider.php');?>
<!-- ============================================== BRANDS CAROUSEL : END ============================================== -->	</div><!-- /.container -->
</div><!-- /.body-content -->
<?php include('includes/footer.php');?>

	<script src="assets/js/jquery-1.11.1.min.js"></script>
	
	<script src="assets/js/bootstrap.min.js"></script>
	
	<script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	
	<script src="assets/js/echo.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
	<script src="assets/js/bootstrap-slider.min.js"></script>
    <script src="assets/js/jquery.rateit.min.js"></script>
    <script type="text/javascript" src="assets/js/lightbox.min.js"></script>
    <script src="assets/js/bootstrap-select.min.js"></script>
    <script src="assets/js/wow.min.js"></script>
	<script src="assets/js/scripts.js"></script>

	<!-- For demo purposes � can be removed on production -->
	
	<script src="switchstylesheet/switchstylesheet.js"></script>
	
	<script>
		$(document).ready(function(){ 
			$(".changecolor").switchstylesheet( { seperator:"color"} );
			$('.show-theme-options').click(function(){
				$(this).parent().toggleClass('open');
				return false;
			});
		});

		$(window).bind("load", function() {
		   $('.show-theme-options').delay(2000).trigger('click');
		});
	</script>
	<!-- For demo purposes � can be removed on production : End -->
</body>
</html>