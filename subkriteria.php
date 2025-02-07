<?php 
	require_once('../library/koneksi.php');
	require_once('../model/database.php');
	$connection = new Database($servername, $username, $password, $dbname);
	include "../model/m_subkriteria.php";
	$subkriteria = new Subkriteria($connection);
	
	if(isset($_POST['edit']))
	{
	$id=$_POST['id'];
	$kode=$_POST['kode'];
	$nama=$_POST['nama'];
	$kategori=$_POST['kategori'];
	$subkriteria->edit($id, $kode, $nama, $kategori);
	header("location: ../index.php?pages=kd2&pesan=2&id=$id");
	}
?>