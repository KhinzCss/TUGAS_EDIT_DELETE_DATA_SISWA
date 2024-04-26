-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Apr 2024 pada 14.29
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_guru`
--
CREATE DATABASE IF NOT EXISTS `data_guru` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `data_guru`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nip` varchar(100) NOT NULL,
  `aksi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id`, `nama`, `nip`, `aksi`) VALUES
(2, 'Haikal Ahmad Ridha', '7777777', ''),
(3, 'Nelisa Siva Azhara', '2525252', ''),
(6, 'kiki k', '7777777777', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `db_absen`
--
CREATE DATABASE IF NOT EXISTS `db_absen` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_absen`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `status_kehadiran` varchar(20) DEFAULT NULL,
  `waktu_masuk` datetime NOT NULL,
  `waktu_keluar` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `absensi`
--

INSERT INTO `absensi` (`id`, `nama`, `kelas`, `status_kehadiran`, `waktu_masuk`, `waktu_keluar`) VALUES
(1, 'tes', 'x', 'Tepat Waktu', '2024-03-24 02:21:48', NULL),
(2, 'haikal', 'xii', 'Tepat Waktu', '2024-03-24 02:25:30', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `db_absensi`
--
CREATE DATABASE IF NOT EXISTS `db_absensi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_absensi`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kehadiran`
--

CREATE TABLE `kehadiran` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `waktu_absen` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Tepat Waktu','Terlambat') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `nomor_absen` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role_id`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, 'siswa', '202cb962ac59075b964b07152d234b70', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_id` (`siswa_id`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kehadiran`
--
ALTER TABLE `kehadiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD CONSTRAINT `kehadiran_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`);

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
--
-- Database: `db_ekios`
--
CREATE DATABASE IF NOT EXISTS `db_ekios` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_ekios`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_detail`
--

CREATE TABLE `tbl_detail` (
  `detail_id` int(11) NOT NULL,
  `detail_menu_id` int(11) DEFAULT NULL,
  `detail_menu_nama` varchar(100) DEFAULT NULL,
  `detail_harjul` double DEFAULT NULL,
  `detail_porsi` int(11) DEFAULT NULL,
  `detail_diskon_id` int(11) NOT NULL,
  `detail_nama_diskon` varchar(100) NOT NULL,
  `detail_a_diskon` int(11) NOT NULL,
  `detail_subtotal` double DEFAULT NULL,
  `detail_inv_no` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_detail`
--

INSERT INTO `tbl_detail` (`detail_id`, `detail_menu_id`, `detail_menu_nama`, `detail_harjul`, `detail_porsi`, `detail_diskon_id`, `detail_nama_diskon`, `detail_a_diskon`, `detail_subtotal`, `detail_inv_no`) VALUES
(73, 15, 'Coca Cola Dingin', 10000, 1, 0, '', 0, 10000, 'INV171019000002'),
(74, 3, 'Sate Madura', 18000, 3, 0, '', 0, 54000, 'INV171019000002'),
(75, 17, 'Kopi Latte Moca', 7500, 2, 1, 'Diskon Mulai Tanggal 27 s/d 31 Oktober', 50, 15000, 'INV171019000003'),
(76, 14, 'Es Semangka', 12000, 1, 0, '', 0, 12000, 'INV171019000003'),
(77, 4, 'Burger', 18000, 4, 2, 'Diskon Toko', 10, 72000, 'INV171019000004'),
(78, 17, 'Kopi Latte Moca', 7500, 1, 1, 'Diskon Mulai Tanggal 27 s/d 31 Oktober', 50, 7500, 'INV171019000004'),
(79, 17, 'Kopi Latte Moca', 7500, 1, 1, 'Diskon Mulai Tanggal 27 s/d 31 Oktober', 50, 7500, 'INV171019000005'),
(80, 4, 'Burger', 18000, 4, 2, 'Diskon Toko', 10, 72000, 'INV171019000005'),
(81, 3, 'Sate Madura', 18000, 1, 0, '', 0, 18000, 'INV171019000005'),
(82, 4, 'Burger', 18000, 1, 2, 'Diskon Toko', 10, 18000, 'INV171019000006'),
(83, 17, 'Kopi Latte Moca', 7500, 3, 1, 'Diskon Mulai Tanggal 27 s/d 31 Oktober', 50, 22500, 'INV171019000006'),
(84, 16, 'Kopi Latte', 14000, 1, 0, '', 0, 14000, 'INV171019000006'),
(85, 17, 'Kopi Latte Moca', 7500, 1, 1, 'Diskon Mulai Tanggal 27 s/d 31 Oktober', 50, 7500, 'INV171019000007'),
(86, 4, 'Burger', 18000, 1, 2, 'Diskon Toko', 10, 18000, 'INV171019000007'),
(87, 3, 'Sate Madura', 18000, 1, 0, '', 0, 18000, 'INV171019000007'),
(88, 4, 'Burger', 18000, 1, 2, 'Diskon Toko', 10, 18000, 'INV171019000008'),
(91, 5, 'Pizza', 17000, 10, 0, '', 0, 170000, 'INV191019000001'),
(92, 6, 'Menu 5', 20000, 1, 0, '', 0, 20000, 'INV191019000001'),
(93, 11, 'Coklat Hangat', 12000, 1, 0, '', 0, 12000, 'INV191019000001'),
(94, 4, 'Burger', 18000, 1, 2, 'Diskon Toko', 10, 18000, 'INV191019000001'),
(95, 15, 'Coca Cola Dingin', 10000, 1, 0, '', 0, 10000, 'INV191019000001'),
(96, 3, 'Sate Madura', 18000, 1, 0, '', 0, 18000, 'INV191019000002'),
(97, 13, 'Ice Lemon', 12000, 1, 0, '', 0, 12000, 'INV191019000002'),
(98, 15, 'Coca Cola Dingin', 10000, 1, 0, '', 0, 10000, 'INV191019000002'),
(99, 3, 'Sate Madura', 18000, 50, 0, '', 0, 900000, 'INV191019000003'),
(100, 3, 'Sate Madura', 18000, 1, 0, '', 0, 18000, 'INV191019000004'),
(101, 4, 'Burger', 18000, 3, 2, 'Diskon Toko', 10, 54000, 'INV191019000004'),
(102, 4, 'Burger', 18000, 1, 2, 'Diskon Toko', 10, 18000, 'INV201019000001'),
(103, 5, 'Pizza', 8500, 1, 1, 'Diskon Mulai Tanggal 27 s/d 31 Oktober', 50, 8500, 'INV201019000001'),
(104, 6, 'Menu 5', 20000, 1, 0, '', 0, 20000, 'INV201019000002'),
(105, 3, 'Sate Madura', 16200, 1, 2, 'Diskon Toko', 10, 16200, 'INV201019000002'),
(106, 4, 'Burger', 18000, 1, 2, 'Diskon Toko', 10, 18000, 'INV201019000002'),
(107, 5, 'Pizza', 8500, 1, 1, 'Diskon Mulai Tanggal 27 s/d 31 Oktober', 50, 8500, 'INV201019000002'),
(108, 15, 'Coca Cola Dingin', 10000, 1, 0, '', 0, 10000, 'INV201019000002'),
(109, 3, 'Sate Madura', 16200, 2, 2, 'Diskon Toko', 10, 32400, 'INV201019000003'),
(110, 17, 'Kopi Latte Moca', 7500, 1, 1, 'Diskon Mulai Tanggal 27 s/d 31 Oktober', 50, 7500, 'INV201019000004'),
(111, 3, 'Sate Madura', 16200, 10, 2, 'Diskon Toko', 10, 162000, 'INV211019000001'),
(112, 5, 'Pizza', 8500, 10, 1, 'Diskon Mulai Tanggal 27 s/d 31 Oktober', 50, 85000, 'INV211019000001'),
(113, 13, 'Ice Lemon', 12000, 1, 0, '', 0, 12000, 'INV211019000001'),
(114, 4, 'Burger', 18000, 1, 2, 'Diskon Toko', 10, 18000, 'INV211019000001'),
(115, 16, 'Kopi Latte', 14000, 1, 0, '', 0, 14000, 'INV211019000001'),
(116, 3, 'Sate Madura', 16200, 1, 2, 'Diskon Toko', 10, 16200, 'INV211019000002'),
(117, 3, 'Sate Madura', 16200, 10, 2, 'Diskon Toko', 10, 162000, 'INV211019000003'),
(118, 3, 'Sate Madura', 16200, 1, 2, 'Diskon Toko', 10, 16200, 'INV211019000004'),
(119, 4, 'Burger', 18000, 1, 2, 'Diskon Toko', 10, 18000, 'INV211019000004'),
(120, 3, 'Sate Madura', 16200, 1, 2, 'Diskon Toko', 10, 16200, 'INV211019000005'),
(121, 4, 'Burger', 18000, 1, 2, 'Diskon Toko', 10, 18000, 'INV211019000005'),
(122, 3, 'Sate Madura', 16200, 1, 2, 'Diskon Toko', 10, 16200, 'INV211019000006'),
(123, 4, 'Burger', 18000, 1, 2, 'Diskon Toko', 10, 18000, 'INV211019000006'),
(124, 3, 'Sate Madura', 16200, 1, 2, 'Diskon Toko', 10, 16200, 'INV211019000007'),
(125, 4, 'Burger', 18000, 10, 2, 'Diskon Toko', 10, 180000, 'INV211019000007'),
(126, 5, 'Pizza', 8500, 1, 1, 'Diskon Mulai Tanggal 27 s/d 31 Oktober', 50, 8500, 'INV211019000007'),
(127, 13, 'Ice Lemon', 12000, 1, 0, '', 0, 12000, 'INV211019000007'),
(128, 11, 'Coklat Hangat', 12000, 1, 0, '', 0, 12000, 'INV211019000007'),
(129, 11, 'Coklat Hangat', 12000, 11, 0, '', 0, 132000, 'INV211019000008'),
(130, 4, 'Burger', 18000, 10, 2, 'Diskon Toko', 10, 180000, 'INV211019000009'),
(131, 5, 'Pizza', 8500, 1, 1, 'Diskon Mulai Tanggal 27 s/d 31 Oktober', 50, 8500, 'INV211019000009'),
(132, 6, 'Menu 5', 10000, 6, 1, 'Diskon Mulai Tanggal 27 s/d 31 Oktober', 50, 60000, 'INV211019000010'),
(133, 3, 'Sate Madura', 16200, 1, 2, 'Diskon Toko', 10, 16200, 'INV211019000011'),
(134, 3, 'Sate Madura', 16200, 1, 2, 'Diskon Toko', 10, 16200, 'INV221019000001'),
(135, 4, 'Burger', 18000, 1, 2, 'Diskon Toko', 10, 18000, 'INV221019000001'),
(136, 5, 'Pizza', 13600, 1, 1, 'Diskon Tanggal Tua', 20, 13600, 'INV221019000001'),
(137, 6, 'Menu 5', 20000, 1, 0, '', 0, 20000, 'INV221019000001'),
(138, 13, 'Ice Lemon', 12000, 1, 0, '', 0, 12000, 'INV221019000001'),
(139, 17, 'Kopi Torabika', 10400, 10, 1, 'Diskon Tanggal Tua', 20, 104000, 'INV221019000002'),
(140, 4, 'Burger', 18000, 1, 2, 'Diskon Toko', 10, 18000, 'INV221019000002'),
(141, 3, 'Sate Madura', 16200, 1, 2, 'Diskon Toko', 10, 16200, 'INV231019000003'),
(142, 4, 'Burger', 18000, 1, 2, 'Diskon Toko', 10, 18000, 'INV231019000003'),
(143, 5, 'Pizza', 13600, 1, 1, 'Diskon Tanggal Tua', 20, 13600, 'INV231019000003'),
(144, 13, 'Ice Lemon', 12000, 1, 0, '', 0, 12000, 'INV231019000003'),
(145, 3, 'Sate Madura', 14400, 1, 1, 'Diskon Tanggal Muda', 20, 14400, 'INV241019000001'),
(146, 4, 'Burger', 20000, 1, 0, '', 0, 20000, 'INV241019000001'),
(147, 5, 'Pizza', 13600, 1, 1, 'Diskon Tanggal Muda', 20, 13600, 'INV241019000001'),
(148, 11, 'Coklat Hangat', 9600, 10, 1, 'Diskon Tanggal Muda', 20, 96000, 'INV241019000001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_diskon`
--

CREATE TABLE `tbl_diskon` (
  `diskon_id` int(11) NOT NULL,
  `nama_diskon` varchar(100) DEFAULT NULL,
  `a_diskon` int(11) DEFAULT NULL,
  `mulai_diskon` date DEFAULT NULL,
  `exp_diskon` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_diskon`
--

INSERT INTO `tbl_diskon` (`diskon_id`, `nama_diskon`, `a_diskon`, `mulai_diskon`, `exp_diskon`) VALUES
(0, NULL, NULL, NULL, NULL),
(1, 'Diskon Tanggal Muda', 60, '2019-10-15', '2019-10-31'),
(2, 'Diskon Toko', 10, '2019-10-17', '2019-11-01'),
(3, 'diskon xp', 20, '2019-10-10', '2019-10-24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_invoice`
--

CREATE TABLE `tbl_invoice` (
  `inv_no` varchar(15) NOT NULL,
  `inv_tanggal` timestamp NULL DEFAULT current_timestamp(),
  `inv_plg_id` int(11) DEFAULT NULL,
  `inv_plg_nama` varchar(80) DEFAULT NULL,
  `inv_total` double DEFAULT NULL,
  `inv_bayar` int(11) DEFAULT NULL,
  `inv_kembali` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_invoice`
--

INSERT INTO `tbl_invoice` (`inv_no`, `inv_tanggal`, `inv_plg_id`, `inv_plg_nama`, `inv_total`, `inv_bayar`, `inv_kembali`) VALUES
('INV171019000002', '2019-10-17 03:18:02', 28, 'Imam asri', 64000, 65000, '1000'),
('INV171019000003', '2019-10-17 03:36:41', 28, 'Imam asri', 27000, 30000, '3000'),
('INV171019000004', '2019-10-17 03:51:00', 28, 'Imam asri', 79500, 80000, '500'),
('INV171019000005', '2019-10-17 04:39:05', 28, 'Imam asri', 97500, 100000, '2500'),
('INV171019000006', '2019-10-17 05:49:43', 28, 'Imam asri', 54500, 55000, '500'),
('INV171019000007', '2019-10-17 05:53:19', 28, 'Imam asri', 43500, 45000, '1500'),
('INV171019000008', '2019-10-17 06:34:01', 28, 'Imam asri', 18000, 20000, '2000'),
('INV191019000001', '2019-10-19 03:20:28', 28, 'Imam asri', 230000, 240000, '10000'),
('INV191019000002', '2019-10-19 07:40:29', 28, 'Imam asri', 40000, 40000, '0'),
('INV191019000003', '2019-10-19 10:18:55', 28, 'Imam asri', 900000, 900000, '0'),
('INV191019000004', '2019-10-19 11:08:48', 28, 'Imam asri', 72000, 75000, '3000'),
('INV201019000001', '2019-10-20 04:12:24', 28, 'Imam asri', 26500, 27000, '500'),
('INV201019000002', '2019-10-20 08:57:20', 28, 'Imam asri', 72700, 73000, '300'),
('INV201019000003', '2019-10-20 10:08:34', 28, 'Imam asri', 32400, 33000, '600'),
('INV201019000004', '2019-10-20 14:54:10', 28, 'Imam asri', 7500, 8000, '500'),
('INV211019000001', '2019-10-21 02:08:43', 28, 'Imam asri', 291000, 300000, '9000'),
('INV211019000002', '2019-10-21 02:09:49', 28, 'Imam asri', 16200, 17000, '800'),
('INV211019000003', '2019-10-21 02:10:19', 28, 'Imam asri', 162000, 170000, '8000'),
('INV211019000004', '2019-10-21 02:10:57', 28, 'Imam asri', 34200, 35000, '800'),
('INV211019000005', '2019-10-21 02:11:23', 28, 'Imam asri', 34200, 35000, '800'),
('INV211019000006', '2019-10-21 02:16:41', 28, 'Imam asri', 34200, 35000, '800'),
('INV211019000007', '2019-10-21 04:24:57', 28, 'Imam asri', 228700, 230000, '1300'),
('INV211019000008', '2019-10-21 04:27:24', 28, 'Imam asri', 132000, 133000, '1000'),
('INV211019000009', '2019-10-21 07:03:16', 28, 'Imam asri', 188500, 190000, '1500'),
('INV211019000010', '2019-10-21 07:04:33', 28, 'Imam asri', 60000, 60000, '0'),
('INV211019000011', '2019-10-21 08:31:13', 28, 'Imam asri', 16200, 17000, '800'),
('INV221019000001', '2019-10-22 20:09:19', 29, 'Imam asri 02', 79800, 80000, '200'),
('INV221019000002', '2019-10-22 21:53:47', 28, 'Imam asri', 122000, 123000, '1000'),
('INV231019000003', '2019-10-23 01:10:56', 29, 'Imam asri 02', 59800, 60000, '200'),
('INV241019000001', '2019-10-24 01:00:40', 29, 'Imam asri 02', 144000, 150000, '6000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_nama` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`kategori_id`, `kategori_nama`) VALUES
(1, 'Makanan'),
(2, 'Minuman'),
(7, 'Cemilan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `menu_id` int(11) NOT NULL,
  `menu_nama` varchar(100) DEFAULT NULL,
  `menu_harga_lama` double DEFAULT NULL,
  `menu_harga_baru` double DEFAULT NULL,
  `menu_kategori_id` int(11) DEFAULT NULL,
  `menu_kategori_nama` varchar(30) DEFAULT NULL,
  `menu_id_diskon` int(11) NOT NULL,
  `menu_nama_diskon` varchar(100) DEFAULT NULL,
  `menu_a_diskon` int(11) NOT NULL,
  `menu_qty` int(11) DEFAULT NULL,
  `menu_gambar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_menu`
--

INSERT INTO `tbl_menu` (`menu_id`, `menu_nama`, `menu_harga_lama`, `menu_harga_baru`, `menu_kategori_id`, `menu_kategori_nama`, `menu_id_diskon`, `menu_nama_diskon`, `menu_a_diskon`, `menu_qty`, `menu_gambar`) VALUES
(3, 'Sate Madura', 20000, 18000, 1, 'Makanan', 1, 'Diskon Tanggal Muda', 60, 166, 'file_1481423323.jpg'),
(4, 'Burger', NULL, 20000, 1, 'Makanan', 1, 'Diskon Tanggal Muda', 60, 173, 'file_1481423391.jpg'),
(5, 'Pizza', 20000, 17000, 1, 'Makanan', 1, 'Diskon Tanggal Muda', 60, 344, 'file_1481423407.jpg'),
(6, 'Kue telur', NULL, 20000, 1, 'Makanan', 1, 'Diskon Tanggal Muda', 60, 10, 'file_1481423428.jpg'),
(11, 'Coklat Hangat', NULL, 12000, 2, 'Minuman', 1, 'Diskon Tanggal Muda', 60, 64, 'file_1494160941.jpg'),
(12, 'Es Coklat Mint', 16000, 15000, 2, 'Minuman', 0, '', 0, 10, 'file_1494160974.jpg'),
(13, 'Ice Lemon', NULL, 12000, 2, 'Minuman', 0, '', 0, 93, 'file_1494161014.jpg'),
(14, 'Es Semangka', NULL, 12000, 2, 'Minuman', 0, '', 0, 88, 'file_1494161073.jpg'),
(15, 'Coca Cola Dingin', NULL, 10000, 2, 'Minuman', 1, 'Diskon Tanggal Muda', 60, 32, 'file_1494161100.jpg'),
(16, 'Kopi Latte', 14000, 13000, 1, 'Makanan', 0, '', 0, 305, 'file_1494161133.jpg'),
(17, 'Kopi Torabika', 15000, 13000, 2, 'Minuman', 1, 'Diskon Tanggal Muda', 60, 78, 'file_1494161156.jpg'),
(18, 'Kopi Torabika setia', 5000, 4000, 2, 'Minuman', 0, '', 0, 88, 'file_1571879041.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `plg_id` int(11) NOT NULL,
  `plg_nama` varchar(80) DEFAULT NULL,
  `plg_jenkel` varchar(20) DEFAULT NULL,
  `plg_notelp` varchar(30) DEFAULT NULL,
  `plg_email` varchar(40) DEFAULT NULL,
  `plg_photo` varchar(20) DEFAULT NULL,
  `plg_register` timestamp NULL DEFAULT current_timestamp(),
  `plg_password` varchar(35) DEFAULT NULL,
  `plg_level` enum('Kasir','Admin') DEFAULT NULL,
  `plg_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`plg_id`, `plg_nama`, `plg_jenkel`, `plg_notelp`, `plg_email`, `plg_photo`, `plg_register`, `plg_password`, `plg_level`, `plg_status`) VALUES
(28, 'Imam asri', 'Laki Laki', '089664080645', 'Imamasri@outlook.com', 'file_1571835232.jpg', '2019-09-01 22:18:55', '21232f297a57a5a743894a0e4a801fc3', 'Admin', 0),
(29, 'Imam asri 02', 'Perempuan', '089666440365', 'Imamasri02@outlook.com', 'file_1571878970.jpg', '2019-10-22 07:48:31', '21232f297a57a5a743894a0e4a801fc3', 'Kasir', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_detail`
--
ALTER TABLE `tbl_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `detail_inv_no` (`detail_inv_no`),
  ADD KEY `detail_menu_id` (`detail_menu_id`);

--
-- Indeks untuk tabel `tbl_diskon`
--
ALTER TABLE `tbl_diskon`
  ADD PRIMARY KEY (`diskon_id`);

--
-- Indeks untuk tabel `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD PRIMARY KEY (`inv_no`),
  ADD KEY `inv_plg_id` (`inv_plg_id`);

--
-- Indeks untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indeks untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`menu_id`),
  ADD KEY `menu_kategori_id` (`menu_kategori_id`);

--
-- Indeks untuk tabel `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`plg_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_detail`
--
ALTER TABLE `tbl_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT untuk tabel `tbl_diskon`
--
ALTER TABLE `tbl_diskon`
  MODIFY `diskon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  MODIFY `plg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_detail`
--
ALTER TABLE `tbl_detail`
  ADD CONSTRAINT `tbl_detail_ibfk_1` FOREIGN KEY (`detail_inv_no`) REFERENCES `tbl_invoice` (`inv_no`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_detail_ibfk_2` FOREIGN KEY (`detail_menu_id`) REFERENCES `tbl_menu` (`menu_id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD CONSTRAINT `tbl_invoice_ibfk_1` FOREIGN KEY (`inv_plg_id`) REFERENCES `tbl_pelanggan` (`plg_id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD CONSTRAINT `tbl_menu_ibfk_1` FOREIGN KEY (`menu_kategori_id`) REFERENCES `tbl_kategori` (`kategori_id`) ON UPDATE CASCADE;
--
-- Database: `db_gallerys`
--
CREATE DATABASE IF NOT EXISTS `db_gallerys` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_gallerys`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `albumid` int(11) NOT NULL,
  `namaalbum` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggaldibuat` date NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`albumid`, `namaalbum`, `deskripsi`, `tanggaldibuat`, `admin_id`) VALUES
(9, 'tes', 'tess', '2024-04-18', 15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin_telp` varchar(20) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_address` text NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`admin_id`, `admin_name`, `username`, `password`, `admin_telp`, `admin_email`, `admin_address`, `role`) VALUES
(2, 'irawan', 'irawan', 'adminirawan', '085774137284', 'irawan@gmail.com', 'Jl. Raya Kadu Seungit', 'user'),
(3, 'Diana', 'diana', '1234', '085788992919', 'Diana@gmail.com', 'Suka Seneng Cikeusik', 'user'),
(4, 'Hazwan', 'hazwan', '123', '085787778811', 'hazwan@gmail.com', 'Cikeusik Pandeglang', 'user'),
(6, 'admin', 'Admin', 'semuasama', 'semuasama', 'admin@gmail.com', 'semuasama', 'admin'),
(15, 'Afridol', 'afridol', 'bandung', '0896', 'aridol@gmail.com', 'Bandung', 'user'),
(20, 'putra', 'putra', 'kilua', '0826', 'kilua@gmail.com', 'Kp.pajajaran', 'admin'),
(21, 'Afridoll Putraa', 'putraaa', 'parongpong', '', '', '', 'user'),
(22, 'Ludwig', 'ludwig', 'bandung', '', '', '', 'user');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_category`
--

CREATE TABLE `tb_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(25) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_category`
--

INSERT INTO `tb_category` (`category_id`, `category_name`, `image`) VALUES
(16, 'Alam', ''),
(18, 'Makanan', ''),
(20, 'Sayuran', ''),
(21, 'Buah Buahan', ''),
(22, 'Lautan', ''),
(24, 'Pegunungan', 'foto1710689448.jpg'),
(26, 'Hewan Liar', 'foto1710704099.jpg'),
(27, 'bunga', 'foto1712202897.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_comments`
--

CREATE TABLE `tb_comments` (
  `comment_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `comment_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_image`
--

CREATE TABLE `tb_image` (
  `image_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `image_description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `image_status` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `albumid` int(11) NOT NULL,
  `likes` int(11) DEFAULT 11
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_image`
--

INSERT INTO `tb_image` (`image_id`, `category_id`, `category_name`, `admin_id`, `admin_name`, `image_name`, `image_description`, `image`, `image_status`, `date_created`, `albumid`, `likes`) VALUES
(77, 18, 'Makanan', 15, 'afridol', 'afridol', 'ini makanan kayaknya', 'foto1713506096.jpeg', 1, '2024-04-20 09:23:51', 0, 42);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`albumid`),
  ADD KEY `userid` (`admin_id`);

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeks untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `tb_comments`
--
ALTER TABLE `tb_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Indeks untuk tabel `tb_image`
--
ALTER TABLE `tb_image`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `albumid` (`albumid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `albumid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `tb_comments`
--
ALTER TABLE `tb_comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `tb_image`
--
ALTER TABLE `tb_image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `tb_admin` (`admin_id`);

--
-- Ketidakleluasaan untuk tabel `tb_comments`
--
ALTER TABLE `tb_comments`
  ADD CONSTRAINT `tb_comments_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `tb_image` (`image_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_image`
--
ALTER TABLE `tb_image`
  ADD CONSTRAINT `tb_image_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `tb_admin` (`admin_id`),
  ADD CONSTRAINT `tb_image_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`category_id`);
--
-- Database: `db_kasir`
--
CREATE DATABASE IF NOT EXISTS `db_kasir` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_kasir`;
--
-- Database: `db_naz`
--
CREATE DATABASE IF NOT EXISTS `db_naz` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_naz`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id` int(11) NOT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id`, `nip`, `nama`) VALUES
(1, '123', 'nazwa'),
(3, '1111111111', 'nazwa rahma'),
(4, '22222222', 'haikal');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nip` (`nip`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `db_penjualan`
--
CREATE DATABASE IF NOT EXISTS `db_penjualan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_penjualan`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mahasiswa`
--

CREATE TABLE `tb_mahasiswa` (
  `nim` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_mahasiswa`
--

INSERT INTO `tb_mahasiswa` (`nim`, `nama`, `alamat`) VALUES
(21400200, 'faqih', 'bandung'),
(21400201, 'ina', 'jakarta'),
(21400202, 'anto', 'semarang'),
(21400203, 'dani', 'padang'),
(21400204, 'jaka', 'bandung'),
(21400205, 'nara', 'bandung'),
(21400206, 'senta', 'semarang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(10) NOT NULL,
  `nim` int(10) NOT NULL,
  `buku` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id_transaksi`, `nim`, `buku`) VALUES
(1, 21400200, 'Buku Informatika'),
(2, 21400202, 'Buku Teknik Elektro'),
(3, 21400203, 'Buku Matematika'),
(4, 21400206, 'Buku Fisika'),
(5, 21400207, 'Buku Bahasa Indonesia'),
(6, 21400210, 'Buku Bahasa Daerah'),
(7, 21400211, 'Buku Kimia');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  MODIFY `nim` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21400207;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Database: `db_perpus`
--
CREATE DATABASE IF NOT EXISTS `db_perpus` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_perpus`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expired_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `books`
--

INSERT INTO `books` (`id`, `cover`, `title`, `author`, `publisher`, `description`, `code`, `stock`, `category_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Judul Buku Fiksi', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 'AF123', 5, '1', NULL, NULL),
(2, NULL, 'Judul Buku Non Fiksi', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 'AF456', 5, '2', NULL, NULL),
(3, NULL, 'Judul Buku Fiksi', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 'AF789', 5, '1', '2023-12-12 18:24:14', NULL),
(4, NULL, 'Judul Buku Non Fiksi', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 'AF012', 5, '2', '2023-12-13 18:24:14', NULL),
(5, NULL, 'Judul Buku Fiksi', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 'AF785239', 5, '1', NULL, NULL),
(6, NULL, 'Judul Buku Non Fiksi', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 'AF05212', 5, '2', NULL, NULL),
(7, NULL, 'Judul Buku Fiksi', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 'AF78239', 5, '1', NULL, NULL),
(8, NULL, 'Judul Buku Non Fiksi', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 'AF01522', 5, '2', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'fiksi', NULL, NULL),
(2, 'non-fiksi', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2014_10_12_000000_create_users_table', 1),
(9, '2014_10_12_100000_create_password_resets_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(12, '2024_01_11_021008_create_books_table', 1),
(13, '2024_01_11_022457_create_categories_table', 1),
(14, '2024_01_11_141309_create_bookings_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `db_perpus1`
--
CREATE DATABASE IF NOT EXISTS `db_perpus1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_perpus1`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expired_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `book_id`, `code`, `status`, `alasan`, `created_at`, `updated_at`, `expired_at`) VALUES
(40, 1, 6, '406120424', 'Dikembalikan', 'z', '2024-04-12 05:34:15', '2024-04-21 23:39:39', '2024-04-14'),
(70, 2, 27, '7027220424', 'Dikembalikan', 'untuk belajar', '2024-04-21 23:56:43', '2024-04-21 23:57:03', '2024-04-24'),
(71, 2, 16, '7116220424', 'Diajukan', 'favorit aku', '2024-04-22 00:09:11', '2024-04-22 00:09:11', '2024-04-24'),
(73, 3, 6, '736220424', 'Diajukan', 'buku kesukaan', '2024-04-22 00:41:36', '2024-04-22 00:41:36', '2024-04-25'),
(74, 3, 16, '7416220424', 'Diajukan', 'favorit', '2024-04-22 00:47:26', '2024-04-22 00:47:26', '2024-04-29'),
(75, 2, 6, '756260424', 'Diajukan', 'suka', '2024-04-26 04:28:18', '2024-04-26 04:28:18', '2024-04-30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `author` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `books`
--

INSERT INTO `books` (`id`, `title`, `code`, `cover`, `author`, `publisher`, `description`, `category_id`, `stock`, `created_at`, `updated_at`) VALUES
(1, '1 Kos, 3 Cinta, 7 Keberuntungan', 'AF123', 'books-cover/CvFF6goqngNxy81drWG4RW6sF6WMvoDgv3sIUhQc.jpg', 'Astrid Tito', 'Gramedia Pustaka Utama', 'Novel 1 Kos, 3 Cinta, 7 Keberuntungan bercerita tentang sebuah kosan yang bentuknya tidak seperti kosan pada umumnya bernama kos 7.', 1, 0, '2023-12-11 18:24:14', '2024-04-11 20:58:07'),
(2, 'Di Lembah Sungai Nil', 'AF456', 'books-cover/YPKkSZkrz4dErkeowdXYNGSDGq3sM6uSE9gwcJeh.jpg', 'Hamka', 'Gema Insani', 'Tubuhnya badan binatang dan kepalanya manusia. Memang itulah hakikat manusia itu sendiri.', 2, 10, '2023-12-12 18:24:14', '2024-04-20 05:56:28'),
(3, 'Pemrograman Berorientasi Objek', 'AF789', 'books-cover/09vHQw1r8MOdyRihvNysOusI7JQ5WXYRQuoMvBtr.jpg', 'Patwiyanto', 'Bumi Aksara', 'Rekayasa Perangkat Lunak adalah satu bidang profesi yang mendalami cara-cara pengembangan perangkat lunak termasuk pembuatan, pemeliharaan.', 3, 5, '2023-12-12 18:24:14', '2024-04-21 11:20:50'),
(4, 'Manajemen Administrasi Perkantoran', 'AF012', 'books-cover/6aaPXC2UZUneykzvASjlTJNvwEYjSlicVs28A6d4.jpg', 'Ida Nuraida', 'Kanisius', 'Buku ini menyajikan berbagai informasi yang diperlukan dalam pengelolaan administrasi kantor', 4, 5, '2023-12-13 18:24:14', '2024-04-21 11:23:18'),
(5, 'SMK/MAK Kelas 12 Housekeeping', 'AF785239', 'books-cover/mb5TBdJSpvWNBYvOnqwGbvnvMl1kNjOg1wzzBxLc.jpg', 'Romi Setiawan', 'Bumi Aksara', 'Buku SMK/MAK Kelas 12 Housekeeping, Kompetensi Keahlian Perhotelan ini hadir sebagai penunjang pembelajaran untuk siswa kelas 12 SMK/MAK.', 5, 5, '2023-12-13 18:24:14', '2024-04-21 11:28:39'),
(6, 'City Lite: Requisition', 'AF789', 'books-cover/4DbdovKWcy7xeV6bkDBUhD5sxbhjslWldPp40Vq9.jpg', 'AYUNITA KURAISY', 'Elex Media Komputindo', 'Novel ini mengisahkan tentang hubungan Fanny dan Ryan yang bermula dari sebuah pertemuan bisnis biasa. Keduanya kemudian saling jatuh cinta.', 1, 5, '2023-12-12 18:24:14', '2024-04-22 00:39:46'),
(7, 'Perang Dunia II 1939–1945 : Konflik Besar Kedua yang Mengubah Dunia', 'AF012', 'books-cover/qpFa6j6f2oiRiqmwJjvIv43ICido8gXTvS53q4m4.jpg', 'Yonita Yulia Yalinda', 'Bumi Aksara', 'Perang Dunia II, konflik terbesar dan paling mematikan dalam sejarah umat manusia yang melibatkan lebih dari 50 negara.', 2, 5, '2023-12-13 18:24:14', '2024-04-21 11:35:54'),
(8, 'Rekayasa Perangkat Lunak Edisi Revisi', 'AF789', 'books-cover/SO0QvOqOoZ2c0g7VomMokI9KvKleRjPugkmI5EkD.jpg', 'Rosa A S & M Shalahuddin', 'Bumi Aksara', 'Rekayasa Perangkat Lunak Edisi Revisi', 3, 5, '2023-12-12 18:24:14', '2024-04-21 11:49:24'),
(9, 'Microsoft Excel 2021 Untuk Administrasi Perkantoran Modern', 'AF012', 'books-cover/vcihKiwkghEM5ZdVhnYYsv89YcypKTHDV5i7vfSe.jpg', 'andi', 'Penerbit Andi', 'Sebagai seorang tenaga administrasi perkantoran modern dituntut mempunyai keahlian khusus dalam menyusun berbagai laporan', 4, 5, '2023-12-13 18:24:14', '2024-04-21 11:43:41'),
(10, 'Food And Beverage, Kompetensi Keahlian Perhotelan', 'AF785239', 'books-cover/y788736kahfoP7ML1fBkD1FZsKSpyF7YOvDJzRkq.jpg', 'Madcomsono', 'gramed', 'Kompetensi Keahlian Perhotelan ini disusun dengan memperhatikan struktur Kurikulum SMK berdasarkan Kurikulum 2013 edisi revisi.', 5, 5, '2023-12-13 18:24:14', '2024-04-21 11:46:16'),
(11, 'Kado Terindah', 'AF785239', 'books-cover/tJJufdCvnbMj8q1Zu7HDfNV7snCEoXuiumVZSnar.png', 'J.S. Khairen', 'Gramedia Widiasarana Indonesia', 'Kado Terbaik berkisah tentang seorang laki-laki, Rizki, yang ditinggal ayahnya', 1, 10, '2023-12-13 18:24:14', '2024-04-16 23:11:58'),
(12, 'Sejarah Jawa Jilid 1 (History of Java)', 'AF05212', 'books-cover/zXLtIxvj6xvPhcRDao5InLQyl6vSzgXDkzviCPNq.jpg', 'Thomas Stamford Raffles', 'Anak Hebat Indonesia', 'sebuah karya monumental yang memberikan pandangan mendalam tentang sejarah, budaya, dan masyarakat Pulau Jawa. Raffles, yang menjabat sebagai Gubernur Jenderal Hindia Belanda', 2, 5, '2023-12-13 18:24:14', '2024-04-21 11:53:37'),
(13, 'Rekayasa Perangkat Lunak Berorientasi Objek Menggunakan PHP', 'AF789', 'books-cover/CXkY3HrdCTfFKk1Fq6Kue6nsUqsdpkzeki80pFU4.jpg', 'Andi Offset', 'gramed', 'untuk digunakan pada program studi Teknik Komputer, Ilmu Komputer, Teknik Elektro.', 3, 5, '2023-12-12 18:24:14', '2024-04-21 11:55:58'),
(14, 'Pengantar Administrasi Perkantoran Kelas 10', 'AF012', 'books-cover/muSnEs4j0FecXzUDQBUAfGJiqY2VD6N517bQw6h2.jpg', 'Fiki Puspitasari', 'gramed', 'Jurusan Administrasi Perkantoran akan mempelajari pengetahuan dan keterampilan yang kemudian dibutuhkan untuk menyelesaikan berbagai pekerjaan di suatu organisasi (perusahaan atau kantor).', 4, 5, '2023-12-13 18:24:14', '2024-04-21 12:13:24'),
(15, 'Industri Perhotelan, Kompetensi Keahlian Perhotelan', 'AF785239', 'books-cover/mRWrr5JWdy83b74tib8N0dMcwgZ4JuQIOrfCmffU.jpg', 'Umaryadi', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 5, 5, '2023-12-13 18:24:14', '2024-04-21 11:59:36'),
(16, 'Metropop: Saat-Saat Jauh', 'AF78239', 'books-cover/4QADLlRCXCKTb2LNixzk5aohCeqvxxkGJKUfNYgq.jpg', 'Lia Seplia', 'Gramedia Pustaka Utama', 'Novel “Saat-Saat Jauh” karangan Lia Seplia ini mengisahkan kisah cinta yang tak mudah antara Aline dan Alex.', 1, 5, '2023-12-13 18:24:14', '2024-04-21 12:02:43'),
(17, 'Hitam Putih Jawa Sunda', 'AF01522', 'books-cover/SDHBP6rgm5auMlf44FwlZRX1WXzSHAIJ3ghGTq12.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 2, 5, '2023-12-14 18:24:14', '2024-04-21 12:05:51'),
(18, 'Rekayasa Perangkat Lunak', 'AF789', 'books-cover/AuNGefXwgHst0ctCmgTFthYPs16uQyE8SSj3NVjH.jpg', 'Rosa A S & M Shalahuddin', 'Gramedia Pustaka Utama', 'Pada buku ini akan membahas tentang analisis dan desain sistem dengan disertai suatu studi kasus untuk memudahkan dalam pemahaman. Analisis dan desain sistem', 3, 5, '2023-12-12 18:24:14', '2024-04-21 12:08:02'),
(19, 'Microsoft Word Untuk Administrasi Perkantoran Modern Microsoft Office 2019', 'AF012', 'books-cover/sI6HCtVgHFPXvsRy9chfrDvR4vgDXosGcuKCw1xq.jpg', 'Sapardi Djoko Damono', 'Gramedia Pustaka Utama', 'Seorang tenaga administrasi perkantoran dituntut untuk mempunyai keahlian khusus di dalam menyusun beragam dokumen perkantoran.', 4, 5, '2023-12-13 18:24:14', '2024-04-21 12:10:28'),
(20, 'Front Office, Kompetensi Keahlian Perhotelan', 'AF785239', 'books-cover/ey307Y3rOPCJ709O78QP9wZK4Y30M5jdX170beXN.jpg', 'Romi Setiawan', 'Bumi Aksara', 'penunjang pembelajaran untuk siswa SMK/MAK kelas 12 untuk kompetensi keahlian perhotelan', 5, 5, '2023-12-13 18:24:14', '2024-04-21 12:12:11'),
(21, 'Dikta & Hukum', 'AF78239', 'books-cover/0nVJa9aWTClpuGde5dE0ZsRpCkFM0FRWxRbSA1S3.jpg', 'Dhia`an Farah', 'ASOKA AKSARA X LOVEABLE', 'merupakan sebuah karya fanfict dengan menjadikan orang nyata sebagai tokoh cerita seperti artis atau idol terkenal.', 1, 5, '2023-12-13 18:24:14', '2024-04-21 12:15:39'),
(22, 'Sejarah Peradaban Kuno', 'AF01522', 'books-cover/0uVfYgGjFiqm42XhJ76eZYWLo1v08vzomax1z6FS.jpg', 'Muammar Iqbal Ma’rief', 'Anak Hebat Indonesia', 'sebuah perjalanan melalui sejarah dunia kuno, membawa pembaca dari zaman prasejarah hingga puncak kejayaan Kekaisaran Romawi.', 2, 5, '2023-12-14 18:24:14', '2024-04-21 12:18:33'),
(23, 'Rekayasa Perangkat Lunak - Buku 1,', 'AF789', 'books-cover/LV4V4VxRhh1NF77LXCLHN2oG6xPkg5RJwDbjqznH.jpg', 'Roger S. Pressman, Ph.D.', 'Penerbit Andi', 'Pembahasan dalam buku ini:\r\nBab 1 : Perangkat lunak dan Rekayasa Perangkat Lunak\r\n\r\n\r\nBagian I Proses Perangkat Lunak\r\nBab 2 : Model-model Proses\r\nBab 3 : Pengembangan Cepat', 3, 5, '2023-12-12 18:24:14', '2024-04-21 12:20:57'),
(24, 'Administrasi & Operasional Perkantoran', 'AF012', 'books-cover/2bLOHyeKYEFuLXD9sKdAeGOsvEdktxfLzoyT5nGm.jpg', 'Umaryadi', 'Gramedia Widiasarana Indonesia', 'Administrasi & Operasional Perkantoran', 4, 5, '2023-12-13 18:24:14', '2024-04-21 12:22:51'),
(27, 'Buku Housekeeeping', 'AF012', 'books-cover/dOlpR15dOEXANacVU05Rp7wL6sWvdf3sMa9QXm9U.jpg', 'Nur Hidayat', 'Gramedia Pustaka Utama', 'buku ini direkomendasikan untuk siswa kelas X jurusan perhotelan', 1, 10, '2024-04-21 23:54:00', '2024-04-21 23:57:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'fiksi', NULL, NULL),
(2, 'non-fiksi', NULL, NULL),
(3, 'rpl', NULL, NULL),
(4, 'otkp', NULL, NULL),
(5, 'ph', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_26_133115_create_books_table', 1),
(6, '2023_11_26_133209_create_bookings_table', 1),
(7, '2023_11_26_133301_create_categories_table', 1),
(8, '2024_03_17_054824_create_roles_table', 1),
(9, '2024_04_18_050859_create_book_reviews_table', 2),
(10, '2024_04_18_071204_create_reviews_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'librrarian', NULL, NULL),
(3, 'user', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nis_nip` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 3,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `nis_nip`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', '123456789098765', NULL, '$2y$12$j/Ul7zsdmdQf4ZckONWFBeOfcJlrEw.LHk7EbcYQzPqM0Cq4I1z06', 1, NULL, NULL, NULL),
(2, 'Haikal', 'haikal ahmad ridha', 'haikal@gmail.com', '123456789058765', NULL, '$2y$12$fma2QTteVaMVbe/g7m9/qeM8H.Ubxj0Cd.WHnHt1bKB7rNv/ung8K', 3, NULL, NULL, '2024-03-20 20:32:41'),
(3, 'salwa aulia', 'salwa', 'salwa@gmail.com', '123456789092765', NULL, '$2y$12$/nf35R4gZKXYDej3N7Abl.ni2UBWpgNekfm6VoNaEwLPFBJu0pFZ6', 3, NULL, NULL, '2024-04-22 00:37:29'),
(6, 'sisin', 'sintia', 'sisin@gmail.com', '1111111111', NULL, '$2y$12$iKSWvJyRWpb6HMFWPNeFdeEFYeWFPXASloX.dXBOWLf8KygPda3IO', 2, NULL, '2024-04-02 21:28:18', '2024-04-21 23:32:56'),
(7, 'cecep', 'cecep', 'cep@gmail.com', '2222222222', NULL, '$2y$12$kqhNnF.o7LE4V3ZTjatgt.5gFbwk7RhNXS4Y6KKnH1Wza8Diq1ORq', 3, NULL, '2024-04-02 21:46:11', '2024-04-02 21:46:11');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_book_id_foreign` (`book_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_nis_nip_unique` (`nis_nip`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT untuk tabel `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `db_perpus2`
--
CREATE DATABASE IF NOT EXISTS `db_perpus2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_perpus2`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expired_at` date DEFAULT NULL,
  `denda` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `book_id`, `code`, `status`, `alasan`, `created_at`, `updated_at`, `expired_at`, `denda`) VALUES
(6, 2, 1, '61010424', 'Diajukan', 'ccc', '2024-03-31 23:11:46', '2024-03-31 23:11:46', '2024-04-03', NULL),
(7, 2, 1, '71010424', 'Diajukan', 'aaaa', '2024-03-31 23:12:13', '2024-03-31 23:12:13', '2024-04-03', NULL),
(8, 2, 1, '81010424', 'Diajukan', 'ccccc', '2024-03-31 23:12:55', '2024-03-31 23:12:55', '2024-04-01', NULL),
(9, 2, 1, '91040424', 'Diajukan', 'sss', '2024-04-03 21:11:54', '2024-04-03 21:11:54', '2024-04-05', NULL),
(10, 2, 3, '103040424', 'Diajukan', 'ggg', '2024-04-03 21:12:41', '2024-04-03 21:12:41', '2024-04-06', NULL),
(11, 2, 1, '111040424', 'Diajukan', 'hhh', '2024-04-03 21:27:17', '2024-04-03 21:27:17', '2024-04-11', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `author` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `books`
--

INSERT INTO `books` (`id`, `title`, `code`, `cover`, `author`, `publisher`, `description`, `category_id`, `stock`, `created_at`, `updated_at`) VALUES
(1, 'Judul Buku1 Kos, 3 Cinta, 7 Keberuntungan', 'AF123', 'books-cover/BEznTdefedzltvwGCfthh6bpdHOWNUD6XM9jAB5S.jpg', 'Astrid Tito', 'Gramedia Pustaka Utama', 'bercerita tentang sebuah kosan yang bentuknya tidak seperti kosan pada umumnya bernama kos 7. Kos 7 ini seperti apartemen, elite, mewah, elegan, dan komplit dengan semua fasilitasnya', 1, 3, '2023-12-11 18:24:14', '2024-02-27 18:57:31'),
(2, 'Sejarah Islam di Jawa', 'AF456', 'books-cover/ThioD1UQLT5qgPHgWqZyx112ihZd1RdrEsr7OZXP.jpg', 'Kamil Hamid Baidawi', 'Araska Publisher', 'Sebuah makam menjadi bukti awal masuknya Islam di Jawa. Makam tersebut ditemukan atas nama Maimun pada tahun 1082 M. Lokasi makam adalah di Desa Leran, Kecamatan Manyar, Gresik. Nama Leran atau Liran tersebut adalah nama sebuah tempat di Persia.', 2, 5, '2023-12-12 18:24:14', '2024-02-15 12:57:10'),
(3, 'Judul Buku RPL', 'AF789', 'books-cover/chFUumr9ljmvn1kDeBMB2diEmR6O8ZsITJVtn4UI.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 3, 5, '2023-12-12 18:24:14', '2024-02-19 09:03:50'),
(4, 'Judul Buku OTKP', 'AF012', 'books-cover/TK03mEhvbYZKfwFgyLyhrvFwj1JafXmiwlX2LJoE.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 4, 5, '2023-12-13 18:24:14', '2024-02-19 15:06:32'),
(5, 'Judul Buku PH', 'AF785239', 'books-cover/4kFfJsBmLjCEO4iY6uc4UrhHqnAmyreoFBNncGiH.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 5, 5, '2023-12-13 18:24:14', '2024-02-19 15:11:01'),
(6, 'Kado Terbaik', 'AF789', 'books-cover/j7woM5agXTms0JBpVXhfI4rRBsEsZRgDYAryJPLI.jpg', 'J.S. Khairen', 'Gramedia Widiasarana Indonesia', 'Berkisah tentang seorang laki-laki, Rizki, yang ditinggal ayahnya yang meninggal karena tertembak dan dibuang ibunya di panti asuhan ilegal.', 1, 4, '2023-12-12 18:24:14', '2024-02-27 21:20:04'),
(7, 'Kronologi Sejarah Islam & Dunia', 'AF012', 'books-cover/eKiW4qOvJOLwRfVrjGp5ESHEg5ugqJqDlErsFUPo.jpg', 'Fedrian Hasmand', 'Pustaka Al-Kautsar', 'Buku Kronologi Sejarah Islam & Dunia ini menyediakan berbagai informasi yang ingin Anda ketahui mengenai sejarah Islam dan Dunia dengan cakupan yang lebih luas dan lengkap,', 2, 5, '2023-12-13 18:24:14', '2024-02-15 13:03:12'),
(8, 'Judul Buku RPL', 'AF789', 'books-cover/m74YkrDJ1dERZBLveOjWIars9sFqRRXjqOtEsYk1.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 3, 5, '2023-12-12 18:24:14', '2024-02-19 09:04:23'),
(9, 'Judul Buku OTKP', 'AF012', 'books-cover/yLsgWhRZjQmCXBYQ7obGBfk1FUNUL6zeIVd5me4j.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 4, 5, '2023-12-13 18:24:14', '2024-02-19 15:06:59'),
(10, 'Judul Buku PH', 'AF785239', 'books-cover/Nv9xrhIT3R0KU9L6vJLJ5ZpWZpacJz0KPBYFdf7C.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 5, 5, '2023-12-13 18:24:14', '2024-02-19 15:11:15'),
(11, 'City Lite: Requisition', 'AF785239', 'books-cover/4ybItMUtYYQSjYLo9hV0jZTeBx2DAiy2kyVV7OWC.jpg', 'AYUNITA KURAISY', 'Elex Media Komputindo', 'Novel ini mengisahkan tentang hubungan Fanny dan Ryan yang bermula dari sebuah pertemuan bisnis biasa.', 1, 5, '2023-12-13 18:24:14', '2024-02-15 14:13:42'),
(12, 'Ensiklopedi Sejarah Islam', 'AF05212', 'books-cover/Rd5gkEM6DpamCTCt17nSDQxzAicgru7Nn3UiD2m0.jpg', 'Dr Raghib As-Sirjani', 'Pustaka Al-Kautsar', 'Sejarah adalah cermin masa lalu. Sejarah juga pelajaran bagi orang-orang yang datang kemudian.', 2, 5, '2023-12-13 18:24:14', '2024-02-15 13:05:31'),
(13, 'Judul Buku RPL', 'AF789', 'books-cover/qlX4kR7SP7exfBkfgygY5rnTPnIHllg6sH86neo0.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 3, 5, '2023-12-12 18:24:14', '2024-02-19 09:04:37'),
(14, 'Judul Buku OTKP', 'AF012', 'books-cover/RndTE9n2WZRmFNjPJL4NRl3c6vgM8w2SPngiUyOY.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 4, 5, '2023-12-13 18:24:14', '2024-02-19 15:07:41'),
(15, 'Judul Buku PH', 'AF785239', 'books-cover/BCZIMok7F7g1xox7GP26CfqT2DLKysII8YoX6w2u.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 5, 5, '2023-12-13 18:24:14', '2024-02-19 15:11:32'),
(16, 'MetroPop: Mismatch', 'AF78239', 'books-cover/fSj5nya2mS3CUchYvmY0qMYz8spiaXFO771tL0gf.jpg', 'Arata Kim', 'Gramedia Pustaka Utama', 'Selama belasan tahun bersahabat, Kenizia selalu menganggap Giovanni sebagai pria bawel yang bisa diandalkan.', 1, 5, '2023-12-13 18:24:14', '2024-03-06 21:23:44'),
(17, 'Buku Pintar Sejarah Islam', 'AF01522', 'books-cover/iuIHMy3wY7vQ8RFzAPsc0HOLosV15JoTZtonQpJ9.jpg', 'Qasim A. Ibrahim dan Muhammad A. Saleh', 'zaman', 'Buku ini memaparkan sejarah Islam dan menjelaskannya dari sudut pandang Islam: sejak masa Nabi Muhammad, Khalifah Empat, Dinasti Umayah, Dinasti Abbasiyah, hingga masa kini;', 2, 5, '2023-12-14 18:24:14', '2024-02-15 13:07:53'),
(18, 'Judul Buku RPL', 'AF789', 'books-cover/yADnxadT5kehvpeahJtTDAQevn38zPPKdPoM87d6.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 3, 5, '2023-12-12 18:24:14', '2024-02-19 09:05:01'),
(19, 'Judul Buku OTKP', 'AF012', 'books-cover/NThi74EwiwH7THTHzWwS7qYCfY9GN5ap4Y00qr4A.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 4, 5, '2023-12-13 18:24:14', '2024-02-19 15:08:08'),
(20, 'Judul Buku PH', 'AF785239', 'books-cover/s9Vc7PLdsrr4TJ1w2gJzScS9oaiObDb9cX8K3slc.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 5, 5, '2023-12-13 18:24:14', '2024-02-19 15:11:48'),
(21, 'Saat Saat Jauh', '21212', 'books-cover/7PGN7eaIobfTZfol8wotNOv1T68AxDaoOTjgFPkw.jpg', 'Lia Seplia', 'Gramedia Pustaka Utama', 'Novel “Saat-Saat Jauh” karangan Lia Seplia ini mengisahkan kisah cinta yang tak mudah antara Aline dan Alex.', 1, 5, '2024-02-06 19:48:37', '2024-02-15 14:52:37'),
(22, 'Sejarah Peradaban Islam', '21213', 'books-cover/dqPPxcogupHufyuBTGDdspa793ITsoaZYmdxUqQ6.jpg', 'Prof. Dr. H. Syamruddin Nasution, M.Ag.', 'RajaGrafindo Persada', 'Islam adalah agama yang punya banyak sejarah panjang sejak awal kehadirannya. Agama yang disampaikan oleh Allah Swt. kepada manusia melalui Rasul-Nya Nabi Muhammad Saw', 2, 5, '2024-02-06 19:49:26', '2024-02-15 13:10:42'),
(23, 'PKK', '11311', 'books-cover/s4bSDXK4z23Bvu4JCsk5TSg9JkkOe0S0Tot95xTQ.webp', 'Ubudiyah Setiawati, S.Sos., M.I.Kom.,', 'Ensiklopedia', 'PKK CODING', 3, 5, '2024-02-06 21:18:47', '2024-02-19 09:05:41'),
(24, 'NULIS SURAT', '21312', 'books-cover/8RXCqYI644D58Bh6V9mDyPn6XfUeTCQ4NN6LJNGT.jpg', 'Nur Hidayat', 'Bhuana Ilmu Populer', 'ASIK NULIS SURAT', 4, 5, '2024-02-06 21:20:59', '2024-02-19 15:08:38'),
(25, 'LIPET KASUR', '21412', 'books-cover/2OeWiiwKtqlG7Cbmuk6ywUCGzbhtOmUFxopF1TTu.jpg', 'Daniapus', 'Ensiklopedia', 'BEBERES YANG BENAR', 5, 4, '2024-02-06 21:22:00', '2024-02-19 15:12:32'),
(26, 'Hujan Bulan Juni: Sepilihan Sajak', 'AF123', 'books-cover/rP9SY7rSrhm8BNQy0EA4uBoCoYB6st66Manj9gPH.jpg', 'Sapardi Djoko Damono', 'Gramedia Pustaka Utama', 'Adalah buku berisi kumpulan sajak karya sastrawan terkenal, Sapardi Djoko Damono, yang diterbitkan oleh Gramedia Pustaka Utama', 1, 5, '2023-12-11 18:24:14', '2024-02-15 14:55:15'),
(27, 'Filsafat [di] Indonesia Manusia dan Budaya', 'AF456', 'books-cover/LzWtuoY1T7X2c0LbcZ4w5i16VBbesVTG11MaKWMo.jpg', 'A.setyo Wibowo', 'Penerbit Buku Kompas', 'Manusia dan Budaya merupakan ruang untuk upaya menggali serta mengenali adakah corak berpikir yang khas manusia Indonesia dan tertuang ke dalam butir-butir filosofis', 2, 5, '2023-12-12 18:24:14', '2024-02-15 13:20:40'),
(28, 'Judul Buku RPL', 'AF789', 'books-cover/KS87RrYSzLkt2llCG0Dz7IihWgMe5rAzKCYufS49.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 3, 5, '2023-12-12 18:24:14', '2024-02-19 09:06:06'),
(29, 'Judul Buku OTKP', 'AF012', 'books-cover/jP4HTjl79uR8hX95OP30yI099vn3KhQ5pis3S70G.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 4, 5, '2023-12-13 18:24:14', '2024-02-19 15:09:00'),
(30, 'Judul Buku PH', 'AF785239', 'books-cover/nDjfz7zGt6eXU8uFXnpqnMeBstIogMMgdKiMfmQ7.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 5, 5, '2023-12-13 18:24:14', '2024-02-19 15:12:55'),
(31, 'Metropop: Resign!', 'AF789', 'books-cover/JG1jChAkVNZa3pReQIGcvLm8ubQXzTrkV3fq37kE.jpg', 'Almira Bastari', 'Gramedia Pustaka Utama', 'Aku Minar. Ini cerita cinta versi aku dan Sahat (dan... Mamak Mertua). Seru. Ngeselin. Gemesin. Sekaligus sangat menantang.', 1, 5, '2023-12-12 18:24:14', '2024-02-15 14:57:00'),
(32, 'Membangun Nasionalisme Melalui Bahasa dan Budaya', 'AF012', 'books-cover/TtCqWzKdM8lYX1zyt8HGV8jz4JkgzveXm2EAeRwN.jpg', 'Abdul Rahman Patji', 'Pbk', 'Kontak-kontak kebudayaan dalam lintasan geohistoris sebelumnya telah memungkinkan adanya bangunan kesepahaman bersama pentingnya pembentukan negara bangsa.', 2, 5, '2023-12-13 18:24:14', '2024-02-15 13:22:12'),
(33, 'Judul Buku RPL', 'AF789', 'books-cover/A9lHb5dnT5BVi8PaTsvYRHTLBORdJSZXNrXZQLLR.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 3, 5, '2023-12-12 18:24:14', '2024-02-19 09:07:52'),
(34, 'Judul Buku OTKP', 'AF012', 'books-cover/RPPvZoDSuvxGpxe5QXIzRcjNLTvL9ravaBYTOfiR.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 4, 5, '2023-12-13 18:24:14', '2024-02-19 15:09:24'),
(35, 'Judul Buku PH', 'AF785239', 'books-cover/v5qYUrAF0xJN47jEqYEFfyZcmjnD9QNkeNwVMiCg.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 5, 5, '2023-12-13 18:24:14', '2024-02-19 15:13:17'),
(36, 'Claires', 'AF785239', 'books-cover/Nvc52ZaiRBjn0Xu17Wf0YvMIfV1YWXm1AbhXWrYp.jpg', 'Valerie Patkar', 'Bhuana Ilmu Populer', 'Claire tidak pernah tahu pertemuan singkatnya dengan seorang pria tampan yang tinggi dan berkulit putih itu akan berujung pada perang perasaan dengan hatinya sendiri.', 1, 5, '2023-12-13 18:24:14', '2024-02-15 14:58:21'),
(37, 'Ilmu Sosial dan Budaya Dasar', 'AF05212', 'books-cover/LKvRm4Ft3k1ssTT8LTga9VH4Tcua89lBSNED3oTM.jpg', 'Prof. Dr. Rusmin Tumanggor, M.A.; Kholis Ridlo, S.Ag., M.Si.', 'Prenada Media', 'buku ini didesain dan dideskripsikan mengacu pada Keputusan Menteri Pendidikan Nasional Nomor 232/U/2000', 2, 5, '2023-12-13 18:24:14', '2024-02-15 13:23:47'),
(38, 'Judul Buku RPL', 'AF789', 'books-cover/UDU1sPlf8yl92wiCRhyNr2Tg0jdWSNcT7CTC1Qb2.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 3, 5, '2023-12-12 18:24:14', '2024-02-19 09:13:53'),
(39, 'Judul Buku OTKP', 'AF012', 'books-cover/9m6OKBB0gBrCr5rvPJ1j359oylVyUD2a3TSvGc4f.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 4, 5, '2023-12-13 18:24:14', '2024-02-19 15:09:44'),
(40, 'Judul Buku PH', 'AF785239', 'books-cover/S5DcwIzcUTrnKicjnfFWUBnkzWnEhitQTgEkV4cV.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 5, 5, '2023-12-13 18:24:14', '2024-02-19 15:14:13'),
(41, 'Dikta & Hukum', 'AF78239', 'books-cover/H2RynuCJTeehFaSJ0KvznOnwP8a6K77BVI5MbUp9.jpg', 'DHIA`AN FARAH', 'ASOKA AKSARA X LOVEABLE', 'Novel Dikta & Hukum merupakan sebuah karya fanfict dengan menjadikan orang nyata sebagai tokoh cerita seperti artis atau idol terkenal', 1, 5, '2023-12-13 18:24:14', '2024-02-15 15:00:04'),
(42, 'Arbitrase Komersial Internasional', 'AF01522', 'books-cover/hW44XlHsaSSzuSNnFluONKRKMWYpfOAXFtsNth6L.jpg', 'Cut Memi', 'Sinar Grafika', 'Buku ini membahas dari sudut pandang praktik (law in action) tentang penerapan klausul arbitrase komersial internasional dalam putusan pengadilan negeri di Indonesia.', 2, 5, '2023-12-14 18:24:14', '2024-02-15 13:25:22'),
(43, 'Judul Buku RPL', 'AF789', 'books-cover/15PrgMUlMw2EgmGk5hO2lw3MIKrQfw59K06wa6HP.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 3, 5, '2023-12-12 18:24:14', '2024-02-19 09:15:15'),
(44, 'Judul Buku OTKP', 'AF012', 'books-cover/N6Ed6blaVtb1Y6akRe9DpwQ84MY65AVdsKOB02rQ.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 4, 5, '2023-12-13 18:24:14', '2024-02-19 15:10:02'),
(45, 'Judul Buku PH', 'AF785239', 'books-cover/MgIDDvY4f3izJMTYeYtfdMXguJILaVA6A0LqiCX2.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 5, 5, '2023-12-13 18:24:14', '2024-02-19 15:14:28'),
(46, 'Winter in Tokyo', 'AF78239', 'books-cover/SWElD9wsGKkSVjS8gncKy897tfUxBFImsWLpzb2a.jpg', 'Ilana Tan', 'Gramedia Pustaka Utama', 'menyajikan kisah cinta yang indah namun juga menyayat hati antara Ishida Keiko, gadis blasteran Indonesia - Jepang, dengan Nishimura Kazuto.', 1, 5, '2023-12-13 18:24:14', '2024-02-19 23:31:23'),
(47, 'Hukum Dagang Internasional', 'AF01522', 'books-cover/lZMT13kFNMqzn0sJch2nONN0mKPVxI5gTXvvAmM2.jpg', 'Dr. Muhammad Reza Syariffudin Zaki, S.H., M.A.', 'Prenadamedia Group', 'Buku ini sangat komprehensif menjelaskan tidak hanya tentang hukum perdagangan internasional, namun kita juga diberikan pemahaman tentang cabang-cabang hukum', 2, 5, '2023-12-14 18:24:14', '2024-02-15 13:26:53'),
(48, 'Judul Buku RPL', 'AF789', 'books-cover/R3ntbiKqoEeA9Nxb1lF5Luu3Nu4daoH1VQIMROMK.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 3, 5, '2023-12-12 18:24:14', '2024-02-19 09:14:13'),
(49, 'Judul Buku OTKP', 'AF012', 'books-cover/mUyoHRAzcxe9PtOy9SBfntK373eQiRXTskEfxRJZ.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 4, 5, '2023-12-13 18:24:14', '2024-02-19 15:10:19'),
(50, 'Judul Buku PH', 'AF785239', 'books-cover/YvD5MNOYT2oBGwHU0kkniU6qzagDVeG64XrZ33rD.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 5, 5, '2023-12-13 18:24:14', '2024-02-19 15:14:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `borrowings`
--

CREATE TABLE `borrowings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `borrowed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'fiksi', NULL, NULL),
(2, 'non-fiksi', NULL, NULL),
(3, 'rpl', NULL, NULL),
(4, 'otkp', NULL, NULL),
(5, 'ph', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2014_10_12_000000_create_users_table', 1),
(9, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(12, '2023_11_26_133115_create_books_table', 1),
(13, '2023_11_26_133209_create_bookings_table', 1),
(14, '2023_11_26_133301_create_categories_table', 1),
(15, '2024_03_21_071556_add_denda_colum_to_bookings_table', 2),
(16, '2024_04_04_035047_create_borrowings_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nis_nip` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `nis_nip`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', '123456789098765', NULL, '$2y$12$SgbPBkLG8co2SRJPh706LOzw7Aa/Ipmj9WEZ7vHpom.hcOiMOUv.i', 'admin', NULL, NULL, NULL),
(2, 'fattah rizqi', 'fattah', 'fattah@gmail.com', '123456789058765', NULL, '$2y$12$yRG3kW22BIdC5/YjXb/UmukhhWI53gx/K5b8MJAjsIMtxyZAzNsaC', 'user', NULL, NULL, NULL),
(3, 'librarian', 'librarian', 'librarian@gmail.com', '123456789092765', NULL, '$2y$12$eaqrhaqJodWQmR8c2nb2DeAujhreii.0Ij8xQdNHsjXo1RGEDHYIe', 'librarian', NULL, NULL, NULL),
(4, 'Haikal', 'yourkall', 'haikalaja@gmail.com', '77777777777', NULL, '$2y$12$v.MiuHCVuMgkccscg2geju9EsXQbXNPu.WAhpSmqDTcY7QjZAQnV.', 'user', NULL, '2024-02-15 20:02:01', '2024-02-15 20:02:01'),
(9, 'sisin', 'sintia', 'sisin@gmail.com', '1111111111', NULL, '$2y$12$GZmVG5zrAEm/DS7PR6cYuOW948Bzmjnf0gJL7.hfQAeh54BvOyFCe', 'user', NULL, '2024-04-03 21:43:50', '2024-04-03 21:43:50'),
(10, 'maman', 'maman', 'man@gmail.com', '2222222222', NULL, '$2y$12$5q2hpnGhP0TaFhoqF2HrreYG2lpcl5PE9l3t2qluMM61QVDVYXpAC', 'user', NULL, '2024-04-03 21:54:14', '2024-04-03 21:54:14');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `borrowings`
--
ALTER TABLE `borrowings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_nis_nip_unique` (`nis_nip`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `borrowings`
--
ALTER TABLE `borrowings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Database: `db_perpustakan`
--
CREATE DATABASE IF NOT EXISTS `db_perpustakan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_perpustakan`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `nis_nip` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'admin',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expired_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `author` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `books`
--

INSERT INTO `books` (`id`, `title`, `code`, `cover`, `author`, `publisher`, `description`, `category_id`, `stock`, `created_at`, `updated_at`) VALUES
(95, 'Judul Buku Fiksi', 'AF123', 'books-cover/g068mUsT43ABSmWAzzLPuavbIa4kFvjVPuNIjUzm.png', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 1, 5, '2023-12-11 18:24:14', '2024-02-06 01:22:16'),
(96, 'Judul Buku Non Fiksi', 'AF456', 'books-cover/yFWWkLZTn5YusV5NHIK9eJD26NdhDBmTlxSxvUVO.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 2, 5, '2023-12-12 18:24:14', '2024-02-06 01:22:29'),
(97, 'Judul Buku Fiksi', 'AF789', 'books-cover/O7NNmxORyiQwk4awo39IMJbiF8ttQsXUn0IEwsTW.jpg', 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 3, 5, '2023-12-12 18:24:14', '2024-02-06 01:22:43'),
(98, 'Judul Buku Non Fiksi', 'AF012', NULL, 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 4, 5, '2023-12-13 18:24:14', NULL),
(99, 'Judul Buku Fiksi', 'AF785239', NULL, 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 5, 5, '2023-12-13 18:24:14', NULL),
(100, 'Judul Buku Fiksi', 'AF123', NULL, 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 1, 5, '2023-12-11 18:24:14', NULL),
(101, 'Judul Buku Non Fiksi', 'AF456', NULL, 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 2, 5, '2023-12-12 18:24:14', NULL),
(102, 'Judul Buku Fiksi', 'AF789', NULL, 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 3, 5, '2023-12-12 18:24:14', NULL),
(103, 'Judul Buku Non Fiksi', 'AF012', NULL, 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 4, 5, '2023-12-13 18:24:14', NULL),
(104, 'Judul Buku Fiksi', 'AF785239', NULL, 'jono', 'gramed', 'ini desckripsi penting dari buku dengan judul (judul buku)...', 5, 5, '2023-12-13 18:24:14', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'novel', NULL, NULL),
(2, 'komik', NULL, NULL),
(3, 'Rekayasa Perangkat Lunak', NULL, NULL),
(4, 'Perkantoran', NULL, NULL),
(5, 'Perhotelan', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(40, '2014_10_12_000000_create_users_table', 1),
(41, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(42, '2019_08_19_000000_create_failed_jobs_table', 1),
(43, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(44, '2023_11_26_133115_create_books_table', 1),
(45, '2023_11_26_133209_create_bookings_table', 1),
(46, '2023_11_26_133301_create_categories_table', 1),
(47, '2024_02_04_172317_admins_migration', 1),
(48, '2024_02_04_174850_perpustakawans_migration', 1),
(49, '2024_03_17_042900_create_role_table', 2),
(50, '2024_03_17_043902_add_role_id_colum_to_users_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `perpustakawans`
--

CREATE TABLE `perpustakawans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `nis_nip` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'perpustakawan',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'librrarian', NULL, NULL),
(3, 'user', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nis_nip` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `nis_nip`, `email_verified_at`, `password`, `role_id`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', '123456789098765', NULL, '$2y$12$C5CB04fJ1J9NhY20KllSm.JloUcs79JB0KOjoOAPdQ1U9xPezWnWu', NULL, 'admin', NULL, NULL, NULL),
(2, 'fattah rizqi', 'fattah', 'fattah@gmail.com', '123456789058765', NULL, '$2y$12$cT3z6nWPmX9jua7FTy1K4.Q5VaZPQD8NLxJrXTZctJmGnQKo5mo4S', NULL, 'user', NULL, NULL, NULL),
(3, 'librarian', 'librarian', 'librarian@gmail.com', '123456789092765', NULL, '$2y$12$KzWbhH0IuK7fHsqKwxCERuHMG7kd3SPRf2xKSjr1GQg/GU0SKeYoy', NULL, 'librarian', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_nis_nip_unique` (`nis_nip`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indeks untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `perpustakawans`
--
ALTER TABLE `perpustakawans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `perpustakawans_username_unique` (`username`),
  ADD UNIQUE KEY `perpustakawans_nis_nip_unique` (`nis_nip`),
  ADD UNIQUE KEY `perpustakawans_email_unique` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_nis_nip_unique` (`nis_nip`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `perpustakawans`
--
ALTER TABLE `perpustakawans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
--
-- Database: `db_rental`
--
CREATE DATABASE IF NOT EXISTS `db_rental` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_rental`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2018-03-28 23:34:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `booking`
--

CREATE TABLE `booking` (
  `kode_booking` varchar(8) NOT NULL,
  `id_mobil` int(11) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `durasi` int(11) NOT NULL,
  `driver` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pickup` varchar(30) NOT NULL,
  `tgl_booking` date NOT NULL,
  `bukti_bayar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `booking`
--

INSERT INTO `booking` (`kode_booking`, `id_mobil`, `tgl_mulai`, `tgl_selesai`, `durasi`, `driver`, `status`, `email`, `pickup`, `tgl_booking`, `bukti_bayar`) VALUES
('TRX00000', 11, '2022-09-08', '2022-09-09', 2, 900000, 'Sudah Dibayar', 'yusuf@gmail.com', 'Ambil Sendiri', '2022-09-07', '02042024094221Gambar2.png'),
('TRX00001', 8, '2019-05-26', '2019-05-26', 1, 200000, 'Sudah Dibayar', 'test@gmail.com', 'Pickup Sesuai Alamat', '2019-05-25', '2505201920111034788684_10209405168685237_8233778212845387776_n.JPEG'),
('TRX00002', 9, '2019-05-26', '2019-05-27', 2, 0, 'Menunggu Pembayaran', 'rizalit2@gmail.com', 'Ambil Sendiri', '2019-05-25', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cek_booking`
--

CREATE TABLE `cek_booking` (
  `kode_booking` varchar(8) NOT NULL,
  `id_mobil` int(11) NOT NULL,
  `tgl_booking` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `cek_booking`
--

INSERT INTO `cek_booking` (`kode_booking`, `id_mobil`, `tgl_booking`, `status`) VALUES
('TRX00001', 8, '2019-05-26', 'Sudah Dibayar'),
('TRX00002', 9, '2019-05-26', 'Menunggu Pembayaran'),
('TRX00002', 9, '2019-05-27', 'Menunggu Pembayaran'),
('TRX00000', 11, '2022-09-08', 'Sudah Dibayar'),
('TRX00000', 11, '2022-09-09', 'Sudah Dibayar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `contactus`
--

CREATE TABLE `contactus` (
  `id_cu` int(11) NOT NULL,
  `nama_visit` varchar(100) DEFAULT NULL,
  `email_visit` varchar(120) DEFAULT NULL,
  `telp_visit` char(16) DEFAULT NULL,
  `pesan` longtext DEFAULT NULL,
  `tgl_posting` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `contactus`
--

INSERT INTO `contactus` (`id_cu`, `nama_visit`, `email_visit`, `telp_visit`, `pesan`, `tgl_posting`, `status`) VALUES
(1, 'Anuj Kumar', 'webhostingamigo@gmail.com', '2147483647', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', '2017-06-18 10:03:07', 1),
(2, 'kjk', 'jlkl@gmail.com', '98989898', 'kjlkjkljklj', '2018-03-06 14:01:39', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `contactusinfo`
--

CREATE TABLE `contactusinfo` (
  `id_info` int(11) NOT NULL,
  `alamat_kami` tinytext DEFAULT NULL,
  `email_kami` varchar(255) DEFAULT NULL,
  `telp_kami` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `contactusinfo`
--

INSERT INTO `contactusinfo` (`id_info`, `alamat_kami`, `email_kami`, `telp_kami`) VALUES
(1, 'Rental Mobil \r\nJl. Kemanggisan Raya No.19, RT.4/RW.13, Kemanggisan, Kec. Palmerah, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11480\r\n', 'rentalmobil@gmail.com', '08585233222');

-- --------------------------------------------------------

--
-- Struktur dari tabel `merek`
--

CREATE TABLE `merek` (
  `id_merek` int(11) NOT NULL,
  `nama_merek` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `merek`
--

INSERT INTO `merek` (`id_merek`, `nama_merek`, `CreationDate`, `UpdationDate`) VALUES
(14, 'Honda', '2019-06-07 18:05:23', NULL),
(15, 'MercedesBenz', '2019-06-07 18:29:46', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mobil`
--

CREATE TABLE `mobil` (
  `id_mobil` int(11) NOT NULL,
  `nama_mobil` varchar(150) DEFAULT NULL,
  `id_merek` int(11) DEFAULT NULL,
  `nopol` varchar(20) NOT NULL,
  `deskripsi` longtext DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `bb` varchar(100) DEFAULT NULL,
  `tahun` int(6) DEFAULT NULL,
  `seating` int(11) DEFAULT NULL,
  `image1` varchar(120) DEFAULT NULL,
  `image2` varchar(120) DEFAULT NULL,
  `image3` varchar(120) DEFAULT NULL,
  `image4` varchar(120) DEFAULT NULL,
  `image5` varchar(120) DEFAULT NULL,
  `AirConditioner` int(11) DEFAULT NULL,
  `PowerDoorLocks` int(11) DEFAULT NULL,
  `AntiLockBrakingSystem` int(11) DEFAULT NULL,
  `BrakeAssist` int(11) DEFAULT NULL,
  `PowerSteering` int(11) DEFAULT NULL,
  `DriverAirbag` int(11) DEFAULT NULL,
  `PassengerAirbag` int(11) DEFAULT NULL,
  `PowerWindows` int(11) DEFAULT NULL,
  `CDPlayer` int(11) DEFAULT NULL,
  `CentralLocking` int(11) DEFAULT NULL,
  `CrashSensor` int(11) DEFAULT NULL,
  `LeatherSeats` int(11) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `mobil`
--

INSERT INTO `mobil` (`id_mobil`, `nama_mobil`, `id_merek`, `nopol`, `deskripsi`, `harga`, `bb`, `tahun`, `seating`, `image1`, `image2`, `image3`, `image4`, `image5`, `AirConditioner`, `PowerDoorLocks`, `AntiLockBrakingSystem`, `BrakeAssist`, `PowerSteering`, `DriverAirbag`, `PassengerAirbag`, `PowerWindows`, `CDPlayer`, `CentralLocking`, `CrashSensor`, `LeatherSeats`, `RegDate`, `UpdationDate`) VALUES
(10, 'hondafreed', 14, 'B 7730 NSP', 'Honda Freed 1500 cc transmision automatic seating capacity 6', 450000, 'Bensin', 2012, 6, 'Honda-Freed-front.jpg', 'Honda-Freed-front.jpg', 'Honda-Freed-Interior.jpg', 'Honda-Freed-front.jpg', 'Honda-Freed-Interior.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2019-06-07 18:09:49', '2019-06-07 18:19:29'),
(11, 'HondaCrv', 14, 'B 9990 RXY', 'Honda CRV Tahun 2011', 1000000, 'Bensin', 2011, 5, 'Honda-CRV-2011-Front.jpg', 'Honda-CRV-2011-Rear.jpg', 'Honda-CRV-2011-Interior.jpg', 'Honda-CRV-2011-Rear.jpg', 'Honda-CRV-2011-Front.jpg', 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, '2019-06-07 18:27:37', NULL),
(12, 'MercedesBenzC', 15, 'B 56789 OPX', 'Mercedes Benz C Class 1800 CC', 1850000, 'Bensin', 2012, 5, 'Merci-Cclass-service1.jpg', 'Merci-Cclass-service2.jpg', 'Merci-Cclass-service3.jpg', 'Merci-Cclass-service3.jpg', 'Merci-Cclass-service1.jpg', 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2019-06-07 18:32:21', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(1, 'Terms and Conditions', 'terms', '																						<h2><font size=\"3\"><span class=\"purple\">Syarat</span> Ketentuan Penyewaan Mobil</font></h2><div><h4>\r\n	<span data-scayt_word=\"Persyaratan\" data-scaytid=\"1\">Persyaratan</span> Rental Mobil <span data-scayt_word=\"untuk\" data-scaytid=\"2\">untuk</span> <span data-scayt_word=\"Perusahaan\" data-scaytid=\"3\">Perusahaan</span></h4>\r\n<ul><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"4\">Fotokopi</span> <span data-scayt_word=\"SIUP\" data-scaytid=\"7\">SIUP</span> <span data-scayt_word=\"dan\" data-scaytid=\"8\">dan</span> <span data-scayt_word=\"NPWP\" data-scaytid=\"9\">NPWP</span>.</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"5\">Fotokopi</span> <span data-scayt_word=\"akte\" data-scaytid=\"10\">akte</span> <span data-scayt_word=\"pendirian\" data-scaytid=\"11\">pendirian</span> <span data-scayt_word=\"perusahaan\" data-scaytid=\"12\">perusahaan</span>.</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"6\">Fotokopi</span> <span data-scayt_word=\"Tanda\" data-scaytid=\"14\">Tanda</span> <span data-scayt_word=\"Daftar\" data-scaytid=\"15\">Daftar</span> <span data-scayt_word=\"perusahaan\" data-scaytid=\"13\">perusahaan</span>.</li><li>\r\n		<span data-scayt_word=\"Surat\" data-scaytid=\"20\">Surat</span> <span data-scayt_word=\"keterangan\" data-scaytid=\"22\">keterangan</span> <span data-scayt_word=\"domisili\" data-scaytid=\"23\">domisili</span> <span data-scayt_word=\"perusahaan\" data-scaytid=\"16\">perusahaan</span>.</li><li>\r\n		<span data-scayt_word=\"Surat\" data-scaytid=\"21\">Surat</span> <span data-scayt_word=\"pengesahan\" data-scaytid=\"25\">pengesahan</span> <span data-scayt_word=\"keputusan\" data-scaytid=\"26\">keputusan</span> <span data-scayt_word=\"menteri\" data-scaytid=\"27\">menteri</span> <span data-scayt_word=\"Hukum\" data-scaytid=\"28\">Hukum</span> <span data-scayt_word=\"dan\" data-scaytid=\"17\">dan</span> Ham</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"19\">Fotokopi</span> <span data-scayt_word=\"KTP\" data-scaytid=\"32\">KTP</span> <span data-scayt_word=\"direksi\" data-scaytid=\"33\">direksi</span>, <span data-scayt_word=\"dan\" data-scaytid=\"18\">dan</span> <span data-scayt_word=\"pejabat\" data-scaytid=\"34\">pejabat</span> yang <span data-scayt_word=\"bertanggung\" data-scaytid=\"35\">bertanggung</span> <span data-scayt_word=\"jawab\" data-scaytid=\"36\">jawab</span> <span data-scayt_word=\"terhadap\" data-scaytid=\"37\">terhadap</span> unit <span data-scayt_word=\"kendaraan\" data-scaytid=\"38\">kendaraan</span>.</li><li>\r\n		<span data-scayt_word=\"Surat\" data-scaytid=\"39\">Surat</span> <span data-scayt_word=\"kuasa\" data-scaytid=\"58\">kuasa</span> <span data-scayt_word=\"bila\" data-scaytid=\"59\">bila</span> <span data-scayt_word=\"bukan\" data-scaytid=\"60\">bukan</span> <span data-scayt_word=\"direktur\" data-scaytid=\"61\">direktur</span> <span data-scayt_word=\"perusahaan\" data-scaytid=\"40\">perusahaan</span> yang <span data-scayt_word=\"bertanggung\" data-scaytid=\"42\">bertanggung</span> <span data-scayt_word=\"jawab\" data-scaytid=\"43\">jawab</span>.</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"44\">Fotokopi</span> <span data-scayt_word=\"SIM\" data-scaytid=\"67\">SIM</span> <span data-scayt_word=\"pengemudi\" data-scaytid=\"68\">pengemudi</span>.</li><li>\r\n		Survey <span data-scayt_word=\"lokasi\" data-scaytid=\"69\">lokasi</span> <span data-scayt_word=\"domisili\" data-scaytid=\"45\">domisili</span> <span data-scayt_word=\"perusahaan\" data-scaytid=\"41\">perusahaan</span>.</li></ul>\r\n<h4>\r\n	<span data-scayt_word=\"Persyaratan\" data-scaytid=\"53\">Persyaratan</span> Rental Mobil <span data-scayt_word=\"untuk\" data-scaytid=\"54\">untuk</span> <span data-scayt_word=\"Perorangan\" data-scaytid=\"85\">Perorangan</span></h4>\r\n<ul><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"55\">Fotokopi</span> <span data-scayt_word=\"bukti\" data-scaytid=\"88\">bukti</span> <span data-scayt_word=\"kepemilikan\" data-scaytid=\"89\">kepemilikan</span> <span data-scayt_word=\"rumah\" data-scaytid=\"90\">rumah</span> <span data-scayt_word=\"atau\" data-scaytid=\"91\">atau</span> <span data-scayt_word=\"tempat\" data-scaytid=\"92\">tempat</span> <span data-scayt_word=\"tinggal\" data-scaytid=\"93\">tinggal</span>.</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"56\">Fotokopi</span> <span data-scayt_word=\"PBB\" data-scaytid=\"94\">PBB</span>.</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"75\">Fotokopi</span> <span data-scayt_word=\"NPWP\" data-scaytid=\"79\">NPWP</span>.</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"76\">Fotokopi</span> <span data-scayt_word=\"KTP\" data-scaytid=\"80\">KTP</span> <span data-scayt_word=\"atau\" data-scaytid=\"101\">atau</span> <span data-scayt_word=\"KITAS\" data-scaytid=\"126\">KITAS</span> (<span data-scayt_word=\"pemohon\" data-scaytid=\"127\">pemohon</span> <span data-scayt_word=\"dan\" data-scaytid=\"81\">dan</span> <span data-scayt_word=\"penjamin\" data-scaytid=\"129\">penjamin</span>).</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"77\"><span data-scayt_word=\"Foto\" data-scaytid=\"436\">Foto</span>kopi</span> <span data-scayt_word=\"KK\" data-scaytid=\"130\">KK</span> (<span data-scayt_word=\"Kartu\" data-scaytid=\"131\">Kartu</span> <span data-scayt_word=\"Keluarga\" data-scaytid=\"132\">Keluarga</span>).</li><li>\r\n		<span data-scayt_word=\"Fotokopi\" data-scaytid=\"78\">Fotokopi</span> <span data-scayt_word=\"Pasport\" data-scaytid=\"133\">Pasport</span>.</li><li>\r\n		<span data-scayt_word=\"Foto\" data-scaytid=\"134\">Foto</span> <span data-scayt_word=\"kopi\" data-scaytid=\"135\">kopi</span> <span data-scayt_word=\"SIM\" data-scaytid=\"82\">SIM</span>.</li><li>\r\n		<span data-scayt_word=\"Foto\" data-scaytid=\"137\">Foto</span> <span data-scayt_word=\"kopi\" data-scaytid=\"138\">kopi</span> ID Card <span data-scayt_word=\"tempat\" data-scaytid=\"113\">tempat</span> <span data-scayt_word=\"bekerja\" data-scaytid=\"164\">bekerja</span>.</li><li>\r\n		<span data-scayt_word=\"Kartu\" data-scaytid=\"141\">Kartu</span> <span data-scayt_word=\"nama\" data-scaytid=\"166\">nama</span>.</li><li>\r\n		Tim surveyor <span data-scayt_word=\"kami\" data-scaytid=\"167\">kami</span> survey <span data-scayt_word=\"lokasi\" data-scaytid=\"115\">lokasi</span> <span data-scayt_word=\"alamat\" data-scaytid=\"169\">alamat</span> <span data-scayt_word=\"dan\" data-scaytid=\"116\">dan</span> <span data-scayt_word=\"tempat\" data-scaytid=\"114\">tempat</span> <span data-scayt_word=\"tinggal\" data-scaytid=\"117\">tinggal</span> <span data-scayt_word=\"penyewa\" data-scaytid=\"172\">penyewa</span>.</li><li>\r\n		<span data-scayt_word=\"Memiliki\" data-scaytid=\"173\">Memiliki</span> <span data-scayt_word=\"penjamin\" data-scaytid=\"145\">penjamin</span> (<span data-scayt_word=\"bila\" data-scaytid=\"118\">bila</span> <span data-scayt_word=\"diperlukan\" data-scaytid=\"176\">diperlukan</span>).</li><li>\r\n		<span data-scayt_word=\"ketersediaan\" data-scaytid=\"188\">ketersediaan</span> <span data-scayt_word=\"lahan\" data-scaytid=\"189\">lahan</span> <span data-scayt_word=\"parkir\" data-scaytid=\"190\">parkir</span> yang <span data-scayt_word=\"layak\" data-scaytid=\"191\">layak</span> <span data-scayt_word=\"dan\" data-scaytid=\"157\">dan</span> <span data-scayt_word=\"aman\" data-scaytid=\"193\">aman</span>.</li></ul>\r\n<div style=\"padding:15px; background:#efefef\">\r\n	<h4>\r\n		Note</h4>\r\n	<ul><li>\r\n			<span data-scayt_word=\"Prosedur\" data-scaytid=\"194\">Prosedur</span> survey <span data-scayt_word=\"kami\" data-scaytid=\"178\">kami</span> <span data-scayt_word=\"harus\" data-scaytid=\"196\">harus</span> <span data-scayt_word=\"dilakukan\" data-scaytid=\"197\">dilakukan</span> minimal 1 <span data-scayt_word=\"hari\" data-scaytid=\"198\">hari</span> <span data-scayt_word=\"sebelum\" data-scaytid=\"200\">sebelum</span> <span data-scayt_word=\"hari\" data-scaytid=\"199\">hari</span> H. (<span data-scayt_word=\"Perusahaan\" data-scaytid=\"158\">Perusahaan</span> <span data-scayt_word=\"memerlukan\" data-scaytid=\"202\">memerlukan</span> <span data-scayt_word=\"waktu\" data-scaytid=\"203\">waktu</span> <span data-scayt_word=\"untuk\" data-scaytid=\"159\">untuk</span> <span data-scayt_word=\"pengecekan\" data-scaytid=\"205\">pengecekan</span> <span data-scayt_word=\"legalitas\" data-scaytid=\"206\">legalitas</span>/<span data-scayt_word=\"keaslian\" data-scaytid=\"207\">keaslian</span> data customer).</li><li>\r\n			Customer <span data-scayt_word=\"wajib\" data-scaytid=\"208\">wajib</span> <span data-scayt_word=\"Membayar\" data-scaytid=\"209\">Membayar</span> <span data-scayt_word=\"uang\" data-scaytid=\"210\">uang</span> deposit <span data-scayt_word=\"sebagai\" data-scaytid=\"211\">sebagai</span> <span data-scayt_word=\"jaminan\" data-scaytid=\"212\">jaminan</span> <span data-scayt_word=\"asuransi\" data-scaytid=\"213\">asuransi</span> (<span data-scayt_word=\"dikembalikan\" data-scaytid=\"214\">dikembalikan</span> <span data-scayt_word=\"di\" data-scaytid=\"215\">di</span> <span data-scayt_word=\"masa\" data-scaytid=\"216\">masa</span> <span data-scayt_word=\"akhir\" data-scaytid=\"217\">akhir</span> <span data-scayt_word=\"sewa\" data-scaytid=\"218\">sewa</span>).</li><li>\r\n			<span data-scayt_word=\"Kendaraan\" data-scaytid=\"289\">Kendaraan</span> <span data-scayt_word=\"hanya\" data-scaytid=\"290\">hanya</span> <span data-scayt_word=\"dapat\" data-scaytid=\"291\">dapat</span> <span data-scayt_word=\"dikemudikan\" data-scaytid=\"292\">dikemudikan</span> <span data-scayt_word=\"oleh\" data-scaytid=\"293\">oleh</span> <span data-scayt_word=\"orang\" data-scaytid=\"294\">orang</span> yang <span data-scayt_word=\"memiliki\" data-scaytid=\"295\">memiliki</span> <span data-scayt_word=\"SIM\" data-scaytid=\"185\">SIM</span> <span data-scayt_word=\"nasional\" data-scaytid=\"298\">nasional</span> <span data-scayt_word=\"indonesia\" data-scaytid=\"299\">indonesia</span> <span data-scayt_word=\"atau\" data-scaytid=\"187\">atau</span> <span data-scayt_word=\"SIM\" data-scaytid=\"186\">SIM</span> <span data-scayt_word=\"internasional\" data-scaytid=\"301\">internasional</span>.</li><li>\r\n			<span data-scayt_word=\"Semua\" data-scaytid=\"302\">Semua</span> data yang <span data-scayt_word=\"di\" data-scaytid=\"253\">di</span> <span data-scayt_word=\"sertakan\" data-scaytid=\"305\">sertakan</span> <span data-scayt_word=\"berupa\" data-scaytid=\"306\">berupa</span> <span data-scayt_word=\"foto\" data-scaytid=\"307\">foto</span> <span data-scayt_word=\"kopi\" data-scaytid=\"255\">kopi</span>. <span data-scayt_word=\"Penyewa\" data-scaytid=\"309\">Penyewa</span> <span data-scayt_word=\"wajib\" data-scaytid=\"256\">wajib</span> <span data-scayt_word=\"menunjukan\" data-scaytid=\"311\">menunjukan</span> <span data-scayt_word=\"dokumen\" data-scaytid=\"312\">dokumen</span> <span data-scayt_word=\"asli\" data-scaytid=\"314\">asli</span> <span data-scayt_word=\"kepada\" data-scaytid=\"315\">kepada</span> surveyor <span data-scayt_word=\"ketika\" data-scaytid=\"316\">ketika</span> <span data-scayt_word=\"di\" data-scaytid=\"254\">di</span> survey. <span data-scayt_word=\"Guna\" data-scaytid=\"317\">Guna</span> <span data-scayt_word=\"mencocokan\" data-scaytid=\"318\">mencocokan</span> <span data-scayt_word=\"keaslian\" data-scaytid=\"257\">keaslian</span> <span data-scayt_word=\"dokumen\" data-scaytid=\"313\">dokumen</span> <span data-scayt_word=\"dengan\" data-scaytid=\"320\">dengan</span> <span data-scayt_word=\"fotokopi\" data-scaytid=\"321\">fotokopi</span> yang <span data-scayt_word=\"diberikan\" data-scaytid=\"322\">diberikan</span>.</li><li>\r\n			<span data-scayt_word=\"Dilarang\" data-scaytid=\"920\">Dilarang</span> <span data-scayt_word=\"meninggalkan\" data-scaytid=\"921\">meninggalkan</span> <span data-scayt_word=\"STNK\" data-scaytid=\"922\">STNK</span>, <span data-scayt_word=\"kunci\" data-scaytid=\"923\">kunci</span> <span data-scayt_word=\"kontak\" data-scaytid=\"924\">kontak</span> <span data-scayt_word=\"dan\" data-scaytid=\"512\">dan</span> <span data-scayt_word=\"karcis\" data-scaytid=\"926\">karcis</span> <span data-scayt_word=\"parkir\" data-scaytid=\"513\">parkir</span> <span data-scayt_word=\"di\" data-scaytid=\"503\">di</span> <span data-scayt_word=\"dalam\" data-scaytid=\"929\">dalam</span> <span data-scayt_word=\"kendaraan\" data-scaytid=\"515\">kendaraan</span> yang <span data-scayt_word=\"sedang\" data-scaytid=\"932\">sedang</span> <span data-scayt_word=\"di\" data-scaytid=\"504\">di</span> <span data-scayt_word=\"parkir\" data-scaytid=\"514\">parkir</span>.</li><li>\r\n			<span data-scayt_word=\"Penggantian\" data-scaytid=\"933\">Penggantian</span> <span data-scayt_word=\"kendaraan\" data-scaytid=\"516\">kendaraan</span> <span data-scayt_word=\"tidak\" data-scaytid=\"934\">tidak</span> <span data-scayt_word=\"berlaku\" data-scaytid=\"935\">berlaku</span> <span data-scayt_word=\"jika\" data-scaytid=\"936\">jika</span> <span data-scayt_word=\"kerusakan\" data-scaytid=\"937\">kerusakan</span>/<span data-scayt_word=\"kecelakaan\" data-scaytid=\"938\">kecelakaan</span> <span data-scayt_word=\"diakibatkan\" data-scaytid=\"939\">diakibatkan</span> <span data-scayt_word=\"kelalaian\" data-scaytid=\"940\">kelalaian</span> <span data-scayt_word=\"penyewa\" data-scaytid=\"517\">penyewa</span>.</li><li>\r\n			<span id=\"result_box\" lang=\"id\"><span class=\"hps\"><span data-scayt_word=\"Penyewa\" data-scaytid=\"518\">Penyewa</span></span> <span class=\"hps\"><span data-scayt_word=\"dan\" data-scaytid=\"537\">dan</span></span> <span class=\"hps\">driver <span data-scayt_word=\"tambahan\" data-scaytid=\"609\">tambahan</span></span> <span class=\"hps\"><span data-scayt_word=\"harus\" data-scaytid=\"538\">harus</span> <span data-scayt_word=\"memiliki\" data-scaytid=\"539\">memiliki</span> <span data-scayt_word=\"usia\" data-scaytid=\"612\">usia</span> <span data-scayt_word=\"antara\" data-scaytid=\"613\">antara</span></span> <span class=\"hps\">21</span> <span data-scayt_word=\"hingga\" data-scaytid=\"614\">hingga</span> <span class=\"hps\">65 <span data-scayt_word=\"tahun\" data-scaytid=\"615\">tahun</span></span> <span class=\"hps\"><span data-scayt_word=\"untuk\" data-scaytid=\"540\">untuk</span> normal</span> <span class=\"hps\"><span data-scayt_word=\"kendaraan\" data-scaytid=\"541\">kendaraan</span></span> <span class=\"hps\"><span data-scayt_word=\"kategori\" data-scaytid=\"618\">kategori</span></span> <span class=\"hps\"><span data-scayt_word=\"mobil\" data-scaytid=\"619\">mobil</span> <span data-scayt_word=\"standar\" data-scaytid=\"620\">standar</span></span> <span class=\"hps\"><span data-scayt_word=\"dan\" data-scaytid=\"565\">dan</span></span> <span class=\"hps\">berusia</span> <span class=\"hps\">25</span> <span data-scayt_word=\"hingga\" data-scaytid=\"622\">hingga</span><span class=\"hps\"> 65</span> <span class=\"hps\"><span data-scayt_word=\"tahun\" data-scaytid=\"623\">tahun</span></span> <span class=\"hps\"><span data-scayt_word=\"untuk\" data-scaytid=\"566\">untuk</span></span> <span class=\"hps\"><span data-scayt_word=\"kategori\" data-scaytid=\"626\">kategori</span></span> <span class=\"hps\"><span data-scayt_word=\"mobil\" data-scaytid=\"627\">mobil</span> mewah.</span> </span></li><li>\r\n			<span data-scayt_word=\"Penyewaan\" data-scaytid=\"568\">Penyewaan</span> <span data-scayt_word=\"tanpa\" data-scaytid=\"569\">tanpa</span> <span data-scayt_word=\"supir\" data-scaytid=\"570\">supir</span> <span data-scayt_word=\"diwajibkan\" data-scaytid=\"571\">diwajibkan</span> <span data-scayt_word=\"untuk\" data-scaytid=\"323\">untuk</span> <span data-scayt_word=\"memonitor\" data-scaytid=\"572\">memonitor</span> <span data-scayt_word=\"perawatan\" data-scaytid=\"573\">perawatan</span> <span data-scayt_word=\"kendaraan\" data-scaytid=\"324\">kendaraan</span>.</li><li>\r\n			<span data-scayt_word=\"Hasil\" data-scaytid=\"797\">Hasil</span> survey <span data-scayt_word=\"adalah\" data-scaytid=\"798\">adalah</span> <span data-scayt_word=\"murni\" data-scaytid=\"799\">murni</span> data <span data-scayt_word=\"independen\" data-scaytid=\"800\">independen</span> <span data-scayt_word=\"dari\" data-scaytid=\"801\">dari</span> <span data-scayt_word=\"perusahaan\" data-scaytid=\"779\">perusahaan</span> <span data-scayt_word=\"kami\" data-scaytid=\"781\">kami</span>, <span data-scayt_word=\"jika\" data-scaytid=\"782\">jika</span> <span data-scayt_word=\"terjadi\" data-scaytid=\"806\">terjadi</span> <span data-scayt_word=\"penolakan\" data-scaytid=\"807\">penolakan</span> <span data-scayt_word=\"hasil\" data-scaytid=\"808\">hasil</span> survey, <span data-scayt_word=\"maka\" data-scaytid=\"810\">maka</span> <span data-scayt_word=\"perusahaan\" data-scaytid=\"780\">perusahaan</span> <span data-scayt_word=\"tidak\" data-scaytid=\"783\">tidak</span> <span data-scayt_word=\"akan\" data-scaytid=\"812\">akan</span> <span data-scayt_word=\"memberikan\" data-scaytid=\"813\">memberikan</span> <span data-scayt_word=\"informasi\" data-scaytid=\"814\">informasi</span> <span data-scayt_word=\"apapun\" data-scaytid=\"815\">apapun</span> <span data-scayt_word=\"kepada\" data-scaytid=\"784\">kepada</span> customer <span data-scayt_word=\"mengenai\" data-scaytid=\"817\">mengenai</span> <span data-scayt_word=\"hasil\" data-scaytid=\"809\">hasil</span> <span data-scayt_word=\"analisa\" data-scaytid=\"818\">analisa</span> survey</li></ul>\r\n</div>\r\n<p>&nbsp;\r\n	<br></p></div><p align=\"justify\"><br></p>																						'),
(5, 'Rekening', 'rekening', '																																	123456789 Bank BRI a/n WAHYU SARONTO'),
(0, 'Driver', 'driver', '450000'),
(2, 'Privacy Policy', 'privacy', '<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat</span>'),
(3, 'Tentang Kami', 'aboutus', '											<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Kami adalah perusahaan yang bergerak di bidang penyewaan mobil.</span>'),
(11, 'FAQs', 'faqs', '																						<div style=\"text-align: justify;\"><span style=\"font-size: 1em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Q : Bagaimana cara menyewa mobil di&nbsp; Car Rental?</span></div><div style=\"text-align: justify;\"><span style=\"font-size: 1em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">A : Pertama anda harus mendaftar terlebih dahulu sebagai user melalui menu yang telah disediakan.</span></div>																						');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(120) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `telp` char(11) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `ktp` varchar(120) NOT NULL,
  `kk` varchar(120) NOT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `nama_user`, `email`, `password`, `telp`, `alamat`, `ktp`, `kk`, `RegDate`, `UpdationDate`) VALUES
(7, 'Yusuf', 'yusuf@gmail.com', 'dd2eb170076a5dec97cdbbbbff9a4405', '08122233343', 'Jl. Sukosemolo', '07092022132814id.png', '07092022132814id (1).png', '2022-09-07 11:28:14', NULL),
(8, 'Widya Prastika', 'widya@gmail.com', '9146bfc09df862ee46fa9b512c72f9a6', '08977788898', 'Jl. Ahmad Yani', '07092022132849id.png', '07092022132849id (1).png', '2022-09-07 11:28:49', NULL),
(9, 'Alvian Andhi', 'alvian@gmail.com', 'e8cb77839eba5ec65525e642c3899b3b', '08766655567', 'Jl. Rowo Jombor', '07092022132925id.png', '07092022132925id (1).png', '2022-09-07 11:29:25', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`kode_booking`);

--
-- Indeks untuk tabel `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`id_cu`);

--
-- Indeks untuk tabel `contactusinfo`
--
ALTER TABLE `contactusinfo`
  ADD PRIMARY KEY (`id_info`);

--
-- Indeks untuk tabel `merek`
--
ALTER TABLE `merek`
  ADD PRIMARY KEY (`id_merek`);

--
-- Indeks untuk tabel `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id_mobil`);

--
-- Indeks untuk tabel `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `contactus`
--
ALTER TABLE `contactus`
  MODIFY `id_cu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `contactusinfo`
--
ALTER TABLE `contactusinfo`
  MODIFY `id_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `merek`
--
ALTER TABLE `merek`
  MODIFY `id_merek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `mobil`
--
ALTER TABLE `mobil`
  MODIFY `id_mobil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Database: `db_toko`
--
CREATE DATABASE IF NOT EXISTS `db_toko` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_toko`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `id_barang` varchar(255) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_barang` text NOT NULL,
  `merk` varchar(255) NOT NULL,
  `harga_beli` varchar(255) NOT NULL,
  `harga_jual` varchar(255) NOT NULL,
  `satuan_barang` varchar(255) NOT NULL,
  `stok` text NOT NULL,
  `tgl_input` varchar(255) NOT NULL,
  `tgl_update` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `id_barang`, `id_kategori`, `nama_barang`, `merk`, `harga_beli`, `harga_jual`, `satuan_barang`, `stok`, `tgl_input`, `tgl_update`) VALUES
(15, 'BR001', 1, 'Topi Renang', 'SPEEDS', '14000', '20000', '#', '32', '20 February 2024, 10:57', NULL),
(16, 'BR002', 1, 'Kacamata Renang', 'TAFFSPORT', '35000', '50000', '#', '29', '20 February 2024, 10:58', NULL),
(17, 'BR003', 1, 'Kaki Katak', 'SPEEDS', '100000', '125000', '#', '32', '20 February 2024, 10:59', NULL),
(18, 'BR004', 1, 'Papan Renang', 'SPEEDO', '42000', '55000', '#', '20', '20 February 2024, 11:00', NULL),
(19, 'BR005', 1, 'Pelampung', 'SPEEDS', '30000', '45000', '#', '20', '20 February 2024, 11:01', NULL),
(20, 'BR006', 1, 'Earplug/Penutup Telinga', 'SPEEDS', '10000', '20000', '#', '20', '20 February 2024, 11:02', NULL),
(21, 'BR007', 1, 'Baju Renang', 'SPEEDS', '85000', '120000', '#', '30', '20 February 2024, 11:03', NULL),
(22, 'BR008', 1, 'Snorkeling', 'SPEEDS', '200000', '230000', '#', '45', '20 February 2024, 11:04', NULL),
(23, 'BR009', 1, 'Senter Selam', 'SPEEDS', '32000', '45000', '#', '32', '20 February 2024, 11:08', NULL),
(24, 'BR010', 1, 'Sabuk Pelampung', 'SPEEDS', '70000', '80000', '#', '22', '20 February 2024, 11:09', NULL),
(25, 'BR011', 5, 'Bola Basket', 'MOLTEN', '100000', '150000', '#', '32', '20 February 2024, 11:10', NULL),
(26, 'BR012', 5, 'Leg Sleeve', 'Knee Pad', '55000', '65000', '#', '29', '20 February 2024, 11:14', NULL),
(27, 'BR013', 5, 'Basket Ball Bag', 'Adinda', '40000', '50000', '#', '43', '20 February 2024, 11:16', '18 March 2024, 15:29'),
(31, 'BR015', 1, 'fins', '-', '200000', '230000', 'PCS', '13', '19 March 2024, 9:53', NULL),
(32, 'BR016', 5, 'Baju Jersey', 'abcd', '100000', '110000', 'PCS', '4', '19 March 2024, 11:32', '3 April 2024, 22:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `diskon`
--

CREATE TABLE `diskon` (
  `id` int(11) NOT NULL,
  `jumlah_diskon` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `diskon`
--

INSERT INTO `diskon` (`id`, `jumlah_diskon`) VALUES
(5, 5),
(6, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `tgl_input` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `tgl_input`) VALUES
(1, 'Peralatan Renang', '7 May 2017, 10:23'),
(5, 'Peralatan Basket', '7 May 2017, 10:28'),
(6, 'Peralatan Volly', '6 October 2020, 0:19'),
(7, 'Peralatan Futsal', '6 October 2020, 0:20'),
(8, 'Peralatan Badminton', '11 Febuari 2024');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` char(32) NOT NULL,
  `id_member` int(11) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id_login`, `user`, `pass`, `id_member`, `role`) VALUES
(1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'admin'),
(2, 'user', '202cb962ac59075b964b07152d234b70', 2, 'user'),
(7, 'kall', '202cb962ac59075b964b07152d234b70', 3, 'user'),
(8, 'gun', 'e10adc3949ba59abbe56e057f20f883e', 4, 'admin'),
(9, 'aden', '827ccb0eea8a706c4c34a16891f84e7b', 5, 'user'),
(24, 'diana', '827ccb0eea8a706c4c34a16891f84e7b', 0, 'user'),
(35, 'dadan', 'fcea920f7412b5da7be0cf42b8c93759', 25, 'user');

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nm_member` varchar(255) NOT NULL,
  `alamat_member` text NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gambar` text NOT NULL,
  `NIK` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id_member`, `nm_member`, `alamat_member`, `telepon`, `email`, `gambar`, `NIK`) VALUES
(1, 'sintia', 'barukai', '081234567890', 'example@gmail.com', 'unnamed.jpg', '12314121'),
(2, 'sins', 'barukai', '085624401234', 'sisin@gmail.com', '1707884639p7.jpg', '1111222'),
(3, 'haikal', 'cikalong', '0856', 'kall@gmail.com', '', '111111111'),
(4, 'gugun', 'cikalongf', '08976589', 'gugun@gmail.com', '', '1234567'),
(17, 'angun legi', 'cikalong', '085624401245 ', 'haikalridha07@gmail.com', '', '111120'),
(24, 'dianaa', 'cikalongf', '08976589', 'desty@gmail.com', '', '1234567'),
(25, 'agus', 'cikalong', '085624401245 ', 'haikalaja@gmail.com', '', '111120');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nota`
--

CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL,
  `id_barang` varchar(255) NOT NULL,
  `id_member` int(11) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `tanggal_input` varchar(255) NOT NULL,
  `periode` varchar(255) DEFAULT NULL,
  `jumlah_diskon` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `nota`
--

INSERT INTO `nota` (`id_nota`, `id_barang`, `id_member`, `jumlah`, `total`, `tanggal_input`, `periode`, `jumlah_diskon`) VALUES
(1, 'BR002', 1, '1', '3000', '13 February 2024, 11:05', '02-2024', 0),
(2, 'BR001', 2, '1', '200000', '14 February 2024, 9:56', '02-2024', 0),
(3, 'BR001', 2, '1', '200000', '14 February 2024, 9:56', '02-2024', 0),
(4, 'BR001', 2, '1', '200000', '14 February 2024, 10:40', '02-2024', 0),
(5, 'BR001', 2, '1', '200000', '14 February 2024, 10:40', '02-2024', 0),
(6, 'BR001', 2, '1', '200000', '14 February 2024, 10:40', '02-2024', 0),
(7, 'BR001', 2, '1', '200000', '14 February 2024, 10:40', '02-2024', 0),
(8, 'BR001', 2, '1', '200000', '14 February 2024, 10:40', '02-2024', 0),
(9, 'BR001', 2, '1', '200000', '14 February 2024, 11:19', '02-2024', 0),
(10, 'BR002', 2, '1', '50000', '20 February 2024, 11:07', '02-2024', 0),
(11, 'BR002', 2, '1', '50000', '20 February 2024, 11:07', '02-2024', 0),
(12, 'BR011', 2, '1', '150000', '20 February 2024, 13:44', '02-2024', 0),
(13, 'BR002', 2, '1', '50000', '20 February 2024, 11:07', '02-2024', 0),
(14, 'BR011', 2, '1', '150000', '20 February 2024, 13:44', '02-2024', 0),
(15, 'BR002', 2, '-4', '-200000', '20 February 2024, 11:07', '02-2024', 0),
(16, 'BR011', 2, '2', '300000', '20 February 2024, 13:44', '02-2024', 0),
(17, 'BR002', 2, '-9', '-450000', '20 February 2024, 20:00', '02-2024', 0),
(18, 'BR002', 2, '-1', '-50000', '20 February 2024, 20:20', '02-2024', 0),
(19, 'BR002', 2, '-1', '-50000', '20 February 2024, 20:20', '02-2024', 0),
(20, 'BR002', 2, '-1', '-50000', '20 February 2024, 20:20', '02-2024', 0),
(21, 'BR002', 2, '1', '50000', '22 February 2024, 16:15', '02-2024', 0),
(22, 'BR001', 2, '1', '20000', '22 February 2024, 16:27', '02-2024', 0),
(23, 'BR001', 2, '1', '20000', '22 February 2024, 16:27', '02-2024', 0),
(24, 'BR003', 2, '1', '125000', '22 February 2024, 16:33', '02-2024', 0),
(25, 'BR002', 2, '1', '50000', '7 March 2024, 10:55', '03-2024', 0),
(26, 'BR014', 2, '1', '220000', '18 March 2024, 22:30', '03-2024', 0),
(27, 'BR014', 2, '1', '220000', '19 March 2024, 9:46', '03-2024', 0),
(28, 'BR015', 2, '6', '1380000', '19 March 2024, 10:01', '03-2024', 0),
(29, 'BR002', 2, '1', '50000', '19 March 2024, 11:37', '03-2024', 0),
(30, 'BR003', 2, '1', '125000', '1 April 2024, 10:04', '04-2024', 0),
(31, 'BR002', 2, '4', '200000', '1 April 2024, 10:39', '04-2024', 0),
(32, 'BR002', 2, '4', '200000', '1 April 2024, 10:39', '04-2024', 0),
(33, 'BR002', 2, '4', '200000', '1 April 2024, 10:39', '04-2024', 0),
(34, 'BR002', 2, '4', '200000', '1 April 2024, 10:39', '04-2024', 0),
(35, 'BR002', 2, '4', '200000', '1 April 2024, 10:39', '04-2024', 0),
(36, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(37, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(38, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(39, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(40, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(41, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(42, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(43, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(44, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(45, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(46, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(47, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(48, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(49, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(50, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(51, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(52, 'BR002', 2, '1', '50000', '1 April 2024, 11:13', '04-2024', 0),
(53, 'BR013', 2, '1', '50000', '1 April 2024, 13:55', '04-2024', 0),
(54, 'BR013', 2, '1', '50000', '1 April 2024, 13:55', '04-2024', 0),
(55, 'BR011', 2, '1', '150000', '1 April 2024, 14:22', '04-2024', 0),
(56, 'BR011', 2, '1', '150000', '1 April 2024, 14:23', '04-2024', 0),
(57, 'BR011', 2, '1', '150000', '1 April 2024, 14:23', '04-2024', 0),
(58, 'BR011', 2, '1', '150000', '1 April 2024, 14:51', '04-2024', 0),
(59, 'BR011', 2, '1', '150000', '1 April 2024, 14:51', '04-2024', 0),
(60, 'BR011', 2, '1', '150000', '1 April 2024, 14:51', '04-2024', 0),
(61, 'BR012', 2, '1', '65000', '1 April 2024, 14:58', '04-2024', 0),
(62, 'BR010', 2, '1', '80000', '1 April 2024, 14:59', '04-2024', 0),
(63, 'BR011', 2, '3', '450000', '8 April 2024, 10:49', '04-2024', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_barang` varchar(255) NOT NULL,
  `id_member` int(11) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `tanggal_input` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Struktur dari tabel `toko`
--

CREATE TABLE `toko` (
  `id_toko` int(11) NOT NULL,
  `nama_toko` varchar(255) NOT NULL,
  `alamat_toko` text NOT NULL,
  `tlp` varchar(255) NOT NULL,
  `nama_pemilik` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `toko`
--

INSERT INTO `toko` (`id_toko`, `nama_toko`, `alamat_toko`, `tlp`, `nama_pemilik`) VALUES
(1, 'Peralatan Olahraga', 'Bandung', '081234567890', 'sintia');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `diskon`
--
ALTER TABLE `diskon`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`),
  ADD UNIQUE KEY `id_member` (`id_member`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indeks untuk tabel `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id_toko`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `diskon`
--
ALTER TABLE `diskon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `nota`
--
ALTER TABLE `nota`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `toko`
--
ALTER TABLE `toko`
  MODIFY `id_toko` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `db_union`
--
CREATE DATABASE IF NOT EXISTS `db_union` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_union`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_order`
--

CREATE TABLE `tb_order` (
  `order_id` int(10) NOT NULL,
  `order_date` date NOT NULL,
  `supplier_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_order`
--

INSERT INTO `tb_order` (`order_id`, `order_date`, `supplier_id`) VALUES
(1, '2015-08-01', 2000),
(2, '2015-08-02', 6000),
(3, '2015-08-03', 7000),
(4, '2015-08-04', 8000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `supplier_id` int(10) NOT NULL,
  `supplier_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_supplier`
--

INSERT INTO `tb_supplier` (`supplier_id`, `supplier_name`) VALUES
(1000, 'Microsoft'),
(2000, 'Oracle'),
(3000, 'Apple'),
(4000, 'Samsung');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indeks untuk tabel `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_supplier`
--
ALTER TABLE `tb_supplier`
  MODIFY `supplier_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4001;
--
-- Database: `galeri`
--
CREATE DATABASE IF NOT EXISTS `galeri` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `galeri`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar_foto`
--

CREATE TABLE `komentar_foto` (
  `komentarID` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `isi_komentar` text NOT NULL,
  `tanggal_komentar` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin_telp` varchar(20) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_address` text NOT NULL,
  `role` enum('admin','user','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`admin_id`, `admin_name`, `username`, `password`, `admin_telp`, `admin_email`, `admin_address`, `role`) VALUES
(2, 'Irawan', 'irawan', 'adminirawan', '085774137284', 'irawan@gmail.com', 'Jl. Raya Kadu Seungit', 'admin'),
(3, 'Diana', 'diana', '1234', '085788992919', 'Diana@gmail.com', 'Suka Seneng Cikeusik', 'admin'),
(4, 'Hazwan', 'hazwan', '123', '085787778811', 'hazwan@gmail.com', 'Cikeusik Pandeglang', 'admin'),
(6, 'Ddn', 'dadan', '12345', '668786868', 'gdgvvh', 'Jbhbjb', 'user'),
(7, 'Ddn', 'dadan', '12345', '668786868', 'gdgvvh', 'Jbhbjb', 'user'),
(8, 'Ddn', 'dadan', '12345', '668786868', 'gdgvvh', 'Jbhbjb', 'user');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_category`
--

CREATE TABLE `tb_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(25) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_category`
--

INSERT INTO `tb_category` (`category_id`, `category_name`, `image`) VALUES
(15, 'Satwa Liar', ''),
(16, 'Seni Rupa', ''),
(17, 'Fashion', ''),
(18, 'Makanan', ''),
(20, 'Olahraga', ''),
(22, 'Bawah Air', ''),
(25, 'Hewan Peliharaan', ''),
(26, 'capruk', 'foto1709784356.jpg'),
(27, 'capruk', 'foto1709784356.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_image`
--

CREATE TABLE `tb_image` (
  `image_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `image_description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `image_status` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_image`
--

INSERT INTO `tb_image` (`image_id`, `category_id`, `category_name`, `admin_id`, `admin_name`, `image_name`, `image_description`, `image`, `image_status`, `date_created`) VALUES
(35, 23, 'Arsitektur', 2, 'Irawan', 'Merancang Perumahan Elit', '<p>Foto ini menggambarkan kegiatan desain perencanaan membuat Rumah yang modern, nyaman untuk keluarga</p>\r\n', 'foto1701144257.jpg', 1, '2023-11-28 04:04:17'),
(36, 17, 'Satwa Liar', 3, 'Diana', 'Harimau Sumatra', 'Harimau sumatera (Panthera tigris sumatrae) adalah subspesies harimau yang habitat aslinya di pulau Sumatera. Hidup di hutan hujan tropis Sumatera, harimau ini adalah pemakan daging yang ulung. Dengan kecepatan lari hampir 40 mil per jam, mereka adalah predator yang tangguh di alam liar. Kemampuannya berburu, terutama di malam hari, memungkinkan mereka untuk mengintai mangsa dengan diam-diam sebelum menerkam dengan cepat.', 'foto1701147078.jpg', 1, '2023-11-28 04:51:18'),
(37, 17, 'Satwa Liar', 3, 'Diana', 'Badak Jawa', 'Badak Jawa (Rhinoceros sondaicus) adalah jenis satwa langka yang masuk kedalam 25 spesies prioritas utama konservasi Pemerintah Indonesia. Badak Jawa dapat hidup hingga 30-45 tahun di habitat aslinya. Mereka biasa tinggal di hutan hujan dataran rendah, padang rumput basah, dan dataran banjir yang luas. Badak ini merupakan makhluk yang suka menyendiri, kecuali saat pacaran dan saat membesarkan anak.', 'foto1701147926.jpg', 1, '2023-11-28 05:05:26'),
(38, 16, 'Hewan Peliharaan', 3, 'Diana', 'Kucing Angora', 'Anggora adalah kucing dengan ciri khas berbulu panjang yang indah. Anggora memiliki tubuh yang sedang dengan badan berotot yang panjang, ramping, langsing dan elegan. Anggora memiliki hidung yang panjang, kepala yang berbentuk segitiga, serta telinga yang panjang, lebar, dan berbentuk segitiga.', 'foto1701148582.jpg', 1, '2023-11-28 05:16:22'),
(39, 16, 'Hewan Peliharaan', 3, 'Diana', 'Ayam Kampung', 'Ayam kampung adalah kualitas daging nya yang memang lebih unggul di bandingkan dengan daging ayam lain nya, sehingga tidak heran jika rasa nya juga jauh lebih enak di bandingkan ayam lain.', 'foto1701148797.jpg', 1, '2023-11-28 05:19:57'),
(40, 14, 'Perjalanan', 4, 'Hazwan', 'Pantai Carita', 'Pantai Carita merupakan objek wisata yang terletak di Kabupaten Pandeglang. Fasilitas di Pantai Carita cukup lengkap yaitu Banana boat, snorkling, papan seluncur, diving, dan fasilitas lainnya. Banyak juga penginapan-penginapan sepanjang pesisir pantai dan atau rumah-rumah warga yang difungsikan untuk penginapan.', 'foto1701150076.jpg', 1, '2023-11-28 05:41:16'),
(41, 14, 'Perjalanan', 4, 'Hazwan', 'Curug Putri', 'Curug Putri Carita Pandeglang ini unik banget karena terbentuk dari lava yang membeku dan kemudian menjadi aliran sungai dengan batuan cantik.', 'foto1701150304.jpg', 1, '2023-11-28 05:45:04'),
(42, 17, 'Satwa Liar', 3, 'Diana', 'Singa Afrika', 'Singa adalah binatang yang menakutkan , tubuhnya besar, gesit dan garang, buas dan menyeramkan. Singa memiliki taring yang gampang melumatkan mangsanya, punya kuku yang kuat yang mampu menerkam mangsa hingga tak berdaya, dan mencabik- cabiknya. Singa sering digunakan untuk mewakili kekuatan, kegarangan dan kebuasan.', 'foto1701150517.jpg', 1, '2023-11-28 05:48:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_like`
--

CREATE TABLE `tb_like` (
  `like_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `tanggal_like` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `komentar_foto`
--
ALTER TABLE `komentar_foto`
  ADD PRIMARY KEY (`komentarID`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeks untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `tb_image`
--
ALTER TABLE `tb_image`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indeks untuk tabel `tb_like`
--
ALTER TABLE `tb_like`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `komentar_foto`
--
ALTER TABLE `komentar_foto`
  MODIFY `komentarID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `tb_image`
--
ALTER TABLE `tb_image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `tb_like`
--
ALTER TABLE `tb_like`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `komentar_foto`
--
ALTER TABLE `komentar_foto`
  ADD CONSTRAINT `komentar_foto_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `tb_image` (`image_id`),
  ADD CONSTRAINT `komentar_foto_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `tb_admin` (`admin_id`);

--
-- Ketidakleluasaan untuk tabel `tb_like`
--
ALTER TABLE `tb_like`
  ADD CONSTRAINT `tb_like_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `tb_image` (`image_id`),
  ADD CONSTRAINT `tb_like_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `tb_admin` (`admin_id`);
--
-- Database: `galeridadan`
--
CREATE DATABASE IF NOT EXISTS `galeridadan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `galeridadan`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar_foto`
--

CREATE TABLE `komentar_foto` (
  `komentarID` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `isi_komentar` text NOT NULL,
  `tanggal_komentar` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_category`
--

CREATE TABLE `tb_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(25) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_category`
--

INSERT INTO `tb_category` (`category_id`, `category_name`, `image`) VALUES
(15, 'Satwa Liar', ''),
(16, 'Seni Rupa', ''),
(17, 'Fashion', ''),
(18, 'Makanan', ''),
(20, 'Olahraga', ''),
(22, 'Bawah Air', ''),
(25, 'Hewan Peliharaan', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_like`
--

CREATE TABLE `tb_like` (
  `like_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `tanggal_like` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `komentar_foto`
--
ALTER TABLE `komentar_foto`
  ADD PRIMARY KEY (`komentarID`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indeks untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `tb_like`
--
ALTER TABLE `tb_like`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `komentar_foto`
--
ALTER TABLE `komentar_foto`
  MODIFY `komentarID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `tb_like`
--
ALTER TABLE `tb_like`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `komentar_foto`
--
ALTER TABLE `komentar_foto`
  ADD CONSTRAINT `komentar_foto_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `tb_image` (`image_id`),
  ADD CONSTRAINT `komentar_foto_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `tb_admin` (`admin_id`);

--
-- Ketidakleluasaan untuk tabel `tb_like`
--
ALTER TABLE `tb_like`
  ADD CONSTRAINT `tb_like_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `tb_image` (`image_id`),
  ADD CONSTRAINT `tb_like_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `tb_admin` (`admin_id`);
--
-- Database: `galerifoto`
--
CREATE DATABASE IF NOT EXISTS `galerifoto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `galerifoto`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin_telp` varchar(20) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`admin_id`, `admin_name`, `username`, `password`, `admin_telp`, `admin_email`, `admin_address`) VALUES
(2, 'Irawan', 'irawan', 'adminirawan', '085774137284', 'irawan@gmail.com', 'Jl. Raya Kadu Seungit'),
(3, 'Diana', 'diana', '1234', '085788992919', 'Diana@gmail.com', 'Suka Seneng Cikeusik'),
(4, 'Hazwan', 'hazwan', '123', '085787778811', 'hazwan@gmail.com', 'Cikeusik Pandeglang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_category`
--

CREATE TABLE `tb_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_category`
--

INSERT INTO `tb_category` (`category_id`, `category_name`) VALUES
(15, 'Hewan Liar'),
(16, 'Alam'),
(17, 'Bunga'),
(18, 'Makanan'),
(20, 'Sayuran'),
(21, 'Buah Buahan'),
(22, 'Lautan'),
(23, 'Pegunungan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_image`
--

CREATE TABLE `tb_image` (
  `image_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `image_description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `image_status` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_image`
--

INSERT INTO `tb_image` (`image_id`, `category_id`, `category_name`, `admin_id`, `admin_name`, `image_name`, `image_description`, `image`, `image_status`, `date_created`) VALUES
(34, 23, 'Arsitektur', 2, 'Irawan', 'Merancang Kota Modern', '<p>Foto ini menggambarkan kegiatan desain perencanaan membuat kota yang modern berdasarkan ramah lingkungan</p>\r\n', 'foto1701141777.jpg', 1, '2023-11-28 04:58:19'),
(35, 23, 'Arsitektur', 2, 'Irawan', 'Merancang Perumahan Elit', '<p>Foto ini menggambarkan kegiatan desain perencanaan membuat Rumah yang modern, nyaman untuk keluarga</p>\r\n', 'foto1701144257.jpg', 1, '2023-11-28 04:04:17'),
(36, 17, 'Satwa Liar', 3, 'Diana', 'Harimau Sumatra', 'Harimau sumatera (Panthera tigris sumatrae) adalah subspesies harimau yang habitat aslinya di pulau Sumatera. Hidup di hutan hujan tropis Sumatera, harimau ini adalah pemakan daging yang ulung. Dengan kecepatan lari hampir 40 mil per jam, mereka adalah predator yang tangguh di alam liar. Kemampuannya berburu, terutama di malam hari, memungkinkan mereka untuk mengintai mangsa dengan diam-diam sebelum menerkam dengan cepat.', 'foto1701147078.jpg', 1, '2023-11-28 04:51:18'),
(37, 17, 'Satwa Liar', 3, 'Diana', 'Badak Jawa', 'Badak Jawa (Rhinoceros sondaicus) adalah jenis satwa langka yang masuk kedalam 25 spesies prioritas utama konservasi Pemerintah Indonesia. Badak Jawa dapat hidup hingga 30-45 tahun di habitat aslinya. Mereka biasa tinggal di hutan hujan dataran rendah, padang rumput basah, dan dataran banjir yang luas. Badak ini merupakan makhluk yang suka menyendiri, kecuali saat pacaran dan saat membesarkan anak.', 'foto1701147926.jpg', 1, '2023-11-28 05:05:26'),
(38, 16, 'Hewan Peliharaan', 3, 'Diana', 'Kucing Angora', 'Anggora adalah kucing dengan ciri khas berbulu panjang yang indah. Anggora memiliki tubuh yang sedang dengan badan berotot yang panjang, ramping, langsing dan elegan. Anggora memiliki hidung yang panjang, kepala yang berbentuk segitiga, serta telinga yang panjang, lebar, dan berbentuk segitiga.', 'foto1701148582.jpg', 1, '2023-11-28 05:16:22'),
(39, 16, 'Hewan Peliharaan', 3, 'Diana', 'Ayam Kampung', 'Ayam kampung adalah kualitas daging nya yang memang lebih unggul di bandingkan dengan daging ayam lain nya, sehingga tidak heran jika rasa nya juga jauh lebih enak di bandingkan ayam lain.', 'foto1701148797.jpg', 1, '2023-11-28 05:19:57'),
(40, 14, 'Perjalanan', 4, 'Hazwan', 'Pantai Carita', 'Pantai Carita merupakan objek wisata yang terletak di Kabupaten Pandeglang. Fasilitas di Pantai Carita cukup lengkap yaitu Banana boat, snorkling, papan seluncur, diving, dan fasilitas lainnya. Banyak juga penginapan-penginapan sepanjang pesisir pantai dan atau rumah-rumah warga yang difungsikan untuk penginapan.', 'foto1701150076.jpg', 1, '2023-11-28 05:41:16'),
(41, 14, 'Perjalanan', 4, 'Hazwan', 'Curug Putri', 'Curug Putri Carita Pandeglang ini unik banget karena terbentuk dari lava yang membeku dan kemudian menjadi aliran sungai dengan batuan cantik.', 'foto1701150304.jpg', 1, '2023-11-28 05:45:04'),
(42, 17, 'Satwa Liar', 3, 'Diana', 'Singa Afrika', 'Singa adalah binatang yang menakutkan , tubuhnya besar, gesit dan garang, buas dan menyeramkan. Singa memiliki taring yang gampang melumatkan mangsanya, punya kuku yang kuat yang mampu menerkam mangsa hingga tak berdaya, dan mencabik- cabiknya. Singa sering digunakan untuk mewakili kekuatan, kegarangan dan kebuasan.', 'foto1701150517.jpg', 1, '2023-11-28 05:48:37');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeks untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `tb_image`
--
ALTER TABLE `tb_image`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `tb_image`
--
ALTER TABLE `tb_image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- Database: `galleri`
--
CREATE DATABASE IF NOT EXISTS `galleri` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `galleri`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin_telp` varchar(20) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_address` text NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`admin_id`, `admin_name`, `username`, `password`, `admin_telp`, `admin_email`, `admin_address`, `role`) VALUES
(2, 'irawan', 'irawan', 'adminirawan', '085774137284', 'irawan@gmail.com', 'Jl. Raya Kadu Seungit', 'user'),
(3, 'Diana', 'diana', '1234', '085788992919', 'Diana@gmail.com', 'Suka Seneng Cikeusik', 'user'),
(4, 'Hazwan', 'hazwan', '123', '085787778811', 'hazwan@gmail.com', 'Cikeusik Pandeglang', 'user'),
(6, 'admin', 'Admin', 'semuasama', 'semuasama', 'admin@gmail.com', 'semuasama', 'admin'),
(13, 'Muhamad Ilyas', 'Ilyas', '123', '083814101360', 'muhamadilyas26821@gmail.com', 'Kp.pasirlangu', 'user'),
(14, 'Muhamad Ilyas', 'Ilyas', '123', '083814101360', 'muhamadilyas26821@gmail.com', 'Kp.pasirlangu', 'user'),
(15, 'Afridol', 'afridol', 'bandung', '0896', 'aridol@gmail.com', 'Bandung', 'user'),
(16, 'Afridol', 'afridol', 'bandung', '0896', 'aridol@gmail.com', 'Bandung', 'user'),
(17, 'Afridol Putra', 'afridol', 'bandung', '0896', 'afridolputra@gmail.com', 'Kp.parongpong', 'user'),
(20, 'putra', 'putra', 'kilua', '0826', 'kilua@gmail.com', 'Kp.pajajaran', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_category`
--

CREATE TABLE `tb_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(25) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_category`
--

INSERT INTO `tb_category` (`category_id`, `category_name`, `image`) VALUES
(16, 'Alam', ''),
(18, 'Makanan', ''),
(20, 'Sayuran', ''),
(21, 'Buah Buahan', ''),
(22, 'Lautan', ''),
(26, 'Hewan Liar', 'foto1710704099.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_comment`
--

CREATE TABLE `tb_comment` (
  `comment_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `comment_text` text DEFAULT NULL,
  `comment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_comment`
--

INSERT INTO `tb_comment` (`comment_id`, `image_id`, `admin_id`, `comment_text`, `comment_date`) VALUES
(1, 71, 2, 'hallo\r\n', '2024-03-17 20:01:13'),
(2, 71, 2, 'holla\r\n', '2024-03-17 20:11:34'),
(3, 71, 2, 'hallow\r\n', '2024-03-17 20:16:13'),
(4, 75, 2, 'nanti lagi aja', '2024-03-18 03:29:28'),
(5, 75, 2, 'cyka blyat', '2024-03-18 03:29:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_image`
--

CREATE TABLE `tb_image` (
  `image_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `image_description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `image_status` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_image`
--

INSERT INTO `tb_image` (`image_id`, `category_id`, `category_name`, `admin_id`, `admin_name`, `image_name`, `image_description`, `image`, `image_status`, `date_created`) VALUES
(71, 16, 'Alam', 20, 'putra', 't', 't', 'foto1710704078.jpg', 1, '2024-03-17 19:34:38'),
(72, 16, 'Alam', 20, 'putra', 'q', 'q', 'foto1710704115.jpg', 1, '2024-03-17 19:35:15'),
(75, 18, '', 20, 'putra', 'asasasas', 'asas', 'foto1710732532.jpg', 1, '2024-03-18 03:28:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_like`
--

CREATE TABLE `tb_like` (
  `like_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_like`
--

INSERT INTO `tb_like` (`like_id`, `image_id`, `admin_id`) VALUES
(1, 71, NULL),
(2, 71, NULL),
(3, 71, NULL),
(4, 75, NULL),
(5, 75, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeks untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `tb_comment`
--
ALTER TABLE `tb_comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indeks untuk tabel `tb_image`
--
ALTER TABLE `tb_image`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indeks untuk tabel `tb_like`
--
ALTER TABLE `tb_like`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `tb_comment`
--
ALTER TABLE `tb_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_image`
--
ALTER TABLE `tb_image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT untuk tabel `tb_like`
--
ALTER TABLE `tb_like`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_comment`
--
ALTER TABLE `tb_comment`
  ADD CONSTRAINT `tb_comment_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `tb_image` (`image_id`),
  ADD CONSTRAINT `tb_comment_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `tb_admin` (`admin_id`);

--
-- Ketidakleluasaan untuk tabel `tb_image`
--
ALTER TABLE `tb_image`
  ADD CONSTRAINT `tb_image_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `tb_admin` (`admin_id`),
  ADD CONSTRAINT `tb_image_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`category_id`);

--
-- Ketidakleluasaan untuk tabel `tb_like`
--
ALTER TABLE `tb_like`
  ADD CONSTRAINT `tb_like_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `tb_image` (`image_id`),
  ADD CONSTRAINT `tb_like_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `tb_admin` (`admin_id`);
--
-- Database: `gallery`
--
CREATE DATABASE IF NOT EXISTS `gallery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gallery`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery_album`
--

CREATE TABLE `gallery_album` (
  `AlbumID` int(11) NOT NULL,
  `NamaAlbum` varchar(255) NOT NULL,
  `Deskripsi` text DEFAULT NULL,
  `TanggalDibuat` date NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `gallery_album`
--

INSERT INTO `gallery_album` (`AlbumID`, `NamaAlbum`, `Deskripsi`, `TanggalDibuat`, `UserID`) VALUES
(2, 'binatang', 'ini album binatang', '2024-03-16', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery_foto`
--

CREATE TABLE `gallery_foto` (
  `FotoID` int(11) NOT NULL,
  `JudulFoto` varchar(255) NOT NULL,
  `DeskripsiFoto` text DEFAULT NULL,
  `Tanggal` date NOT NULL,
  `NamaFile` varchar(50) NOT NULL,
  `AlbumID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `gallery_foto`
--

INSERT INTO `gallery_foto` (`FotoID`, `JudulFoto`, `DeskripsiFoto`, `Tanggal`, `NamaFile`, `AlbumID`, `UserID`) VALUES
(14, 'jjkjkjk', 'mnmn', '2024-03-16', 'imagesssss.png', 2, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery_komentarfoto`
--

CREATE TABLE `gallery_komentarfoto` (
  `KomentarID` int(11) NOT NULL,
  `FotoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `IsiKomentar` text NOT NULL,
  `TanggalKomentar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery_likefoto`
--

CREATE TABLE `gallery_likefoto` (
  `LikelD` int(11) NOT NULL,
  `FotoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `TanggalLike` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery_user`
--

CREATE TABLE `gallery_user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `NamaLengkap` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `Role` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `gallery_user`
--

INSERT INTO `gallery_user` (`UserID`, `Username`, `Password`, `Email`, `NamaLengkap`, `Alamat`, `Role`) VALUES
(1, 'sani', 'b82ef4c44602c1146244738d9d768dcd', 'padil@gmail.com', 'padilgantenk', 'juahpisan', 'admin'),
(2, 'user', '827ccb0eea8a706c4c34a16891f84e7b', 'admin@gmail.com', 'adnn', 'dgfhg', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `gallery_album`
--
ALTER TABLE `gallery_album`
  ADD PRIMARY KEY (`AlbumID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indeks untuk tabel `gallery_foto`
--
ALTER TABLE `gallery_foto`
  ADD PRIMARY KEY (`FotoID`),
  ADD KEY `AlbumID` (`AlbumID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indeks untuk tabel `gallery_komentarfoto`
--
ALTER TABLE `gallery_komentarfoto`
  ADD PRIMARY KEY (`KomentarID`),
  ADD KEY `FotoID` (`FotoID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indeks untuk tabel `gallery_likefoto`
--
ALTER TABLE `gallery_likefoto`
  ADD PRIMARY KEY (`LikelD`),
  ADD KEY `FotoID` (`FotoID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indeks untuk tabel `gallery_user`
--
ALTER TABLE `gallery_user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `gallery_album`
--
ALTER TABLE `gallery_album`
  MODIFY `AlbumID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `gallery_foto`
--
ALTER TABLE `gallery_foto`
  MODIFY `FotoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `gallery_komentarfoto`
--
ALTER TABLE `gallery_komentarfoto`
  MODIFY `KomentarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `gallery_likefoto`
--
ALTER TABLE `gallery_likefoto`
  MODIFY `LikelD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `gallery_user`
--
ALTER TABLE `gallery_user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `gallery_album`
--
ALTER TABLE `gallery_album`
  ADD CONSTRAINT `gallery_album_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `gallery_user` (`UserID`);

--
-- Ketidakleluasaan untuk tabel `gallery_foto`
--
ALTER TABLE `gallery_foto`
  ADD CONSTRAINT `gallery_foto_ibfk_1` FOREIGN KEY (`AlbumID`) REFERENCES `gallery_album` (`AlbumID`),
  ADD CONSTRAINT `gallery_foto_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `gallery_user` (`UserID`);

--
-- Ketidakleluasaan untuk tabel `gallery_komentarfoto`
--
ALTER TABLE `gallery_komentarfoto`
  ADD CONSTRAINT `gallery_komentarfoto_ibfk_1` FOREIGN KEY (`FotoID`) REFERENCES `gallery_foto` (`FotoID`),
  ADD CONSTRAINT `gallery_komentarfoto_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `gallery_user` (`UserID`);

--
-- Ketidakleluasaan untuk tabel `gallery_likefoto`
--
ALTER TABLE `gallery_likefoto`
  ADD CONSTRAINT `gallery_likefoto_ibfk_1` FOREIGN KEY (`FotoID`) REFERENCES `gallery_foto` (`FotoID`),
  ADD CONSTRAINT `gallery_likefoto_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `gallery_user` (`UserID`);
--
-- Database: `kasir`
--
CREATE DATABASE IF NOT EXISTS `kasir` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kasir`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `idmenu` int(11) NOT NULL,
  `namamenu` varchar(100) DEFAULT NULL,
  `harga` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`idmenu`, `namamenu`, `harga`) VALUES
(2, 'Jus jeruk', 3000),
(4, 'Ayam goreng', 10000),
(5, 'Es kosong', 1000),
(7, 'menu bau', 1233),
(9, 'es hampir berisi', 5000),
(10, 'jus mangga', 6000),
(11, 'nasi ramas', 15000),
(12, 'ayam bakar', 8000),
(13, 'jus pokat', 5000),
(14, 'ayam kangkung', 10000),
(15, 'jasjus', 2000),
(16, 'sdfdsfsd', 10000),
(17, 'mzmz', 1000),
(18, 'sdkfhdsjhfds', 234),
(19, 'mnbv', 12333),
(20, 'mmnmn', 1000),
(21, 'mnmnmnm', 12344),
(22, 'zxzxzx', 123123213),
(23, 'qwq', 123123),
(24, 'nsnd', 10000),
(25, 'qaa', 1000),
(26, 'qaz', 10000),
(27, 'qazzz', 10000),
(28, 'kjfkjfk', 10000),
(29, 'mcnvcv', 15000),
(30, 'vcvcvcv', 1233),
(31, 'AYAM KECAP', 10000),
(32, 'sdfcvc', 10000),
(33, 'mzz', 2000),
(34, 'test', 10000),
(35, 'eee', 2000),
(36, 'e2', 10000),
(37, 'e123456', 10000),
(38, 'e3', 10000),
(39, 'JUS MANGGA', 10000),
(40, 'susu', 3000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idpelanggan` int(11) NOT NULL,
  `namapelanggan` varchar(80) DEFAULT NULL,
  `jeniskelamin` tinyint(1) DEFAULT NULL,
  `nohp` varchar(13) DEFAULT NULL,
  `alamat` varchar(95) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`idpelanggan`, `namapelanggan`, `jeniskelamin`, `nohp`, `alamat`) VALUES
(1, 'raga', 1, '085326161', 'lsjdflksjdf'),
(2, 'raga2', 1, '082137', 'jskdhfksjdf'),
(3, 'raga3', 1, '0853216111', 'jalan utama gang cipta'),
(4, 'raga4', 1, '0853216161', 'jalan utama gang cipta'),
(5, 'raga5', 1, '08532111', 'jalan utama gang cipta'),
(6, 'raga6', 1, '08532161744', 'jalan utama gcang'),
(7, 'raga7', 1, '08532161744', 'jalan utama gnacdf'),
(8, 'raga8', 1, '0853216', 'ksdfkshdf'),
(9, 'cool', 1, '08536344', 'jalan utama gang cipta'),
(10, 'cool2', 1, '08536314', 'jalan utama gang cipta'),
(11, 'cool3', 1, '085363213123', 'jalads'),
(12, 'cool4', 1, '923743264', 'sdfsdf'),
(13, 'cool5', 1, '3234', 'dfsdf'),
(14, 'cool6', 1, '085213', 'jhskjdfhsdf'),
(15, 'cool7', 1, '213123123', 'sdhfskdjfhdsf'),
(16, 'cool8', 1, '085363123', 'jalan utama gang cipta'),
(17, 'andi', 1, '234234234', 'jalan utama gang cipta'),
(18, 'cil2', 1, '192839213', 'jalan utama ganc tip\\r\\n'),
(19, 'cil3', 1, '234234234', 'jalan utama gang cipta'),
(20, 'cil4', 1, '072932384', 'kjhksdhfkdsf'),
(21, 'dika', 1, '078564856', 'ksdhfkshfsd');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `idpesanan` int(11) NOT NULL,
  `kodepesanan` varchar(15) DEFAULT NULL,
  `menu_idmenu` int(11) NOT NULL,
  `pelanggan_idpelanggan` int(11) NOT NULL,
  `user_iduser` int(11) NOT NULL,
  `jumlah` tinyint(1) NOT NULL,
  `dibuat` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`idpesanan`, `kodepesanan`, `menu_idmenu`, `pelanggan_idpelanggan`, `user_iduser`, `jumlah`, `dibuat`) VALUES
(3, 'ABCCCFB12DGAF3', 4, 1, 2, 1, '2019-02-21'),
(4, 'ABCCCFB12DGAF3', 5, 1, 2, 2, '2019-02-21'),
(5, 'ABADEDFDG3C51F', 14, 5, 2, 3, '2019-02-21'),
(7, 'ABBCBBFGBCE31F', 4, 21, 2, 2, '2019-02-25');

--
-- Trigger `pesanan`
--
DELIMITER $$
CREATE TRIGGER `before_delete_pesanan` BEFORE DELETE ON `pesanan` FOR EACH ROW UPDATE transaksi SET
transaksi.total = transaksi.total - (SELECT menu.harga * old.jumlah FROM menu WHERE menu.idmenu = old.menu_idmenu)
WHERE transaksi.idtransaksi = old.kodepesanan
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_transaksi` AFTER INSERT ON `pesanan` FOR EACH ROW INSERT INTO transaksi SET
transaksi.idtransaksi = new.kodepesanan,
transaksi.total = (SELECT menu.harga * new.jumlah FROM menu WHERE menu.idmenu = new.menu_idmenu)

ON duplicate KEY UPDATE transaksi.total = transaksi.total + (SELECT menu.harga * new.jumlah FROM menu WHERE menu.idmenu = new.menu_idmenu)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `idtransaksi` varchar(15) NOT NULL,
  `total` int(1) DEFAULT NULL,
  `bayar` int(4) DEFAULT 0,
  `kembalian` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`idtransaksi`, `total`, `bayar`, `kembalian`, `status`) VALUES
('ABADEDFDG3C51F', 30000, 32000, 2000, 1),
('ABBCBBFGBCE31F', 20000, 20000, 0, 1),
('ABCCCFB12DGAF3', 12000, 13000, 1000, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `namauser` varchar(80) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `akses` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`iduser`, `namauser`, `password`, `akses`) VALUES
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(3, 'naruto', 'cf9ee5bcb36b4936dd7064ee9b2f139e', 2),
(4, 'sasuke', '93207db25ad357906be2fd0c3f65f3dc', 3),
(5, 'owner', '72122ce96bfec66e2396d2e25225d70a', 4),
(6, 'anto', '2c946c0178ec72aaefa54f786540d301', 3);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_pesanan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_pesanan` (
`idpesanan` int(11)
,`kodepesanan` varchar(15)
,`namapelanggan` varchar(80)
,`namamenu` varchar(100)
,`jumlah` tinyint(1)
,`total` bigint(14)
,`dibuat` date
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_transaksi`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_transaksi` (
`idtransaksi` varchar(15)
,`total` int(1)
,`bayar` int(4)
,`kembalian` int(3)
,`status` tinyint(1)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `v_pesanan`
--
DROP TABLE IF EXISTS `v_pesanan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pesanan`  AS SELECT `pesanan`.`idpesanan` AS `idpesanan`, `pesanan`.`kodepesanan` AS `kodepesanan`, `pelanggan`.`namapelanggan` AS `namapelanggan`, `menu`.`namamenu` AS `namamenu`, `pesanan`.`jumlah` AS `jumlah`, (select `menu`.`harga` * `pesanan`.`jumlah` from `menu` where `menu`.`idmenu` = `pesanan`.`menu_idmenu`) AS `total`, `pesanan`.`dibuat` AS `dibuat` FROM ((`pesanan` join `pelanggan` on(`pelanggan`.`idpelanggan` = `pesanan`.`pelanggan_idpelanggan`)) join `menu` on(`menu`.`idmenu` = `pesanan`.`menu_idmenu`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_transaksi`
--
DROP TABLE IF EXISTS `v_transaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_transaksi`  AS SELECT `transaksi`.`idtransaksi` AS `idtransaksi`, `transaksi`.`total` AS `total`, `transaksi`.`bayar` AS `bayar`, `transaksi`.`kembalian` AS `kembalian`, `transaksi`.`status` AS `status` FROM `transaksi` WHERE `transaksi`.`status` = 0 ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idmenu`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idpelanggan`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`idpesanan`),
  ADD KEY `fk_pesanan_menu1_idx` (`menu_idmenu`),
  ADD KEY `fk_pesanan_pelanggan1_idx` (`pelanggan_idpelanggan`),
  ADD KEY `user_iduser` (`user_iduser`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`idtransaksi`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `idmenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `idpelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `idpesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `fk_pesanan_menu1` FOREIGN KEY (`menu_idmenu`) REFERENCES `menu` (`idmenu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pesanan_pelanggan1` FOREIGN KEY (`pelanggan_idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data untuk tabel `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data untuk tabel `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'db', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"db_penjualan\",\"db_perpus\",\"db_perpus2\",\"db_perpustakaan\",\"db_perpustakan\",\"db_toko\",\"db_union\",\"phpmyadmin\",\"test\",\"toko_laravel\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Struktur tabel @TABLE@\",\"latex_structure_continued_caption\":\"Struktur tabel @TABLE@ (dilanjutkan)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Isi tabel @TABLE@\",\"latex_data_continued_caption\":\"Isi tabel @TABLE@ (dilanjutkan)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'server', 'db_toko', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"db_penjualan\",\"db_perpus\",\"db_perpus2\",\"db_perpustakaan\",\"db_perpustakan\",\"db_toko\",\"db_union\",\"phpmyadmin\",\"test\",\"toko_laravel\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Struktur tabel @TABLE@\",\"latex_structure_continued_caption\":\"Struktur tabel @TABLE@ (dilanjutkan)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Isi tabel @TABLE@\",\"latex_data_continued_caption\":\"Isi tabel @TABLE@ (dilanjutkan)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data untuk tabel `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"db_toko\",\"table\":\"member\"},{\"db\":\"db_toko\",\"table\":\"login\"},{\"db\":\"kasir\",\"table\":\"petugas\"},{\"db\":\"db_toko\",\"table\":\"role\"},{\"db\":\"db_toko\",\"table\":\"user\"},{\"db\":\"db_toko\",\"table\":\"kategori\"},{\"db\":\"db_toko\",\"table\":\"barang\"},{\"db\":\"db_perpus2\",\"table\":\"books\"},{\"db\":\"db_perpus2\",\"table\":\"users\"},{\"db\":\"db_perpustakan\",\"table\":\"admins\"}]');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data untuk tabel `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-02-19 15:40:16', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"id\",\"NavigationWidth\":199.66666412353516}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeks untuk tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeks untuk tabel `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeks untuk tabel `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeks untuk tabel `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeks untuk tabel `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeks untuk tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeks untuk tabel `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeks untuk tabel `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeks untuk tabel `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeks untuk tabel `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `toko_laravel`
--
CREATE DATABASE IF NOT EXISTS `toko_laravel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `toko_laravel`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategory` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_member` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `kabupaten` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `detail_alamat` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_15_040316_create_categories_table', 1),
(6, '2023_11_17_031717_create_subcategories_table', 1),
(7, '2023_11_17_064229_create_sliders_table', 1),
(8, '2023_11_17_083353_create_products_table', 1),
(9, '2023_11_20_035732_create_members_table', 1),
(10, '2023_11_20_064854_create_testimonis_table', 1),
(11, '2023_11_20_074535_create_reviews_table', 1),
(12, '2023_11_21_020115_create_pesanans_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanans`
--

CREATE TABLE `pesanans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_member` int(11) NOT NULL,
  `invoice` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan_details`
--

CREATE TABLE `pesanan_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_subkategory` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL,
  `diskon` int(11) NOT NULL,
  `bahan` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `ukuran` varchar(255) NOT NULL,
  `warna` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_member` varchar(255) NOT NULL,
  `id_produk` varchar(255) NOT NULL,
  `review` text NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_slider` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_category` int(11) NOT NULL,
  `nama_subkategory` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `testimonis`
--

CREATE TABLE `testimonis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_testimoni` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administator', 'admin@gmail.com', '2024-02-06 17:42:19', '$2y$10$6n5ZXJZibqr82mClXYhQLu1A4iwUdIiJIeT/ZPWvHXOgOwHcWzjs2', NULL, '2024-02-06 17:42:19', '2024-02-06 17:42:19');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `pesanans`
--
ALTER TABLE `pesanans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pesanan_details`
--
ALTER TABLE `pesanan_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `testimonis`
--
ALTER TABLE `testimonis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pesanans`
--
ALTER TABLE `pesanans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pesanan_details`
--
ALTER TABLE `pesanan_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `testimonis`
--
ALTER TABLE `testimonis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
