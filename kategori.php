<?php 
	require_once('library/koneksi.php');
	require_once('model/database.php');
	$connection = new Database($servername, $username, $password, $dbname);
	include "../model/m_kategori.php";
	$kategori = new Kategori($connection);
?>