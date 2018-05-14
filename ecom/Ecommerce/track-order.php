<?php
session_start();
include_once 'includes/config.php';
$oid=intval($_GET['oid']);
$pay = $_GET['pay'];

if(strlen($_SESSION['login'])==0)
    {   
header('location:login.php');
}
else{
	if (isset($_POST['paypal'])) {
		
   $order = $_POST['oderid'];
   $user = $_POST['userid'];
   $tran = $_POST['tran'];
   $sql = mysqli_query($con,"SELECT * FROM transactionpaypal WHERE orderid='$order'");
   $num=mysqli_num_rows($sql);
   if($num>0){
	$sql = mysqli_query($con,"UPDATE `transactionpaypal` SET `tran`='$tran' WHERE orderid='$order'");
   }else{
   	$sql=mysqli_query($con,"INSERT INTO `transactionpaypal`(`id`, `orderid`, `userid`, `tran`) VALUES ('',$order,$user,'$tran')");
   }
     
	}
   if (isset($_POST['bank'])) {
   $order = $_POST['oderid'];
   $user = $_POST['userid'];
   $date = $_POST['date'];
   $time = $_POST['time'];
   $sql = mysqli_query($con,"SELECT * FROM transactionbank WHERE orderid='$order'");
   $num=mysqli_num_rows($sql);
   if($num>0){
	$sql = mysqli_query($con,"UPDATE `transactionbank` SET `date`='$date',`time`='$time' WHERE orderid='$order'");
   }else{ 
   $sql=mysqli_query($con,"INSERT INTO `transactionbank`(`id`, `orderid`, `userid`, `date`, `time`) VALUES ('',$order,$user,'$date','$time')");
  }
     
	}
   }
?>
<script language="javascript" type="text/javascript">
function f2()
{
window.close();
}ser
function f3()
{
window.print(); 
}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Order Tracking Details</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="anuj.css" rel="stylesheet" type="text/css">
</head>
<body>

<?php if($pay=="Paypal"){?>
   <div style="margin-left:50px;">
<?php 
$ret = mysqli_query($con,"SELECT * FROM orders WHERE orderid='$oid'");
while($row=mysqli_fetch_array($ret)){
   
}
?>
 <form name="updateticket" id="updateticket" method="post"> 
<table width="100%" border="0" cellspacing="0" cellpadding="0">

    <tr height="50">
      <td colspan="2" class="fontkink2" style="padding-left:0px;"><div class="fontpink2"> <b>Payment notification</b></div></td>
      
    </tr>
    <tr height="30">
      <td  class="fontkink1"><b>order Id:</b></td>
      <td  class="fontkink"><?php echo ($oid+1000);?></td>
    </tr>
    <?php 
$ret = mysqli_query($con,"SELECT * FROM orders WHERE orderid='$oid'");
$num=mysqli_num_rows($ret);
if($num>0)
{
$cn = -1;
while($row=mysqli_fetch_array($ret))
      {
      if($row['orderid']!=$cn){
         $cn = $row['orderid'];
     
     ?>
		<?php if($row['paymentMethod']=="Paypal"){?>
        <div >
           <tr> 
           <td>
            <label>Transaction ID</label>
            <input type="text" name="tran">
            <input type="text" name="oderid" value="<?php echo $row['orderid'];?>" hidden="hidden">
            <input type="text" name="userid" value="<?php echo $row['userId'];?>" hidden="hidden">
            </td>
            
      </tr>
        </div>
		<?php }?>
   <?php  }
      }
}
   ?>

</table>
<button type="submit" name="paypal" class="btn">Save</button>
 </form>
</div>
<?php }else { ?>
<div style="margin-left:50px;">
<?php 
$ret = mysqli_query($con,"SELECT * FROM orders WHERE orderid='$oid'");
while($row=mysqli_fetch_array($ret)){
   
}
?>
 <form name="updateticket" id="updateticket" method="post"> 
<table width="100%" border="0" cellspacing="0" cellpadding="0">

    <tr height="50">
      <td colspan="2" class="fontkink2" style="padding-left:0px;"><div class="fontpink2"> <b>Payment notification</b></div></td>
      
    </tr>
    <tr height="30">
      <td  class="fontkink1"><b>order Id:</b></td>
      <td  class="fontkink"><?php echo ($oid+1000);?></td>
    </tr>
    <?php 
$ret = mysqli_query($con,"SELECT * FROM orders WHERE orderid='$oid'");
$num=mysqli_num_rows($ret);
if($num>0)
{
$cn = -1;
while($row=mysqli_fetch_array($ret))
      {
      if($row['orderid']!=$cn){
         $cn = $row['orderid'];
     
     ?>
		<?php if($row['paymentMethod']=="Banking"){?>
        <div >
           <tr> 
           <td>
            <label>Date: </label>
            <input type="date" name="date"><br>
            <label>Time: </label>
            <input type="text" name="time">
            <input type="text" name="oderid" value="<?php echo $row['orderid'];?>" hidden="hidden">
            <input type="text" name="userid" value="<?php echo $row['userId'];?>" hidden="hidden">
            </td>
            
      </tr>
        </div>
		<?php }?>
   <?php  }
      } }

   ?>

</table>
<button type="submit" name="bank" class="btn">Save</button>
 </form>
</div>
<?php }
?>

</body>
</html>