-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2024 at 05:00 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_umbk`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(10) NOT NULL,
  `id_mapel` int(10) NOT NULL,
  `sesi` varchar(10) NOT NULL,
  `ruang` varchar(20) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `ikut` varchar(10) DEFAULT NULL,
  `susulan` varchar(10) DEFAULT NULL,
  `no_susulan` text DEFAULT NULL,
  `mulai` varchar(10) DEFAULT NULL,
  `selesai` varchar(10) DEFAULT NULL,
  `nama_proktor` varchar(50) DEFAULT NULL,
  `nip_proktor` varchar(50) DEFAULT NULL,
  `nama_pengawas` varchar(50) DEFAULT NULL,
  `nip_pengawas` varchar(50) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `tgl_ujian` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `file_pendukung`
--

CREATE TABLE `file_pendukung` (
  `id_file` int(11) NOT NULL,
  `id_mapel` int(11) DEFAULT 0,
  `nama_file` varchar(50) DEFAULT NULL,
  `status_file` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jawaban`
--

CREATE TABLE `jawaban` (
  `id_jawaban` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `jawaban` char(1) DEFAULT NULL,
  `jawabx` char(1) DEFAULT NULL,
  `jenis` int(1) NOT NULL,
  `esai` text DEFAULT NULL,
  `nilai_esai` int(5) NOT NULL DEFAULT 0,
  `ragu` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_tugas`
--

CREATE TABLE `jawaban_tugas` (
  `id_jawaban` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `id_tugas` int(11) DEFAULT NULL,
  `jawaban` longtext DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_dikerjakan` datetime DEFAULT NULL,
  `tgl_update` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nilai` varchar(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` varchar(30) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama`, `status`) VALUES
('PTS', 'Penilaian Tengah Semester', 'tidak'),
('USBK', 'Ujian Sekolah', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `jurusan_id` varchar(25) NOT NULL,
  `nama_jurusan_sp` varchar(100) DEFAULT NULL,
  `kurikulum` varchar(120) DEFAULT NULL,
  `jurusan_sp_id` varchar(50) DEFAULT NULL,
  `kurikulum_id` varchar(20) DEFAULT NULL,
  `sekolah_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` varchar(11) NOT NULL,
  `level` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  `semester_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `level`, `nama`, `rombongan_belajar_id`, `semester_id`) VALUES
('XIIAKL1', 'XII', 'XIIAKL1', NULL, NULL),
('XIIAKL2', 'XII', 'XIIAKL2', NULL, NULL),
('XIIAKL3', 'XII', 'XIIAKL3', NULL, NULL),
('XIIAKL4', 'XII', 'XIIAKL4', NULL, NULL),
('XIIBDP1', 'XII', 'XIIBDP1', NULL, NULL),
('XIIBDP2', 'XII', 'XIIBDP2', NULL, NULL),
('XIIBDP3', 'XII', 'XIIBDP3', NULL, NULL),
('XIIBDP4', 'XII', 'XIIBDP4', NULL, NULL),
('XIIOTKP1', 'XII', 'XIIOTKP1', NULL, NULL),
('XIIOTKP2', 'XII', 'XIIOTKP2', NULL, NULL),
('XIIOTKP3', 'XII', 'XIIOTKP3', NULL, NULL),
('XIIOTKP4', 'XII', 'XIIOTKP4', NULL, NULL),
('XIIRPL1', 'XII', 'XII RPL 1', NULL, NULL),
('XIIRPL2', 'XII', 'XIIRPL2', NULL, NULL),
('XIIRPL3', 'XII', 'XIIRPL3', NULL, NULL),
('XIIRPL4', 'XII', 'XIIRPL4', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `kode_level` varchar(5) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`kode_level`, `keterangan`, `rombongan_belajar_id`) VALUES
('X', 'X', NULL),
('XI', 'XI', NULL),
('XII', 'XII', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `text` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id_log`, `id_siswa`, `type`, `text`, `date`) VALUES
(1, 533, 'login', 'masuk', '2024-03-20 14:25:35'),
(2, 533, 'logout', 'keluar', '2024-03-20 14:25:47'),
(3, 1, 'login', 'Selesai Ujian', '2024-03-21 10:30:35');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int(11) NOT NULL,
  `kode` varchar(255) NOT NULL DEFAULT '0',
  `idpk` varchar(255) NOT NULL,
  `idguru` varchar(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jml_soal` int(5) NOT NULL,
  `jml_esai` int(5) NOT NULL DEFAULT 0,
  `tampil_pg` int(5) NOT NULL,
  `tampil_esai` int(5) NOT NULL DEFAULT 0,
  `bobot_pg` int(5) NOT NULL,
  `bobot_esai` int(5) NOT NULL DEFAULT 0,
  `level` varchar(5) NOT NULL,
  `opsi` int(1) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(2) NOT NULL,
  `kkm` int(3) DEFAULT NULL,
  `soal_agama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `kode`, `idpk`, `idguru`, `nama`, `jml_soal`, `jml_esai`, `tampil_pg`, `tampil_esai`, `bobot_pg`, `bobot_esai`, `level`, `opsi`, `kelas`, `date`, `status`, `kkm`, `soal_agama`) VALUES
(1, 'US-ENG', 'a:1:{i:0;s:5:\"semua\";}', '274', 'ENG', 5, 0, 5, 0, 1, 0, 'XII', 4, 'a:1:{i:0;s:7:\"XIIRPL1\";}', '2024-03-20 05:20:30', '1', 70, ''),
(2, 'SIM-UMUM', 'a:1:{i:0;s:5:\"semua\";}', '266', 'SIM', 50, 0, 50, 0, 1, 0, 'XII', 4, 'a:1:{i:0;s:5:\"semua\";}', '2024-03-21 03:36:32', '1', 70, '');

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `kode_mapel` varchar(20) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL,
  `mata_pelajaran_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`kode_mapel`, `nama_mapel`, `mata_pelajaran_id`) VALUES
('ENG', 'Bahasa Inggris', NULL),
('IND', 'Bahasa Indonesia', NULL),
('MTK', 'Matematika', NULL),
('PAI', 'Pendidikan Agama dan Budi Pekerti', NULL),
('PKN', 'Pendidikan Kewarganegaraan', NULL),
('SIM', 'Simulasi', NULL),
('SND', 'Bahasa Sunda', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id_materi` int(255) NOT NULL,
  `id_guru` int(255) NOT NULL DEFAULT 0,
  `kelas` text NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `materi` longtext DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_mulai` datetime NOT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `tgl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`id_materi`, `id_guru`, `kelas`, `mapel`, `judul`, `materi`, `file`, `tgl_mulai`, `youtube`, `tgl`, `status`) VALUES
(7, 1, 'a:1:{i:0;s:5:\"XTKJB\";}', 'KIMIA', 'TEST', '<p><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/t9FtOJBJJ3c\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe></p>', 'Daftar hadir piket.xlsx', '2020-04-23 18:00:00', NULL, '2020-04-23 11:40:29', 1),
(8, 1, 'a:1:{i:0;s:5:\"semua\";}', 'KIMIA', 'aaaaaaa', '', NULL, '2020-04-24 04:00:00', 'https://www.youtube.com/embed/t9FtOJBJJ3c', '2020-04-23 21:39:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `kode_ujian` varchar(30) NOT NULL,
  `ujian_mulai` varchar(20) NOT NULL,
  `ujian_berlangsung` varchar(20) DEFAULT NULL,
  `ujian_selesai` varchar(20) DEFAULT NULL,
  `jml_benar` int(10) DEFAULT NULL,
  `jml_salah` int(10) DEFAULT NULL,
  `nilai_esai` varchar(10) DEFAULT NULL,
  `skor` varchar(10) DEFAULT NULL,
  `total` varchar(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `hasil` int(2) NOT NULL,
  `jawaban` text DEFAULT NULL,
  `jawaban_esai` longtext DEFAULT NULL,
  `nilai_esai2` text DEFAULT NULL,
  `online` int(1) NOT NULL DEFAULT 0,
  `id_soal` longtext DEFAULT NULL,
  `id_opsi` longtext DEFAULT NULL,
  `id_esai` text DEFAULT NULL,
  `blok` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_ujian`, `id_mapel`, `id_siswa`, `kode_ujian`, `ujian_mulai`, `ujian_berlangsung`, `ujian_selesai`, `jml_benar`, `jml_salah`, `nilai_esai`, `skor`, `total`, `status`, `ipaddress`, `hasil`, `jawaban`, `jawaban_esai`, `nilai_esai2`, `online`, `id_soal`, `id_opsi`, `id_esai`, `blok`) VALUES
