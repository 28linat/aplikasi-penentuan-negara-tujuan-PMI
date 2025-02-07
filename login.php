<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Halaman Login</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="library/plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="library/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="library/dist/css/adminlte.min.css">
  <link rel="shortcut icon" href="library/dist/img/choice.png">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <center><img src="library/dist/img/choice.png" width="200" height="200"><br><br></center>
  <div class="card card-inline card-success">
    <div class="card-header text-center">
      <a href="#" class="h5"><b>SPK Penentuan Negara Tujuan TKI menggunakan metode AHP</b></a>
    </div>
    <div class="card-body">
      <p class="login-box-msg h5"><b>Halaman Login</b></p>

      <form method="post" action="login_proses.php">
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="username" placeholder="nama user">
          <div class="input-group-append">
            <div class="input-group-text"><span class="fas fa-user"></span></div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="password" placeholder="kata sandi">
          <div class="input-group-append">
            <div class="input-group-text"><span class="fas fa-lock"></span></div>
          </div>
        </div>
        <div class="row">
          <div class="col-8"></div>
          <div class="col-4"><button type="submit" class="btn btn-success btn-block" name="login"><i class="nav-icon fas fa-sign-in-alt"></i> Masuk</button></div>
        </div>
      </form>
      <p class="mb-1">
        <a href="../index.php">Kembali Ke Halaman Utama</a>
    </div>
  </div>
</div>

<script src="library/plugins/jquery/jquery.min.js"></script>
<script src="library/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="library/dist/js/adminlte.min.js"></script>
</body>
</html>