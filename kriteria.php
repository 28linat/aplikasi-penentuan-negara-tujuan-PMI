<?php 
	require_once('../library/koneksi.php');
	require_once('../model/database.php');
	$connection = new Database($servername, $username, $password, $dbname);
	include "../model/m_kriteria.php";
	$kriteria = new Kriteria($connection);
	
	if(isset($_POST['edit']))
	{
	$kode=$_POST['kode'];
	$nama=$_POST['nama'];
	$kriteria->edit($kode, $nama);
	header("location: ../index.php?pages=d2&pesan=2");
	}
?>