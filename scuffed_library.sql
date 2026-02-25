/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 10.4.27-MariaDB : Database - db_library
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_library` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;

USE `db_library`;

/*Table structure for table `anggota` */

DROP TABLE IF EXISTS `anggota`;

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `nis` varchar(50) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `status` enum('Admin','Siswa','aktif') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*Data for the table `anggota` */

insert  into `anggota`(`id`,`user_id`,`nis`,`kelas`,`alamat`,`status`) values (1,8,NULL,NULL,NULL,NULL),(3,10,NULL,NULL,NULL,NULL),(4,11,NULL,NULL,NULL,NULL),(5,12,NULL,NULL,NULL,NULL),(6,13,'23334','12','11','aktif'),(7,14,'23334','12','','aktif'),(9,16,'23334','12','jl. ketan','aktif');

/*Table structure for table `buku` */

DROP TABLE IF EXISTS `buku`;

CREATE TABLE `buku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_buku` varchar(50) DEFAULT NULL,
  `judul` varchar(50) DEFAULT NULL,
  `pengarang` varchar(50) DEFAULT NULL,
  `penerbit` varchar(50) DEFAULT NULL,
  `tahun` date DEFAULT NULL,
  `stok` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*Data for the table `buku` */

insert  into `buku`(`id`,`kode_buku`,`judul`,`pengarang`,`penerbit`,`tahun`,`stok`) values (1,'2323','water','tonus','angga','0000-00-00','2'),(3,'2323','water','tonus','angga','3222-02-23','11'),(6,'234245','malaysia','jamal','angga','3222-02-23','1'),(7,'1222026','Resep Puasa','roma','oreo','2026-02-12','100');

/*Table structure for table `peminjaman` */

DROP TABLE IF EXISTS `peminjaman`;

CREATE TABLE `peminjaman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anggota_id` int(11) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `nomor_peminjaman` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*Data for the table `peminjaman` */

insert  into `peminjaman`(`id`,`anggota_id`,`tgl_pinjam`,`tgl_kembali`,`status`,`nomor_peminjaman`) values (23,7,'2026-02-25','2026-02-27','dipinjam',NULL),(22,9,'2026-02-25','2026-02-28','dipinjam',NULL),(21,9,'2026-02-25','2026-02-26','dipinjam',NULL),(19,7,'2026-02-25','2026-03-25','dikembalikan',NULL),(18,6,'2026-02-25','2026-02-28','dikembalikan',NULL),(20,6,'2026-02-12','2026-02-13','dikembalikan',NULL);

/*Table structure for table `peminjaman_deteksi` */

DROP TABLE IF EXISTS `peminjaman_deteksi`;

CREATE TABLE `peminjaman_deteksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peminjaman_id` int(11) DEFAULT NULL,
  `buku_id` int(11) DEFAULT NULL,
  `qty` decimal(50,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*Data for the table `peminjaman_deteksi` */

/*Table structure for table `pengembalian` */

DROP TABLE IF EXISTS `pengembalian`;

CREATE TABLE `pengembalian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peminjaman_id` int(11) DEFAULT NULL,
  `tgl_pengembalian` date DEFAULT NULL,
  `denda` decimal(50,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*Data for the table `pengembalian` */

insert  into `pengembalian`(`id`,`peminjaman_id`,`tgl_pengembalian`,`denda`) values (12,18,'2026-02-25','0'),(11,19,'2026-02-25','0'),(10,20,'2026-02-25','333000');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('Admin','User') DEFAULT 'User',
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`nama`,`username`,`password`,`role`,`created_at`) values (2,'admin','admin','$2y$10$dzHeaZo3rdx66aG4OaJGcu9GIwM3rNlfH9QSSJFeNRirKMnSde.Mi','Admin',NULL),(3,'admin','admin','$2y$10$rl6ly1VpusHSdJ3ZbdSsOOTpLH1g7/i9CTCyS1Nc7L8es9nQrxXXO','Admin',NULL),(4,'admin','admin','$2y$10$bShec8PmGgz/fHmft3uF8.muWYr0snq8IgkbwT429rB8mWfuBs3Vy','Admin',NULL),(19,'user','user','$2y$10$lMtCrly1tqvY/ZPrOjEtUemPwDHOJ.bofHqvObO43EFEpE9WzpRju','User',NULL),(16,'Bolu Keju','bolukentan','$2y$10$mgVZhkVIiUQfYlB2dBNyh.PWKmYwSJRU63sjh0k3W0RhxKdJZKBkm','',NULL),(13,'Tengku','user','$2y$10$o3Zk/o34NBJTw0oQT/3/9eXS0h23RlL7iEsE9JDiVS5zH12OQkHNi','User',NULL),(14,'Tengku','user','$2y$10$o3FGlhkNvXoK.YVhF8HHg..68y0GXDCeI3BCbxKAehv/8O0KuBFgW','',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
