-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2020 at 09:01 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_banhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(14, 14, '2017-03-23', 160000, 'COD', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 13, '2017-03-21', 400000, 'ATM', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 12, '2017-03-21', 520000, 'COD', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 11, '2017-03-21', 420000, 'COD', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(15, 15, '2017-03-24', 220000, 'COD', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(18, 15, 62, 5, 220000, '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(17, 14, 2, 1, 160000, '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(16, 13, 60, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(15, 13, 59, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(14, 12, 60, 2, 200000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(13, 12, 61, 1, 120000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(12, 11, 61, 1, 120000, '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(11, 11, 57, 2, 150000, '2017-03-21 07:16:09', '2017-03-21 07:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(15, 'ê', 'Nữ', 'huongnguyen@gmail.com', 'e', 'e', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(14, 'hhh', 'nam', 'huongnguyen@gmail.com', 'Lê thị riêng', '99999999999999999', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '23456789', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 'Khoa phạm', 'Nam', 'khoapham@gmail.com', 'Lê thị riêng', '1234567890', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '234567890-', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_12_21_104331_vp_categories', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `create_at`, `update_at`) VALUES
(1, 'Mùa trung thu năm nay, Hỷ Lâm Môn muốn gửi đến quý khách hàng sản phẩm mới xuất hiện lần đầu tiên tại Việt nam \"Bánh trung thu Bơ Sữa HongKong\".', 'Những ý tưởng dưới đây sẽ giúp bạn sắp xếp tủ quần áo trong phòng ngủ chật hẹp của mình một cách dễ dàng và hiệu quả nhất. ', 'sample1.jpg', '2017-03-11 06:20:23', '0000-00-00 00:00:00'),
(2, 'Tư vấn cải tạo phòng ngủ nhỏ sao cho thoải mái và thoáng mát', 'Chúng tôi sẽ tư vấn cải tạo và bố trí nội thất để giúp phòng ngủ của chàng trai độc thân thật thoải mái, thoáng mát và sáng sủa nhất. ', 'sample2.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(3, 'Đồ gỗ nội thất và nhu cầu, xu hướng sử dụng của người dùng', 'Đồ gỗ nội thất ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Xu thế của các gia đình hiện nay là muốn đem thiên nhiên vào nhà ', 'sample3.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(4, 'Hướng dẫn sử dụng bảo quản đồ gỗ, nội thất.', 'Ngày nay, xu hướng chọn vật dụng làm bằng gỗ để trang trí, sử dụng trong văn phòng, gia đình được nhiều người ưa chuộng và quan tâm. Trên thị trường có nhiều sản phẩm mẫu ', 'sample4.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(5, 'Phong cách mới trong sử dụng đồ gỗ nội thất gia đình', 'Đồ gỗ nội thất gia đình ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Phong cách sử dụng đồ gỗ hiện nay của các gia đình hầu h ', 'sample5.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(1, 'Rau Muống 4KFarm túi 200-300g', 1, 'Rau sạch theo tiêu chuẩn VietGAP', 23000, 20000, '1.jpg', 'g', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(2, 'Cải Thìa 4KFarm túi 200-300g', 1, '', 23000, 0, '2.jpg', 'kg', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(3, 'Cải Ngọt 4KFarm túi 200-300g', 1, '', 16000, 0, '3.jpg', 'kg', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(4, 'Rau Mùng Tơi 4KFarm túi 200-300g', 1, '', 11900, 0, '4.jpg', 'kg', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(5, 'Rau Dền 4KFarm túi 200-300g', 1, '', 25000, 22900, '5.jpg', 'kg', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(6, 'Cải Ngồng 4KFarm túi 200-300g', 1, '', 18000, 17500, '6.jpg', 'kg', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(7, 'Cải Dúng 4KFarm túi 200-300g', 1, '', 28000, 0, '7.jpg', 'kg', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(8, 'Cải Bẹ Xanh 4KFarm túi 200-300g', 1, '', 55800, 54500, '8.jpg', 'kg', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(9, 'Táo Ambrosia nhập khẩu Mỹ hộp 1kg', 2, '', 89000, 85000, '9.jpg', 'kg', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(10, 'Cam vàng Valencia Úc nhập khẩu hộp 1kg', 2, '', 11000, 10000, '10.jpg', 'kg', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(11, 'Táo đỏ Red Delicious nhập khẩu Mỹ hộp 1kg ', 2, '', 25000, 24000, '11.jpg', 'kg', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(12, 'Táo Gala nhập khẩu New Zealand hộp 1kg', 2, '', 25000, 0, '12.jpg', 'kg', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(14, 'Lê Singo nhập khẩu Trung Quốc hộp 1kg', 2, ' ', 58000, 55000, '13.jpg', 'kg', 1, '2020-11-12 15:18:07', '2020-11-11 17:00:00'),
(15, 'Lê đường nhập khẩu Trung Quốc hộp 1kg', 2, NULL, 75000, 73000, '14.jpg', 'kg', 0, '2020-11-12 15:22:30', '2020-11-12 15:23:27'),
(16, 'Thanh cua surimi vị cua 3N Foods gói 250g', 3, NULL, 40000, 0, '16.jpg', 'kg', 1, NULL, NULL),
(18, '1/6\r\nTôm thịt Đôi Đũa Vàng 31/40 gói 252g', 3, NULL, 90000, 85000, '19.jpg', 'kg', 0, NULL, NULL),
(19, 'Thịt càng ghẹ đông lạnh gói 250g', 3, NULL, 15000, 0, '17.jpg', 'kg', 1, NULL, NULL),
(20, 'Cá trứng Đôi Đũa Vàng khay 400g', 3, NULL, 290000, 285000, '20.jpg', 'kg', 0, NULL, NULL),
(21, 'Xúc xích Deli Sumo Le Gourmet gói 250g', 4, NULL, 15000, 12000, '21.jpg', 'hộp', 1, NULL, NULL),
(22, 'Ba rọi xông khói thái hạt lựu gói 200g', 4, NULL, 10000, NULL, '22.jpg', 'hộp', 0, NULL, NULL),
(23, 'Ba rọi xông khói xắt lát gói 200g', 4, NULL, 50000, NULL, '23.jpg', 'hộp', 0, NULL, NULL),
(24, 'Xúc xích hải sản La Cusina gói 500g', 4, NULL, 60000, 55000, '24.jpg', 'hộp', 1, NULL, NULL),
(25, 'Chả bò Le Gourmet cây 200g', 4, NULL, 30000, 28000, '25.jpg', 'hộp', 0, NULL, NULL),
(26, 'Xúc xích vườn bia Bếp 5 sao gói 200g', 4, NULL, 30000, NULL, '26.jpg', 'hộp', 1, NULL, NULL),
(27, 'Chả lụa Hưng Phát cây 200g', 4, NULL, 10000, NULL, '27.jpg', 'hộp', 1, NULL, NULL),
(28, 'Chả quế mini C.P gói 300g', 4, NULL, 20000, 18000, '28.jpg', 'hộp', 0, NULL, NULL),
(29, 'C2 hương chanh 230ml', 7, NULL, 8000, NULL, '29.jpg', 'lon', 1, NULL, NULL),
(30, 'Nước bù khoáng Revive 500ml', 7, NULL, 7800, NULL, '30.jpg', 'lon', 0, NULL, NULL),
(31, 'Pepsi Cola 1.5 lít', 7, NULL, 7500, NULL, '31.jpg', 'lon', 0, NULL, NULL),
(32, '7 Up vị chanh 1.5 lít', 7, NULL, 7000, NULL, '32.jpg', 'lon', 1, NULL, NULL),
(33, 'Trà nha đam Vfresh Beauty Plus 350ml', 7, NULL, 6500, 6000, '34.jpg', 'lon', 0, NULL, NULL),
(34, 'Coca Cola Plus 330ml', 7, NULL, 9000, 8500, '33.jpg', 'lon', 1, NULL, NULL),
(36, 'Sữa uống lên men hương cam chai 700ml', 6, NULL, 540000, NULL, '36.jpg', 'hộp', 0, NULL, NULL),
(38, 'Thùng 12 hộp sữa tươi ít béo 1 lít', 6, NULL, 600000, NULL, '38.jpg', 'thùng', 1, NULL, NULL),
(39, 'Sữa đậu nành đậu đen óc chó hạnh nhân', 6, NULL, 30000, 29000, '39.jpg', 'hộp', 0, NULL, NULL),
(40, 'Kem đặc có đường Carnation lon 388g', 6, NULL, 30000, 28000, '40.jpg', 'hộp', 1, NULL, NULL),
(41, 'Sữa bột Abbott Glucerna vani lon 850g', 6, NULL, 475000, NULL, '41.jpg', 'hộp', 0, NULL, NULL),
(67, 'Ớt ngâm chua ngọt Sông Hương hũ 350g', 5, NULL, 37000, 47000, '99.jpg', 'hũ', 1, NULL, NULL),
(68, 'Kim chi cải thảo cắt lát hộp 500g', 5, NULL, 47000, NULL, '98.jpg', 'hộp', 1, NULL, NULL),
(69, 'Kim chi cải thảo Mr. Lee gói 300g', 5, NULL, 26000, NULL, '97.jpg', 'gói', 1, NULL, NULL),
(70, 'Cải chua Toàn Phát gói 300g', 5, NULL, 15000, NULL, '96.jpg', 'gói', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'banner1.jpg'),
(2, '', 'banner2.jpg'),
(3, '', 'banner3.jpg'),
(4, '', 'banner4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `type_name`, `created_at`, `updated_at`) VALUES
(1, 'Rau xanh', NULL, NULL),
(2, 'Trái cây', '2016-10-12 02:16:15', '2016-10-13 01:38:35'),
(3, 'Thịt, Hải sản', '2016-10-18 00:33:33', '2016-10-15 07:25:27'),
(4, 'Xúc xích, Chả lụa, Thịt nguội', '2016-10-26 03:29:19', '2016-10-26 02:22:22'),
(5, 'Kim chi, Dưa muối', '2016-10-28 04:00:00', '2016-10-27 04:00:23'),
(6, 'Sữa ', '2016-10-25 17:19:00', NULL),
(7, 'Nước ngọt', '2016-10-25 17:19:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
