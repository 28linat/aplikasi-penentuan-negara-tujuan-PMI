-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2024 at 03:55 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_ahp`
--

-- --------------------------------------------------------

--
-- Table structure for table `ahp_alternatif`
--

CREATE TABLE `ahp_alternatif` (
  `id_alternatif` varchar(2) NOT NULL,
  `nama_alternatif` varchar(50) NOT NULL,
  `bobot_alternatif` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ahp_alternatif`
--

INSERT INTO `ahp_alternatif` (`id_alternatif`, `nama_alternatif`, `bobot_alternatif`) VALUES
('A1', 'Malaysia', 0.43278600944011),
('A2', 'Singapura', 0.21692916054875),
('A3', 'Hongkong', 0.36237444263289),
('A4', 'Taiwan', 0.55831954079249);

-- --------------------------------------------------------

--
-- Table structure for table `ahp_kategori`
--

CREATE TABLE `ahp_kategori` (
  `id` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ahp_kategori`
--

INSERT INTO `ahp_kategori` (`id`, `kategori`) VALUES
(1, 'SANGAT PENTING'),
(2, 'PENTING'),
(3, 'KURANG'),
(4, 'SANGAT KURANG');

-- --------------------------------------------------------

--
-- Table structure for table `ahp_kriteria`
--

CREATE TABLE `ahp_kriteria` (
  `id_kriteria` varchar(2) NOT NULL,
  `nama_kriteria` varchar(50) NOT NULL,
  `bobot_kriteria` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ahp_kriteria`
--

INSERT INTO `ahp_kriteria` (`id_kriteria`, `nama_kriteria`, `bobot_kriteria`) VALUES
('K1', 'Kualitas Hidup', 0.14155156208869),
('K2', 'Biaya Hidup', 0.15477957229056),
('K3', 'Jenis Pekerjaan', 0.16492554896268),
('K4', 'Gaji dan Kompensasi', 0.17012859189428),
('K5', 'Keamanan dan Stabilitas', 0.17991042079129),
('K6', 'Budaya dan Sosial', 0.18870430397249);

-- --------------------------------------------------------

--
-- Table structure for table `ahp_nilai`
--

CREATE TABLE `ahp_nilai` (
  `nilai` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ahp_nilai`
--

INSERT INTO `ahp_nilai` (`nilai`, `keterangan`) VALUES
(1, 'Sama penting dengan'),
(2, 'Mendekati sedikit lebih penting dari'),
(3, 'Sedikit lebih penting dari'),
(4, 'Mendekati lebih penting dari'),
(5, 'Lebih penting dari'),
(6, 'Mendekati sangat penting dari'),
(7, 'Sangat penting dari'),
(8, 'Mendekati mutlak dari'),
(9, 'Mutlak sangat penting dari');

-- --------------------------------------------------------

--
-- Table structure for table `ahp_subkriteria`
--

CREATE TABLE `ahp_subkriteria` (
  `id_subkriteria` int(11) NOT NULL,
  `id_kriteria` varchar(2) NOT NULL,
  `subkriteria` varchar(50) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ahp_subkriteria`
--

INSERT INTO `ahp_subkriteria` (`id_subkriteria`, `id_kriteria`, `subkriteria`, `kategori`) VALUES
(1, 'K1', 'KESEHATAN', 'SANGAT PENTING'),
(2, 'K1', 'PENDIDIKAN/PENGEMBANGAN DIRI', 'PENTING'),
(3, 'K1', 'KONDISI TEMPAT TINGGAL', 'KURANG'),
(4, 'K1', 'JAM KERJA', 'SANGAT KURANG'),
(5, 'K2', 'BIAYA PERJALANAN', 'SANGAT PENTING'),
(6, 'K2', 'BIAYA TEMPAT TINGGAL', 'PENTING'),
(7, 'K2', 'BIAYA MAKANAN', 'KURANG'),
(8, 'K2', 'BIAYA TRANSPORTASI', 'SANGAT KURANG'),
(9, 'K3', 'PABRIK', 'SANGAT PENTING'),
(10, 'K3', 'KONSTRUKSI', 'PENTING'),
(11, 'K3', 'PEKERJA RUMAH TANGGA', 'KURANG'),
(12, 'K3', 'PENGASUH ANAK', 'SANGAT KURANG'),
(13, 'K4', '> Rp. 12.000.000', 'SANGAT PENTING'),
(14, 'K4', 'Rp. 10.000.000 - 12.000.000', 'PENTING'),
(15, 'K4', '< Rp. 10.000.000', 'KURANG'),
(16, 'K4', 'RP. 5.000.000 - 8.000.000', 'SANGAT KURANG'),
(17, 'K5', 'BAHASA', 'SANGAT PENTING'),
(18, 'K5', 'TRADISI', 'PENTING'),
(19, 'K5', 'KEPERCAYAAN', 'KURANG'),
(20, 'K5', 'INTEGRASI SOSIAL', 'SANGAT KURANG'),
(21, 'K6', 'LINGKUNGAN KERJA', 'SANGAT PENTING'),
(22, 'K6', 'PERLINDUNGAN HUKUM', 'PENTING'),
(23, 'K6', 'STABILITAS PEKERJAAN', 'KURANG'),
(24, 'K6', 'DUKUNGAN DARI AGENSI', 'SANGAT KURANG');

-- --------------------------------------------------------

--
-- Table structure for table `analisa_alternatif`
--

CREATE TABLE `analisa_alternatif` (
  `alternatif` varchar(50) NOT NULL,
  `nilai_kriteria1` varchar(50) NOT NULL,
  `nilai_kriteria2` varchar(50) NOT NULL,
  `nilai_kriteria3` varchar(50) NOT NULL,
  `nilai_kriteria4` varchar(50) NOT NULL,
  `nilai_kriteria5` varchar(50) NOT NULL,
  `nilai_kriteria6` varchar(50) NOT NULL,
  `nilai_ahp` double NOT NULL,
  `rangking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisa_alternatif`
--

INSERT INTO `analisa_alternatif` (`alternatif`, `nilai_kriteria1`, `nilai_kriteria2`, `nilai_kriteria3`, `nilai_kriteria4`, `nilai_kriteria5`, `nilai_kriteria6`, `nilai_ahp`, `rangking`) VALUES
('Malaysia', 'PENDIDIKAN/PENGEMBANGAN DIRI', 'BIAYA MAKANAN', 'KONSTRUKSI', 'Rp. 10.000.000 - 12.000.000', 'TRADISI', 'PERLINDUNGAN HUKUM', 0.43278600944011, 2),
('Singapura', 'KONDISI TEMPAT TINGGAL', 'BIAYA TEMPAT TINGGAL', 'PEKERJA RUMAH TANGGA', 'RP. 5.000.000 - 8.000.000', 'INTEGRASI SOSIAL', 'STABILITAS PEKERJAAN', 0.21692916054875, 4),
('Hongkong', 'JAM KERJA', 'BIAYA TRANSPORTASI', 'KONSTRUKSI', 'Rp. 10.000.000 - 12.000.000', 'TRADISI', 'PERLINDUNGAN HUKUM', 0.36237444263289, 3),
('Taiwan', 'PENDIDIKAN/PENGEMBANGAN DIRI', 'BIAYA TRANSPORTASI', 'PABRIK', '< Rp. 10.000.000', 'TRADISI', 'LINGKUNGAN KERJA', 0.55831954079249, 1);

-- --------------------------------------------------------

--
-- Table structure for table `analisa_kriteria`
--

CREATE TABLE `analisa_kriteria` (
  `kriteria` varchar(25) NOT NULL,
  `nilai_kriteria1` double NOT NULL,
  `nilai_kriteria2` double NOT NULL,
  `nilai_kriteria3` double NOT NULL,
  `nilai_kriteria4` double NOT NULL,
  `nilai_kriteria5` double NOT NULL,
  `nilai_kriteria6` double NOT NULL,
  `jumlah` double NOT NULL,
  `prioritas` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisa_kriteria`
--

INSERT INTO `analisa_kriteria` (`kriteria`, `nilai_kriteria1`, `nilai_kriteria2`, `nilai_kriteria3`, `nilai_kriteria4`, `nilai_kriteria5`, `nilai_kriteria6`, `jumlah`, `prioritas`) VALUES
('Kualitas Hidup', 1, 0.77093, 0.82226, 0.84211, 0.83727, 0.85738, 0.84930937253215, 0.14155156208869),
('Biaya Hidup', 1.2971346296032, 1, 0.79685, 0.85734, 0.85245, 0.86283, 0.92867743374339, 0.15477957229056),
('Jenis Pekerjaan', 1.216160338579, 1.2549413314928, 1, 0.85656, 0.85416, 0.86221, 0.98955329377607, 0.16492554896268),
('Gaji dan Kompensasi', 1.1874933203501, 1.1663983950358, 1.1674605398338, 1, 0.8495, 0.85179, 1.0207715513657, 0.17012859189428),
('Keamanan dan Stabilitas', 1.1943578535001, 1.1730893307525, 1.1707408448066, 1.1771630370806, 1, 0.84737, 1.0794625247477, 0.17991042079129),
('Budaya dan Sosial', 1.166343978166, 1.1589768552322, 1.1598102550423, 1.1739982859625, 1.1801220246173, 1, 1.132225823835, 0.18870430397249);

-- --------------------------------------------------------

--
-- Table structure for table `analisa_subkriteria`
--

CREATE TABLE `analisa_subkriteria` (
  `subkriteria` varchar(15) NOT NULL,
  `nilai_subkriteria1` double NOT NULL,
  `nilai_subkriteria2` double NOT NULL,
  `nilai_subkriteria3` double NOT NULL,
  `nilai_subkriteria4` double NOT NULL,
  `jumlah` double NOT NULL,
  `prioritas` double NOT NULL,
  `prioritas_subkriteria` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisa_subkriteria`
--

INSERT INTO `analisa_subkriteria` (`subkriteria`, `nilai_subkriteria1`, `nilai_subkriteria2`, `nilai_subkriteria3`, `nilai_subkriteria4`, `jumlah`, `prioritas`, `prioritas_subkriteria`) VALUES
('SANGAT PENTING', 1, 3, 5, 7, 2.2315699006876, 0.55789247517189, 1),
('PENTING', 0.33333333333333, 1, 3, 5, 1.0533804430863, 0.26334511077158, 0.47203560272155),
('KURANG', 0.2, 0.33333333333333, 1, 3, 0.48749045072574, 0.12187261268144, 0.21845179511319),
('SANGAT KURANG', 0.14285714285714, 0.2, 0.33333333333333, 1, 0.22755920550038, 0.056889801375095, 0.10197269887458);

-- --------------------------------------------------------

--
-- Table structure for table `kuesioner`
--

CREATE TABLE `kuesioner` (
  `id_kuesioner` int(11) NOT NULL,
  `tanggal` varchar(15) NOT NULL,
  `nama` varchar(70) NOT NULL,
  `jk` varchar(15) NOT NULL,
  `umur` int(11) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `soal_1` int(11) NOT NULL,
  `soal_2` int(11) NOT NULL,
  `soal_3` int(11) NOT NULL,
  `soal_4` int(11) NOT NULL,
  `soal_5` int(11) NOT NULL,
  `soal_6` int(11) NOT NULL,
  `soal_7` int(11) NOT NULL,
  `soal_8` int(11) NOT NULL,
  `soal_9` int(11) NOT NULL,
  `soal_10` int(11) NOT NULL,
  `soal_11` int(11) NOT NULL,
  `soal_12` int(11) NOT NULL,
  `soal_13` int(11) NOT NULL,
  `soal_14` int(11) NOT NULL,
  `soal_15` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kuesioner`
--

INSERT INTO `kuesioner` (`id_kuesioner`, `tanggal`, `nama`, `jk`, `umur`, `alamat`, `soal_1`, `soal_2`, `soal_3`, `soal_4`, `soal_5`, `soal_6`, `soal_7`, `soal_8`, `soal_9`, `soal_10`, `soal_11`, `soal_12`, `soal_13`, `soal_14`, `soal_15`) VALUES
(1, '30/10/2024', 'Herlina Kakambong', 'PEREMPUAN', 37, 'Marise', 3, 5, 5, 1, 7, 1, 3, 1, 5, 3, 7, 5, 5, 1, 1),
(2, '3/11/2024', 'Novriadi berhamba', 'LAKI-LAKI', 26, 'Bitung', 3, 5, 1, 3, 5, 1, 3, 3, 1, 1, 3, 3, 1, 1, 1),
(3, '7/11/2024', 'Jonathan lawendatu', 'LAKI-LAKI', 19, 'Liwas', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3),
(4, '18/11/2024', 'Ferry Salakay', 'LAKI-LAKI', 21, 'Watudambo', 1, 1, 3, 1, 1, 7, 7, 3, 1, 1, 3, 1, 9, 5, 1),
(5, '20/11/2024', 'Anggun badu', 'PEREMPUAN', 32, 'Bitung', 1, 1, 1, 1, 3, 3, 1, 5, 1, 1, 3, 3, 9, 3, 1),
(6, '25/11/2024', 'Steffen son matandatu', 'LAKI-LAKI', 24, 'Sangihe', 5, 5, 1, 3, 3, 1, 1, 3, 3, 1, 1, 1, 9, 9, 1),
(7, '30/11/2024', 'Meyta sarajar', 'PEREMPUAN', 26, 'Kombi', 1, 5, 5, 3, 7, 7, 7, 5, 5, 1, 7, 1, 7, 7, 7),
(8, '01/12/2024', 'Adolvina salmanu', 'PEREMPUAN', 30, 'Bitung', 7, 1, 5, 7, 7, 1, 5, 7, 5, 7, 3, 5, 7, 7, 7),
(9, '03/12/2024', 'Pingkan koagow', 'PEREMPUAN', 27, 'Maruari', 5, 5, 3, 5, 7, 7, 7, 5, 9, 5, 5, 7, 7, 7, 7),
(10, '03/12/2024', 'Fensca maria', 'PEREMPUAN', 32, 'Kema', 5, 5, 3, 7, 7, 7, 5, 9, 5, 7, 7, 5, 5, 7, 5),
(11, '10/12/2024 18:3', 'Fensca Maria', 'PEREMPUAN', 23, 'Kema', 1, 1, 1, 3, 5, 5, 5, 3, 3, 3, 1, 1, 1, 1, 5),
(12, '10/12/2024 18:3', 'Vici mamonto', 'PEREMPUAN', 25, 'Kotamobagu', 1, 3, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 3, 7),
(13, '10/12/2024 18:3', 'Olivia Mangangantung', 'PEREMPUAN', 27, 'Bitung', 1, 1, 1, 1, 5, 5, 7, 5, 5, 7, 3, 5, 5, 7, 5),
(14, '10/12/2024 18:3', 'Mercy korua', 'PEREMPUAN', 25, 'Ratatotok satu', 1, 1, 5, 3, 5, 5, 5, 1, 1, 5, 5, 5, 5, 5, 5),
(15, '10/12/2024 18:4', 'Yunice laleda', 'PEREMPUAN', 30, 'Tobelo', 1, 1, 5, 7, 7, 5, 5, 1, 1, 1, 5, 5, 1, 1, 1),
(16, '10/12/2024 18:4', 'Stela malendes', 'PEREMPUAN', 35, 'Bitung', 1, 1, 5, 1, 7, 5, 7, 1, 7, 9, 7, 5, 7, 1, 5),
(17, '10/12/2024 18:4', 'Jesicca Bregita', 'PEREMPUAN', 32, 'Manado', 1, 1, 5, 7, 7, 5, 5, 9, 7, 5, 7, 1, 5, 7, 9),
(18, '10/12/2024 18:4', 'Meyta Sarajar', 'PEREMPUAN', 27, 'Manado', 1, 1, 1, 5, 5, 5, 7, 3, 7, 7, 5, 9, 5, 5, 7),
(19, '10/12/2024 18:4', 'Christin Matahang', 'PEREMPUAN', 25, 'Amurang MINSEL', 1, 1, 1, 1, 1, 1, 7, 5, 7, 9, 7, 7, 9, 9, 7),
(20, '10/12/2024 18:4', 'Yune Yeti lepa', 'PEREMPUAN', 24, 'Blongko', 1, 5, 7, 5, 7, 1, 5, 7, 7, 7, 9, 7, 7, 7, 1),
(21, '10/12/2024 18:5', 'Anita Sualang', 'PEREMPUAN', 26, 'Ratahan Timur', 1, 1, 1, 7, 7, 9, 1, 7, 9, 7, 9, 9, 7, 7, 7),
(22, '10/12/2024 18:5', 'Debora Anneta kaloke', 'PEREMPUAN', 27, 'Kakenturan Bitung', 1, 1, 1, 7, 7, 7, 7, 7, 7, 5, 9, 9, 9, 1, 1),
(23, '10/12/2024 19:0', 'Rahmawati wulandari', 'PEREMPUAN', 26, 'Madidir Bitung', 1, 1, 1, 7, 7, 7, 7, 9, 9, 1, 1, 7, 7, 7, 9),
(24, '10/12/2024 19:0', 'Oktavia Tahulending', 'PEREMPUAN', 25, 'Manembo nembo Bitung', 1, 1, 1, 7, 7, 7, 7, 7, 1, 9, 5, 5, 5, 7, 9),
(25, '10/12/2024 19:0', 'Ritha Tompunu', 'PEREMPUAN', 26, 'Tombatu Timur', 1, 1, 1, 1, 7, 7, 7, 9, 3, 7, 9, 1, 1, 1, 7),
(26, '10/12/2024 19:1', 'Gloria Eveline Takapulungang', 'PEREMPUAN', 24, 'Tahuna, Sangihe', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(27, '10/12/2024 19:1', 'Distein dolontelide', 'LAKI-LAKI', 24, 'manado', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(28, '10/12/2024 19:1', 'Geo pagihari', 'LAKI-LAKI', 24, 'manado', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(29, '10/12/2024 19:1', 'julian pangandeng', 'LAKI-LAKI', 25, 'manado', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(30, '10/12/2024 19:2', 'Pingkan ingrid koagow', 'PEREMPUAN', 27, 'Bitung', 1, 1, 1, 7, 7, 9, 7, 5, 9, 9, 7, 7, 7, 9, 9),
(31, '10/12/2024 19:2', 'dio Pontongadil', 'LAKI-LAKI', 22, 'tomohon', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(32, '10/12/2024 19:2', 'gamaliel gahinsa', 'LAKI-LAKI', 23, 'tomohon ', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(33, '10/12/2024 19:2', 'Adolfina Salmanu', 'PEREMPUAN', 26, 'Bitung', 5, 5, 5, 7, 7, 7, 1, 1, 1, 7, 7, 9, 9, 9, 9),
(34, '10/12/2024 19:2', 'Susanti Utina', 'PEREMPUAN', 26, 'Bitung Timur', 5, 5, 1, 7, 1, 3, 7, 9, 5, 7, 7, 7, 5, 5, 5),
(35, '10/12/2024 19:2', 'Meyke koureng', 'PEREMPUAN', 25, 'Sinonsayang ', 1, 1, 5, 9, 5, 7, 9, 7, 5, 1, 7, 5, 9, 5, 5),
(36, '10/12/2024 19:3', 'Lidia Grace Karundeng', 'PEREMPUAN', 27, 'Sinonsayang', 5, 5, 9, 7, 7, 7, 9, 9, 5, 5, 5, 1, 1, 5, 5),
(37, '10/12/2024 19:4', 'Nathania Estevania', 'PEREMPUAN', 23, 'Wonasa kapleng', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(38, '10/12/2024 19:4', 'Arya putra', 'LAKI-LAKI', 25, 'Paal dua, manado', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(39, '10/12/2024 19:4', 'Kevin vincent', 'LAKI-LAKI', 25, 'Paniki atas', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(40, '10/12/2024 19:4', 'Arshilla vanesya', 'PEREMPUAN', 22, 'Mapanget', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(41, '10/12/2024 19:5', 'I dewa yoga', 'LAKI-LAKI', 32, 'Tumumpa dua, tuminting', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(42, '10/12/2024 21:1', 'febrianto lumape', 'LAKI-LAKI', 35, 'Watutumou', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(43, '10/12/2024 21:1', 'Giska rumagit', 'PEREMPUAN', 28, 'Watutumou minahasa utara', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(44, '11/12/2024 19:3', 'Kezia Sigar', 'PEREMPUAN', 23, 'Airmadidi', 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(45, '11/12/2024 19:4', 'Aleny Mokoginta', 'PEREMPUAN', 24, 'Kauditan', 9, 5, 9, 5, 5, 9, 9, 3, 5, 9, 5, 5, 5, 7, 5),
(46, '11/12/2024 19:4', 'Angeline Rivita Sumigar', 'PEREMPUAN', 23, 'Tikala Baru', 1, 5, 7, 5, 5, 5, 9, 5, 5, 9, 5, 5, 5, 5, 5),
(47, '11/12/2024 19:4', 'Thalia Fransisca Karamoy', 'PEREMPUAN', 24, 'Paal 2', 2, 7, 7, 5, 5, 2, 7, 7, 5, 7, 7, 5, 5, 1, 5),
(48, '11/12/2024 19:4', 'William Jacob', 'LAKI-LAKI', 27, 'Kombos Permai', 9, 9, 9, 5, 5, 9, 5, 5, 5, 9, 5, 7, 7, 7, 7),
(49, '11/12/2024 19:5', 'Rivandi Poluan', 'LAKI-LAKI', 25, 'Wenang, Manado', 9, 9, 9, 9, 7, 9, 9, 5, 7, 5, 5, 5, 5, 5, 5),
(50, '11/12/2024 19:5', 'Celine Mauren Rondonuwu', 'PEREMPUAN', 25, 'Sindulang Satu', 5, 5, 5, 5, 5, 3, 3, 3, 3, 5, 5, 5, 1, 1, 1),
(51, '11/12/2024 20:0', 'Gretta Eklessia Mello', 'PEREMPUAN', 23, 'Bengkol Manado', 7, 7, 7, 7, 7, 5, 5, 5, 5, 3, 3, 3, 7, 7, 5),
(52, '11/12/2024 20:1', 'Fernando Kalangit', 'LAKI-LAKI', 25, 'Manembo-nembo Atas ', 1, 1, 1, 1, 5, 9, 9, 5, 5, 9, 5, 5, 5, 5, 5),
(53, '11/12/2024 20:1', 'Jesslyn Kawengian', 'PEREMPUAN', 26, 'Bahu, Manado', 9, 9, 1, 9, 9, 1, 5, 5, 7, 7, 7, 5, 5, 5, 7),
(54, '11/12/2024 20:2', 'Felicia Karen Goniwala', 'PEREMPUAN', 27, 'Langowan', 5, 5, 1, 1, 5, 5, 5, 1, 1, 5, 1, 1, 5, 5, 5),
(55, '11/12/2024 20:2', 'Jeremias Walangitan', 'LAKI-LAKI', 24, 'Mahekeret Timur', 1, 1, 1, 3, 5, 1, 1, 3, 5, 9, 3, 3, 3, 3, 3),
(56, '11/12/2024 20:3', 'Orlando Fillio Egeten', 'LAKI-LAKI', 22, 'Titiwungen Utara, Sario, Manado', 9, 7, 9, 7, 7, 9, 9, 7, 7, 9, 7, 7, 7, 7, 7),
(57, '11/12/2024 20:3', 'Giselle Reinata Moningkey', 'PEREMPUAN', 24, 'Taas, Manado', 9, 9, 9, 9, 9, 7, 7, 5, 5, 7, 9, 9, 9, 7, 7),
(58, '11/12/2024 20:3', 'Yehezkiel Tendean', 'LAKI-LAKI', 25, 'Karombasan Utara', 7, 7, 9, 7, 7, 9, 9, 7, 7, 9, 7, 7, 7, 7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `kuesioner_hasil`
--

CREATE TABLE `kuesioner_hasil` (
  `soal` varchar(10) NOT NULL,
  `nilai_1` double NOT NULL,
  `nilai_3` double NOT NULL,
  `nilai_5` double NOT NULL,
  `nilai_7` double NOT NULL,
  `nilai_9` double NOT NULL,
  `nilai_2468` double NOT NULL,
  `hasil` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kuesioner_hasil`
--

INSERT INTO `kuesioner_hasil` (`soal`, `nilai_1`, `nilai_3`, `nilai_5`, `nilai_7`, `nilai_9`, `nilai_2468`, `hasil`, `total`) VALUES
('soal_1', 0.655, 0.034, 0.138, 0.052, 0.103, 0.017, 0.00000027982646952, 0.77093),
('soal_2', 0.603, 0.017, 0.241, 0.069, 0.069, 0, 0.000011762007651, 0.82226),
('soal_3', 0.569, 0.052, 0.19, 0.069, 0.121, 0, 0.00004693574028, 0.84211),
('soal_4', 0.397, 0.121, 0.155, 0.259, 0.069, 0, 0.000133062730185, 0.85738),
('soal_5', 0.31, 0.034, 0.259, 0.362, 0.034, 0, 0.00003359911688, 0.83727),
('soal_6', 0.397, 0.052, 0.19, 0.207, 0.138, 0.017, 0.00000190478430792, 0.79685),
('soal_7', 0.345, 0.052, 0.207, 0.259, 0.138, 0, 0.00013273077636, 0.85734),
('soal_8', 0.362, 0.138, 0.241, 0.155, 0.103, 0, 0.00019220895714, 0.86283),
('soal_9', 0.397, 0.069, 0.293, 0.172, 0.069, 0, 0.000095254336332, 0.85245),
('soal_10', 0.397, 0.052, 0.155, 0.207, 0.19, 0, 0.0001258489206, 0.85656),
('soal_11', 0.328, 0.121, 0.224, 0.241, 0.086, 0, 0.000184256461312, 0.86221),
('soal_12', 0.397, 0.069, 0.293, 0.155, 0.086, 0, 0.00010698856617, 0.85416),
('soal_13', 0.362, 0.034, 0.259, 0.207, 0.138, 0, 0.000091061894952, 0.85179),
('soal_14', 0.414, 0.052, 0.19, 0.276, 0.069, 0, 0.00007789605408, 0.8495),
('soal_15', 0.397, 0.034, 0.259, 0.224, 0.086, 0, 0.000067346597248, 0.84737);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`) VALUES
(1, 'Agen TKI', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ahp_alternatif`
--
ALTER TABLE `ahp_alternatif`
  ADD PRIMARY KEY (`id_alternatif`);

--
-- Indexes for table `ahp_kategori`
--
ALTER TABLE `ahp_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ahp_kriteria`
--
ALTER TABLE `ahp_kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `ahp_nilai`
--
ALTER TABLE `ahp_nilai`
  ADD PRIMARY KEY (`nilai`);

--
-- Indexes for table `ahp_subkriteria`
--
ALTER TABLE `ahp_subkriteria`
  ADD PRIMARY KEY (`id_subkriteria`);

--
-- Indexes for table `kuesioner`
--
ALTER TABLE `kuesioner`
  ADD PRIMARY KEY (`id_kuesioner`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ahp_subkriteria`
--
ALTER TABLE `ahp_subkriteria`
  MODIFY `id_subkriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `kuesioner`
--
ALTER TABLE `kuesioner`
  MODIFY `id_kuesioner` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
