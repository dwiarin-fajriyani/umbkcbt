<!DOCTYPE html>
<?php

// yang mau pasang di hosting,
// HILANGKAN TANDA KOMENTAR SETELAH BARIS Start sampai sebelum End
// Start =================>>>
// $_IP_SERVER = $_SERVER['SERVER_ADDR'];
// $_IP_ADDRESS = $_SERVER['REMOTE_ADDR'];
//
// if ($_IP_ADDRESS <> $_IP_SERVER) {
// 	header("Location: ../login.php");
// }
// End ===================<<<

require("../config/config.default.php");
require("../config/config.function.php");
require("../config/config.umbk.php");

$cekdb = mysqli_query($koneksi, "SELECT 1 FROM pengawas LIMIT 1");
if ($cekdb == false) {
	echo "<script>location.href = '../install.php';</script>";
}

$ceks = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM setting"));

$namaaplikasi = $ceks['aplikasi'];
$namasekolah = $ceks['sekolah'];

if (isset($_POST['submit'])) {
	$username = mysqli_escape_string($koneksi, $_POST['username']);
	$password = mysqli_escape_string($koneksi, $_POST['password']);
	$query = mysqli_query($koneksi, "SELECT * FROM pengawas WHERE username='$username'");
	$cek = mysqli_num_rows($query);
	$user = mysqli_fetch_array($query);
	if ($cek <> 0) {

		if ($user['level'] == 'admin') {

			if (!password_verify($password, $user['password'])) {
				$info = info("Password salah!", "NO");
			} else {
				$_SESSION['id_pengawas'] = $user['id_pengawas'];
				$_SESSION['level'] = 'admin';
				echo "<script>location.href = '.';</script>";
			}
			
		} elseif ($user['level'] == 'guru') {

			if ($password == $user['password']) {
				$_SESSION['id_pengawas'] = $user['id_pengawas'];
				$_SESSION['level'] = 'guru';
				echo "<script>location.href = '.';</script>";
			} else {
				$info = info("Password salah!", "NO");
			}
		} elseif ($user['level'] == 'pengawas') {

			if (!password_verify($password, $user['password'])) {
				$info = info("Password salah!", "NO");
			} else {
				$_SESSION['id_pengawas'] = $user['id_pengawas'];
				$_SESSION['level'] = 'pengawas';
				echo "<script>location.href = '.';</script>";
			}
		}
	} elseif ($cek == 0) {
		echo "<script>alert('Pengguna tidak terdaftar');</script>";
	}
}

?>
<html lang="en">

<head>
	<title>Login Admin </title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="../fav.ico" />
	<link rel="stylesheet" type="text/css" href="../dist/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../plugins/font-awesome/css/font-awesome.css">

	<link rel="stylesheet" type="text/css" href="../plugins/animate/animate.min.css">

	<link rel="stylesheet" type="text/css" href="../dist/bootstrap/css/util.css">
	<link rel="stylesheet" type="text/css" href="../dist/bootstrap/css/main.css">
	<style>
		.judul {
			position: absolute;
			right: 20px;
			top: 20px;
			z-index: 2;
			color: #000;
		}

		.logo {
			position: absolute;
			left: 20px;
			top: 20px;
			z-index: 2;
			color: #000;
			-webkit-filter: drop-shadow(5px 5px 5px #222);
			filter: drop-shadow(5px 5px 5px #222);
		}

		.candy {
			position: absolute;
			left: 10px;
			top: 90%;
			z-index: 3;
			color: #000;
			-webkit-filter: drop-shadow(5px 5px 5px #222);
			filter: drop-shadow(5px 5px 5px #222);
			opacity: 0.4;
			filter: alpha(opacity=40);
		}

		.candy:hover {
			opacity: 1.0;
			filter: alpha(opacity=100);
		}

		.wrap-login100-form-btn {
			display: block;
			position: relative;
			z-index: 1;
			border-radius: 0px;
			overflow: hidden;
		}
	</style>
</head>

<body style="background-color: #999999;">

	<div class="limiter">
		<div class="container-login100">
			<div class='judul'><a href="https://aplikasipendidikan.net" class="txt2 hov1">
					
				</a>
			</div>
			<div class='logo hidden-xs'>
			<span class="animated flipInX login100-form-title">
						<!-- <?php echo	$namaaplikasi; ?> -->
						<?php echo	"PSAJ-BK"?>
					</span>
					<small class="animated flipInX p-b-50">
						<?php echo	"$setting[sekolah] - $setting[web]"; ?>
					</small>
			</div>

			<div class="login100-more" style="background-image: url('<?= $homeurl ?>/dist/img/bg-header.jpg');"></div>
			

			<div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50" style="background-image: url('../dist/img/b.jpg');">
			<img src="<?= $homeurl ?>/dist/img/umbk-smk2.png" style="max-width:270px" class="img-responsive" alt="Responsive image">
				<form action='' method='post' class="validate-form">
					<span class="animated flipInX login100-form-title">
						
					</span>
					<small class="animated flipInX p-b-50">
						Aplikasi Penilaian Sumatif Akhir Jenjang Berbasis Komputer (PSAJ-BK)
						
					</small>

					<div class="wrap-input100 validate-input p-t-50" data-validate="Username is required">
						<span class="label-input100">Username</span>
						<input class="input100" type="text" name="username" placeholder="Username...">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="password" placeholder="*************">
						<span class="focus-input100"></span>
					</div>



					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button name='submit' class="login100-form-btn">
								Login Masuk
							</button>
						</div>


					</div>
				</form>

			</div>

		</div>
	</div>

	<script src='../plugins/jQuery/jquery-3.2.1.min.js'></script>
	<script src='../dist/bootstrap/js/bootstrap.min.js'></script>

	<script src="../plugins/jQuery/main.js"></script>

</body>

</html>