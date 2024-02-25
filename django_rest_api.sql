-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 25, 2024 at 04:22 PM
-- Server version: 8.0.30-0ubuntu0.20.04.2
-- PHP Version: 8.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `django_rest_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add product', 8, 'add_product'),
(30, 'Can change product', 8, 'change_product'),
(31, 'Can delete product', 8, 'delete_product'),
(32, 'Can view product', 8, 'view_product'),
(33, 'Can add product images', 9, 'add_productimages'),
(34, 'Can change product images', 9, 'change_productimages'),
(35, 'Can delete product images', 9, 'delete_productimages'),
(36, 'Can view product images', 9, 'view_productimages'),
(37, 'Can add users', 10, 'add_users'),
(38, 'Can change users', 10, 'change_users'),
(39, 'Can delete users', 10, 'delete_users'),
(40, 'Can view users', 10, 'view_users'),
(41, 'Can add myapp user', 11, 'add_myappuser'),
(42, 'Can change myapp user', 11, 'change_myappuser'),
(43, 'Can delete myapp user', 11, 'delete_myappuser'),
(44, 'Can view myapp user', 11, 'view_myappuser');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$OR7tbxLujhLBKvZ5LqaHTN$tb+2eV+Hkj2pF8a6VcP2nIhXI93WyStUZ6xHlQSQBKw=', NULL, 1, 'jawedsiddiqui', '', '', 'jawed7siddiqui@gmail.com', 1, 1, '2024-01-29 19:21:13.901119');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'myapp', 'category'),
(11, 'myapp', 'myappuser'),
(8, 'myapp', 'product'),
(9, 'myapp', 'productimages'),
(10, 'myapp', 'users'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-01-29 19:19:26.468152'),
(2, 'auth', '0001_initial', '2024-01-29 19:19:29.101993'),
(3, 'admin', '0001_initial', '2024-01-29 19:19:29.579440'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-01-29 19:19:29.603867'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-29 19:19:29.623594'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-01-29 19:19:29.862585'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-01-29 19:19:30.086029'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-01-29 19:19:30.169977'),
(9, 'auth', '0004_alter_user_username_opts', '2024-01-29 19:19:30.192833'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-01-29 19:19:30.469728'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-01-29 19:19:30.490121'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-01-29 19:19:30.523472'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-01-29 19:19:30.853089'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-01-29 19:19:31.083271'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-01-29 19:19:31.172397'),
(16, 'auth', '0011_update_proxy_permissions', '2024-01-29 19:19:31.206180'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-01-29 19:19:31.724104'),
(18, 'sessions', '0001_initial', '2024-01-29 19:19:32.004831'),
(19, 'myapp', '0001_initial', '2024-01-29 19:24:13.443472'),
(20, 'myapp', '0002_myappuser', '2024-01-29 20:38:38.487033'),
(21, 'myapp', '0003_rename_pwd_enc_users_password_delete_myappuser', '2024-01-30 05:05:36.805405'),
(22, 'myapp', '0004_alter_users_username', '2024-01-30 05:08:06.400136');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `myapp_category`
--

CREATE TABLE `myapp_category` (
  `id` int NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `myapp_category`
--

INSERT INTO `myapp_category` (`id`, `category_name`) VALUES
(4, 'rr'),
(3, 'Shoes125'),
(5, 'Shoes1251');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_product`
--

CREATE TABLE `myapp_product` (
  `id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_desc` longtext NOT NULL,
  `product_category_id` int UNSIGNED NOT NULL,
  `product_specification` longtext NOT NULL,
  `product_actual_cost` decimal(10,2) NOT NULL,
  `product_actual_cost_currency` varchar(3) NOT NULL,
  `product_status` varchar(20) NOT NULL,
  `user_id` int UNSIGNED NOT NULL
) ;

--
-- Dumping data for table `myapp_product`
--