(2, 1, 1, 1, 'USBK', '2024-03-20 12:19:03', '2024-03-20 12:20:49', '2024-03-21 10:30:35', 0, 5, NULL, '0', '0', NULL, '::1', 1, 'a:5:{i:8;s:1:\"X\";i:9;s:1:\"X\";i:10;s:1:\"X\";i:11;s:1:\"X\";i:12;s:1:\"X\";}', 'a:0:{}', NULL, 0, '8,9,10,11,12,', 'A,C,B,D,A,C,B,D,B,C,D,A,B,A,D,C,C,D,A,B,', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pengawas`
--

CREATE TABLE `pengawas` (
  `id_pengawas` int(11) NOT NULL,
  `nip` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `no_ktp` varchar(16) DEFAULT NULL,
  `tempat_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat_jalan` varchar(255) DEFAULT NULL,
  `rt_rw` varchar(8) DEFAULT NULL,
  `dusun` varchar(50) DEFAULT NULL,
  `kelurahan` varchar(50) DEFAULT NULL,
  `kecamatan` varchar(30) DEFAULT NULL,
  `kode_pos` int(6) DEFAULT NULL,
  `nuptk` varchar(20) DEFAULT NULL,
  `bidang_studi` varchar(50) DEFAULT NULL,
  `jenis_ptk` varchar(50) DEFAULT NULL,
  `tgs_tambahan` varchar(50) DEFAULT NULL,
  `status_pegawai` varchar(50) DEFAULT NULL,
  `status_aktif` varchar(20) DEFAULT NULL,
  `status_nikah` varchar(20) DEFAULT NULL,
  `sumber_gaji` varchar(30) DEFAULT NULL,
  `ahli_lab` varchar(10) DEFAULT NULL,
  `nama_ibu` varchar(40) DEFAULT NULL,
  `nama_suami` varchar(50) DEFAULT NULL,
  `nik_suami` varchar(20) DEFAULT NULL,
  `pekerjaan` varchar(20) DEFAULT NULL,
  `tmt` date DEFAULT NULL,
  `keahlian_isyarat` varchar(10) DEFAULT NULL,
  `kewarganegaraan` varchar(10) DEFAULT NULL,
  `npwp` varchar(16) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `ptk_id` varchar(50) DEFAULT NULL,
  `password2` text DEFAULT NULL,
  `ruang` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pengawas`
--

INSERT INTO `pengawas` (`id_pengawas`, `nip`, `nama`, `jabatan`, `username`, `password`, `level`, `no_ktp`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `no_hp`, `email`, `alamat_jalan`, `rt_rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `nuptk`, `bidang_studi`, `jenis_ptk`, `tgs_tambahan`, `status_pegawai`, `status_aktif`, `status_nikah`, `sumber_gaji`, `ahli_lab`, `nama_ibu`, `nama_suami`, `nik_suami`, `pekerjaan`, `tmt`, `keahlian_isyarat`, `kewarganegaraan`, `npwp`, `foto`, `ptk_id`, `password2`, `ruang`) VALUES
(266, '-', 'Guru 1', NULL, 'guru1', '123456', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(267, '-', 'Guru 2', NULL, 'guru2', '123456', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(268, '-', 'Guru 3', NULL, 'guru3', '123456', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(269, '-', 'Guru 4', NULL, 'guru4', '123456', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(270, '-', 'Guru 5', NULL, 'guru5', '123456', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(271, '-', 'Guru 6', NULL, 'guru6', '123456', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(272, '-', 'Guru 7', NULL, 'guru7', '123456', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(273, '-', 'Guru 8', NULL, 'guru8', '123456', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(274, '-', 'Guru 9', NULL, 'guru9', '123456', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(275, '-', 'Guru 10', NULL, 'guru10', '123456', 'guru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(276, '3456', 'pengawas', NULL, 'pengawas', '$2y$10$safblq4Oj4rjjn6ufB7K7OlQxrSlwsdRUPCfTEZ1k/sbZdLmR/tlS', 'pengawas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01'),
(277, '12345', 'Administrator', NULL, 'proktor', '$2y$10$h7ubV6OCIlf7uTaNuTV/o.4JJHAxuczaMQpDOCrDCkrZDAU4LeliG', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(278, '111111', 'arin', NULL, 'arin', '$2y$10$V00y1gd9Ss9xYbXMTf51..Ram/wjLSVYNZnajiZbLWd3J5bKPp87e', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id_pengumuman` int(5) NOT NULL,
  `type` varchar(30) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `user` int(3) NOT NULL,
  `text` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`id_pengumuman`, `type`, `judul`, `user`, `text`, `date`) VALUES
(8, 'eksternal', 'INFO JADWAL UJIAN', 1, '<p>Untuk ujian sekolah dilakukan secara daring atau online menggunakan Hp Android, PC, Laptop. Aplikasi ujian diakses dengan browser Google Chrome.</p>', '2020-04-04 15:23:29');

-- --------------------------------------------------------

--
-- Table structure for table `pk`
--

CREATE TABLE `pk` (
  `id_pk` varchar(10) NOT NULL,
  `program_keahlian` varchar(50) NOT NULL,
  `jurusan_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pk`
--

INSERT INTO `pk` (`id_pk`, `program_keahlian`, `jurusan_id`) VALUES
('AKL', 'AKL', NULL),
('BDP', 'BDP', NULL),
('OTKP', 'OTKP', NULL),
('RPL', 'RPL', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `referensi_jurusan`
--

CREATE TABLE `referensi_jurusan` (
  `jurusan_id` varchar(10) NOT NULL,
  `nama_jurusan` varchar(100) DEFAULT NULL,
  `untuk_sma` int(1) NOT NULL,
  `untuk_smk` int(1) NOT NULL,
  `jenjang_pendidikan_id` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `kode_ruang` varchar(10) NOT NULL,
  `keterangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`kode_ruang`, `keterangan`) VALUES
('R.01', 'R.01'),
('R.02', 'R.02'),
('R.03', 'R.03'),
('R.04', 'R.04'),
('R.05', 'R.05'),
('R.06', 'R.06'),
('R.07', 'R.07'),
('R.08', 'R.08'),
('R.09', 'R.09'),
('R.10', 'R.10'),
('R.11', 'R.11'),
('R.12', 'R.12'),
('R.13', 'R.13'),
('R.14', 'R.14'),
('R.15', 'R.15'),
('R.16', 'R.16'),
('R.17', 'R.17'),
('R.18', 'R.18'),
('R.19', 'R.19'),
('R.20', 'R.20'),
('R.21', 'R.21'),
('R.22', 'R.22'),
('R.23', 'R.23'),
('R.24', 'R.24'),
('R.25', 'R.25'),
('R.26', 'R.26'),
('R.27', 'R.27'),
('R.28', 'R.28');

-- --------------------------------------------------------

--
-- Table structure for table `savsoft_options`
--

CREATE TABLE `savsoft_options` (
  `oid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `q_option` text NOT NULL,
  `q_option_match` varchar(1000) DEFAULT NULL,
  `score` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `savsoft_qbank`
--

CREATE TABLE `savsoft_qbank` (
  `qid` int(11) NOT NULL,
  `question_type` varchar(100) NOT NULL DEFAULT 'Multiple Choice Single Answer',
  `question` text NOT NULL,
  `description` text NOT NULL,
  `cid` int(11) NOT NULL,
  `lid` int(11) NOT NULL,
  `no_time_served` int(11) NOT NULL DEFAULT 0,
  `no_time_corrected` int(11) NOT NULL DEFAULT 0,
  `no_time_incorrected` int(11) NOT NULL DEFAULT 0,
  `no_time_unattempted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `semester_id` varchar(5) NOT NULL,
  `tahun_ajaran_id` varchar(4) NOT NULL,
  `nama_semester` varchar(50) NOT NULL,
  `semester` int(1) NOT NULL,
  `periode_aktif` enum('1','0') NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `server`
--

CREATE TABLE `server` (
  `kode_server` varchar(20) NOT NULL,
  `nama_server` varchar(30) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `server`
--

INSERT INTO `server` (`kode_server`, `nama_server`, `status`) VALUES
('SR01', 'SR01', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `sesi`
--

CREATE TABLE `sesi` (
  `kode_sesi` varchar(10) NOT NULL,
  `nama_sesi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sesi`
--

INSERT INTO `sesi` (`kode_sesi`, `nama_sesi`) VALUES
('1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `session_time` varchar(10) NOT NULL,
  `session_hash` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(11) NOT NULL,
  `aplikasi` varchar(100) DEFAULT NULL,
  `kode_sekolah` varchar(10) DEFAULT NULL,
  `sekolah` varchar(50) DEFAULT NULL,
  `jenjang` varchar(5) DEFAULT NULL,
  `kepsek` varchar(50) DEFAULT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kecamatan` varchar(50) DEFAULT NULL,
  `kota` varchar(30) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `header` text DEFAULT NULL,
  `header_kartu` text DEFAULT NULL,
  `nama_ujian` text DEFAULT NULL,
  `versi` varchar(10) DEFAULT NULL,
  `ip_server` varchar(100) DEFAULT NULL,
  `waktu` varchar(50) DEFAULT NULL,
  `server` varchar(50) DEFAULT NULL,
  `id_server` varchar(50) DEFAULT NULL,
  `url_host` varchar(50) DEFAULT NULL,
  `token_api` varchar(50) DEFAULT NULL,
  `sekolah_id` varchar(50) DEFAULT NULL,
  `npsn` varchar(10) DEFAULT NULL,
  `db_versi` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id_setting`, `aplikasi`, `kode_sekolah`, `sekolah`, `jenjang`, `kepsek`, `nip`, `alamat`, `kecamatan`, `kota`, `telp`, `fax`, `web`, `email`, `logo`, `header`, `header_kartu`, `nama_ujian`, `versi`, `ip_server`, `waktu`, `server`, `id_server`, `url_host`, `token_api`, `sekolah_id`, `npsn`, `db_versi`) VALUES
(1, 'UMBK', 'K0248', 'SMKN 2 Sumedang', 'MA', 'Dra. Elis Herawati, M.Pd', '200321052411428666', 'Jl. Arief Rakhman Hakim No. 59 Sumedang<br />\r\n', 'Sumedang Utara ', 'Sumedang', '0261-201531', '0261-210097', 'www.smkn2sumedang.sch.id', 'smkn2sumedang@yahoo.com', 'dist/img/logo31.png', '', 'KARTU PESERTA', 'Ujian Sekolah', '2.5', 'http://192.168.0.200/umbk', 'Asia/Jakarta', 'pusat', 'SR01', 'xxxxxx', 'VKLuYN7Lwjjwu', '8cce47df-aae7-4274-83cb-5af3093eab56', '69787351', '2.8.1');

-- --------------------------------------------------------

--
-- Table structure for table `sinkron`
--

CREATE TABLE `sinkron` (
  `nama_data` varchar(50) NOT NULL,
  `data` varchar(50) DEFAULT NULL,
  `jumlah` varchar(50) DEFAULT NULL,
  `tanggal` varchar(50) DEFAULT NULL,
  `status_sinkron` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sinkron`
--

INSERT INTO `sinkron` (`nama_data`, `data`, `jumlah`, `tanggal`, `status_sinkron`) VALUES
('DATA1', 'siswa', '', '', 0),
('DATA2', 'bank soal', '', '', 0),
('DATA3', 'soal', '', '', 0),
('DATA4', 'jadwal', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `id_kelas` varchar(11) DEFAULT NULL,
  `idpk` varchar(10) DEFAULT NULL,
  `nis` varchar(30) DEFAULT NULL,
  `no_peserta` varchar(30) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `level` varchar(5) DEFAULT NULL,
  `ruang` varchar(10) DEFAULT NULL,
  `sesi` int(2) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(30) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `kebutuhan_khusus` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `rt` varchar(5) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `dusun` varchar(100) DEFAULT NULL,
  `kelurahan` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kode_pos` int(10) DEFAULT NULL,
  `jenis_tinggal` varchar(100) DEFAULT NULL,
  `alat_transportasi` varchar(100) DEFAULT NULL,
  `hp` varchar(15) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `skhun` int(11) DEFAULT NULL,
  `no_kps` varchar(50) DEFAULT NULL,
  `nama_ayah` varchar(150) DEFAULT NULL,
  `tahun_lahir_ayah` int(4) DEFAULT NULL,
  `pendidikan_ayah` varchar(50) DEFAULT NULL,
  `pekerjaan_ayah` varchar(100) DEFAULT NULL,
  `penghasilan_ayah` varchar(100) DEFAULT NULL,
  `nohp_ayah` varchar(15) DEFAULT NULL,
  `nama_ibu` varchar(150) DEFAULT NULL,
  `tahun_lahir_ibu` int(4) DEFAULT NULL,
  `pendidikan_ibu` varchar(50) DEFAULT NULL,
  `pekerjaan_ibu` varchar(100) DEFAULT NULL,
  `penghasilan_ibu` varchar(100) DEFAULT NULL,
  `nohp_ibu` int(15) DEFAULT NULL,
  `nama_wali` varchar(150) DEFAULT NULL,
  `tahun_lahir_wali` int(4) DEFAULT NULL,
  `pendidikan_wali` varchar(50) DEFAULT NULL,
  `pekerjaan_wali` varchar(100) DEFAULT NULL,
  `penghasilan_wali` varchar(50) DEFAULT NULL,
  `angkatan` int(5) DEFAULT NULL,
  `nisn` varchar(50) DEFAULT NULL,
  `peserta_didik_id` varchar(50) DEFAULT NULL,
  `semester_id` varchar(10) DEFAULT NULL,
  `rombongan_belajar_id` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `online` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `id_kelas`, `idpk`, `nis`, `no_peserta`, `nama`, `level`, `ruang`, `sesi`, `username`, `password`, `foto`, `server`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `agama`, `kebutuhan_khusus`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `jenis_tinggal`, `alat_transportasi`, `hp`, `email`, `skhun`, `no_kps`, `nama_ayah`, `tahun_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `nohp_ayah`, `nama_ibu`, `tahun_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `nohp_ibu`, `nama_wali`, `tahun_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `penghasilan_wali`, `angkatan`, `nisn`, `peserta_didik_id`, `semester_id`, `rombongan_belajar_id`, `status`, `online`) VALUES
(1, 'XIIAKL1', 'AKL', '202101145', '001', 'AI ASSIFFA CAHYATI', 'XII', 'R.01', 1, '0065927200', 'ZG605H', 'siswa.png', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(2, 'XIIAKL1', 'AKL', '202101146', '002', 'AMALIA DWI NOVIANTY', 'XII', 'R.01', 1, '0058351974', 'IU778D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(3, 'XIIAKL1', 'AKL', '202101147', '003', 'ANISA SALSABILA', 'XII', 'R.01', 1, '0043857838', 'SC940R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(4, 'XIIAKL1', 'AKL', '202101148', '004', 'APRILIA KUSUMANINGSIH', 'XII', 'R.01', 1, '0051377441', 'DY594T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(5, 'XIIAKL1', 'AKL', '202101149', '005', 'ARINI LESTARI', 'XII', 'R.01', 1, '0063348242', 'TP553M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(6, 'XIIAKL1', 'AKL', '202101150', '006', 'AULIA YUSRA SHABIRAH', 'XII', 'R.01', 1, '0059703131', 'YM783H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(7, 'XIIAKL1', 'AKL', '202101151', '007', 'CICA NURHAYATI', 'XII', 'R.01', 1, '0053079477', 'GK747Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(8, 'XIIAKL1', 'AKL', '202101152', '008', 'CINDI SITI KURNIA', 'XII', 'R.01', 1, '0065661828', 'AO654O', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(9, 'XIIAKL1', 'AKL', '202101153', '009', 'CINDY ANGGRAENI', 'XII', 'R.01', 1, '0054867556', 'CC813J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(10, 'XIIAKL1', 'AKL', '202101154', '010', 'CITRA SHAKILA TRI PARADE', 'XII', 'R.01', 1, '0065189788', 'OC238L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(11, 'XIIAKL1', 'AKL', '202101155', '011', 'DEA LISDIANTI', 'XII', 'R.01', 1, '0066596712', 'AQ386S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(12, 'XIIAKL1', 'AKL', '202101156', '012', 'DINDA AWALIANI', 'XII', 'R.01', 1, '0053998654', 'SJ925E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(13, 'XIIAKL1', 'AKL', '202101157', '013', 'ELLY WULANSARI MARLIANI', 'XII', 'R.01', 1, '0057193859', 'WT914P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(14, 'XIIAKL1', 'AKL', '202101158', '014', 'FANI FAUZIAH', 'XII', 'R.01', 1, '0067087053', 'GZ838Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(15, 'XIIAKL1', 'AKL', '202101159', '015', 'GISKA YULIANA', 'XII', 'R.01', 1, '0063366441', 'ZF386L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(16, 'XIIAKL1', 'AKL', '202101160', '016', 'HANI NUR ANISA', 'XII', 'R.01', 1, '0058265579', 'KI589F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(17, 'XIIAKL1', 'AKL', '202101161', '017', 'HASNA ADRA ZAHIRA', 'XII', 'R.01', 1, '0072387342', 'IY390U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(18, 'XIIAKL1', 'AKL', '202101162', '018', 'IIS ROSITA', 'XII', 'R.01', 1, '0053074954	', 'VL312G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(19, 'XIIAKL1', 'AKL', '202101163', '019', 'IMELDA HERDIANI', 'XII', 'R.01', 1, '0058260256', 'XR620I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(20, 'XIIAKL1', 'AKL', '202101164', '020', 'JAMILAH RAHAYU', 'XII', 'R.01', 1, '0052434279', 'KY268I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(21, 'XIIAKL1', 'AKL', '202101165', '021', 'KHAIFA HUSAADAH ALZANUAR', 'XII', 'R.02', 1, '0054546704', 'GQ290R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(22, 'XIIAKL1', 'AKL', '202101166', '022', 'LIA AMELIA', 'XII', 'R.02', 1, '0059720273', 'RG528J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(23, 'XIIAKL1', 'AKL', '202101167', '023', 'MITA NURHALIZA', 'XII', 'R.02', 1, '0051655532', 'EB965E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(24, 'XIIAKL1', 'AKL', '202101168', '024', 'MUTIA SUKMA SARI', 'XII', 'R.02', 1, '0068249708', 'ST947N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(25, 'XIIAKL1', 'AKL', '202101169', '025', 'NARISA SRI NUR AINI', 'XII', 'R.02', 1, '0069585115', 'PP827D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(26, 'XIIAKL1', 'AKL', '202101170', '026', 'RAHMAH HATTA', 'XII', 'R.02', 1, '0052060849', 'PV955F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(27, 'XIIAKL1', 'AKL', '202101171', '027', 'REFINA DESNIA SHILVIANDA', 'XII', 'R.02', 1, '0052324846', 'BX660J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(28, 'XIIAKL1', 'AKL', '202101172', '028', 'SHABRINA JULIA', 'XII', 'R.02', 1, '0055266601', 'VA311N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(29, 'XIIAKL1', 'AKL', '202101173', '029', 'SHINTYA RHEINAVELLA MAHARANI', 'XII', 'R.02', 1, '0066619810', 'KU959Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(30, 'XIIAKL1', 'AKL', '202101174', '030', 'SILVIA RAHMAWATI.', 'XII', 'R.02', 1, '0056308860', 'AG455M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(31, 'XIIAKL1', 'AKL', '202101175', '031', 'SITI NURAENI', 'XII', 'R.02', 1, '0059097527', 'WX296W', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(32, 'XIIAKL1', 'AKL', '202101176', '032', 'SOPIAH PEBIYANTI', 'XII', 'R.02', 1, '0066779417', 'GQ114Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(33, 'XIIAKL1', 'AKL', '202101177', '033', 'SRI NUR AENI', 'XII', 'R.02', 1, '0052516772', 'QN374E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(34, 'XIIAKL1', 'AKL', '202101178', '034', 'VERA LEO NADIA', 'XII', 'R.02', 1, '0051507047', 'CB482L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(35, 'XIIAKL1', 'AKL', '202101179', '035', 'WIDIA AGUSTIN', 'XII', 'R.02', 1, '0057068560', 'LZ661Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(36, 'XIIAKL1', 'AKL', '202101180', '036', 'WINDI RAHMAWATI', 'XII', 'R.02', 1, '0064349125', 'LT539R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(37, 'XIIAKL2', 'AKL', '202101181', '037', 'AMALIA HASANAH RATNASARI', 'XII', 'R.02', 1, '0065914219', 'FF963M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(38, 'XIIAKL2', 'AKL', '202101182', '038', 'AMELIA HAERUNNISA', 'XII', 'R.02', 1, '0063680694', 'QG208M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(39, 'XIIAKL2', 'AKL', '202101183', '039', 'ANDI DESYCA FUJIANI', 'XII', 'R.02', 1, '0052246020', 'SR113V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(40, 'XIIAKL2', 'AKL', '202101184', '040', 'DEDILA DWI NURDINANTI', 'XII', 'R.02', 1, '0056583579', 'ZB410N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(41, 'XIIAKL2', 'AKL', '202101185', '041', 'DEWI APRILLIA', 'XII', 'R.03', 1, '0052087827', 'HS798V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(42, 'XIIAKL2', 'AKL', '202101187', '042', 'DIAN RAHMAWATI', 'XII', 'R.03', 1, '0062640264', 'FE515K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(43, 'XIIAKL2', 'AKL', '202101188', '043', 'INTAN DWI NURDIAN SARI', 'XII', 'R.03', 1, '0063233914', 'NU418E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(44, 'XIIAKL2', 'AKL', '202101189', '044', 'IRENI RIZQITANIA', 'XII', 'R.03', 1, '0059467862', 'KE696F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(45, 'XIIAKL2', 'AKL', '202101190', '045', 'ISYE IMUT', 'XII', 'R.03', 1, '0066728071', 'XF973X', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(46, 'XIIAKL2', 'AKL', '202101191', '046', 'LEA IKLAS ANDREA', 'XII', 'R.03', 1, '0056938399', 'ZR400Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(47, 'XIIAKL2', 'AKL', '202101192', '047', 'LELA ANGGRAENI', 'XII', 'R.03', 1, '0066034380', 'QW474K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(48, 'XIIAKL2', 'AKL', '202101193', '048', 'NENG AISAH', 'XII', 'R.03', 1, '0057106582', 'WO791U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(49, 'XIIAKL2', 'AKL', '202101194', '049', 'NISA FITRIA HASANAH', 'XII', 'R.03', 1, '0068367317', 'QP738S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(50, 'XIIAKL2', 'AKL', '202101195', '050', 'NUR ANITA', 'XII', 'R.03', 1, '0062430697', 'EP643V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(51, 'XIIAKL2', 'AKL', '202101196', '051', 'PUTRI ZAHRA SITI RODIYAH', 'XII', 'R.03', 1, '0064430830', 'GX473R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(52, 'XIIAKL2', 'AKL', '202101197', '052', 'RANI INDRIANI', 'XII', 'R.03', 1, '0056862487', 'MJ899T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(53, 'XIIAKL2', 'AKL', '202101198', '053', 'SHALWA ADHANY', 'XII', 'R.03', 1, '0068231025', 'HH195P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(54, 'XIIAKL2', 'AKL', '202101199', '054', 'SHINTA DAMAYANTI', 'XII', 'R.03', 1, '0052041508', 'MM464J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(55, 'XIIAKL2', 'AKL', '202101200', '055', 'SHINTA JAMILAH', 'XII', 'R.03', 1, '0058024242', 'JH919L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(56, 'XIIAKL2', 'AKL', '202101201', '056', 'SITI NISRINA NABILA', 'XII', 'R.03', 1, '0069203084', 'DK986K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(57, 'XIIAKL2', 'AKL', '202101202', '057', 'SITI RENI FEBRIANTI', 'XII', 'R.03', 1, '0064796600', 'CQ759H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(58, 'XIIAKL2', 'AKL', '202101203', '058', 'SOYA ALMAZAZI', 'XII', 'R.03', 1, '0068367039', 'HP242G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(59, 'XIIAKL2', 'AKL', '202101204', '059', 'SRI ANDINI WIDIANTI', 'XII', 'R.03', 1, '0059026190', 'PD937U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(60, 'XIIAKL2', 'AKL', '202101205', '060', 'TASYA SALSABILA', 'XII', 'R.03', 1, '0055944165', 'BQ104L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(61, 'XIIAKL2', 'AKL', '202101206', '061', 'TENIA PASHA', 'XII', 'R.04', 1, '0053282246', 'HF691L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(62, 'XIIAKL2', 'AKL', '202101207', '062', 'TIA SETIASIH', 'XII', 'R.04', 1, '0058452833', 'HZ360G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(63, 'XIIAKL2', 'AKL', '202101208', '063', 'TIARA WULANDARI MELAWATI', 'XII', 'R.04', 1, '0053222786', 'GN289W', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(64, 'XIIAKL2', 'AKL', '202101209', '064', 'TITIN WARTINI', 'XII', 'R.04', 1, '0065010309', 'LU986O', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(65, 'XIIAKL2', 'AKL', '202101210', '065', 'TRI LESTARI', 'XII', 'R.04', 1, '0054881165', 'BJ158C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(66, 'XIIAKL2', 'AKL', '202101211', '066', 'WANDA PRIHATININGSIH', 'XII', 'R.04', 1, '0053886798', 'IC695R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(67, 'XIIAKL2', 'AKL', '202101212', '067', 'WIHELMA PUJI HERAWATI', 'XII', 'R.04', 1, '0051944906', 'UD363D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(68, 'XIIAKL2', 'AKL', '202101213', '068', 'YULIANA', 'XII', 'R.04', 1, '0067994335', 'XL808E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(69, 'XIIAKL2', 'AKL', '202101214', '069', 'YUNI NUR`AINI', 'XII', 'R.04', 1, '0056249886', 'DY567D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(70, 'XIIAKL2', 'AKL', '202101215', '070', 'ZAHIRA AULIA ADHA', 'XII', 'R.04', 1, '0064231467', 'XY208R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(71, 'XIIAKL2', 'AKL', '202101216', '071', 'ZAHRA NAZHIFA SALSABILA', 'XII', 'R.04', 1, '0059387831', 'AK424G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(72, 'XIIAKL3', 'AKL', '202101218', '072', 'ALIYYA AZIZA', 'XII', 'R.04', 1, '0066119442', 'YO124E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(73, 'XIIAKL3', 'AKL', '202101219', '073', 'ASSYVA DWI FAUZIA', 'XII', 'R.04', 1, '0058932337', 'PP263S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(74, 'XIIAKL3', 'AKL', '202101220', '074', 'DEVINA ARIPIN', 'XII', 'R.04', 1, '0058455695', 'NN176C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(75, 'XIIAKL3', 'AKL', '202101221', '075', 'DJUALIA PUTRI', 'XII', 'R.04', 1, '0051433776', 'XT452S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(76, 'XIIAKL3', 'AKL', '202101222', '076', 'EGA MELINDA RAHAYU', 'XII', 'R.04', 1, '0059436281', 'RA862V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(77, 'XIIAKL3', 'AKL', '202101223', '077', 'ENDAH FITRI NURHASANAH', 'XII', 'R.04', 1, '0059981998', 'YI246D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(78, 'XIIAKL3', 'AKL', '202101224', '078', 'FUZI TIARA NURFADILAH', 'XII', 'R.04', 1, '0054200778', 'HH479J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(79, 'XIIAKL3', 'AKL', '202101225', '079', 'IRA TAMARA', 'XII', 'R.04', 1, '0059929205', 'IU915J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(80, 'XIIAKL3', 'AKL', '202101226', '080', 'LULU AMANDA', 'XII', 'R.04', 1, '0057537624', 'SI899K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(81, 'XIIAKL3', 'AKL', '202101227', '081', 'NAJMI NUR FAUZIAH', 'XII', 'R.05', 1, '0055882297', 'SR899E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(82, 'XIIAKL3', 'AKL', '202101228', '082', 'NAJWA NUR SHABRINA', 'XII', 'R.05', 1, '0067786381', 'OL525Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(83, 'XIIAKL3', 'AKL', '202101229', '083', 'NANDA MELIANI', 'XII', 'R.05', 1, '0051550493', 'AJ403P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(84, 'XIIAKL3', 'AKL', '202101230', '084', 'NAYLA JESYCA DWI FEBRIANI', 'XII', 'R.05', 1, '0062993129	', 'CU589E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(85, 'XIIAKL3', 'AKL', '202101231', '085', 'NENG RINA WARTINA', 'XII', 'R.05', 1, '0051727228', 'ST711Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(86, 'XIIAKL3', 'AKL', '202101232', '086', 'NOVI YANTI MAHDALENA', 'XII', 'R.05', 1, '0054595239', 'FQ303K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(87, 'XIIAKL3', 'AKL', '202101233', '087', 'NUR MELINDA AFRIANTI', 'XII', 'R.05', 1, '0053741524', 'WA236H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(88, 'XIIAKL3', 'AKL', '202101234', '088', 'NUR RAHMA LUGINA', 'XII', 'R.05', 1, '0055423092', 'JD297B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(89, 'XIIAKL3', 'AKL', '202101235', '089', 'PUTRI PERMATA SARI', 'XII', 'R.05', 1, '0069196343', 'GE816B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(90, 'XIIAKL3', 'AKL', '202101237', '090', 'RAHMAWATI', 'XII', 'R.05', 1, '0057521238', 'OP864I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(91, 'XIIAKL3', 'AKL', '202101238', '091', 'RAISYA DWI ATAYA', 'XII', 'R.05', 1, '0051707696', 'UB332W', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(92, 'XIIAKL3', 'AKL', '202101239', '092', 'REKA AWALI RAMADAN', 'XII', 'R.05', 1, '0059712635', 'MI523M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(93, 'XIIAKL3', 'AKL', '202101240', '093', 'RISTI INDI AMELIA', 'XII', 'R.05', 1, '0063227434', 'LL103V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(94, 'XIIAKL3', 'AKL', '202101241', '094', 'RIZKA SARI RAHMADINA', 'XII', 'R.05', 1, '0065157573', 'NI486H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(95, 'XIIAKL3', 'AKL', '202101242', '095', 'SARI SITI NURFADILAH', 'XII', 'R.05', 1, '0065982780', 'BM192V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(96, 'XIIAKL3', 'AKL', '202101243', '096', 'SESTRI PUJIANTY', 'XII', 'R.05', 1, '0069826952', 'CV829T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(97, 'XIIAKL3', 'AKL', '202101244', '097', 'SILFIA FEBRIANTI', 'XII', 'R.05', 1, '0063906504', 'KJ654P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(98, 'XIIAKL3', 'AKL', '202101245', '098', 'SITI FADILAH RAMADHANTI', 'XII', 'R.05', 1, '0051948313', 'VR152O', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(99, 'XIIAKL3', 'AKL', '202101246', '099', 'SITI MELANI LESTARI', 'XII', 'R.05', 1, '0051747095', 'TT181T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(100, 'XIIAKL3', 'AKL', '202101248', '100', 'TENI NOVIANTI', 'XII', 'R.05', 1, '0051606488', 'YL295T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(101, 'XIIAKL3', 'AKL', '202101249', '101', 'WIDYA AYU PRATAMA', 'XII', 'R.06', 1, '0069836299', 'EO113Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(102, 'XIIAKL3', 'AKL', '202101250', '102', 'WIDYA CITRA SANTICA', 'XII', 'R.06', 1, '0051189619', 'VL122V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(103, 'XIIAKL3', 'AKL', '202101251', '103', 'WINA SITI APRILIYANTI', 'XII', 'R.06', 1, '0067256307', 'KV414P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(104, 'XIIAKL3', 'AKL', '202101252', '104', 'ZANITA RIKHAN AL ZAHRA', 'XII', 'R.06', 1, '0068689034', 'QQ851U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(105, 'XIIAKL4', 'AKL', '202101253', '105', 'ADRIAN NUR SIDIK', 'XII', 'R.06', 1, '0066714598', 'RZ377D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(106, 'XIIAKL4', 'AKL', '202101254', '106', 'AJENG RAHAYU AZZAHRA', 'XII', 'R.06', 1, '0066946660', 'VE765Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(107, 'XIIAKL4', 'AKL', '202101256', '107', 'CICA APRIYANI', 'XII', 'R.06', 1, '0064957413', 'VC834W', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(108, 'XIIAKL4', 'AKL', '202101257', '108', 'DEDE SOPHIA PUTRI', 'XII', 'R.06', 1, '0051032472', 'OX566Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(109, 'XIIAKL4', 'AKL', '202101258', '109', 'DIANDRA AMANDA DEVANA', 'XII', 'R.06', 1, '0065789248', 'FS534T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(110, 'XIIAKL4', 'AKL', '202101259', '110', 'DINI NURARISKA', 'XII', 'R.06', 1, '0061762537', 'DW362T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(111, 'XIIAKL4', 'AKL', '202101260', '111', 'DITA RAHMAWATI', 'XII', 'R.06', 1, '0064519889', 'SR553C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(112, 'XIIAKL4', 'AKL', '202101261', '112', 'ELSA YUNIAR', 'XII', 'R.06', 1, '0051064309', 'RO322H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(113, 'XIIAKL4', 'AKL', '202101262', '113', 'FAATIN ASHRI WIDIATIN', 'XII', 'R.06', 1, '0065007264', 'IK253K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(114, 'XIIAKL4', 'AKL', '202101263', '114', 'FELLINA HUGES FERONICA', 'XII', 'R.06', 1, '0032189448', 'WG697R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(115, 'XIIAKL4', 'AKL', '202101264', '115', 'FENI YULIANI', 'XII', 'R.06', 1, '0056835620', 'EE829C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(116, 'XIIAKL4', 'AKL', '202101265', '116', 'FITRIA AMANDA MUKAROMAH', 'XII', 'R.06', 1, '0073088103', 'WX587A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(117, 'XIIAKL4', 'AKL', '202101266', '117', 'ITA NABILA MASTUROH', 'XII', 'R.06', 1, '0065526999', 'WM462N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(118, 'XIIAKL4', 'AKL', '202101267', '118', 'LIA LAILATUL MAGFIROH', 'XII', 'R.06', 1, '0062644213', 'KN436Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(119, 'XIIAKL4', 'AKL', '202101268', '119', 'LISTA ANGGRAINI', 'XII', 'R.06', 1, '0068928247', 'EO900Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(120, 'XIIAKL4', 'AKL', '202101269', '120', 'MELI SUTIANI', 'XII', 'R.06', 1, '0061039533', 'MP786G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(121, 'XIIAKL4', 'AKL', '202101270', '121', 'MILA TARMILAH', 'XII', 'R.07', 1, '0055254900', 'ZS464H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(122, 'XIIAKL4', 'AKL', '202101271', '122', 'NAURA KHESYA MAHARANI PUTRI', 'XII', 'R.07', 1, '0063725362', 'HC759Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(123, 'XIIAKL4', 'AKL', '202101272', '123', 'NAZHIRA MEISYA HARDONO', 'XII', 'R.07', 1, '0067448478', 'JW945T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(124, 'XIIAKL4', 'AKL', '202101273', '124', 'NIDA FUZIANTI', 'XII', 'R.07', 1, '0062506565', 'MT760Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(125, 'XIIAKL4', 'AKL', '202101274', '125', 'NINDA NISA AMELIA', 'XII', 'R.07', 1, '0057412392', 'AJ933C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(126, 'XIIAKL4', 'AKL', '202101275', '126', 'NOVI FITRIYANI', 'XII', 'R.07', 1, '0055422661', 'PK658J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(127, 'XIIAKL4', 'AKL', '202101277', '127', 'RACHMA AULIA NURJANNAH', 'XII', 'R.07', 1, '0066405458', 'QZ688T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(128, 'XIIAKL4', 'AKL', '202101278', '128', 'RIMA ELIVIA', 'XII', 'R.07', 1, '0057576247', 'EX549H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(129, 'XIIAKL4', 'AKL', '202101279', '129', 'SABILA CESYA AULIA', 'XII', 'R.07', 1, '0061082523', 'YL344X', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(130, 'XIIAKL4', 'AKL', '202101280', '130', 'SALWA MAYDA INAYAH', 'XII', 'R.07', 1, '0062005356', 'TH411M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(131, 'XIIAKL4', 'AKL', '202101281', '131', 'SISKA KARTIKA', 'XII', 'R.07', 1, '0067013538', 'UQ490Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(132, 'XIIAKL4', 'AKL', '202101282', '132', 'SONNYA GALIBAH SAFFANAH', 'XII', 'R.07', 1, '0054791582', 'LT598M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(133, 'XIIAKL4', 'AKL', '202101283', '133', 'SRI OKTAVIANI', 'XII', 'R.07', 1, '0054994861', 'NF434E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(134, 'XIIAKL4', 'AKL', '202101284', '134', 'SYAHNAZ AULIA JIHANNATUSOFA ALFAZRIN', 'XII', 'R.07', 1, '0057796522', 'GO117N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `siswa` (`id_siswa`, `id_kelas`, `idpk`, `nis`, `no_peserta`, `nama`, `level`, `ruang`, `sesi`, `username`, `password`, `foto`, `server`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `agama`, `kebutuhan_khusus`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `jenis_tinggal`, `alat_transportasi`, `hp`, `email`, `skhun`, `no_kps`, `nama_ayah`, `tahun_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `nohp_ayah`, `nama_ibu`, `tahun_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `nohp_ibu`, `nama_wali`, `tahun_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `penghasilan_wali`, `angkatan`, `nisn`, `peserta_didik_id`, `semester_id`, `rombongan_belajar_id`, `status`, `online`) VALUES
(135, 'XIIAKL4', 'AKL', '202101285', '135', 'SYIFA FAUZIYYAH PUTRI', 'XII', 'R.07', 1, '0066125663', 'LT272O', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(136, 'XIIAKL4', 'AKL', '202101286', '136', 'TAMY NUR FADILLAH', 'XII', 'R.07', 1, '0063078163', 'YB692M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(137, 'XIIAKL4', 'AKL', '202101287', '137', 'TIARA NUR AISYAH', 'XII', 'R.07', 1, '0062466077', 'NZ530U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(138, 'XIIAKL4', 'AKL', '202101288', '138', 'WIDIA MEILANI', 'XII', 'R.07', 1, '0062502430', 'UZ304A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(139, 'XIIOTKP1', 'OTKP', '202102289', '139', 'ADINDA ARDINA TASYA', 'XII', 'R.08', 1, '0066219443', 'EF697T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(140, 'XIIOTKP1', 'OTKP', '202102290', '140', 'ALIA SOFIA ZAHRA', 'XII', 'R.08', 1, '0056799971', 'GR101I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(141, 'XIIOTKP1', 'OTKP', '202102291', '141', 'ANING RISTIANI', 'XII', 'R.08', 1, '0059909195', 'NE407J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(142, 'XIIOTKP1', 'OTKP', '202102292', '142', 'ANISSA GEMILANG', 'XII', 'R.08', 1, '0051759208', 'LZ818K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(143, 'XIIOTKP1', 'OTKP', '202102293', '143', 'CINDHY CINTHIYA', 'XII', 'R.08', 1, '0068098997', 'WV199D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(144, 'XIIOTKP1', 'OTKP', '202102294', '144', 'DAVI ARIFAH MUSYAFA', 'XII', 'R.08', 1, '0063346186', 'JW145H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(145, 'XIIOTKP1', 'OTKP', '202102295', '145', 'DEVISCKA TRESA SEPTIARA', 'XII', 'R.08', 1, '0062985290', 'ZF255C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(146, 'XIIOTKP1', 'OTKP', '202102297', '146', 'FANISYA INDRIANI PUTRI', 'XII', 'R.08', 1, '0063617266', 'GH828W', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(147, 'XIIOTKP1', 'OTKP', '202102298', '147', 'FANY WIRYANTI', 'XII', 'R.08', 1, '0067513155', 'CE709O', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(148, 'XIIOTKP1', 'OTKP', '202102299', '148', 'FITRI PIRDIANI', 'XII', 'R.08', 1, '0047840005', 'HA601B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(149, 'XIIOTKP1', 'OTKP', '202102300', '149', 'FRIZKA MEILY YANSYAH', 'XII', 'R.08', 1, '0064859480', 'XS386D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(150, 'XIIOTKP1', 'OTKP', '202102301', '150', 'HANA NURFITRIANI', 'XII', 'R.08', 1, '0051782952', 'NZ902R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(151, 'XIIOTKP1', 'OTKP', '202102302', '151', 'HELSA SUCI RIZKYA', 'XII', 'R.08', 1, '0067790595', 'DE901A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(152, 'XIIOTKP1', 'OTKP', '202102303', '152', 'HERLENI ISTIAH', 'XII', 'R.08', 1, '0061663311', 'VZ572S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(153, 'XIIOTKP1', 'OTKP', '202102304', '153', 'HILMI NURBAITI', 'XII', 'R.08', 1, '0067518174', 'BT464M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(154, 'XIIOTKP1', 'OTKP', '202102305', '154', 'ICHA FADILLA NUR AGUSTINA', 'XII', 'R.08', 1, '0064731252', 'EN161B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(155, 'XIIOTKP1', 'OTKP', '202102306', '155', 'IDEH KOMALASARI', 'XII', 'R.08', 1, '0059272947', 'ZL407T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(156, 'XIIOTKP1', 'OTKP', '202102307', '156', 'MAYA METALIA YANTARI', 'XII', 'R.08', 1, '0064248282', 'XN292U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(157, 'XIIOTKP1', 'OTKP', '202102308', '157', 'MELATI INDAH PERTIWI', 'XII', 'R.08', 1, '0051350129', 'CL180E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(158, 'XIIOTKP1', 'OTKP', '202102309', '158', 'MELINDA APRILIYANI', 'XII', 'R.08', 1, '0066845647', 'BX124E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(159, 'XIIOTKP1', 'OTKP', '202102310', '159', 'NAYLLA YUNITA AULIA', 'XII', 'R.09', 1, '0064421114', 'SM698U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(160, 'XIIOTKP1', 'OTKP', '202102311', '160', 'NOVI FITRIANI RAMADANI', 'XII', 'R.09', 1, '0055749096', 'RA828Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(161, 'XIIOTKP1', 'OTKP', '202102312', '161', 'PURI ARDIYANI', 'XII', 'R.09', 1, '0055773871', 'UI701X', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(162, 'XIIOTKP1', 'OTKP', '202102314', '162', 'PUTRI NOVIANTI', 'XII', 'R.09', 1, '0068109566', 'ZD841R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(163, 'XIIOTKP1', 'OTKP', '202102315', '163', 'SALMA AULIA', 'XII', 'R.09', 1, '0048907257', 'SP634G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(164, 'XIIOTKP1', 'OTKP', '202102316', '164', 'SALMA SITI FARHANY', 'XII', 'R.09', 1, '0065819151', 'GU368H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(165, 'XIIOTKP1', 'OTKP', '202102317', '165', 'SHEILDA NURLYA AMANDA', 'XII', 'R.09', 1, '0068567554', 'VH987W', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(166, 'XIIOTKP1', 'OTKP', '202102318', '166', 'SITI RAHMAWATI', 'XII', 'R.09', 1, '0062064075', 'TI135E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(167, 'XIIOTKP1', 'OTKP', '202102319', '167', 'SITI TASYA KHOERIAH', 'XII', 'R.09', 1, '0062965961', 'RY949D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(168, 'XIIOTKP1', 'OTKP', '202102320', '168', 'SUCI AMELIA', 'XII', 'R.09', 1, '0051940101', 'YL673U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(169, 'XIIOTKP1', 'OTKP', '202102321', '169', 'TASYA MEILANI', 'XII', 'R.09', 1, '0067882835', 'SX976Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(170, 'XIIOTKP1', 'OTKP', '202102322', '170', 'TESSA AWALIA HIDAYANINGSIH', 'XII', 'R.09', 1, '0054259297', 'ZL100Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(171, 'XIIOTKP1', 'OTKP', '202102323', '171', 'TITA', 'XII', 'R.09', 1, '0066845842', 'ZT175Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(172, 'XIIOTKP1', 'OTKP', '202102324', '172', 'YULI NURANISA', 'XII', 'R.09', 1, '0067442612', 'VJ166L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(173, 'XIIOTKP2', 'OTKP', '202102325', '173', 'AMELIA RAMADHANI', 'XII', 'R.09', 1, '0058672757', 'QS631N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(174, 'XIIOTKP2', 'OTKP', '202102326', '174', 'AMILIAH SYAWALINA', 'XII', 'R.09', 1, '0054772107', 'XB342V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(175, 'XIIOTKP2', 'OTKP', '202102327', '175', 'ANISAH NURHAMDAH', 'XII', 'R.09', 1, '0062995330', 'WL802I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(176, 'XIIOTKP2', 'OTKP', '202102328', '176', 'ASTI MAELANI', 'XII', 'R.09', 1, '0067207102', 'NT960D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(177, 'XIIOTKP2', 'OTKP', '202102329', '177', 'DELA SARTIKA', 'XII', 'R.09', 1, '0059635267', 'RL491E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(178, 'XIIOTKP2', 'OTKP', '202102330', '178', 'DIAZ RIASHA IMMAWATI', 'XII', 'R.09', 1, '0052890248', 'TW696X', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(179, 'XIIOTKP2', 'OTKP', '202102331', '179', 'DINA NOVIANA', 'XII', 'R.10', 1, '0054027828', 'LC200K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(180, 'XIIOTKP2', 'OTKP', '202102332', '180', 'DINI NOVIYANTI', 'XII', 'R.10', 1, '0052247938', 'ZO560L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(181, 'XIIOTKP2', 'OTKP', '202102333', '181', 'EGA PRADITA', 'XII', 'R.10', 1, '0063027972', 'TM541S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(182, 'XIIOTKP2', 'OTKP', '202102334', '182', 'ELIN NURYANI', 'XII', 'R.10', 1, '0056884229', 'FR621C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(183, 'XIIOTKP2', 'OTKP', '202102335', '183', 'IRMA MULYANI', 'XII', 'R.10', 1, '0064854086', 'QT727T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(184, 'XIIOTKP2', 'OTKP', '202102336', '184', 'IYA APRIANI', 'XII', 'R.10', 1, '0055495367', 'YM184W', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(185, 'XIIOTKP2', 'OTKP', '202102337', '185', 'JUARIAH', 'XII', 'R.10', 1, '0059523070', 'KT699B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(186, 'XIIOTKP2', 'OTKP', '202102338', '186', 'MAUDY NOER KHARISMA', 'XII', 'R.10', 1, '0067751003', 'OY835S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(187, 'XIIOTKP2', 'OTKP', '202102339', '187', 'MAYESHA NIDA NAIILA', 'XII', 'R.10', 1, '0063016014', 'XD418B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(188, 'XIIOTKP2', 'OTKP', '202102340', '188', 'NAFISYA AULIA PUTRI NUR INSANI', 'XII', 'R.10', 1, '0063212650', 'ME254R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(189, 'XIIOTKP2', 'OTKP', '202102341', '189', 'NASWA NATASYA APRILIKA', 'XII', 'R.10', 1, '0062597970', 'RN469S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(190, 'XIIOTKP2', 'OTKP', '202102342', '190', 'NENG NOVA ADELIA', 'XII', 'R.10', 1, '0055475470', 'IY564L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(191, 'XIIOTKP2', 'OTKP', '202102344', '191', 'NINDA SITI FADILAH', 'XII', 'R.10', 1, '0055375263', 'GE562V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(192, 'XIIOTKP2', 'OTKP', '202102345', '192', 'NOPITA SARI', 'XII', 'R.10', 1, '0069689440', 'HQ328L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(193, 'XIIOTKP2', 'OTKP', '202102346', '193', 'NURMILA FITRIANI', 'XII', 'R.10', 1, '0051275602', 'BB712W', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(194, 'XIIOTKP2', 'OTKP', '202102347', '194', 'PEBRIYANTI', 'XII', 'R.10', 1, '0064947830', 'CB226C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(195, 'XIIOTKP2', 'OTKP', '202102348', '195', 'PINGKAN', 'XII', 'R.10', 1, '0059505442', 'MF214P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(196, 'XIIOTKP2', 'OTKP', '202102349', '196', 'RAHMA SANTY', 'XII', 'R.10', 1, '0068931985', 'BF479F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(197, 'XIIOTKP2', 'OTKP', '202102350', '197', 'RAICHA ADE LYA PRATIWI', 'XII', 'R.10', 1, '0061994858', 'UN677O', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(198, 'XIIOTKP2', 'OTKP', '202102351', '198', 'RD. MIMA SITI RAHAYU', 'XII', 'R.10', 1, '0066860762', 'NJ641M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(199, 'XIIOTKP2', 'OTKP', '202102352', '199', 'RISMA YULIANA', 'XII', 'R.11', 1, '0055724440', 'DC595H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(200, 'XIIOTKP2', 'OTKP', '202102353', '200', 'SINTA ARIANI', 'XII', 'R.11', 1, '0056661045', 'IX822K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(201, 'XIIOTKP2', 'OTKP', '202102354', '201', 'SOPI SILVIA', 'XII', 'R.11', 1, '0068414533', 'YL664C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(202, 'XIIOTKP2', 'OTKP', '202102355', '202', 'SUSI ROSFIANTI', 'XII', 'R.11', 1, '0057666648', 'WX969I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(203, 'XIIOTKP2', 'OTKP', '202102356', '203', 'SYINTIA NUR FADILAH', 'XII', 'R.11', 1, '0066904377', 'TS883M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(204, 'XIIOTKP2', 'OTKP', '202102357', '204', 'USI AGUSTINI', 'XII', 'R.11', 1, '0051902153', 'OI338E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(205, 'XIIOTKP2', 'OTKP', '202102358', '205', 'VANISA SAFARA', 'XII', 'R.11', 1, '0065863048', 'JY502W', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(206, 'XIIOTKP2', 'OTKP', '202102359', '206', 'WULAN PUJI LESTARI', 'XII', 'R.11', 1, '0062579005', 'DF481Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(207, 'XIIOTKP3', 'OTKP', '202102361', '207', 'ADELLIA NUR SETIAWAN', 'XII', 'R.11', 1, '0054855805', 'LS261N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(208, 'XIIOTKP3', 'OTKP', '202102362', '208', 'ALYA SOVYA', 'XII', 'R.11', 1, '0065300180', 'BQ131M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(209, 'XIIOTKP3', 'OTKP', '202102363', '209', 'ANGGUN SEPTIANI', 'XII', 'R.11', 1, '0043487267', 'LT201P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(210, 'XIIOTKP3', 'OTKP', '202102364', '210', 'ANITA ALZAHRA', 'XII', 'R.11', 1, '0065192552', 'QD214U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(211, 'XIIOTKP3', 'OTKP', '202102365', '211', 'DESI AMELIA', 'XII', 'R.11', 1, '0062726938', 'WW598V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(212, 'XIIOTKP3', 'OTKP', '202102367', '212', 'FADILA PUJAWATI ASTARI', 'XII', 'R.11', 1, '0044954048', 'FC402J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(213, 'XIIOTKP3', 'OTKP', '202102368', '213', 'FELISHA ALYA FERNANDA', 'XII', 'R.11', 1, '0057543377', 'FA260S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(214, 'XIIOTKP3', 'OTKP', '202102369', '214', 'GINA KARTIKA', 'XII', 'R.11', 1, '0067618307', 'AA789J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(215, 'XIIOTKP3', 'OTKP', '202102370', '215', 'GITA RAHMADINI', 'XII', 'R.11', 1, '0054492042', 'SD577A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(216, 'XIIOTKP3', 'OTKP', '202102371', '216', 'GUSTDINI', 'XII', 'R.11', 1, '0069475676', 'KK152L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(217, 'XIIOTKP3', 'OTKP', '202102372', '217', 'HANA YULIANA PUTRI', 'XII', 'R.11', 1, '0068242795', 'QE141M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(218, 'XIIOTKP3', 'OTKP', '202102373', '218', 'HERA AULIA FADILAH', 'XII', 'R.11', 1, '0058115093', 'DR887E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(219, 'XIIOTKP3', 'OTKP', '202102374', '219', 'INDI AULIA', 'XII', 'R.12', 1, '0054903470', 'OJ340V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(220, 'XIIOTKP3', 'OTKP', '202102375', '220', 'IRMA DEVIRA', 'XII', 'R.12', 1, '0069279034', 'AD954X', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(221, 'XIIOTKP3', 'OTKP', '202102376', '221', 'LISNA DANIA RAHAYU', 'XII', 'R.12', 1, '0058045922', 'HD185T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(222, 'XIIOTKP3', 'OTKP', '202102378', '222', 'MELISA RAHMAWATI', 'XII', 'R.12', 1, '0061514085', 'HZ660C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(223, 'XIIOTKP3', 'OTKP', '202102379', '223', 'MIA SRI LESTARI', 'XII', 'R.12', 1, '0061978757', 'SU227S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(224, 'XIIOTKP3', 'OTKP', '202102380', '224', 'MISYEL DELIANA', 'XII', 'R.12', 1, '0053174207', 'XF997Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(225, 'XIIOTKP3', 'OTKP', '202102381', '225', 'MUTIARA NUR ARIFAH', 'XII', 'R.12', 1, '0068001324', 'IK118K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(226, 'XIIOTKP3', 'OTKP', '202102382', '226', 'NAISA WULANDARI', 'XII', 'R.12', 1, '0065095690', 'DR377Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(227, 'XIIOTKP3', 'OTKP', '202102383', '227', 'NANDA SITI JULIA', 'XII', 'R.12', 1, '0056041808', 'NV699I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(228, 'XIIOTKP3', 'OTKP', '202102384', '228', 'PIPIH KRIES ANDIANTI', 'XII', 'R.12', 1, '0061875683', 'SO206B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(229, 'XIIOTKP3', 'OTKP', '202102385', '229', 'RATIFA SRI KUSWANTI', 'XII', 'R.12', 1, '0064996961', 'DL779G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(230, 'XIIOTKP3', 'OTKP', '202102386', '230', 'RITA YULIANA HERMAN', 'XII', 'R.12', 1, '0058357385', 'MT328Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(231, 'XIIOTKP3', 'OTKP', '202102387', '231', 'SHASA ARIYANA SEHA', 'XII', 'R.12', 1, '0064920784', 'KS745S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(232, 'XIIOTKP3', 'OTKP', '202102388', '232', 'SILVYA SANTIKA DEWI', 'XII', 'R.12', 1, '0069171405', 'TN805S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(233, 'XIIOTKP3', 'OTKP', '202102389', '233', 'SISKA JAYUSMAN', 'XII', 'R.12', 1, '0063706561', 'FL975Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(234, 'XIIOTKP3', 'OTKP', '202102390', '234', 'SITI HALIMAH', 'XII', 'R.12', 1, '0079641799', 'QY847S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(235, 'XIIOTKP3', 'OTKP', '202102391', '235', 'SITI NURJANAH', 'XII', 'R.12', 1, '0051940102', 'RC786I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(236, 'XIIOTKP3', 'OTKP', '202102392', '236', 'SITI YULIANA PUTRI', 'XII', 'R.12', 1, '0051942064', 'SH659Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(237, 'XIIOTKP3', 'OTKP', '202102393', '237', 'SRI DAHIBAH DEA PERMANAJATI', 'XII', 'R.12', 1, '0056910995', 'NU828C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(238, 'XIIOTKP3', 'OTKP', '202102394', '238', 'TINA APRILIANI PURNAMASARI', 'XII', 'R.12', 1, '0061513352', 'NF197X', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(239, 'XIIOTKP3', 'OTKP', '202102395', '239', 'TRIANA AGUSTA AULIA AMDA', 'XII', 'R.13', 1, '0053523525', 'EL751H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(240, 'XIIOTKP3', 'OTKP', '202102396', '240', 'YANTI SETIAWATI', 'XII', 'R.13', 1, '0067177355', 'ZV521G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(241, 'XIIOTKP4', 'OTKP', '202102397', '241', 'ADELLITA ANANTASYA', 'XII', 'R.13', 1, '0062361477', 'TX593D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(242, 'XIIOTKP4', 'OTKP', '202102398', '242', 'ALFIRA BARI VILLAREAL', 'XII', 'R.13', 1, '0059180681', 'VV915L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(243, 'XIIOTKP4', 'OTKP', '202102399', '243', 'ANISA JULIYANTI', 'XII', 'R.13', 1, '0077701405', 'NR200F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(244, 'XIIOTKP4', 'OTKP', '202102400', '244', 'ANITA APRIANI', 'XII', 'R.13', 1, '0068509934', 'VX743P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(245, 'XIIOTKP4', 'OTKP', '202102401', '245', 'APRILLIANA FRATIWI', 'XII', 'R.13', 1, '0063263076', 'HN349I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(246, 'XIIOTKP4', 'OTKP', '202102402', '246', 'ARTIKA DEWI PUTRI', 'XII', 'R.13', 1, '0068211426', 'JB976L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(247, 'XIIOTKP4', 'OTKP', '202102403', '247', 'ASTI PURNAMA SARI', 'XII', 'R.13', 1, '0063465678', 'TK523R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(248, 'XIIOTKP4', 'OTKP', '202102404', '248', 'DAFINA FITRI AZZACHRA', 'XII', 'R.13', 1, '0068354533', 'UI122K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(249, 'XIIOTKP4', 'OTKP', '202102405', '249', 'DELISA NURHAYATI', 'XII', 'R.13', 1, '0064756502', 'KZ350P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(250, 'XIIOTKP4', 'OTKP', '202102407', '250', 'EVA NURMAYANTI', 'XII', 'R.13', 1, '0053605148', 'TK594G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(251, 'XIIOTKP4', 'OTKP', '202102408', '251', 'FERA FAUJIANA', 'XII', 'R.13', 1, '0058633212', 'TL943L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(252, 'XIIOTKP4', 'OTKP', '202102409', '252', 'FITRI AYU LESTARI', 'XII', 'R.13', 1, '0069254050', 'RZ948N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(253, 'XIIOTKP4', 'OTKP', '202102410', '253', 'FITRIA FERAWATI', 'XII', 'R.13', 1, '0066308600', 'GZ209Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(254, 'XIIOTKP4', 'OTKP', '202102411', '254', 'HANI KHOIRUNNISA', 'XII', 'R.13', 1, '0059328836', 'MZ533L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(255, 'XIIOTKP4', 'OTKP', '202102412', '255', 'ICHA CAHYATI', 'XII', 'R.13', 1, '0059149702', 'VN653E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(256, 'XIIOTKP4', 'OTKP', '202102413', '256', 'INTAN ANDINI ROHIMAT', 'XII', 'R.13', 1, '0053792592', 'DV897Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(257, 'XIIOTKP4', 'OTKP', '202102414', '257', 'IRNA MEL LESTARI', 'XII', 'R.13', 1, '0058538364', 'OM173F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(258, 'XIIOTKP4', 'OTKP', '202102415', '258', 'JIHAN AMALIA SALSABILA', 'XII', 'R.13', 1, '0062416199', 'HH485Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(259, 'XIIOTKP4', 'OTKP', '202102416', '259', 'LENI SITI NUR HANIFAH', 'XII', 'R.14', 1, '0061960387', 'NM733Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(260, 'XIIOTKP4', 'OTKP', '202102417', '260', 'LIVIA HUTRIAYU MULYANA', 'XII', 'R.14', 1, '0063831148', 'NU179L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(261, 'XIIOTKP4', 'OTKP', '202102419', '261', 'NABILA AYUDHIAWATI', 'XII', 'R.14', 1, '0061955849', 'JC679Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(262, 'XIIOTKP4', 'OTKP', '202102420', '262', 'NAFIRSHA ARONSO PUTRI', 'XII', 'R.14', 1, '0071352249', 'RA981B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(263, 'XIIOTKP4', 'OTKP', '202102421', '263', 'NEZA TASIKA PUTRI', 'XII', 'R.14', 1, '0068500766', 'QZ946W', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(264, 'XIIOTKP4', 'OTKP', '202102422', '264', 'NINA HARI PUTRI LESTARI', 'XII', 'R.14', 1, '0065167257', 'AG743I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(265, 'XIIOTKP4', 'OTKP', '202102423', '265', 'NOVIA ANGGRAENI', 'XII', 'R.14', 1, '0059486187', 'DE701V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(266, 'XIIOTKP4', 'OTKP', '202102424', '266', 'PERA SITI PADILAH', 'XII', 'R.14', 1, '0062138656', 'XP701B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(267, 'XIIOTKP4', 'OTKP', '202102426', '267', 'REVINA', 'XII', 'R.14', 1, '0069024512', 'IV612D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `siswa` (`id_siswa`, `id_kelas`, `idpk`, `nis`, `no_peserta`, `nama`, `level`, `ruang`, `sesi`, `username`, `password`, `foto`, `server`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `agama`, `kebutuhan_khusus`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `jenis_tinggal`, `alat_transportasi`, `hp`, `email`, `skhun`, `no_kps`, `nama_ayah`, `tahun_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `nohp_ayah`, `nama_ibu`, `tahun_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `nohp_ibu`, `nama_wali`, `tahun_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `penghasilan_wali`, `angkatan`, `nisn`, `peserta_didik_id`, `semester_id`, `rombongan_belajar_id`, `status`, `online`) VALUES
(268, 'XIIOTKP4', 'OTKP', '202102427', '268', 'RIMELDA APRIYANTI', 'XII', 'R.14', 1, '0037603949', 'YU880B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(269, 'XIIOTKP4', 'OTKP', '202102428', '269', 'SELLY AURELIA SIDIK', 'XII', 'R.14', 1, '0067207756', 'TJ174B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(270, 'XIIOTKP4', 'OTKP', '202102429', '270', 'SULISTIA FAIQOH ARDANA', 'XII', 'R.14', 1, '0065922072', 'TB465J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(271, 'XIIOTKP4', 'OTKP', '202102430', '271', 'THETHY RACHMAWATHY', 'XII', 'R.14', 1, '0051472473', 'ZS911Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(272, 'XIIOTKP4', 'OTKP', '202102431', '272', 'TITA HARTATI', 'XII', 'R.14', 1, '0066717465', 'CW508C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(273, 'XIIOTKP4', 'OTKP', '202102432', '273', 'YESSA NUR OCTAVIANI', 'XII', 'R.14', 1, '0054108771', 'SK561D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(274, 'XIIBDP1', 'BDP', '202103433', '274', 'AI DINI SALSABANI', 'XII', 'R.15', 1, '0068839132', 'PP946B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(275, 'XIIBDP1', 'BDP', '202103435', '275', 'ALIFIA NUR FADHILAH', 'XII', 'R.15', 1, '0067659708', 'CH437D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(276, 'XIIBDP1', 'BDP', '202103436', '276', 'ANNISA NURFITRIA', 'XII', 'R.15', 1, '0055033912', 'LP923M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(277, 'XIIBDP1', 'BDP', '202103437', '277', 'APRILIA ANGGRAENI', 'XII', 'R.15', 1, '0058460092', 'EV279B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(278, 'XIIBDP1', 'BDP', '202103439', '278', 'CUCU NUR ANISA', 'XII', 'R.15', 1, '0054750534', 'FU687K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(279, 'XIIBDP1', 'BDP', '202103440', '279', 'DESTYANI MAYANGSARI', 'XII', 'R.15', 1, '0062911508', 'NI358F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(280, 'XIIBDP1', 'BDP', '202103441', '280', 'DIAN APRILIA', 'XII', 'R.15', 1, '0062483674', 'CX646V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(281, 'XIIBDP1', 'BDP', '202103442', '281', 'ELSYA AGNI AGUSTIN', 'XII', 'R.15', 1, '0063287949', 'XL109N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(282, 'XIIBDP1', 'BDP', '202103443', '282', 'ENDAH SRI KINKIN', 'XII', 'R.15', 1, '0062429027', 'QQ480M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(283, 'XIIBDP1', 'BDP', '202103444', '283', 'ERNI PARINTIANA', 'XII', 'R.15', 1, '0059364349', 'VV439P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(284, 'XIIBDP1', 'BDP', '202103445', '284', 'HERNA YULIANTI', 'XII', 'R.15', 1, '0068264813', 'NH762E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(285, 'XIIBDP1', 'BDP', '202103446', '285', 'LIVIDHIARA OCTAFIANTIE SETIAWAN', 'XII', 'R.15', 1, '0059320098', 'MA666O', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(286, 'XIIBDP1', 'BDP', '202103447', '286', 'MEGA AULIYA', 'XII', 'R.15', 1, '0054585722', 'CT126E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(287, 'XIIBDP1', 'BDP', '202103448', '287', 'NAURA DWI APRIANI', 'XII', 'R.15', 1, '0068457939', 'GJ269X', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(288, 'XIIBDP1', 'BDP', '202103449', '288', 'NINA SURYANI', 'XII', 'R.15', 1, '0054848444', 'PS761L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(289, 'XIIBDP1', 'BDP', '202103450', '289', 'NISA SAPARIDA', 'XII', 'R.15', 1, '0063714487', 'TQ711C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(290, 'XIIBDP1', 'BDP', '202103451', '290', 'RARAS NUR AENI', 'XII', 'R.15', 1, '0068535819', 'UK738B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(291, 'XIIBDP1', 'BDP', '202103452', '291', 'RATNA SARI', 'XII', 'R.15', 1, '0042264633', 'MO584G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(292, 'XIIBDP1', 'BDP', '202103453', '292', 'RESTI MUTIARA DALIANTIE', 'XII', 'R.15', 1, '0053856198', 'ST866G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(293, 'XIIBDP1', 'BDP', '202103454', '293', 'RIRIN SETYAWATI', 'XII', 'R.15', 1, '0067500214', 'IX521B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(294, 'XIIBDP1', 'BDP', '202103455', '294', 'SESYA FITRIANI DEWI', 'XII', 'R.16', 1, '0057795884', 'EG505D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(295, 'XIIBDP1', 'BDP', '202103456', '295', 'SITI HOPIPAH', 'XII', 'R.16', 1, '0059522103', 'ZB863I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(296, 'XIIBDP1', 'BDP', '202103457', '296', 'SITI SOPIAH', 'XII', 'R.16', 1, '0065035497', 'YP972M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(297, 'XIIBDP1', 'BDP', '202103458', '297', 'SYANIA MEY SARASWATY', 'XII', 'R.16', 1, '0068208467', 'SQ245N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(298, 'XIIBDP1', 'BDP', '202103459', '298', 'TIARA YULIYANTI', 'XII', 'R.16', 1, '0064050636', 'UF647D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(299, 'XIIBDP1', 'BDP', '202103460', '299', 'TIRA CAHNIA', 'XII', 'R.16', 1, '0069772158', 'JY526T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(300, 'XIIBDP1', 'BDP', '202103461', '300', 'TIWI UTAMI', 'XII', 'R.16', 1, '0063031682', 'DP321A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(301, 'XIIBDP1', 'BDP', '202103462', '301', 'TRESNAWATI RAMADANI', 'XII', 'R.16', 1, '0062604390', 'HY190I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(302, 'XIIBDP1', 'BDP', '202103463', '302', 'TRIA APRILIA', 'XII', 'R.16', 1, '0068979660', 'CX729U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(303, 'XIIBDP1', 'BDP', '202103464', '303', 'VENIA OKTAPRIANTI', 'XII', 'R.16', 1, '0061212831', 'FC727L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(304, 'XIIBDP1', 'BDP', '202103465', '304', 'YANI OKTAVIANI ASTUTI', 'XII', 'R.16', 1, '0052525451', 'QI353G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(305, 'XIIBDP1', 'BDP', '202103466', '305', 'ZABRINA ERDIANA PUTRI', 'XII', 'R.16', 1, '0069164251', 'ZQ937F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(306, 'XIIBDP1', 'BDP', '202103467', '306', 'ZAHIRA CHOERUNISA', 'XII', 'R.16', 1, '0062685651', 'FP291V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(307, 'XIIBDP1', 'BDP', '202103468', '307', 'ZAHRA SITI NURJANAH', 'XII', 'R.16', 1, '0056793033', 'HX897B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(308, 'XIIBDP2', 'BDP', '202103469', '308', 'AGISTIYAN SURYANI', 'XII', 'R.16', 1, '0064811157', 'SV646G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(309, 'XIIBDP2', 'BDP', '202103470', '309', 'ALIFIA R. NISYYATUN', 'XII', 'R.16', 1, '0061129168', 'VO725Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(310, 'XIIBDP2', 'BDP', '202103471', '310', 'ALIYA SAGITA OKTAVIANI', 'XII', 'R.16', 1, '0064512797', 'ON823Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(311, 'XIIBDP2', 'BDP', '202103472', '311', 'ALLYSA NURUL FADILLA', 'XII', 'R.16', 1, '0055295805', 'II842P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(312, 'XIIBDP2', 'BDP', '202103473', '312', 'ALYA PUTRI NAFISA', 'XII', 'R.16', 1, '0051362174', 'WU306K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(313, 'XIIBDP2', 'BDP', '202103474', '313', 'AMELIA RAHMAWATI', 'XII', 'R.16', 1, '0068317961', 'GK513Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(314, 'XIIBDP2', 'BDP', '202103475', '314', 'ANISA PUTRI SUSILAWATI', 'XII', 'R.17', 1, '0064480912', 'DI729Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(315, 'XIIBDP2', 'BDP', '202103476', '315', 'ANNISA NUR FAIDAH', 'XII', 'R.17', 1, '0064112004', 'TU121I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(316, 'XIIBDP2', 'BDP', '202103477', '316', 'ARSITA DEWI SYAHARANI', 'XII', 'R.17', 1, '0068438792', 'RD324K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(317, 'XIIBDP2', 'BDP', '202103478', '317', 'DELIA', 'XII', 'R.17', 1, '0068574021', 'KP257B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(318, 'XIIBDP2', 'BDP', '202103479', '318', 'DEVI ANUGRAH SEPTYANI', 'XII', 'R.17', 1, '0052973017', 'NE619R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(319, 'XIIBDP2', 'BDP', '202103480', '319', 'DINI APRIYANI', 'XII', 'R.17', 1, '0064977210', 'NK924F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(320, 'XIIBDP2', 'BDP', '202103481', '320', 'ELYSHA HERLYANA', 'XII', 'R.17', 1, '0059887275', 'JE792I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(321, 'XIIBDP2', 'BDP', '202103482', '321', 'ERLINA HERLIANA', 'XII', 'R.17', 1, '0068977265', 'JS842I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(322, 'XIIBDP2', 'BDP', '202103483', '322', 'GHINA SITI NURJANAH', 'XII', 'R.17', 1, '0064024375', 'BL597N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(323, 'XIIBDP2', 'BDP', '202103484', '323', 'HANA KHOIRUNISA', 'XII', 'R.17', 1, '0059675652', 'WE504D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(324, 'XIIBDP2', 'BDP', '202103485', '324', 'IFFA KAMILLA NURASYIFFA', 'XII', 'R.17', 1, '0072738607', 'JU405D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(325, 'XIIBDP2', 'BDP', '202103486', '325', 'IMA AINI', 'XII', 'R.17', 1, '0074615480', 'MI511P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(326, 'XIIBDP2', 'BDP', '202103487', '326', 'INE SINTIA', 'XII', 'R.17', 1, '0046304635', 'KZ431C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(327, 'XIIBDP2', 'BDP', '202103488', '327', 'KINANTI TIA LESTARI', 'XII', 'R.17', 1, '0069306449', 'DU505A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(328, 'XIIBDP2', 'BDP', '202103489', '328', 'MEILANI ZAHRA NURJANNAH', 'XII', 'R.17', 1, '0064109702', 'NU753D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(329, 'XIIBDP2', 'BDP', '202103490', '329', 'MIRA ANDANI', 'XII', 'R.17', 1, '0054415054', 'FD691T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(330, 'XIIBDP2', 'BDP', '202103491', '330', 'NANDA RIZQIKHAN ARIMBI', 'XII', 'R.17', 1, '0067929470', 'FY101T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(331, 'XIIBDP2', 'BDP', '202103492', '331', 'NURULJANAH', 'XII', 'R.17', 1, '0068882287', 'MP953Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(332, 'XIIBDP2', 'BDP', '202103493', '332', 'RESSA AGUSTINA', 'XII', 'R.17', 1, '0065341855', 'WW462I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(333, 'XIIBDP2', 'BDP', '202103494', '333', 'REVALINA', 'XII', 'R.17', 1, '0053853768', 'VE213F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(334, 'XIIBDP2', 'BDP', '202103495', '334', 'RIZKY AULIA JAYA Br HUTAGALUNG', 'XII', 'R.18', 1, '0065796423', 'DK581N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(335, 'XIIBDP2', 'BDP', '202103496', '335', 'ROHAYATI', 'XII', 'R.18', 1, '0059750483', 'YW874R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(336, 'XIIBDP2', 'BDP', '202103497', '336', 'SALMA FAUZIAH', 'XII', 'R.18', 1, '0068309155', 'EF324Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(337, 'XIIBDP2', 'BDP', '202103498', '337', 'SEPHIA NUR RIZKY', 'XII', 'R.18', 1, '0054285783', 'QK698D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(338, 'XIIBDP2', 'BDP', '202103499', '338', 'SITI NURLAELA', 'XII', 'R.18', 1, '0064332007', 'XD732K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(339, 'XIIBDP2', 'BDP', '202103500', '339', 'SULISTIA SURYANI', 'XII', 'R.18', 1, '0056195860', 'DG979A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(340, 'XIIBDP2', 'BDP', '202103501', '340', 'TIA RENITA DESTIANI', 'XII', 'R.18', 1, '0059361225', 'VZ830R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(341, 'XIIBDP2', 'BDP', '202103502', '341', 'TIARA NUR HOLIVAH', 'XII', 'R.18', 1, '0053725253', 'NS914W', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(342, 'XIIBDP2', 'BDP', '202103503', '342', 'TRIANI NURHASANAH', 'XII', 'R.18', 1, '0069723130', 'SU325D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(343, 'XIIBDP2', 'BDP', '202103504', '343', 'WAFFA AULIA SYABINA PUTRI', 'XII', 'R.18', 1, '0054445063', 'UW553Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(344, 'XIIBDP3', 'BDP', '202103506', '344', 'ANITA', 'XII', 'R.18', 1, '0054448841', 'WP384C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(345, 'XIIBDP3', 'BDP', '202103507', '345', 'ASNI ANJANI', 'XII', 'R.18', 1, '0063622097', 'WJ247X', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(346, 'XIIBDP3', 'BDP', '202103508', '346', 'CASTI ADHARANI', 'XII', 'R.18', 1, '0068400225', 'YP231G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(347, 'XIIBDP3', 'BDP', '202103509', '347', 'CHIKA ARYANTI', 'XII', 'R.18', 1, '0063208072', 'XM828J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(348, 'XIIBDP3', 'BDP', '202103510', '348', 'CYNDY AULIA RAMADANI', 'XII', 'R.18', 1, '0055980275', 'SH459D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(349, 'XIIBDP3', 'BDP', '202103512', '349', 'DIAH NUR ELA', 'XII', 'R.18', 1, '0055141888', 'YQ218X', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(350, 'XIIBDP3', 'BDP', '202103513', '350', 'EZY DWI APRILIANTI', 'XII', 'R.18', 1, '0061181950', 'AY749F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(351, 'XIIBDP3', 'BDP', '202103514', '351', 'HANI NUR ANISA', 'XII', 'R.18', 1, '0058996224', 'HT371N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(352, 'XIIBDP3', 'BDP', '202103515', '352', 'HAPPY NABILLA KARTIPAH', 'XII', 'R.18', 1, '0058443522', 'EI949Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(353, 'XIIBDP3', 'BDP', '202103516', '353', 'HAWA HAMIDAH', 'XII', 'R.18', 1, '0063212578', 'IC536H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(354, 'XIIBDP3', 'BDP', '202103517', '354', 'ILA PERMATASARI', 'XII', 'R.19', 1, '0067062562', 'IO754V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(355, 'XIIBDP3', 'BDP', '202103518', '355', 'INDRY ANGGRAENI NURHIDAYAH', 'XII', 'R.19', 1, '0069569947', 'BY954P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(356, 'XIIBDP3', 'BDP', '202103519', '356', 'INTAN FUZI LESTARI', 'XII', 'R.19', 1, '0054417924', 'JA689N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(357, 'XIIBDP3', 'BDP', '202103520', '357', 'INTAN NUR SYIFA', 'XII', 'R.19', 1, '0063231403', 'VK336G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(358, 'XIIBDP3', 'BDP', '202103521', '358', 'JESSYKA INKA PUTRI', 'XII', 'R.19', 1, '0058151400', 'QH287T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(359, 'XIIBDP3', 'BDP', '202103522', '359', 'JULIA NURUL SAFITRI', 'XII', 'R.19', 1, '0065918204', 'AW461R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(360, 'XIIBDP3', 'BDP', '202103523', '360', 'KEYRA FASYA KARINA', 'XII', 'R.19', 1, '0059125588', 'PF822R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(361, 'XIIBDP3', 'BDP', '202103524', '361', 'LEKSA MUTMAINAH', 'XII', 'R.19', 1, '0051542431', 'QA490P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(362, 'XIIBDP3', 'BDP', '202103525', '362', 'MUTIARA KAMILA NURFADILAH', 'XII', 'R.19', 1, '0061302329', 'AE519O', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(363, 'XIIBDP3', 'BDP', '202103526', '363', 'NAILA JULIANI', 'XII', 'R.19', 1, '0062858998', 'BM957U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(364, 'XIIBDP3', 'BDP', '202103527', '364', 'NIESA SYAHRANI M', 'XII', 'R.19', 1, '0066237707', 'FW904I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(365, 'XIIBDP3', 'BDP', '202103528', '365', 'NUR ELYANA NATASYA', 'XII', 'R.19', 1, '0053828216', 'YO983L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(366, 'XIIBDP3', 'BDP', '202103529', '366', 'PUTRI MEILANI', 'XII', 'R.19', 1, '0054239119', 'XD435V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(367, 'XIIBDP3', 'BDP', '202103530', '367', 'REVANI ROSTIANA', 'XII', 'R.19', 1, '0054469351', 'FS645V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(368, 'XIIBDP3', 'BDP', '202103531', '368', 'RIFA AULYA LUDIANA', 'XII', 'R.19', 1, '0068295110', 'FK135K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(369, 'XIIBDP3', 'BDP', '202103532', '369', 'RIFANA ADITIYA NANDA', 'XII', 'R.19', 1, '0051446890', 'JA922R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(370, 'XIIBDP3', 'BDP', '202103533', '370', 'RITA TALIA LESTARI', 'XII', 'R.19', 1, '0066243796', 'JK493L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(371, 'XIIBDP3', 'BDP', '202103534', '371', 'SITI NURJANAH', 'XII', 'R.19', 1, '0061000502', 'PI119I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(372, 'XIIBDP3', 'BDP', '202103535', '372', 'SOPI SAKILA LUPTIANI', 'XII', 'R.19', 1, '0069769371', 'KJ418Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(373, 'XIIBDP3', 'BDP', '202103536', '373', 'TASSA EKA MEILANI', 'XII', 'R.19', 1, '0068627377', 'EZ679F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(374, 'XIIBDP3', 'BDP', '202103537', '374', 'TITA MULIYA PUTRI', 'XII', 'R.20', 1, '3062277820', 'XD596H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(375, 'XIIBDP3', 'BDP', '202103538', '375', 'VANIA ZERLINA ANWAR', 'XII', 'R.20', 1, '0061738144', 'ZW969L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(376, 'XIIBDP3', 'BDP', '202103540', '376', 'WINA SUGIH RAHAYU', 'XII', 'R.20', 1, '0058474708', 'WD608S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(377, 'XIIBDP4', 'BDP', '202103541', '377', 'AIDA FITRI AZZAHRA', 'XII', 'R.20', 1, '0058058534', 'KR982P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(378, 'XIIBDP4', 'BDP', '202103542', '378', 'ANGGI ALYANTI', 'XII', 'R.20', 1, '0059811402', 'LB799C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(379, 'XIIBDP4', 'BDP', '202103543', '379', 'ANI ZUIE SANTIKA', 'XII', 'R.20', 1, '0068357134', 'XB950T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(380, 'XIIBDP4', 'BDP', '202103544', '380', 'AULIA FEBRIANI', 'XII', 'R.20', 1, '0054857714', 'GD669V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(381, 'XIIBDP4', 'BDP', '202103545', '381', 'DEA PUTRI ARDINI', 'XII', 'R.20', 1, '0069203282', 'SK403V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(382, 'XIIBDP4', 'BDP', '202103546', '382', 'DEDE NAESAH', 'XII', 'R.20', 1, '0062638296', 'AK481K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(383, 'XIIBDP4', 'BDP', '202103547', '383', 'DESTA AMELIA', 'XII', 'R.20', 1, '0057164740', 'IK315I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(384, 'XIIBDP4', 'BDP', '202103548', '384', 'ERINA TASYA SONJAYA', 'XII', 'R.20', 1, '0066621517', 'VE777P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(385, 'XIIBDP4', 'BDP', '202103549', '385', 'FASYA SYAVANA FADILLAH', 'XII', 'R.20', 1, '0068701307', 'NG613N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(386, 'XIIBDP4', 'BDP', '202103550', '386', 'FUJI AINUN HAMJAH', 'XII', 'R.20', 1, '0061935308', 'LJ688E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(387, 'XIIBDP4', 'BDP', '202103551', '387', 'HELMA DINI ALMANOVA', 'XII', 'R.20', 1, '0067972530', 'OC888T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(388, 'XIIBDP4', 'BDP', '202103552', '388', 'INDRI KISMAYA DEWI', 'XII', 'R.20', 1, '0059143348', 'CW115Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(389, 'XIIBDP4', 'BDP', '202103553', '389', 'KARMILA MAULIA', 'XII', 'R.20', 1, '0069932273', 'QT816F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(390, 'XIIBDP4', 'BDP', '202103554', '390', 'LESTA LESTARI', 'XII', 'R.20', 1, '0066092439', 'VH951G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(391, 'XIIBDP4', 'BDP', '202103555', '391', 'LINDA NUR FATMAWATI', 'XII', 'R.20', 1, '0063169860', 'NI186X', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(392, 'XIIBDP4', 'BDP', '202103556', '392', 'MARSYA AULIA', 'XII', 'R.20', 1, '0074036852', 'AJ403P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(393, 'XIIBDP4', 'BDP', '202103557', '393', 'MEGA MEILANI', 'XII', 'R.20', 1, '0061401219', 'ZE661M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(394, 'XIIBDP4', 'BDP', '202103558', '394', 'MEIDA NURHASANAH', 'XII', 'R.21', 1, '0061788411', 'ZY937J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(395, 'XIIBDP4', 'BDP', '202103559', '395', 'NADHIA AYUDHINA', 'XII', 'R.21', 1, '0058425635', 'JU326G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(396, 'XIIBDP4', 'BDP', '202103560', '396', 'NINA NURJANAH', 'XII', 'R.21', 1, '0058433638', 'UY761O', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(397, 'XIIBDP4', 'BDP', '202103561', '397', 'NURAENI FEBRIANTI', 'XII', 'R.21', 1, '0069024569', 'BL348M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(398, 'XIIBDP4', 'BDP', '202103562', '398', 'RAHMA AZZAHRA', 'XII', 'R.21', 1, '0065882197', 'BU191Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(399, 'XIIBDP4', 'BDP', '202103563', '399', 'RIKA DWI RAHAYU', 'XII', 'R.21', 1, '0052996347', 'ZN579N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(400, 'XIIBDP4', 'BDP', '202103564', '400', 'RINA LISNAWATI', 'XII', 'R.21', 1, '0064142788', 'JT807G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(401, 'XIIBDP4', 'BDP', '202103565', '401', 'SAFINAH RAMADHANTI', 'XII', 'R.21', 1, '0054125147', 'MY565N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `siswa` (`id_siswa`, `id_kelas`, `idpk`, `nis`, `no_peserta`, `nama`, `level`, `ruang`, `sesi`, `username`, `password`, `foto`, `server`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `agama`, `kebutuhan_khusus`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `jenis_tinggal`, `alat_transportasi`, `hp`, `email`, `skhun`, `no_kps`, `nama_ayah`, `tahun_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `nohp_ayah`, `nama_ibu`, `tahun_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `nohp_ibu`, `nama_wali`, `tahun_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `penghasilan_wali`, `angkatan`, `nisn`, `peserta_didik_id`, `semester_id`, `rombongan_belajar_id`, `status`, `online`) VALUES
(402, 'XIIBDP4', 'BDP', '202103566', '402', 'SELVA NOVIYANI', 'XII', 'R.21', 1, '0066123097', 'ZZ643S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(403, 'XIIBDP4', 'BDP', '202103567', '403', 'SHALSABILLA DWI ANANDA', 'XII', 'R.21', 1, '0066025158', 'SP375Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(404, 'XIIBDP4', 'BDP', '202103568', '404', 'SITI FADILLAH NURAENI', 'XII', 'R.21', 1, '0063010871', 'MA667J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(405, 'XIIBDP4', 'BDP', '202103569', '405', 'SITI LATIPAH MULYANI', 'XII', 'R.21', 1, '0064962901', 'UO692F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(406, 'XIIBDP4', 'BDP', '202103570', '406', 'SITI MULIA SARI', 'XII', 'R.21', 1, '0052081379', 'ON586A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(407, 'XIIBDP4', 'BDP', '202103571', '407', 'SITI NABILAH NOVIANA', 'XII', 'R.21', 1, '0051517856', 'XT651T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(408, 'XIIBDP4', 'BDP', '202103572', '408', 'SYINTIA NURFADILLAH', 'XII', 'R.21', 1, '0065260611', 'QS278I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(409, 'XIIBDP4', 'BDP', '202103573', '409', 'TIARA AYUNINGSIH', 'XII', 'R.21', 1, '0057454179', 'IY737R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(410, 'XIIBDP4', 'BDP', '202103574', '410', 'WIDA SAPANIA', 'XII', 'R.21', 1, '0057161728', 'VT950D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(411, 'XIIBDP4', 'BDP', '202103575', '411', 'WINDI KUSMINI', 'XII', 'R.21', 1, '0043946318', 'HN687G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(412, 'XIIBDP4', 'BDP', '202103576', '412', 'WINDY INTAN NUR`AINI', 'XII', 'R.21', 1, '0066032154', 'NP710Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(413, 'XIIRPL1', 'RPL', '202104001', '413', 'ANISA FAUZIAH', 'XII', 'R.22', 1, '0067232005', 'BE729J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(414, 'XIIRPL1', 'RPL', '202104002', '414', 'ANITA RINI RIANTI', 'XII', 'R.22', 1, '0065862432', 'IC706Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(415, 'XIIRPL1', 'RPL', '202104003', '415', 'AYUDIA SUGIHARTI PUTRI RAHMATIKA', 'XII', 'R.22', 1, '0061231911', 'JB878O', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(416, 'XIIRPL1', 'RPL', '202104004', '416', 'CITRA LESTARI', 'XII', 'R.22', 1, '0061382878', 'ZS126M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(417, 'XIIRPL1', 'RPL', '202104005', '417', 'DESI AULIA', 'XII', 'R.22', 1, '0064163692', 'YK432W', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(418, 'XIIRPL1', 'RPL', '202104006', '418', 'DESY NUR OCTAVIANY', 'XII', 'R.22', 1, '0056775655', 'HT204R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(419, 'XIIRPL1', 'RPL', '202104007', '419', 'ERSYA SYAHARANI', 'XII', 'R.22', 1, '0052956587', 'OZ447I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(420, 'XIIRPL1', 'RPL', '202104008', '420', 'FUJI OKTAFIA MUSWIDA', 'XII', 'R.22', 1, '0059385117', 'GD804S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(421, 'XIIRPL1', 'RPL', '202104009', '421', 'GIANE MAULIDYA PUTRI BASTAMAN', 'XII', 'R.22', 1, '0067911938', 'DA467N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(422, 'XIIRPL1', 'RPL', '202104010', '422', 'GINA NURMALA', 'XII', 'R.22', 1, '0059902397', 'JZ817S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(423, 'XIIRPL1', 'RPL', '202104011', '423', 'IRA ROSELA SETIAWATI', 'XII', 'R.22', 1, '0067568223', 'GS351K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(424, 'XIIRPL1', 'RPL', '202104012', '424', 'KARLINA ANDINI', 'XII', 'R.22', 1, '0068840855', 'YK929T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(425, 'XIIRPL1', 'RPL', '202104013', '425', 'MAITSA MAULIDA APRILYANTY', 'XII', 'R.22', 1, '0069912798', 'JC665R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(426, 'XIIRPL1', 'RPL', '202104014', '426', 'MEIDA TRIANI', 'XII', 'R.22', 1, '0068192473', 'RZ564H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(427, 'XIIRPL1', 'RPL', '202104015', '427', 'MUHAMMAD AZFA SALMAN AKBAR', 'XII', 'R.22', 1, '3059885323', 'OT113A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(428, 'XIIRPL1', 'RPL', '202104016', '428', 'NAILA NUR AZIZAH OKTAPIANI', 'XII', 'R.22', 1, '0055477496', 'MU410S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(429, 'XIIRPL1', 'RPL', '202104017', '429', 'NAZWA AJIZAH NURAULIA', 'XII', 'R.22', 1, '0063233742', 'YU925Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(430, 'XIIRPL1', 'RPL', '202104018', '430', 'NESSA JULIA', 'XII', 'R.22', 1, '0065787513', 'HK453R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(431, 'XIIRPL1', 'RPL', '202104019', '431', 'NINA MARYANI SAPITRI', 'XII', 'R.22', 1, '0058575306', 'ED774H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(432, 'XIIRPL1', 'RPL', '202104020', '432', 'NISA FITRIYANI', 'XII', 'R.22', 1, '0066884339', 'SR221Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(433, 'XIIRPL1', 'RPL', '202104021', '433', 'NISA JAMILATU SAADAH', 'XII', 'R.23', 1, '0054791963', 'LJ164Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(434, 'XIIRPL1', 'RPL', '202104022', '434', 'NISSA PUTRI AMELIA', 'XII', 'R.23', 1, '0064904798', 'QQ140A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(435, 'XIIRPL1', 'RPL', '202104023', '435', 'NURI NURSAIDAH ZAHRA', 'XII', 'R.23', 1, '0057153156', 'HM417X', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(436, 'XIIRPL1', 'RPL', '202104024', '436', 'NURUL PAJRIAH', 'XII', 'R.23', 1, '0053529532', 'ID381A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(437, 'XIIRPL1', 'RPL', '202104025', '437', 'RIFTY HARDIANTI', 'XII', 'R.23', 1, '0063619519', 'TJ341D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(438, 'XIIRPL1', 'RPL', '202104026', '438', 'RISKA FITRIANI', 'XII', 'R.23', 1, '0069226016', 'ID548W', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(439, 'XIIRPL1', 'RPL', '202104027', '439', 'RISSA SRIHANDITA', 'XII', 'R.23', 1, '0061837243', 'OT599B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(440, 'XIIRPL1', 'RPL', '202104028', '440', 'RIVA SITI HAFSHOH', 'XII', 'R.23', 1, '0069621314', 'YE334C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(441, 'XIIRPL1', 'RPL', '202104029', '441', 'SALSABILA MAHESA JENAR', 'XII', 'R.23', 1, '0065020210', 'BO775X', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(442, 'XIIRPL1', 'RPL', '202104030', '442', 'SHYFA AFRILIA', 'XII', 'R.23', 1, '0068573220', 'XG523N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(443, 'XIIRPL1', 'RPL', '202104031', '443', 'SITI MUALIPAH', 'XII', 'R.23', 1, '0059681193', 'KM783F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(444, 'XIIRPL1', 'RPL', '202104032', '444', 'TARI QUROTA AYUNI', 'XII', 'R.23', 1, '0058405269', 'GA444T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(445, 'XIIRPL1', 'RPL', '202104033', '445', 'YOKTAN SIMANJUNTAK', 'XII', 'R.23', 1, '0066641327', 'YO667K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(446, 'XIIRPL1', 'RPL', '202104034', '446', 'ZAHRA MUTIARA SOPIAN', 'XII', 'R.23', 1, '0058909885', 'HL777V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(447, 'XIIRPL1', 'RPL', '202104035', '447', 'ZULFA QURROTULAIN', 'XII', 'R.23', 1, '0054544447', 'MZ381N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(448, 'XIIRPL1', 'RPL', '202104036', '448', 'ZULVA YUZRINA NURHAMIDAH', 'XII', 'R.23', 1, '0055715532', 'OB176F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(449, 'XIIRPL2', 'RPL', '202104037', '449', 'AI KARYANI', 'XII', 'R.23', 1, '0061464348', 'OD697V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(450, 'XIIRPL2', 'RPL', '202104038', '450', 'ANANDA VITHALOKA', 'XII', 'R.23', 1, '0066916806', 'TS933N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(451, 'XIIRPL2', 'RPL', '202104039', '451', 'ANGGITA FITRIYANI FIRMANSYAH', 'XII', 'R.23', 1, '0058155028', 'LN673P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(452, 'XIIRPL2', 'RPL', '202104040', '452', 'ANISA', 'XII', 'R.23', 1, '0052867827', 'RL129X', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(453, 'XIIRPL2', 'RPL', '202104041', '453', 'CINTA RAHMIA YULIANTI', 'XII', 'R.24', 1, '0053341943', 'ZX956Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(454, 'XIIRPL2', 'RPL', '202104042', '454', 'DANYA HAMIDAH AZ-ZAHRA', 'XII', 'R.24', 1, '0068015577', 'YH281H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(455, 'XIIRPL2', 'RPL', '202104043', '455', 'DELLA FRISKA ARDIANA', 'XII', 'R.24', 1, '0053708460', 'TH147Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(456, 'XIIRPL2', 'RPL', '202104044', '456', 'DELLIA WULANSARI', 'XII', 'R.24', 1, '0068622539', 'SK265F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(457, 'XIIRPL2', 'RPL', '202104045', '457', 'DWI YUSRI MEILANI', 'XII', 'R.24', 1, '0065591822', 'HQ937U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(458, 'XIIRPL2', 'RPL', '202104046', '458', 'FITRI AYU FUJIANTI', 'XII', 'R.24', 1, '0059018168', 'VL392I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(459, 'XIIRPL2', 'RPL', '202104047', '459', 'FITRI NURHAYATI', 'XII', 'R.24', 1, '0053408796', 'ZR659K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(460, 'XIIRPL2', 'RPL', '202104048', '460', 'FUJI AULIA ROHMAH', 'XII', 'R.24', 1, '0058544778', 'PI604V', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(461, 'XIIRPL2', 'RPL', '202104049', '461', 'GENDHIS PUTRI KINANTI', 'XII', 'R.24', 1, '0065628992', 'ML603E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(462, 'XIIRPL2', 'RPL', '202104050', '462', 'GINA ENJELINA', 'XII', 'R.24', 1, '0068689600', 'AP123J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(463, 'XIIRPL2', 'RPL', '202104051', '463', 'HAFIZ HAEKAL', 'XII', 'R.24', 1, '0067353358', 'TK136Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(464, 'XIIRPL2', 'RPL', '202104052', '464', 'IRMA INDRIANI FITRI', 'XII', 'R.24', 1, '0052420404', 'JE204N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(465, 'XIIRPL2', 'RPL', '202104053', '465', 'NAYLA ADELA SUKMA FHIZRIYAH', 'XII', 'R.24', 1, '0068515429', 'ZD227M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(466, 'XIIRPL2', 'RPL', '202104054', '466', 'NOVA SEPTIAWATI', 'XII', 'R.24', 1, '0056342946', 'SL739J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(467, 'XIIRPL2', 'RPL', '202104055', '467', 'NOVIA AULIA', 'XII', 'R.24', 1, '0053226388', 'ZO376R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(468, 'XIIRPL2', 'RPL', '202104056', '468', 'QORI LESTARI', 'XII', 'R.24', 1, '0054274259', 'OD340M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(469, 'XIIRPL2', 'RPL', '202104057', '469', 'RATNA BELLA NURWANDA', 'XII', 'R.24', 1, '0064475611', 'UG374P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(470, 'XIIRPL2', 'RPL', '202104058', '470', 'REDATKI CHERLIANI', 'XII', 'R.24', 1, '0069896479', 'CT699L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(471, 'XIIRPL2', 'RPL', '202104059', '471', 'RISTIN IMAN ANDINI', 'XII', 'R.24', 1, '0069515049', 'OA851F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(472, 'XIIRPL2', 'RPL', '202104060', '472', 'SALSA SABILA', 'XII', 'R.24', 1, '0068443172', 'TQ933B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(473, 'XIIRPL2', 'RPL', '202104061', '473', 'SALWA RAHMA JULIANA', 'XII', 'R.25', 1, '0069867930', 'XR938Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(474, 'XIIRPL2', 'RPL', '202104062', '474', 'SELLY RAHMADHANI', 'XII', 'R.25', 1, '0064332811', 'PG933R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(475, 'XIIRPL2', 'RPL', '202104063', '475', 'SHIFA DWIPANGGA', 'XII', 'R.25', 1, '0059028276', 'DL227E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(476, 'XIIRPL2', 'RPL', '202104064', '476', 'SILVI SRI LUSISTA', 'XII', 'R.25', 1, '0061631196', 'QD718L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(477, 'XIIRPL2', 'RPL', '202104065', '477', 'SITI AFIFAH', 'XII', 'R.25', 1, '0068127442', 'GI325B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(478, 'XIIRPL2', 'RPL', '202104066', '478', 'SITI APIPAH MUNGGARANI', 'XII', 'R.25', 1, '0061803547', 'DS213A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(479, 'XIIRPL2', 'RPL', '202104067', '479', 'SITI NURAINI MARYAM', 'XII', 'R.25', 1, '0068181260', 'XC970M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(480, 'XIIRPL2', 'RPL', '202104068', '480', 'SUCIYANA SYABANI', 'XII', 'R.25', 1, '0064142211', 'SR144E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(481, 'XIIRPL2', 'RPL', '202104069', '481', 'TASYA WULANDARI', 'XII', 'R.25', 1, '0059523948', 'FE637P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(482, 'XIIRPL2', 'RPL', '202104070', '482', 'TIA AMELIA', 'XII', 'R.25', 1, '0065587542', 'WZ406N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(483, 'XIIRPL2', 'RPL', '202104071', '483', 'VINA NUR ANNISA', 'XII', 'R.25', 1, '0057920637', 'ZJ972I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(484, 'XIIRPL2', 'RPL', '202104072', '484', 'ZAHRA DWI ANANDA', 'XII', 'R.25', 1, '0062981916', 'IW215J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(485, 'XIIRPL3', 'RPL', '202104073', '485', 'ABDUL JABBAR', 'XII', 'R.25', 1, '0068187227', 'CO174G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(486, 'XIIRPL3', 'RPL', '202104074', '486', 'AI NURHAYATI SURYADI', 'XII', 'R.25', 1, '0068253898', 'BP298S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(487, 'XIIRPL3', 'RPL', '202104075', '487', 'ALLISYA NOER ARYANTI DEWI', 'XII', 'R.25', 1, '0068769680', 'LO619E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(488, 'XIIRPL3', 'RPL', '202104076', '488', 'AULIA DEVITA SANDY WIBIKSANA', 'XII', 'R.25', 1, '0057756941', 'CN799N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(489, 'XIIRPL3', 'RPL', '202104077', '489', 'CINTYA SITI FEBRIANI', 'XII', 'R.25', 1, '0063896662', 'YJ111N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(490, 'XIIRPL3', 'RPL', '202104078', '490', 'DAILA JAYANTI', 'XII', 'R.25', 1, '0051923170', 'FQ754O', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(491, 'XIIRPL3', 'RPL', '202104079', '491', 'DEA NATALIA', 'XII', 'R.25', 1, '0055049148', 'EC736A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(492, 'XIIRPL3', 'RPL', '202104080', '492', 'DEDE RAMADANI', 'XII', 'R.25', 1, '0057582182', 'QA686R', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(493, 'XIIRPL3', 'RPL', '202104081', '493', 'DELVY YULIANI', 'XII', 'R.26', 1, '0057958746', 'SY343M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(494, 'XIIRPL3', 'RPL', '202104082', '494', 'FANI NUR FADILLAH', 'XII', 'R.26', 1, '0065669063', 'EK367T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(495, 'XIIRPL3', 'RPL', '202104083', '495', 'FIFI AFRIYANI', 'XII', 'R.26', 1, '0065181880', 'RR912K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(496, 'XIIRPL3', 'RPL', '202104084', '496', 'HILMA OCTAVIANA', 'XII', 'R.26', 1, '0063520883', 'MB628L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(497, 'XIIRPL3', 'RPL', '202104085', '497', 'IMELDHA ERDIANA', 'XII', 'R.26', 1, '0058043499', 'AO625E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(498, 'XIIRPL3', 'RPL', '202104086', '498', 'INTAN RAHMAWATI', 'XII', 'R.26', 1, '0069065357', 'ZU651O', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(499, 'XIIRPL3', 'RPL', '202104087', '499', 'INTAN TANKIHUL KOUL', 'XII', 'R.26', 1, '0061785833', 'WS836D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(500, 'XIIRPL3', 'RPL', '202104088', '500', 'KHOIRUN NISA', 'XII', 'R.26', 1, '0069843738', 'HF283S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(501, 'XIIRPL3', 'RPL', '202104089', '501', 'M. GHAZY MUFADHAL ARAFAH', 'XII', 'R.26', 1, '0065531269', 'ML196Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(502, 'XIIRPL3', 'RPL', '202104090', '502', 'MELINDA AMELIA', 'XII', 'R.26', 1, '0063725285', 'HW599N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(503, 'XIIRPL3', 'RPL', '202104091', '503', 'MILA KARTIKA', 'XII', 'R.26', 1, '0068375126', 'EX237I', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(504, 'XIIRPL3', 'RPL', '202104092', '504', 'NADA ZALFA KAMILIA', 'XII', 'R.26', 1, '0055398108', 'HO290P', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(505, 'XIIRPL3', 'RPL', '202104093', '505', 'NASSWA RAHMADANI PUTRI', 'XII', 'R.26', 1, '0055295876', 'TE413B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(506, 'XIIRPL3', 'RPL', '202104094', '506', 'NELI', 'XII', 'R.26', 1, '0063150565', 'QP307A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(507, 'XIIRPL3', 'RPL', '202104095', '507', 'NUR AJIJAH', 'XII', 'R.26', 1, '0054314029', 'DF265T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(508, 'XIIRPL3', 'RPL', '202104097', '508', 'RARI NARITA', 'XII', 'R.26', 1, '0069539080', 'NV563D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(509, 'XIIRPL3', 'RPL', '202104098', '509', 'REGINA CITRADEWI LESTARI', 'XII', 'R.26', 1, '0061839917', 'OB389Z', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(510, 'XIIRPL3', 'RPL', '202104099', '510', 'SANTI APRIANI', 'XII', 'R.26', 1, '0065973109', 'PJ229M', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(511, 'XIIRPL3', 'RPL', '202104100', '511', 'SISKA MEGA ANGGRAENI', 'XII', 'R.26', 1, '0058405545', 'QH219J', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(512, 'XIIRPL3', 'RPL', '202104102', '512', 'SRIYUNITA', 'XII', 'R.26', 1, '0062406984', 'XR631C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(513, 'XIIRPL3', 'RPL', '202104103', '513', 'SYABILA SALWA NAURAH', 'XII', 'R.27', 1, '0066488580', 'AL396Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(514, 'XIIRPL3', 'RPL', '202104104', '514', 'SYIFAA NUR HIKMAH', 'XII', 'R.27', 1, '0062766437', 'AH893Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(515, 'XIIRPL3', 'RPL', '202104105', '515', 'TIKA NOERLIA', 'XII', 'R.27', 1, '0069713871', 'JM514F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(516, 'XIIRPL3', 'RPL', '202104106', '516', 'WIDYA AGUSTIN', 'XII', 'R.27', 1, '0059770434', 'NX763C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(517, 'XIIRPL3', 'RPL', '202104108', '517', 'WULAN NURFITRIANI', 'XII', 'R.27', 1, '0065946346', 'NH991X', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(518, 'XIIRPL4', 'RPL', '202104109', '518', 'AISYAH NUR FADILAH', 'XII', 'R.27', 1, '0053978952', 'MX172W', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(519, 'XIIRPL4', 'RPL', '202104110', '519', 'ALYA NABILA', 'XII', 'R.27', 1, '0065299550', 'CL106U', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(520, 'XIIRPL4', 'RPL', '202104111', '520', 'AMELIA PUJI LESTARI', 'XII', 'R.27', 1, '0067067800', 'RF843G', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(521, 'XIIRPL4', 'RPL', '202104112', '521', 'ANNISA MAYSHAROH', 'XII', 'R.27', 1, '0055029984', 'IC706D', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(522, 'XIIRPL4', 'RPL', '202104113', '522', 'CLANDA RAHADIVA SUBERLI', 'XII', 'R.27', 1, '0063809683', 'YG683Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(523, 'XIIRPL4', 'RPL', '202104114', '523', 'DELA SANTI', 'XII', 'R.27', 1, '0058458520', 'OB342T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(524, 'XIIRPL4', 'RPL', '202104115', '524', 'DEVINA ZAHLIYA PUTRI', 'XII', 'R.27', 1, '0053726131', 'OD965N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(525, 'XIIRPL4', 'RPL', '202104116', '525', 'DHEA MUTHIA NABILAH', 'XII', 'R.27', 1, '0067804520', 'LG602H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(526, 'XIIRPL4', 'RPL', '202104117', '526', 'DHINIE APRANISA ALDAILANI', 'XII', 'R.27', 1, '0056928482', 'YA769F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(527, 'XIIRPL4', 'RPL', '202104118', '527', 'DIANA PUJA DESTIENI', 'XII', 'R.27', 1, '0059157862', 'TM392T', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(528, 'XIIRPL4', 'RPL', '202104119', '528', 'DILLA NOERFAZRYAH', 'XII', 'R.27', 1, '0068953386', 'IT155A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(529, 'XIIRPL4', 'RPL', '202104120', '529', 'DINA FUZI LISDIANA', 'XII', 'R.27', 1, '0051458797', 'TW115A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(530, 'XIIRPL4', 'RPL', '202104121', '530', 'DINDA NUR OKTAFIANI', 'XII', 'R.27', 1, '0054669689', 'FI811F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(531, 'XIIRPL4', 'RPL', '202104122', '531', 'GRISCA SILFIA PRIYANA', 'XII', 'R.27', 1, '0051075334', 'EC503Y', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(532, 'XIIRPL4', 'RPL', '202104123', '532', 'HABIBAH ADAWIAH', 'XII', 'R.27', 1, '0066912460', 'NZ247X', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(533, 'XIIRPL4', 'RPL', '202104126', '533', 'LILIS SARIKOMALA', 'XII', 'R.28', 1, '0053740455', 'ES373O', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(534, 'XIIRPL4', 'RPL', '202104127', '534', 'MERISA SITI NURUL MUGHNI', 'XII', 'R.28', 1, '0064131047', 'TN630H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(535, 'XIIRPL4', 'RPL', '202104128', '535', 'NISA DEISMAWATI', 'XII', 'R.28', 1, '0067211241', 'WU689C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `siswa` (`id_siswa`, `id_kelas`, `idpk`, `nis`, `no_peserta`, `nama`, `level`, `ruang`, `sesi`, `username`, `password`, `foto`, `server`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `agama`, `kebutuhan_khusus`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `jenis_tinggal`, `alat_transportasi`, `hp`, `email`, `skhun`, `no_kps`, `nama_ayah`, `tahun_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `nohp_ayah`, `nama_ibu`, `tahun_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `nohp_ibu`, `nama_wali`, `tahun_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `penghasilan_wali`, `angkatan`, `nisn`, `peserta_didik_id`, `semester_id`, `rombongan_belajar_id`, `status`, `online`) VALUES
(536, 'XIIRPL4', 'RPL', '202104129', '536', 'NOVELIA', 'XII', 'R.28', 1, '0063241882', 'US258N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(537, 'XIIRPL4', 'RPL', '202104130', '537', 'NOVI ROSMIATI', 'XII', 'R.28', 1, '0055066320', 'JR664L', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(538, 'XIIRPL4', 'RPL', '202104132', '538', 'RENI SYABRINA BALQIS', 'XII', 'R.28', 1, '0066252397', 'OM158Q', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(539, 'XIIRPL4', 'RPL', '202104133', '539', 'REVA ALINDA WANGSAYUDA PUTRI', 'XII', 'R.28', 1, '0063576978', 'CM390C', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(540, 'XIIRPL4', 'RPL', '202104134', '540', 'RIMA YULIANTI', 'XII', 'R.28', 1, '0059296096', 'JT266S', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(541, 'XIIRPL4', 'RPL', '202104135', '541', 'SAMUEL SAMUDRA SIHOMBING', 'XII', 'R.28', 1, '0061318057', 'GI814F', '', 'SR01', NULL, NULL, NULL, 'Kristen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(542, 'XIIRPL4', 'RPL', '202104136', '542', 'SINDI RAHMAWATI', 'XII', 'R.28', 1, '0063779101', 'FY157O', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(543, 'XIIRPL4', 'RPL', '202104137', '543', 'SINDY DHITA OKTAVIANI', 'XII', 'R.28', 1, '0056153899', 'SN658H', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(544, 'XIIRPL4', 'RPL', '202104138', '544', 'SIPA KHOERUNNISA', 'XII', 'R.28', 1, '0062513162', 'HC391K', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(545, 'XIIRPL4', 'RPL', '202104139', '545', 'SISKA LISNAWATI', 'XII', 'R.28', 1, '0056581015', 'HI348E', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(546, 'XIIRPL4', 'RPL', '202104140', '546', 'SITI SARAH AZZAHRA', 'XII', 'R.28', 1, '0052743517', 'TX665F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(547, 'XIIRPL4', 'RPL', '202104141', '547', 'SOVI NUR`AENI', 'XII', 'R.28', 1, '0057633953', 'PX286A', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(548, 'XIIRPL4', 'RPL', '202104142', '548', 'SUCI FITRIYANTI', 'XII', 'R.28', 1, '0056920348', 'WO141N', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(549, 'XIIRPL4', 'RPL', '202104143', '549', 'TINA LESTARI', 'XII', 'R.28', 1, '0051895704', 'YR142B', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(550, 'XIIRPL4', 'RPL', '202104144', '550', 'ZAHRA AZQIA FAUZATUL VILA', 'XII', 'R.28', 1, '0069103732', 'SP339F', '', 'SR01', NULL, NULL, NULL, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id_soal` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `nomor` int(5) DEFAULT NULL,
  `soal` longtext DEFAULT NULL,
  `jenis` int(1) DEFAULT NULL,
  `pilA` longtext DEFAULT NULL,
  `pilB` longtext DEFAULT NULL,
  `pilC` longtext DEFAULT NULL,
  `pilD` longtext DEFAULT NULL,
  `pilE` longtext DEFAULT NULL,
  `jawaban` varchar(1) DEFAULT NULL,
  `file` mediumtext DEFAULT NULL,
  `file1` mediumtext DEFAULT NULL,
  `fileA` mediumtext DEFAULT NULL,
  `fileB` mediumtext DEFAULT NULL,
  `fileC` mediumtext DEFAULT NULL,
  `fileD` mediumtext DEFAULT NULL,
  `fileE` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id_soal`, `id_mapel`, `nomor`, `soal`, `jenis`, `pilA`, `pilB`, `pilC`, `pilD`, `pilE`, `jawaban`, `file`, `file1`, `fileA`, `fileB`, `fileC`, `fileD`, `fileE`) VALUES
(8, 1, 1, '<p>Mandy : Let me _____myself. My name is Mandy Lawson.</p>\r\n<p>Andy : Hi... I am Andy. Nice to meet you!</p>\r\n<p>Mandy : Nice to meet you too.</p>', 1, '<p>introducing</p>', '<p>introduce</p>', '<p>introduced</p>', '<p>introduces</p>', '', 'B', '', '', '', '', '', '', ''),
(9, 1, 2, 'I told you yesterday that I ___ the cinema with my family tomorrow, so I can’t go with you.', 1, 'will go', 'am going to go to', 'wont’t go', 'will be going', '', 'B', '', '', '', '', '', '', ''),
(10, 1, 3, '<p>Wendy : What do you think of my singing?</p>\r\n<p>Joy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : It sounds great, but I suggest you try singing in a high tune.</p>\r\n<p>Wendy : Okay, thanks Joy.</p>\r\n<p>Joy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : No problem Wendy.</p>\r\n<p>From the dialogue above, Wendy is___</p>', 1, '<p>Giving help</p>', '<p>Giving an opinion</p>', '<p>Asking for help</p>', '<p>Asking for an opinion</p>', '', 'D', '', '', '', '', '', '', ''),
(11, 1, 4, '<p>Jeni : Dita, why do you look so sad?</p>\r\n<p>Dita : I got bad scores on my last test. What should I do, Jen?</p>\r\n<p>Jeni : Why don&rsquo;t you watch a live class from Youtube to learn better?</p>\r\n<p>Dita : That&rsquo;s a good idea. I&rsquo;ll try to do that. Thanks, Jeni.</p>\r\n<p>Jeni : Anytime, Dita.</p>\r\n<p>According to the conversation above, which expression shows giving suggestion?</p>', 1, '<p>Dita, why you look so sad?</p>', '<p>What should I do, Jen?</p>', '<p>Why don&rsquo;t you watch a live class from Youtube to learn better?</p>', '<p>I&rsquo;ll try to do that.</p>', '', 'C', '', '', '', '', '', '', ''),
(12, 1, 5, '<p>Gilda : I think the car is too small for Remember we are four.</p>\r\n<p>Peter : I&rsquo;m with you. We need a ____one.</p>\r\n<p>Gilda : So, which car are we going to buy, then?</p>', 1, '<p>big</p>', '<p>biggest</p>', '<p>bigger</p>', '<p>too big</p>', '', 'C', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id_token` int(11) NOT NULL,
  `token` varchar(6) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `masa_berlaku` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id_token`, `token`, `time`, `masa_berlaku`) VALUES
(1, 'RONMJA', '2024-03-20 06:05:38', '00:15:00'),
(1, 'RONMJA', '2024-03-20 06:05:38', '00:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id_tugas` int(255) NOT NULL,
  `id_guru` int(255) NOT NULL DEFAULT 0,
  `kelas` text NOT NULL,
  `mapel` varchar(255) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tugas` longtext NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE `ujian` (
  `id_ujian` int(5) NOT NULL,
  `kode_nama` varchar(255) DEFAULT '0',
  `id_pk` varchar(255) NOT NULL,
  `id_guru` int(5) NOT NULL,
  `id_mapel` int(5) NOT NULL,
  `kode_ujian` varchar(30) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jml_soal` int(5) NOT NULL,
  `jml_esai` int(5) NOT NULL,
  `bobot_pg` int(5) NOT NULL,
  `opsi` int(1) NOT NULL,
  `bobot_esai` int(5) NOT NULL,
  `tampil_pg` int(5) NOT NULL,
  `tampil_esai` int(5) NOT NULL,
  `lama_ujian` int(5) NOT NULL,
  `tgl_ujian` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `waktu_ujian` time DEFAULT NULL,
  `selesai_ujian` time DEFAULT NULL,
  `level` varchar(5) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `sesi` varchar(1) DEFAULT NULL,
  `acak` int(1) NOT NULL,
  `token` int(1) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `hasil` int(1) DEFAULT NULL,
  `kkm` varchar(128) DEFAULT NULL,
  `ulang` int(2) DEFAULT NULL,
  `soal_agama` varchar(50) DEFAULT NULL,
  `reset` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `file_pendukung`
--
ALTER TABLE `file_pendukung`
  ADD PRIMARY KEY (`id_file`);

--
-- Indexes for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`id_jawaban`);

--
-- Indexes for table `jawaban_tugas`
--
ALTER TABLE `jawaban_tugas`
  ADD PRIMARY KEY (`id_jawaban`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`jurusan_id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`kode_level`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`kode_mapel`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id_materi`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `pengawas`
--
ALTER TABLE `pengawas`
  ADD PRIMARY KEY (`id_pengawas`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id_pengumuman`);

--
-- Indexes for table `pk`
--
ALTER TABLE `pk`
  ADD PRIMARY KEY (`id_pk`);

--
-- Indexes for table `referensi_jurusan`
--
ALTER TABLE `referensi_jurusan`
  ADD PRIMARY KEY (`jurusan_id`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`kode_ruang`);

--
-- Indexes for table `savsoft_options`
--
ALTER TABLE `savsoft_options`
  ADD PRIMARY KEY (`oid`);

--
-- Indexes for table `savsoft_qbank`
--
ALTER TABLE `savsoft_qbank`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`semester_id`);

--
-- Indexes for table `sesi`
--
ALTER TABLE `sesi`
  ADD PRIMARY KEY (`kode_sesi`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `sinkron`
--
ALTER TABLE `sinkron`
  ADD PRIMARY KEY (`nama_data`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id_tugas`);

--
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id_ujian`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_pendukung`
--
ALTER TABLE `file_pendukung`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT for table `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jawaban_tugas`
--
ALTER TABLE `jawaban_tugas`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id_materi` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pengawas`
--
ALTER TABLE `pengawas`
  MODIFY `id_pengawas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=279;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id_pengumuman` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `savsoft_options`
--
ALTER TABLE `savsoft_options`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `savsoft_qbank`
--
ALTER TABLE `savsoft_qbank`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=551;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id_tugas` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id_ujian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
