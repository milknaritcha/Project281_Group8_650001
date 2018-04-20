<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
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
</body>
</html>