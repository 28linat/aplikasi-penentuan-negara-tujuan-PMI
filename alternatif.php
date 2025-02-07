<?php 
	require_once('../library/koneksi.php');
	require_once('../model/database.php');
	$connection = new Database($servername, $username, $password, $dbname);
	include "../model/m_alternatif.php";
	$alternatif = new Alternatif($connection);
	
	if(isset($_POST['edit']))
	{
	$kode=$_POST['kode'];
	$nama=$_POST['nama'];
	$alternatif->edit($kode, $nama);
	header("location: ../index.php?pages=d3&pesan=2");
	}
?>