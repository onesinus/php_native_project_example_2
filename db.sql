-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2021 at 07:05 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zakat`
--

-- --------------------------------------------------------

--
-- Table structure for table `masters`
--

CREATE TABLE `masters` (
  `id` int(11) NOT NULL,
  `code` varchar(25) NOT NULL,
  `description` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `masters`
--

INSERT INTO `masters` (`id`, `code`, `description`) VALUES
(4, 'M01', 'Zakat Fitrah'),
(5, 'M05', 'Zakat Harta'),
(6, 'M06', 'Infak'),
(7, 'M07', 'Sedekah');

-- --------------------------------------------------------

--
-- Table structure for table `mustahik`
--

CREATE TABLE `mustahik` (
  `id` int(11) NOT NULL,
  `name` varchar(125) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mustahik`
--

INSERT INTO `mustahik` (`id`, `name`, `phone_number`, `address`) VALUES
(1, 'Bambang Skuy', '912092101920', 'Cakung Ajah'),
(3, 'Udin Penyok', '921873982173', 'Jagakarsa'),
(5, 'Oke', '0120391', 'Test'),
(6, 'Okelah kalau gitu', '231321', 'test'),
(7, 'Gaje', '123213213', 'TEst');

-- --------------------------------------------------------

--
-- Table structure for table `muzakki`
--

