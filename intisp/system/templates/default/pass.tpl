<?php
error_reporting(E_ALL);
/*
 * Adaclare IntISP System
 * Copyright Adaclare Technologies 2007-2018
 * https://www.adaclare.com
 * https://github.com/INTisp
 *
 */

require 'config.php';
//die('update Administrators set username="' .addslashes($_POST["username"]) .'", password="' . md5(addslashes($_POST["password_ch"])) .'" where username=' . $_POST["username"]);
    $con = mysqli_connect($host, $user, $pass, $data);
    $sql = 'update Users set username="'.$_POST['username'].'", password="'.sha1($_POST['password'] . $salt).'" where username="'.$_POST['username'].'"';
    mysqli_query($con, $sql);
   $query = sprintf("SET PASSWORD FOR %s@localhost = PASSWORD('%s');", $_POST['username'], $_POST['password']);
    mysqli_query($con, $query);
    mysqli_close($con);
    function service_send($command) 
{
    $fp = fsockopen("127.0.0.1", 1210, $errno, $errstr, 30);
    if (!$fp) {
        echo "$errstr ($errno)<br />\n";
    } else {
        fwrite($fp, $command);
 
        fclose($fp);
    }
}
service_send("restart");
    header('Location: index.php?page=cp#');