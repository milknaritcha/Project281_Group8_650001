<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<?php
mysql_connect("localhost","root","");
			mysql_select_db("mydbshop");
			$strSQL = "SELECT email FROM user";
			$objQuery = mysql_query($strSQL);
			while($objResult = mysql_fetch_array($objQuery)){
				$emailto=''.$objResult["email"]; //อีเมล์ผู้รับ<br>
				$subject=$_POST['subject']; //หัวข้อ<br>
				$header= "Content-type: text/html; charset=utf-8\n";
				$header.="from: gg"; //ชื่อและอีเมลผู้ส่ง<br>
				$messages = $_POST['body']."<br>"; //ข้อความ<br>
				
				$send_mail = mail($emailto,$subject,$messages,$header);
				if(!$send_mail)
				{
				echo"ยังไม่สามารถส่งเมลล์ได้ในขณะนี้";
				}
				else
				{
				echo "ส่งเมลล์สำเร็จ";
				}
			}
			 header("Location: send-news.php");
?>
</body>
</html>