CREATE TABLE `muzakki` (
  `id` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `phone_number` varchar(25) NOT NULL,
  `type` varchar(25) NOT NULL,
  `receive_type` varchar(25) NOT NULL,
  `receive_date` datetime DEFAULT NULL,
  `master_id` int(11) NOT NULL,
  `description` varchar(512) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(16,2) NOT NULL,
  `grand_total` decimal(16,2) NOT NULL,
  `is_validated` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(10) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `muzakki`
--

INSERT INTO `muzakki` (`id`, `name`, `phone_number`, `type`, `receive_type`, `receive_date`, `master_id`, `description`, `qty`, `total`, `grand_total`, `is_validated`, `status`, `created_by`, `created_date`, `updated_by`, `updated_date`, `is_deleted`) VALUES
(5, 'Ibnu Umar', '0895387836483', 'UANG', '1', NULL, 1, 'Pembayaran Zakat  Fitrah 1 keluarga', 2, '50000.00', '100000.00', 0, 'Open', 0, '2021-01-09 13:28:02', NULL, NULL, 1),
(6, 'test', '0912039210', 'Beras/Makanan/Barang/lain', 'Transfer', '2021-12-31 00:00:00', 4, 'Asoy', 24, '40000.00', '960000.00', 0, 'Open', 18, '2021-01-12 21:08:26', NULL, NULL, 1),
(7, 'Oke', '09120390213', 'Uang', 'Antar', '2021-12-31 00:00:00', 5, 'Zakat Sekeluarga Bray', 20, '150000.00', '3000000.00', 0, 'Closed', 18, '2021-01-14 20:22:19', 18, '2021-01-22 20:54:00', 0),
(8, 'Asikuy', '12321321', 'Makanan', 'Cash/Jemput', '2021-01-14 00:00:00', 7, 'Paboa Ma Jolo', 2, '10.00', '20.00', 0, 'Closed', 18, '2021-01-14 21:24:53', 18, '2021-01-24 12:35:14', 0),
(9, 'Boasa Dang Tibu', '081293891', 'Uang', 'Transfer', '2021-12-31 00:00:00', 5, 'Keluarga Boasa', 1, '20000000.00', '20000000.00', 0, 'Open', 0, '2021-01-14 21:34:38', NULL, NULL, 0),
(10, 'Hape ro Ma siboru', '12321321', 'Beras', 'Cash/Jemput', '2021-12-30 00:00:00', 7, 'Haduan', 2, '2500000.00', '5000000.00', 0, 'Closed', 0, '2021-01-14 21:38:47', 18, '2021-01-14 22:29:45', 0),
(11, 'Hape ro Ma siboru', '12321321', 'Beras', 'Cash/Jemput', '2021-12-30 00:00:00', 7, 'Haduan', 2, '2500000.00', '5000000.00', 0, 'Pickup', 0, '2021-01-14 21:38:56', NULL, NULL, 1),
(12, 'ABC', '123', 'Uang', 'Transfer', '2021-12-31 00:00:00', 5, 'AWWWWW', 1, '2000000.00', '2000000.00', 0, 'Open', 0, '2021-01-14 21:39:19', NULL, NULL, 1),
(13, 'test', '123', 'Uang', 'Transfer', '2021-12-31 00:00:00', 4, 'test', 1, '2.00', '2.00', 0, 'Open', 0, '2021-01-14 21:39:50', NULL, NULL, 0),
(14, 'asik', '12321', 'Beras', 'Cash/Jemput', '2021-12-31 00:00:00', 5, 'Test', 12, '23.00', '276.00', 0, 'Closed', 0, '2021-01-14 21:54:29', 18, '2021-01-16 14:34:34', 0),
(15, 'Test', 'Test', 'Uang', 'Transfer', '2021-01-15 00:00:00', 4, 'Zakat Transfer', 20, '50000.00', '1000000.00', 0, 'Open', 18, '2021-01-16 14:30:33', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `type` varchar(25) DEFAULT NULL,
  `total` decimal(16,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `approved_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `type`, `total`, `status`, `created_by`, `created_date`, `approved_date`, `updated_by`, `updated_date`, `is_deleted`) VALUES
(29, 'Pengeluaran', '1750000.00', 'Closed', 18, '2021-01-24 12:34:28', NULL, NULL, NULL, 0),
(30, 'Penyaluran', '250000.00', 'Open', 18, '2021-01-24 12:35:46', NULL, NULL, NULL, 0),
(31, 'Penyaluran', '150000.00', 'Open', 18, '2021-01-24 12:38:26', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

CREATE TABLE `transaction_details` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `balance` decimal(16,2) NOT NULL,
  `remaining_balance` decimal(16,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `total_unit` int(11) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`id`, `transaction_id`, `note`, `balance`, `remaining_balance`, `amount`, `total_unit`, `type`) VALUES
(18, 29, 'Bayar Kebersihan', '3000000.00', '1250000.00', '1750000.00', 0, 'Uang'),
(19, 30, 'Bambang Skuy, Oke', '20.00', '13.00', '7.00', 2, 'Makanan'),
(20, 30, '', '5000276.00', '0.00', '0.00', 0, 'Beras'),
(21, 30, 'Bambang Skuy, Udin Penyok, Oke, Okelah kalau gitu, Gaje', '1250000.00', '1000000.00', '250000.00', 5, 'Uang'),
(22, 31, 'Udin Penyok', '13.00', '10.00', '3.00', 1, 'Makanan'),
(23, 31, 'Bambang Skuy, Oke', '5000276.00', '5000000.00', '276.00', 2, 'Beras'),
(24, 31, 'Bambang Skuy', '1000000.00', '850000.00', '150000.00', 1, 'Uang');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` varchar(25) NOT NULL,
  `nik` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `nik`, `jabatan`) VALUES
(18, 'it', '$2y$10$AoNFRLodB.EJHX4mrKzOLe4EpYjYdg1rQVVS9z2nhD16TFGkxlWFG', 'IT', '1601110069', 'IT Staf'),
(20, 'ketua', '$2y$10$nNN4e5fT1QEfeUOX58gjaeFgAsM0jSj6cLUaWG3qVyfcaYby61/bS', 'Ketua', '1601110080', 'Ketua');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `masters`
--
ALTER TABLE `masters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mustahik`
--
ALTER TABLE `mustahik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `muzakki`
--
ALTER TABLE `muzakki`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `masters`
--
ALTER TABLE `masters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mustahik`
--
ALTER TABLE `mustahik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `muzakki`
--
ALTER TABLE `muzakki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `transaction_details`
--
ALTER TABLE `transaction_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
