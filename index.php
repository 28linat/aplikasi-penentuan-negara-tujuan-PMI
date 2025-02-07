<?php
error_reporting (0);
include ("library/koneksi.php");
require_once('model/database.php');
$connection = new Database($servername, $username, $password, $dbname);
date_default_timezone_set('Asia/Jakarta');
session_start();
if (empty($_SESSION['id_user'])) {
	echo"<script>location.href='login.php'</script>";}
else{
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> SPK | AHP</title>
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="library/plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="library/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="library/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="library/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <link rel="stylesheet" href="library/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="library/plugins/select2/css/select2.min.css">
  <!-- summernote -->
  <link rel="stylesheet" href="library/plugins/summernote/summernote-bs4.min.css">
  <link rel="shortcut icon" href="library/dist/img/choice.png">
</head>
<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper">
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto"><strong>Sistem Pendukung Keputusan Penentuan Negara Tujuan TKI menggunakan metode AHP</strong></ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="index.php" class="brand-link">
      <img src="library/dist/img/choice.png" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">SPK AHP</span>
    </a>
    <div class="sidebar">
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item">
            <a href="index.php" class="nav-link <?php if($_GET['pages']=="") echo "active"; ?>"><i class="nav-icon fas fa-home"></i><p> Beranda</p></a>
          </li>

          <li class="nav-item <?php if($_GET['pages']=="d1" || $_GET['pages']=="td1" || $_GET['pages']=="ed1" || $_GET['pages']=="d2" || $_GET['pages']=="td2" 
              || $_GET['pages']=="ed2" || $_GET['pages']=="d3" || $_GET['pages']=="td3" || $_GET['pages']=="ed3" || $_GET['pages']=="d4" || $_GET['pages']=="td4" 
              || $_GET['pages']=="ed4" || $_GET['pages']=="kd2" || $_GET['pages']=="tkd2" || $_GET['pages']=="ekd2") echo "menu-open"; ?>">
            <a href="#" class="nav-link <?php if($_GET['pages']=="d1" || $_GET['pages']=="td1" || $_GET['pages']=="ed1" || $_GET['pages']=="d2" || $_GET['pages']=="td2" 
              || $_GET['pages']=="ed2" || $_GET['pages']=="d3" || $_GET['pages']=="td3" || $_GET['pages']=="ed3" || $_GET['pages']=="d4" || $_GET['pages']=="td4" 
              || $_GET['pages']=="ed4" || $_GET['pages']=="kd2" || $_GET['pages']=="tkd2" || $_GET['pages']=="ekd2") echo "active"; ?>">
              <i class="nav-icon fas fa-folder-open"></i><p>Menu master <i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="?pages=d1" class="nav-link <?php if($_GET['pages']=="d1" || $_GET['pages']=="td1" || $_GET['pages']=="ed1") echo "active"; ?>">
                  <i class="far fa-circle nav-icon"></i><p>Data Nilai</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="?pages=d4" class="nav-link <?php if($_GET['pages']=="d4" || $_GET['pages']=="td4" || $_GET['pages']=="ed4") echo "active"; ?>">
                  <i class="far fa-circle nav-icon"></i><p>Data Kategori Nilai</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="?pages=d2" class="nav-link <?php if($_GET['pages']=="d2" || $_GET['pages']=="td2" || $_GET['pages']=="ed2" || $_GET['pages']=="kd2"
                 || $_GET['pages']=="tkd2" || $_GET['pages']=="ekd2") echo "active"; ?>">
                  <i class="far fa-circle nav-icon"></i><p>Data Kriteria</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="?pages=d3" class="nav-link <?php if($_GET['pages']=="d3" || $_GET['pages']=="td3" || $_GET['pages']=="ed3") echo "active"; ?>">
                  <i class="far fa-circle nav-icon"></i><p>Data Alternatif</p>
                </a>
              </li>
            </ul>
          </li>

          <li class="nav-item">
            <a href="?pages=kuesioner" class="nav-link <?php if($_GET['pages']=="kuesioner") echo "active"; ?>"><i class="nav-icon fas fa-edit"></i><p> Kuesioner</p></a>
          </li>
          <li class="nav-item">
            <a href="?pages=kuesionerdata" class="nav-link <?php if($_GET['pages']=="kuesionerdata" || $_GET['pages']=="kuesionerhasil") echo "active"; ?>"><i class="nav-icon fas fa-file"></i><p> Data Kuesioner</p></a>
          </li>
          
          <li class="nav-item <?php if($_GET['pages']=="analisakriteria" || $_GET['pages']=="analisakriteriahasil" || $_GET['pages']=="analisasubkriteria" || $_GET['pages']=="analisasubkriteriahasil" 
          || $_GET['pages']=="analisaalternatif" || $_GET['pages']=="rangking") echo "menu-open"; ?>">
            <a href="#" class="nav-link <?php if($_GET['pages']=="analisakriteria" || $_GET['pages']=="analisaalternatif" || $_GET['pages']=="rangking") echo "active"; ?>">
              <i class="nav-icon fas fa-keyboard"></i><p>Analisis Data <i class="right fas fa-angle-left"></i></p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="?pages=analisakriteria" class="nav-link <?php if($_GET['pages']=="analisakriteria" || $_GET['pages']=="analisakriteriahasil") echo "active"; ?>">
                  <i class="far fa-circle nav-icon"></i><p>Analisa Kriteria</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="?pages=analisasubkriteria" class="nav-link <?php if($_GET['pages']=="analisasubkriteria" || $_GET['pages']=="analisasubkriteriahasil") echo "active"; ?>">
                  <i class="far fa-circle nav-icon"></i><p>Analisa Sub Kriteria</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="?pages=analisaalternatifhasil" class="nav-link <?php if($_GET['pages']=="analisaalternatif" || $_GET['pages']=="analisaalternatifhasil") echo "active"; ?>">
                  <i class="far fa-circle nav-icon"></i><p>Analisa Alternatif</p>
                </a>
              </li>
              <!--<li class="nav-item">
                <a href="?pages=rangking" class="nav-link <?php if($_GET['pages']=="rangking") echo "active"; ?>">
                  <i class="far fa-circle nav-icon"></i><p>Rangking</p>
                </a>
              </li>-->
            </ul>
          </li>
          <li class="nav-item"> <a href="logout.php" class="nav-link" onClick="return confirm ('Apakah anda yakin ingin keluar aplikasi ?')"><i class="nav-icon fas fa-sign-out-alt"></i><p> Keluar</p></a></li>
          
        </ul>
      </nav>
    </div>
  </aside>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <?php 
		if($_GET['pages']=="d1")
		include "view/d1/data.php";
		else if($_GET['pages']=="td1")
		include "view/d1/add.php";
		else if($_GET['pages']=="ed1")
		include "view/d1/edit.php";

    else if($_GET['pages']=="d2")
		include "view/d2/data.php";
		else if($_GET['pages']=="td2")
		include "view/d2/add.php";
		else if($_GET['pages']=="ed2")
		include "view/d2/edit.php";
    else if($_GET['pages']=="kd2")
		include "view/d2/subkriteria.php";
    else if($_GET['pages']=="tkd2")
		include "view/d2/subkriteria_tambah.php";
    else if($_GET['pages']=="ekd2")
		include "view/d2/subkriteria_edit.php";

    else if($_GET['pages']=="d3")
		include "view/d3/data.php";
		else if($_GET['pages']=="td3")
		include "view/d3/add.php";
		else if($_GET['pages']=="ed3")
		include "view/d3/edit.php";

    else if($_GET['pages']=="d4")
		include "view/d4/data.php";
		else if($_GET['pages']=="td4")
		include "view/d4/add.php";
		else if($_GET['pages']=="ed4")
		include "view/d4/edit.php";

    else if($_GET['pages']=="kuesioner")
		include "view/kuesioner/kuesioner_form.php";
    else if($_GET['pages']=="kuesionerdata")
		include "view/kuesioner/kuesioner_data.php";
    else if($_GET['pages']=="kuesionerhasil")
		include "view/kuesioner/kuesioner_hasil.php";

    else if($_GET['pages']=="analisakriteria")
		include "view/analisis/analisakriteria_data.php";
    else if($_GET['pages']=="analisakriteriahasil")
		include "view/analisis/analisakriteria_hasil.php";
    
    else if($_GET['pages']=="analisasubkriteria")
		include "view/analisis/analisasubkriteria_data.php";
    else if($_GET['pages']=="analisasubkriteriahasil")
		include "view/analisis/analisasubkriteria_hasil.php";

    else if($_GET['pages']=="analisaalternatif")
		include "view/analisis/alternatif_proses.php";
    else if($_GET['pages']=="analisaalternatifhasil")
		include "view/analisis/alternatif_hasil.php";

    else if($_GET['pages']=="rangking")
		include "view/analisis/rangking.php";

		else include "view/home.php";
		?>

  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer"></footer>
  <aside class="control-sidebar control-sidebar-dark"></aside>
