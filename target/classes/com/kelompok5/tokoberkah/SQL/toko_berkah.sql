-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Mar 2022 pada 14.37
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_berkah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_pengguna` char(6) NOT NULL,
  `nama_anggota` varchar(30) NOT NULL,
  `alamat_anggota` varchar(80) NOT NULL,
  `telp_anggota` char(12) NOT NULL,
  `tipe_anggota` char(5) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_pengguna`, `nama_anggota`, `alamat_anggota`, `telp_anggota`, `tipe_anggota`, `password`) VALUES
('admin', 'Admin', '', '081444555666', 'admin', 'admin'),
('agim', 'Gymnastiar', 'Madiun', '081999888777', 'kasir', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(6) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `id_kategori` char(6) NOT NULL,
  `id_satuan` char(6) NOT NULL,
  `jumlah` double NOT NULL,
  `barcode` varchar(15) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart_pembelian`
--

CREATE TABLE `cart_pembelian` (
  `id_pembelian` char(20) NOT NULL,
  `id_barang` char(6) NOT NULL,
  `qty` double NOT NULL,
  `harga_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart_penjualan`
--

CREATE TABLE `cart_penjualan` (
  `id_tranksaksi` char(20) NOT NULL,
  `id_barang` char(6) NOT NULL,
  `qty` double NOT NULL,
  `total_harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart_retur_cus`
--

CREATE TABLE `cart_retur_cus` (
  `id_retur` char(6) NOT NULL,
  `id_barang` char(6) NOT NULL,
  `qty` double NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `tanggal_retur` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart_retur_supplier`
--

CREATE TABLE `cart_retur_supplier` (
  `id_retur_sup` char(6) NOT NULL,
  `status` varchar(5) NOT NULL,
  `id_barang` char(6) NOT NULL,
  `qty` double NOT NULL,
  `keterangan` varchar(15) NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `tanggal_retur` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pembelian`
--

CREATE TABLE `detail_pembelian` (
  `id_pembelian` char(20) NOT NULL,
  `id_barang` char(6) NOT NULL,
  `qty` double NOT NULL,
  `harga_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id_penjualan` char(20) NOT NULL,
  `id_barang` char(6) NOT NULL,
  `qty` double NOT NULL,
  `harga_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `detail_penjualan`
--
DELIMITER $$
CREATE TRIGGER `STOK` AFTER INSERT ON `detail_penjualan` FOR EACH ROW BEGIN
 UPDATE barang SET jumlah=jumlah-NEW.qty
 WHERE id_barang=NEW.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_retur_cos`
--

CREATE TABLE `detail_retur_cos` (
  `id_retur` char(6) NOT NULL,
  `id_barang` char(6) NOT NULL,
  `qty` double NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `tanggal_retur` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_retur_supplier`
--

CREATE TABLE `detail_retur_supplier` (
  `id_retur_sup` char(6) NOT NULL,
  `status` varchar(5) NOT NULL,
  `id_barang` char(6) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `qty` double NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `tanggal_retur` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` char(6) NOT NULL,
  `jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` char(20) NOT NULL,
  `tanggal_tranksaksi` date NOT NULL,
  `jam_transaksi` time NOT NULL,
  `uang` double NOT NULL,
  `kembalian` double NOT NULL,
  `id_anggota` char(6) NOT NULL,
  `id_supplier` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` char(20) NOT NULL,
  `tanggal_tranksaksi` date NOT NULL,
  `jam_transaksi` time NOT NULL,
  `total_bayar` double NOT NULL,
  `uang` double NOT NULL,
  `kembalian` double NOT NULL,
  `id_anggota` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `tanggal_tranksaksi`, `jam_transaksi`, `total_bayar`, `uang`, `kembalian`, `id_anggota`) VALUES
('000001', '2021-12-16', '16:51:30', 64000, 70000, 6000, 'agim'),
('000002', '2021-12-16', '17:12:38', 617000, 650000, 33000, 'agim');

-- --------------------------------------------------------

--
-- Struktur dari tabel `retur_customer`
--

CREATE TABLE `retur_customer` (
  `id_retur_cus` char(6) NOT NULL,
  `id_pennjualan` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `retur_supplier`
--

CREATE TABLE `retur_supplier` (
  `id_retur_sup` char(6) NOT NULL,
  `id_supplier` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuan`
--

CREATE TABLE `satuan` (
  `id_satuan` char(6) NOT NULL,
  `satuan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` char(6) NOT NULL,
  `nama_supplier` char(30) NOT NULL,
  `alamat_supplier` varchar(80) NOT NULL,
  `telp_supplier` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat_supplier`, `telp_supplier`) VALUES
('S00001', 'Popo', 'Bubulan,Bojonegoro', '081217634111'),
('S00002', 'Wishal', 'Mangil,Jember', '082232937743'),
('S00003', 'Karen', 'Jagalan,Solo', '083864672711'),
('S00004', 'Erik', 'Kepatihan,Jember', '082228455809'),
('S00005', 'Putra', 'Bungatan.Situbondo', '082333564179'),
('S00006', 'Satria', 'Situbondo,Situbondo', '082332991989'),
('S00007', 'Nila', 'Balongpanggang,Gresik', '089504395516'),
('S00008', 'Andru', 'Pasanggaran,Banyuwangi', '85232398005'),
('S00009', 'Ammar', 'Sampusari,Jember', '085335362801'),
('S00010', 'Daffa', 'Banyuanyar,Probolinggo', '089522687919'),
('S00011', 'Doni', 'Sidoarjo', '081222333444');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_kategori` (`id_kategori`,`id_satuan`),
  ADD KEY `id_satuan` (`id_satuan`);

--
-- Indeks untuk tabel `cart_pembelian`
--
ALTER TABLE `cart_pembelian`
  ADD KEY `id_pembelian` (`id_pembelian`,`id_barang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `cart_penjualan`
--
ALTER TABLE `cart_penjualan`
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_tranksaksi` (`id_tranksaksi`);

--
-- Indeks untuk tabel `cart_retur_cus`
--
ALTER TABLE `cart_retur_cus`
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_retur` (`id_retur`);

--
-- Indeks untuk tabel `cart_retur_supplier`
--
ALTER TABLE `cart_retur_supplier`
  ADD PRIMARY KEY (`id_retur_sup`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_pembelian` (`id_pembelian`);

--
-- Indeks untuk tabel `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD KEY `id_tranksaksi` (`id_penjualan`,`id_barang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `detail_retur_cos`
--
ALTER TABLE `detail_retur_cos`
  ADD PRIMARY KEY (`id_retur`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `detail_retur_supplier`
--
ALTER TABLE `detail_retur_supplier`
  ADD UNIQUE KEY `id_retur_sup` (`id_retur_sup`),
  ADD KEY `id_retur_sup_2` (`id_retur_sup`),
  ADD KEY `id_retur_sup_3` (`id_retur_sup`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_tranksaksi` (`id_penjualan`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- Indeks untuk tabel `retur_customer`
--
ALTER TABLE `retur_customer`
  ADD PRIMARY KEY (`id_retur_cus`),
  ADD KEY `id_pennjualan` (`id_pennjualan`);

--
-- Indeks untuk tabel `retur_supplier`
--
ALTER TABLE `retur_supplier`
  ADD PRIMARY KEY (`id_retur_sup`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indeks untuk tabel `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`id_satuan`) REFERENCES `satuan` (`id_satuan`),
  ADD CONSTRAINT `barang_ibfk_3` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

--
-- Ketidakleluasaan untuk tabel `cart_pembelian`
--
ALTER TABLE `cart_pembelian`
  ADD CONSTRAINT `cart_pembelian_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `cart_penjualan`
--
ALTER TABLE `cart_penjualan`
  ADD CONSTRAINT `cart_penjualan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD CONSTRAINT `detail_pembelian_ibfk_1` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_pembelian_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_penjualan_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `detail_retur_cos`
--
ALTER TABLE `detail_retur_cos`
  ADD CONSTRAINT `detail_retur_cos_ibfk_1` FOREIGN KEY (`id_retur`) REFERENCES `retur_customer` (`id_retur_cus`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_retur_cos_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `detail_retur_supplier`
--
ALTER TABLE `detail_retur_supplier`
  ADD CONSTRAINT `detail_retur_supplier_ibfk_1` FOREIGN KEY (`id_retur_sup`) REFERENCES `retur_supplier` (`id_retur_sup`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_retur_supplier_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`);

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_pengguna`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
