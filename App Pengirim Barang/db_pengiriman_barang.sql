-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2022 at 06:26 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pengiriman_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis_paket`
--

CREATE TABLE `tb_jenis_paket` (
  `id_paket` varchar(25) DEFAULT NULL,
  `paket_type` varchar(25) DEFAULT NULL,
  `asuransi` int(11) DEFAULT NULL,
  `biaya` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_jenis_paket`
--

INSERT INTO `tb_jenis_paket` (`id_paket`, `paket_type`, `asuransi`, `biaya`) VALUES
('3', 'Reguler', 5, 4),
('112', 'Express', 12000, 12000),
('12', 'Express', 12500, 150000),
('12', 'Express', 150000, 125000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penerima_barang`
--

CREATE TABLE `tb_penerima_barang` (
  `no_resi` varchar(25) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `kota_asal` varchar(25) DEFAULT NULL,
  `id_petugas` varchar(25) DEFAULT NULL,
  `penerima` varchar(35) DEFAULT NULL,
  `alamat` varchar(35) DEFAULT NULL,
  `telepon` int(11) DEFAULT NULL,
  `no_pengirim` varchar(25) DEFAULT NULL,
  `jumlah_item` int(11) DEFAULT NULL,
  `isi_paket` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengirim`
--

CREATE TABLE `tb_pengirim` (
  `no_pengirim` varchar(25) NOT NULL,
  `nama_pengirim` varchar(25) DEFAULT NULL,
  `alamat` varchar(35) DEFAULT NULL,
  `kota` varchar(35) DEFAULT NULL,
  `provinsi` varchar(35) DEFAULT NULL,
  `kodepos` varchar(35) DEFAULT NULL,
  `daerah` varchar(25) DEFAULT NULL,
  `telepon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pengirim`
--

INSERT INTO `tb_pengirim` (`no_pengirim`, `nama_pengirim`, `alamat`, `kota`, `provinsi`, `kodepos`, `daerah`, `telepon`) VALUES
('124', 'Dean', 'Medanesia', 'Padang', 'Palembang', '0123', 'Simalungun', 8134);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengiriman_barang`
--

CREATE TABLE `tb_pengiriman_barang` (
  `no_resi` varchar(25) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `kota_tujuan` varchar(25) DEFAULT NULL,
  `penerima` varchar(25) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `telepon` varchar(25) DEFAULT NULL,
  `paket_type` varchar(25) DEFAULT NULL,
  `berat` int(11) DEFAULT NULL,
  `biaya` int(11) DEFAULT NULL,
  `asuransi` int(11) DEFAULT NULL,
  `isi_paket` varchar(25) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `id_petugas` varchar(15) DEFAULT NULL,
  `no_pengirim` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `id_petugas` varchar(25) NOT NULL,
  `nama_petugas` varchar(35) DEFAULT NULL,
  `jabatan` varchar(25) DEFAULT NULL,
  `alamat` varchar(35) DEFAULT NULL,
  `telepon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_petugas`
--

INSERT INTO `tb_petugas` (`id_petugas`, `nama_petugas`, `jabatan`, `alamat`, `telepon`) VALUES
('1244', 'Ridho', 'Kurir', 'Kotanopan', 8123);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_penerima_barang`
--
ALTER TABLE `tb_penerima_barang`
  ADD PRIMARY KEY (`no_resi`);

--
-- Indexes for table `tb_pengirim`
--
ALTER TABLE `tb_pengirim`
  ADD PRIMARY KEY (`no_pengirim`);

--
-- Indexes for table `tb_pengiriman_barang`
--
ALTER TABLE `tb_pengiriman_barang`
  ADD PRIMARY KEY (`no_resi`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `no_pengirim` (`no_pengirim`);

--
-- Indexes for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_pengiriman_barang`
--
ALTER TABLE `tb_pengiriman_barang`
  ADD CONSTRAINT `tb_pengiriman_barang_ibfk_1` FOREIGN KEY (`no_resi`) REFERENCES `tb_penerima_barang` (`no_resi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pengiriman_barang_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `tb_petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pengiriman_barang_ibfk_3` FOREIGN KEY (`no_pengirim`) REFERENCES `tb_pengirim` (`no_pengirim`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
