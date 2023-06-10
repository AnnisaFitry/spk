-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2023 at 07:46 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spk_pro`
--

-- --------------------------------------------------------

--
-- Table structure for table `calon`
--

CREATE TABLE `calon` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `submit_by` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `calon`
--

INSERT INTO `calon` (`id`, `nama`, `jenis_kelamin`, `kecamatan`, `submit_by`) VALUES
(122, 'Ana Wijayanti', 'Perempuan', 'Malang', 1),
(123, 'Candra Dwi Aditama', 'Laki - Laki', 'Malang', 1),
(124, 'Mustofa Harianto', 'Laki - Laki', 'Malang', 1),
(125, 'Samsul Arifin', 'Laki - Laki', 'Malang', 1),
(126, 'Ummi Khulsum', 'Perempuan', 'Malang', 1);

-- --------------------------------------------------------

--
-- Table structure for table `calon_subkriteria`
--

CREATE TABLE `calon_subkriteria` (
  `id` int(11) NOT NULL,
  `calon_id` int(11) DEFAULT NULL,
  `subkriteria_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `calon_subkriteria`
--

INSERT INTO `calon_subkriteria` (`id`, `calon_id`, `subkriteria_id`, `value`) VALUES
(916, 122, 31, 0),
(917, 122, 35, 0),
(918, 122, 39, 0),
(919, 122, 43, 0),
(920, 122, 48, 0),
(921, 122, 50, 0),
(922, 122, 52, 0),
(923, 122, 55, 0),
(924, 122, 59, 0),
(925, 122, 62, 0),
(926, 122, 67, 0),
(927, 122, 71, 0),
(928, 122, 73, 0),
(929, 122, 78, 0),
(930, 122, 80, 0),
(931, 122, 82, 0),
(932, 123, 31, 0),
(933, 123, 36, 0),
(934, 123, 38, 0),
(935, 123, 43, 0),
(936, 123, 49, 0),
(937, 123, 50, 0),
(938, 123, 52, 0),
(939, 123, 55, 0),
(940, 123, 59, 0),
(941, 123, 63, 0),
(942, 123, 67, 0),
(943, 123, 71, 0),
(944, 123, 75, 0),
(945, 123, 78, 0),
(946, 123, 81, 0),
(947, 123, 83, 0),
(948, 124, 32, 0),
(949, 124, 36, 0),
(950, 124, 39, 0),
(951, 124, 43, 0),
(952, 124, 49, 0),
(953, 124, 50, 0),
(954, 124, 52, 0),
(955, 124, 55, 0),
(956, 124, 59, 0),
(957, 124, 63, 0),
(958, 124, 67, 0),
(959, 124, 71, 0),
(960, 124, 74, 0),
(961, 124, 78, 0),
(962, 124, 81, 0),
(963, 124, 83, 0),
(964, 125, 30, 0),
(965, 125, 34, 0),
(966, 125, 38, 0),
(967, 125, 42, 0),
(968, 125, 49, 0),
(969, 125, 50, 0),
(970, 125, 52, 0),
(971, 125, 56, 0),
(972, 125, 60, 0),
(973, 125, 61, 0),
(974, 125, 66, 0),
(975, 125, 70, 0),
(976, 125, 73, 0),
(977, 125, 78, 0),
(978, 125, 80, 0),
(979, 125, 82, 0),
(980, 126, 33, 0),
(981, 126, 37, 0),
(982, 126, 39, 0),
(983, 126, 43, 0),
(984, 126, 47, 0),
(985, 126, 51, 0),
(986, 126, 53, 0),
(987, 126, 55, 0),
(988, 126, 57, 0),
(989, 126, 62, 0),
(990, 126, 69, 0),
(991, 126, 71, 0),
(992, 126, 77, 0),
(993, 126, 79, 0),
(994, 126, 81, 0),
(995, 126, 83, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hasil_seleksi`
--

CREATE TABLE `hasil_seleksi` (
  `id` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  `program_bantuan_id` int(11) NOT NULL,
  `calon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bobot` double NOT NULL,
  `jenis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id`, `nama`, `bobot`, `jenis`) VALUES
(14, 'Jaminan', 10, 'Benefit'),
(15, 'Level Penghasilan', 10, 'Benefit'),
(16, 'Kepribadian', 6, 'Benefit'),
(17, 'Relasi', 6, 'Benefit'),
(18, 'Tanggungan', 6, 'Cost'),
(19, 'Rek. Listrik', 4, 'Benefit'),
(20, 'PBB', 4, 'Benefit'),
(21, 'Jangka Angsuran', 6, 'Cost'),
(22, 'Level Pinjaman', 6, 'Cost'),
(23, 'Kondisi Usaha / Pekerjaan', 6, 'Benefit'),
(24, 'Status Usaha / Pekerjaan', 6, 'Benefit'),
(25, 'Kondisi Rumah', 6, 'Benefit'),
(26, 'Status Rumah', 8, 'Benefit'),
(27, 'SHM', 8, 'Benefit'),
(28, 'SIUP / SKU', 4, 'Benefit'),
(29, 'Slip Gaji', 4, 'Benefit');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `email`, `username`, `password`, `level`) VALUES
(1, 'Administrator', 'admin@gmail.com', 'admin', '0192023a7bbd73250516f069df18b500', 'superadmin');

-- --------------------------------------------------------

--
-- Table structure for table `program_bantuan`
--

CREATE TABLE `program_bantuan` (
  `id` int(11) NOT NULL,
  `jenis_program` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subkriteria`
--

CREATE TABLE `subkriteria` (
  `id` int(11) NOT NULL,
  `kriteria_id` int(11) DEFAULT 0,
  `nama` varchar(50) DEFAULT '0',
  `bobot` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subkriteria`
--

INSERT INTO `subkriteria` (`id`, `kriteria_id`, `nama`, `bobot`) VALUES
(30, 14, 'Akta Tanah', 100),
(31, 14, 'BPKB', 75),
(32, 14, 'Logam Mulia', 50),
(33, 14, 'KTP/KK', 25),
(34, 15, '>= 5000000', 100),
(35, 15, '3000000 - 4900000', 75),
(36, 15, '1000000 - 2900000', 50),
(37, 15, '< 1000000', 25),
(38, 16, 'Sangat Baik', 100),
(39, 16, 'Baik', 75),
(40, 16, 'Kurang Baik', 50),
(41, 16, 'Tidak Baik', 25),
(42, 17, 'Sangat Baik', 100),
(43, 17, 'Baik', 75),
(44, 17, 'Kurang Baik', 50),
(45, 17, 'Tidak Baik', 25),
(46, 18, '>= 6 orang', 100),
(47, 18, '5 orang', 75),
(48, 18, '4 orang', 50),
(49, 18, '<= 3 orang', 25),
(50, 19, 'Ada', 100),
(51, 19, 'Tidak Ada', 25),
(52, 20, 'Ada', 100),
(53, 20, 'Tidak Ada', 25),
(54, 21, '36 Bulan', 100),
(55, 21, '24 Bulan', 75),
(56, 21, '12 Bulan', 25),
(57, 22, '> 10000000', 100),
(58, 22, '7000000 - 10000000', 75),
(59, 22, '5000000 - 6900000', 50),
(60, 22, '< 5000000', 25),
(61, 23, 'Sangat Baik', 100),
(62, 23, 'Baik', 80),
(63, 23, 'Cukup', 60),
(64, 23, 'Kurang Baik', 40),
(65, 23, 'Tidak Baik', 20),
(66, 24, 'Punya Usaha', 100),
(67, 24, 'Swasta', 75),
(68, 24, 'Wiraswasta', 50),
(69, 24, 'Tidak Bekerja', 25),
(70, 25, 'Layak', 100),
(71, 25, 'Cukup', 75),
(72, 25, 'Tidak Layak', 50),
(73, 26, 'Milik Sendiri', 100),
(74, 26, 'Milik Keluarga', 80),
(75, 26, 'Angsuran KPR', 60),
(76, 26, 'Rumah Dinas', 40),
(77, 26, 'Kontrak', 20),
(78, 27, 'Ada', 100),
(79, 27, 'Tidak Ada', 25),
(80, 28, 'Ada', 100),
(81, 28, 'Tidak Ada', 25),
(82, 29, 'Ada', 100),
(83, 29, 'Tidak Ada', 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calon`
--
ALTER TABLE `calon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submit_by` (`submit_by`);

--
-- Indexes for table `calon_subkriteria`
--
ALTER TABLE `calon_subkriteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calon_id` (`calon_id`),
  ADD KEY `subkriteria_id` (`subkriteria_id`);

--
-- Indexes for table `hasil_seleksi`
--
ALTER TABLE `hasil_seleksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_bantuan_id` (`program_bantuan_id`),
  ADD KEY `calon_id` (`calon_id`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `program_bantuan`
--
ALTER TABLE `program_bantuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subkriteria`
--
ALTER TABLE `subkriteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kriteria_id` (`kriteria_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calon`
--
ALTER TABLE `calon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `calon_subkriteria`
--
ALTER TABLE `calon_subkriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=996;

--
-- AUTO_INCREMENT for table `hasil_seleksi`
--
ALTER TABLE `hasil_seleksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `program_bantuan`
--
ALTER TABLE `program_bantuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subkriteria`
--
ALTER TABLE `subkriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `calon`
--
ALTER TABLE `calon`
  ADD CONSTRAINT `calon_ibfk_1` FOREIGN KEY (`submit_by`) REFERENCES `pengguna` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `calon_subkriteria`
--
ALTER TABLE `calon_subkriteria`
  ADD CONSTRAINT `FK__calon` FOREIGN KEY (`calon_id`) REFERENCES `calon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__subkriteria` FOREIGN KEY (`subkriteria_id`) REFERENCES `subkriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasil_seleksi`
--
ALTER TABLE `hasil_seleksi`
  ADD CONSTRAINT `hasil_seleksi_ibfk_1` FOREIGN KEY (`program_bantuan_id`) REFERENCES `program_bantuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_seleksi_ibfk_2` FOREIGN KEY (`calon_id`) REFERENCES `calon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subkriteria`
--
ALTER TABLE `subkriteria`
  ADD CONSTRAINT `FK_subkriteria_kriteria` FOREIGN KEY (`kriteria_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
