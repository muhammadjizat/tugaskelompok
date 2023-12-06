-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2023 at 03:13 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL DEFAULT 'admin',
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `id_sekolah`, `nama`, `email`, `level`, `password`) VALUES
(1, 2, 'tasya', 'tasya@gmail.com', 'admin', 'df10f55cc1c7c9e42080f4984dc0da94');

-- --------------------------------------------------------

--
-- Table structure for table `admin_journal`
--

CREATE TABLE `admin_journal` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_admin` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `nilai` bigint(20) NOT NULL,
  `ext_1` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_journal`
--

INSERT INTO `admin_journal` (`id`, `id_sekolah`, `tanggal`, `id_admin`, `code`, `nilai`, `ext_1`) VALUES
(1, 2, '2023-12-06 10:39:13', 1, 'login', 0, ''),
(2, 2, '2023-12-06 10:39:45', 1, 'login', 0, ''),
(3, 2, '2023-12-06 10:41:28', 1, 'register_siswa', 0, '1'),
(4, 2, '2023-12-06 10:45:01', 1, 'create_kantin', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` longtext NOT NULL,
  `posted_by` int(11) NOT NULL COMMENT 'id admin',
  `target_donasi` bigint(20) NOT NULL,
  `terkumpul` bigint(20) NOT NULL DEFAULT 0,
  `status` enum('open','close') NOT NULL DEFAULT 'open'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donation_disbursement`
--

CREATE TABLE `donation_disbursement` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `idadmin` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `amout` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kantin`
--

CREATE TABLE `kantin` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` mediumtext NOT NULL,
  `saldo` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kantin`
--

INSERT INTO `kantin` (`id`, `id_sekolah`, `nama`, `deskripsi`, `saldo`) VALUES
(1, 2, 'cafe ABC', 'kantin ini berjual berbagai makanan ringan dan minuman kemasan', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kantin_transaction`
--

CREATE TABLE `kantin_transaction` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `kantin_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `qr_id` int(11) NOT NULL,
  `jumlah` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qrcode`
--

CREATE TABLE `qrcode` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `unique_id` varchar(255) NOT NULL COMMENT 'Nilai QR',
  `judul` varchar(255) NOT NULL,
  `tetap` tinyint(1) NOT NULL,
  `generated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_kantin` int(11) NOT NULL,
  `nilai` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `npsn` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL COMMENT 'Negeri / Swasta',
  `bentuk_pendidikan` varchar(255) NOT NULL COMMENT 'SMK / SMA',
  `nama_sekolah` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `biaya_spp` bigint(20) NOT NULL,
  `saldo` bigint(20) NOT NULL,
  `kode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `npsn`, `status`, `bentuk_pendidikan`, `nama_sekolah`, `email`, `alamat`, `biaya_spp`, `saldo`, `kode`) VALUES
(1, '89898989898', 'swasta', 'SMP', 'upi yptk', 'upiyptk@gmail.com', 'jl. lubeg', 0, 0, 'o2Bjfs9gqy'),
(2, '89898989898', 'swasta', 'SMP', 'upi yptk', 'upiyptk@gmail.com', 'jl. lubeg', 0, 0, 'DEt7lPXFzs');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `tanggal_pendaftaran` timestamp NOT NULL DEFAULT current_timestamp(),
  `nama` varchar(255) NOT NULL,
  `kelamin` enum('laki-laki','perempuan') NOT NULL,
  `email` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL DEFAULT 'siswa',
  `tingkatan` enum('I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII','XIII') NOT NULL,
  `jurusan` varchar(255) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `nisn` varchar(255) NOT NULL,
  `saldo` bigint(20) NOT NULL DEFAULT 0,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `id_sekolah`, `tanggal_pendaftaran`, `nama`, `kelamin`, `email`, `level`, `tingkatan`, `jurusan`, `kelas`, `nisn`, `saldo`, `password`) VALUES
(1, 2, '2023-12-06 10:41:28', 'aqsha', 'laki-laki', 'aqsha@gmail.com', 'siswa', 'VII', 'Teknik Informatika', 'IF3', '21101152630115', 50000, 'b47bcc78cdd55b28e28a882185c67b4e');

-- --------------------------------------------------------

--
-- Table structure for table `siswa_donation`
--

CREATE TABLE `siswa_donation` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `donation_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `jumlah` bigint(20) NOT NULL,
  `private` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswa_transaction`
--

CREATE TABLE `siswa_transaction` (
  `id` bigint(20) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `kredit` bigint(20) NOT NULL,
  `debit` bigint(20) NOT NULL,
  `tipe` varchar(255) NOT NULL COMMENT 'tipe transasi (spp/donasi/dll)',
  `jenis` enum('masuk','keluar') NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'tanggal transaksi',
  `siswa_id` int(11) NOT NULL,
  `metode` varchar(255) NOT NULL COMMENT 'metode pembayaran (transfer nisn/qrcode)',
  `deskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `spp`
--

CREATE TABLE `spp` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `bulan` enum('januari','februari','maret','april','mei','juni','juli','agustus','september','oktober','november','desember') NOT NULL,
  `status_pembayaran` tinyint(1) DEFAULT 0,
  `tanggal_pembayaran` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `spp`
--

INSERT INTO `spp` (`id`, `id_sekolah`, `id_siswa`, `bulan`, `status_pembayaran`, `tanggal_pembayaran`) VALUES
(1, 2, 1, 'januari', 0, NULL),
(2, 2, 1, 'februari', 0, NULL),
(3, 2, 1, 'maret', 0, NULL),
(4, 2, 1, 'april', 0, NULL),
(5, 2, 1, 'mei', 0, NULL),
(6, 2, 1, 'juni', 0, NULL),
(7, 2, 1, 'juli', 0, NULL),
(8, 2, 1, 'agustus', 0, NULL),
(9, 2, 1, 'september', 0, NULL),
(10, 2, 1, 'oktober', 0, NULL),
(11, 2, 1, 'november', 0, NULL),
(12, 2, 1, 'desember', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_sekolah` (`id_sekolah`);

--
-- Indexes for table `admin_journal`
--
ALTER TABLE `admin_journal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posted_by` (`posted_by`),
  ADD KEY `id_sekolah` (`id_sekolah`);

--
-- Indexes for table `donation_disbursement`
--
ALTER TABLE `donation_disbursement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idadmin` (`idadmin`),
  ADD KEY `id_sekolah` (`id_sekolah`);

--
-- Indexes for table `kantin`
--
ALTER TABLE `kantin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sekolah` (`id_sekolah`);

--
-- Indexes for table `kantin_transaction`
--
ALTER TABLE `kantin_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sekolah` (`id_sekolah`);

--
-- Indexes for table `qrcode`
--
ALTER TABLE `qrcode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`unique_id`),
  ADD KEY `generated_by` (`generated_by`),
  ADD KEY `id_kantin` (`id_kantin`),
  ADD KEY `id_sekolah` (`id_sekolah`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nisn` (`nisn`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_sekolah` (`id_sekolah`);

--
-- Indexes for table `siswa_donation`
--
ALTER TABLE `siswa_donation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donation_id` (`donation_id`),
  ADD KEY `siswa_id` (`siswa_id`),
  ADD KEY `id_sekolah` (`id_sekolah`);

--
-- Indexes for table `siswa_transaction`
--
ALTER TABLE `siswa_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_id` (`siswa_id`),
  ADD KEY `id_sekolah` (`id_sekolah`);

--
-- Indexes for table `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_journal`
--
ALTER TABLE `admin_journal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `donation`
--
ALTER TABLE `donation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donation_disbursement`
--
ALTER TABLE `donation_disbursement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kantin`
--
ALTER TABLE `kantin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kantin_transaction`
--
ALTER TABLE `kantin_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qrcode`
--
ALTER TABLE `qrcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siswa_donation`
--
ALTER TABLE `siswa_donation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `siswa_transaction`
--
ALTER TABLE `siswa_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spp`
--
ALTER TABLE `spp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_sekolah`) REFERENCES `schools` (`id`);

--
-- Constraints for table `admin_journal`
--
ALTER TABLE `admin_journal`
  ADD CONSTRAINT `admin_journal_ibfk_1` FOREIGN KEY (`id_sekolah`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `admin_journal_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id`);

--
-- Constraints for table `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`posted_by`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `donation_ibfk_2` FOREIGN KEY (`id_sekolah`) REFERENCES `schools` (`id`);

--
-- Constraints for table `donation_disbursement`
--
ALTER TABLE `donation_disbursement`
  ADD CONSTRAINT `donation_disbursement_ibfk_1` FOREIGN KEY (`id_sekolah`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `donation_disbursement_ibfk_2` FOREIGN KEY (`idadmin`) REFERENCES `admin` (`id`);

--
-- Constraints for table `kantin`
--
ALTER TABLE `kantin`
  ADD CONSTRAINT `kantin_ibfk_1` FOREIGN KEY (`id_sekolah`) REFERENCES `schools` (`id`);

--
-- Constraints for table `kantin_transaction`
--
ALTER TABLE `kantin_transaction`
  ADD CONSTRAINT `kantin_transaction_ibfk_1` FOREIGN KEY (`id_sekolah`) REFERENCES `schools` (`id`);

--
-- Constraints for table `qrcode`
--
ALTER TABLE `qrcode`
  ADD CONSTRAINT `qrcode_ibfk_1` FOREIGN KEY (`id_kantin`) REFERENCES `kantin` (`id`),
  ADD CONSTRAINT `qrcode_ibfk_2` FOREIGN KEY (`generated_by`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `qrcode_ibfk_3` FOREIGN KEY (`id_sekolah`) REFERENCES `schools` (`id`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_sekolah`) REFERENCES `schools` (`id`);

--
-- Constraints for table `siswa_donation`
--
ALTER TABLE `siswa_donation`
  ADD CONSTRAINT `siswa_donation_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`),
  ADD CONSTRAINT `siswa_donation_ibfk_2` FOREIGN KEY (`donation_id`) REFERENCES `donation` (`id`),
  ADD CONSTRAINT `siswa_donation_ibfk_3` FOREIGN KEY (`id_sekolah`) REFERENCES `schools` (`id`);

--
-- Constraints for table `siswa_transaction`
--
ALTER TABLE `siswa_transaction`
  ADD CONSTRAINT `siswa_transaction_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`),
  ADD CONSTRAINT `siswa_transaction_ibfk_2` FOREIGN KEY (`id_sekolah`) REFERENCES `schools` (`id`);

--
-- Constraints for table `spp`
--
ALTER TABLE `spp`
  ADD CONSTRAINT `spp_ibfk_1` FOREIGN KEY (`id_sekolah`) REFERENCES `schools` (`id`),
  ADD CONSTRAINT `spp_ibfk_2` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