INSERT INTO `myapp_product` (`id`, `product_name`, `product_desc`, `product_category_id`, `product_specification`, `product_actual_cost`, `product_actual_cost_currency`, `product_status`, `user_id`) VALUES
(1, 'SampleProduct34', 'This is a sample product', 2, '34', '19.99', 'USD', 'Active', 1),
(3, 'SampleProduct', 'This is a sample product', 2, '34', '19.99', 'USD', 'Active', 1),
(4, 'SampleProduct', 'This is a sample product', 2, '34', '19.99', 'USD', 'Active', 1),
(5, 'SampleProduct', 'This is a sample product', 2, '34', '19.99', 'USD', 'Active', 1),
(6, 'SampleProduct', 'This is a sample product', 2, '34', '19.99', 'USD', 'Active', 1),
(7, 'SampleProduct', 'This is a sample product', 2, '34', '19.99', 'USD', 'Active', 1),
(8, 'SampleProduct', 'This is a sample product', 2, '34', '19.99', 'USD', 'Active', 1),
(9, 'SampleProduct', 'This is a sample product', 2, '34', '19.99', 'USD', 'Active', 1),
(10, 'SampleProduct', 'This is a sample product', 2, '34', '19.99', 'USD', 'Active', 1),
(11, 'SampleProduct', 'This is a sample product', 2, '34', '19.99', 'USD', 'Active', 1),
(12, 'SampleProduct', 'This is a sample product', 2, '34', '19.99', 'USD', 'Active', 1),
(13, 'SampleProduct', 'This is a sample product', 2, '34', '19.99', 'USD', 'Active', 1),
(14, 'SampleProduct', 'This is a sample product', 2, '34', '19.99', 'USD', 'Active', 1),
(15, 'SampleProduct', 'This is a sample product', 2, '34', '19.99', 'USD', 'Active', 1),
(16, 'SampleProduct34', 'This is a sample product', 2, '34', '19.99', 'USD', 'Active', 1),
(17, 'hello product', 'This is a sample product', 3, '34', '19.99', 'USD', 'Active', 1),
(18, 'hello product', 'This is a sample product', 3, '34', '19.99', 'USD', 'Active', 1),
(19, 'hello product', 'This is a sample product', 3, '34', '19.99', 'USD', 'Active', 1),
(20, 'hello product', 'This is a sample product', 3, '34', '19.99', 'USD', 'Active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_productimages`
--

CREATE TABLE `myapp_productimages` (
  `id` bigint NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `product_image` varchar(100) NOT NULL
) ;

--
-- Dumping data for table `myapp_productimages`
--

INSERT INTO `myapp_productimages` (`id`, `product_id`, `user_id`, `category_id`, `product_image`) VALUES
(1, 12, 23, 45, ''),
(2, 12, 23, 45, 'product_images/upload.jpg'),
(4, 12, 23, 45, 'product_images/wp6878752.png'),
(5, 12, 23, 45, 'product_images/upload_1KjtYUn.jpg'),
(6, 13, 1, 2, 'product_images/wp6878772_vRcskkY.png'),
(7, 13, 1, 2, 'product_images/wp6878752_3xwiqcD.png'),
(8, 13, 1, 2, 'product_images/upload_qGyAGh1.jpg'),
(9, 16, 1, 3, 'product_images/wp6878772_m88AG9U.png'),
(10, 16, 1, 3, 'product_images/wp6878752_IiP2zL9.png'),
(11, 16, 1, 3, 'product_images/upload_DOaUvB7.jpg'),
(12, 16, 1, 2, 'product_images/unnamed_1.jpg'),
(13, 16, 1, 2, 'product_images/upload_HtTcqMG.jpg'),
(14, 18, 1, 3, 'product_images/wp6878772_CPDI4Ge.png'),
(15, 18, 1, 3, 'product_images/wp6878752_Tes5YBZ.png'),
(16, 18, 1, 3, 'product_images/upload_HFXJvae.jpg'),
(17, 19, 1, 3, 'product_images/wp6878772_VUu0pqb.png'),
(18, 19, 1, 3, 'product_images/wp6878752_oPF33fF.png'),
(19, 19, 1, 3, 'product_images/upload_SVa53D1.jpg'),
(20, 20, 1, 3, 'product_images/wp6878772_o0G952I.png'),
(21, 20, 1, 3, 'product_images/wp6878752_hd6Ade3.png'),
(22, 20, 1, 3, 'product_images/upload_d4DMxj2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_users`
--

CREATE TABLE `myapp_users` (
  `id` int NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(254) NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `joining_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_timestamp` datetime(6) NOT NULL,
  `updated_timestamp` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `myapp_users`
--

INSERT INTO `myapp_users` (`id`, `f_name`, `l_name`, `dob`, `email`, `phonenumber`, `username`, `password`, `joining_date`, `status`, `created_timestamp`, `updated_timestamp`) VALUES
(37, 'kumar', 'shah', '2023-01-23', 'kummkar123@gmail.comdd12az', '9142627909', '12mmm12az', '', '2023-03-12', '', '2024-01-29 21:09:34.007961', '2024-01-29 21:09:34.008000'),
(38, 'kumar', 'shah', '2023-01-23', 'kumamkar123@gmail.cs', '9142627909', '12mamm12az', '', '2023-03-12', '', '2024-01-29 21:14:44.034968', '2024-01-29 21:14:44.035022'),
(40, 'kumar', 'shah', '2023-01-23', 'kumamkar12a3@gmail.cs', '9142627909', '12mamm12aza', '123456', '2023-03-12', 'active', '2024-01-30 04:43:38.918550', '2024-01-30 04:43:38.918606'),
(41, 'kumar', 'shah', '2023-01-23', 'abs@gmail.cs', '9142627909', 'abc123', '123456', '2023-03-14', 'active', '2024-01-30 04:45:57.798105', '2024-01-30 04:45:57.798144'),
(42, 'kumar', 'shah', '2023-01-23', 'abs@gmail.cs1', '9142627909', 'abc1233', '123456', '2023-03-14', 'active', '2024-01-30 04:47:58.999386', '2024-01-30 04:47:58.999426'),
(43, 'kumar', 'shah', '2023-01-23', 'abs@gmail.cs2', '9142627909', 'abc1233', '123456', '2023-03-14', 'active', '2024-01-30 05:08:38.641525', '2024-01-30 05:08:38.641583'),
(44, 'kumar', 'shah', '2023-01-23', 'abs@gmail.cs2d', '9142627909', 'abc1233', 'pbkdf2_sha256$600000$XTimLMuaoBH1nNDWn5Q1aL$r8kXfW53FuzUMBznHeU+ffrJqACv3DCRseJcjyrONH0=', '2023-03-14', 'active', '2024-01-30 21:31:37.793700', '2024-01-30 21:31:37.793764');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `myapp_category`
--
ALTER TABLE `myapp_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `myapp_product`
--
ALTER TABLE `myapp_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_productimages`
--
ALTER TABLE `myapp_productimages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_users`
--
ALTER TABLE `myapp_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `myapp_category`
--
ALTER TABLE `myapp_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `myapp_product`
--
ALTER TABLE `myapp_product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myapp_productimages`
--
ALTER TABLE `myapp_productimages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myapp_users`
--
ALTER TABLE `myapp_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
