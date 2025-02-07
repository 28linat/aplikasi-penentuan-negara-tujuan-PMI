<?php
	if(isset($_POST['login'])) {
	//mengaktifkan session php
	session_start();
	 
	// menghubungkan dengan koneksi
	include 'library/koneksi.php';
	 
	// menangkap data yang dikirim dari form
	$username = $_POST['username'];
	$password = $_POST['password'];
	 
	// menyeleksi data admin dengan username dan password yang sesuai
	$perintah=mysqli_query($conn,"select * from user where username='$username' and password='$password'");
	
	// mengambil data yang ditemukan
	$baris=mysqli_fetch_array($perintah);
	
	//memeriksa username dan password
	if ($baris['username']==$username && $baris['password']==$password && !empty($username) && !empty($password))
	{
		$_SESSION['id_user'] = $baris['id_user'];
		echo "<script>alert('Login berhasil')</script>";
		echo"<script>location.href='index.php'</script>";
	}
	else
	{
		echo "<script>alert('Nama user atau kata sandi Salah')</script>";
		echo"<script>location.href='login.php'</script>";
	}
	}
?>