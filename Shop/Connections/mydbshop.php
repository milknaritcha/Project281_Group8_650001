<?php
# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
$hostname_mydbshop = "localhost";
$database_mydbshop = "mydbshop";
$username_mydbshop = "root";
$password_mydbshop = "";
$mydbshop = mysql_pconnect($hostname_mydbshop, $username_mydbshop, $password_mydbshop) or trigger_error(mysql_error(),E_USER_ERROR); 
?>