</div>

<!-- jQuery -->
<script src="library/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="library/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="library/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="library/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="library/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="library/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="library/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="library/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="library/plugins/jszip/jszip.min.js"></script>
<script src="library/plugins/pdfmake/pdfmake.min.js"></script>
<script src="library/plugins/pdfmake/vfs_fonts.js"></script>
<script src="library/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="library/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="library/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="library/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="library/dist/js/demo.js"></script>
<!-- Page specific script -->
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
<!-- Ekko Lightbox -->
<script src="library/plugins/ekko-lightbox/ekko-lightbox.min.js"></script>
<!-- Page specific script -->
<script>
  $(function () {
    $(document).on('click', '[data-toggle="lightbox"]', function(event) {
      event.preventDefault();
      $(this).ekkoLightbox({
        alwaysShowClose: true
      });
    });

    $('.filter-container').filterizr({gutterPixels: 3});
    $('.btn[data-filter]').on('click', function() {
      $('.btn[data-filter]').removeClass('active');
      $(this).addClass('active');
    });
  })
</script>
<script src="library/plugins/select2/js/select2.full.min.js"></script>
<!-- Summernote -->
<script src="library/plugins/summernote/summernote-bs4.min.js"></script>
<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })
	
	// Summernote
    $('#summernote').summernote()

    // CodeMirror
    CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
      mode: "htmlmixed",
      theme: "monokai"
    });

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date range picker
    $('#reservationdate').datetimepicker({
        format: 'L'
    });
    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({
      timePicker: true,
      timePickerIncrement: 30,
      locale: {
        format: 'MM/DD/YYYY hh:mm A'
      }
    })
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //Timepicker
    $('#timepicker').datetimepicker({
      format: 'LT'
    })

    //Bootstrap Duallistbox
    $('.duallistbox').bootstrapDualListbox()

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    $('.my-colorpicker2').on('colorpickerChange', function(event) {
      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    })

    $("input[data-bootstrap-switch]").each(function(){
      $(this).bootstrapSwitch('state', $(this).prop('checked'));
    })

  })
  // BS-Stepper Init
  document.addEventListener('DOMContentLoaded', function () {
    window.stepper = new Stepper(document.querySelector('.bs-stepper'))
  })

  // DropzoneJS Demo Code Start
  Dropzone.autoDiscover = false

  // Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
  var previewNode = document.querySelector("#template")
  previewNode.id = ""
  var previewTemplate = previewNode.parentNode.innerHTML
  previewNode.parentNode.removeChild(previewNode)

  var myDropzone = new Dropzone(document.body, { // Make the whole body a dropzone
    url: "/target-url", // Set the url
    thumbnailWidth: 80,
    thumbnailHeight: 80,
    parallelUploads: 20,
    previewTemplate: previewTemplate,
    autoQueue: false, // Make sure the files aren't queued until manually added
    previewsContainer: "#previews", // Define the container to display the previews
    clickable: ".fileinput-button" // Define the element that should be used as click trigger to select files.
  })

  myDropzone.on("addedfile", function(file) {
    // Hookup the start button
    file.previewElement.querySelector(".start").onclick = function() { myDropzone.enqueueFile(file) }
  })

  // Update the total progress bar
  myDropzone.on("totaluploadprogress", function(progress) {
    document.querySelector("#total-progress .progress-bar").style.width = progress + "%"
  })

  myDropzone.on("sending", function(file) {
    // Show the total progress bar when upload starts
    document.querySelector("#total-progress").style.opacity = "1"
    // And disable the start button
    file.previewElement.querySelector(".start").setAttribute("disabled", "disabled")
  })

  // Hide the total progress bar when nothing's uploading anymore
  myDropzone.on("queuecomplete", function(progress) {
    document.querySelector("#total-progress").style.opacity = "0"
  })

  // Setup the buttons for all transfers
  // The "add files" button doesn't need to be setup because the config
  // `clickable` has already been specified.
  document.querySelector("#actions .start").onclick = function() {
    myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED))
  }
  document.querySelector("#actions .cancel").onclick = function() {
    myDropzone.removeAllFiles(true)
  }
  // DropzoneJS Demo Code End
</script>
</body>
</html>
<?php } ?>