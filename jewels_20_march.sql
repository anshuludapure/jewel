-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2024 at 06:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jewels_14_march`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(25) NOT NULL,
  `cat_name` varchar(25) NOT NULL,
  `cat_description` text NOT NULL,
  `cat_image` varchar(25) NOT NULL,
  `cat_type` enum('gold','silver','platinum','diamond','gemstone') NOT NULL,
  `keyword` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`, `cat_description`, `cat_image`, `cat_type`, `keyword`) VALUES
(1, 'Necklaces', '', 'necklace.png', 'gold', 'chaplakanthi'),
(2, 'Earrings', '', 'earrings.png', 'gold', ''),
(3, 'Bracelets', '', 'bracelate.png', 'gold', ''),
(4, 'Rings', '', 'rings.png', 'gold', ''),
(5, 'Pendants', '', 'pendant.png', 'gold', ''),
(6, 'Bangles', '', 'bangles.png', 'gold', ''),
(7, 'Anklet', '', 'anklet.png', 'gold', ''),
(8, 'Crystal Jewellery', '', 'crystal.png', 'gold', ''),
(9, 'Chain', '', 'chain.png', 'gold', ''),
(10, 'Statement Jewellery', '', 'statement.png', 'gold', ''),
(11, 'Copper Jewellery', '', 'copperj.png', 'gold', ''),
(12, 'Brass Jewellery', '', 'brassj.png', 'gold', '');

-- --------------------------------------------------------

--
-- Table structure for table `current_price`
--

CREATE TABLE `current_price` (
  `current_price_id` int(25) NOT NULL,
  `metal_type` varchar(25) NOT NULL,
  `metal_price` varchar(50) NOT NULL,
  `last_updated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `current_price`
--

INSERT INTO `current_price` (`current_price_id`, `metal_type`, `metal_price`, `last_updated`) VALUES
(1, 'gold', '6500', '2024-03-20'),
(2, 'silver', '80', '2024-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `product_id` int(25) NOT NULL,
  `product_attribute_value_id` varchar(25) NOT NULL,
  `payment_status` enum('failed','cancelled','success','error') NOT NULL,
  `payment_type` varchar(25) NOT NULL,
  `shipping_status` enum('shipped','in-transit','wait','cancelled') NOT NULL,
  `user_id` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(25) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_description` text NOT NULL,
  `product_type` varchar(25) NOT NULL,
  `cat_id` int(25) NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `product_price` varchar(50) NOT NULL,
  `product_weight` varchar(25) NOT NULL,
  `product_gst` varchar(50) NOT NULL,
  `product_makeing_charges` varchar(50) NOT NULL,
  `last_updated_date` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `product_type`, `cat_id`, `keywords`, `product_price`, `product_weight`, `product_gst`, `product_makeing_charges`, `last_updated_date`) VALUES
(1, 'Pearl Necklace', 'Classic pearl necklace with a sterling silver clasp.', 'Necklace', 1, '', '', '', '', '', ''),
(2, 'Emerald Stud Earrings', 'Gorgeous emerald stud earrings set in white gold.', 'Earrings', 2, '', '', '', '', '', ''),
(3, 'Silver Bangle', 'Chic silver bangle bracelet with intricate detailing.', 'Bracelet', 3, '', '', '', '', '', ''),
(4, 'Diamond Solitaire Ring', 'Stunning diamond solitaire ring with a platinum band.', 'Ring', 4, '', '', '', '', '', ''),
(5, 'Ruby Pendant', 'Exquisite ruby pendant suspended from a delicate gold chain.', 'Pendant', 5, '', '', '', '', '', ''),
(6, 'Tennis Bracelet', 'Classic tennis bracelet featuring a row of sparkling diamonds.', 'Bracelet', 3, '', '', '', '', '', ''),
(7, 'Opal Necklace', 'Mesmerizing opal necklace with a rose gold setting.', 'Necklace', 1, '', '', '', '', '', ''),
(8, 'Hoops Earrings', 'Fashionable hoops earrings crafted in yellow gold.', 'Earrings', 2, '', '', '', '', '', ''),
(9, 'Charm Bracelet', 'Adorable charm bracelet adorned with various charms.', 'Bracelet', 3, '', '', '', '', '', ''),
(10, 'Sapphire Ring', 'Elegant sapphire ring accented with diamond side stones.', 'Ring', 4, '', '', '', '', '', ''),
(11, 'Heart Pendant', 'Lovely heart-shaped pendant crafted in sterling silver.', 'Pendant', 5, '', '', '', '', '', ''),
(12, 'Pearl Drop Earrings', 'Graceful pearl drop earrings with a silver stud.', 'Earrings', 2, '', '', '', '', '', ''),
(13, 'Gold Chain', 'Simple and versatile gold chain necklace.', 'Necklace', 1, '', '', '', '', '', ''),
(14, 'Cuff Bracelet', 'Stylish cuff bracelet featuring a hammered metal finish.', 'Bracelet', 3, '', '', '', '', '', ''),
(15, 'Diamond Cluster Ring', 'Dazzling diamond cluster ring with a white gold band.', 'Ring', 4, '', '', '', '', '', ''),
(16, 'Cross Pendant', 'Elegant cross pendant with intricate filigree detailing.', 'Pendant', 5, '', '', '', '', '', ''),
(17, 'Gold Bangles Set', 'Stylish set of gold bangles perfect for stacking.', 'Bangles', 6, '', '', '', '', '', ''),
(18, 'Silver Anklet', 'Elegant silver anklet with delicate chain detailing.', 'Anklet', 7, '', '', '', '', '', ''),
(19, 'Crystal Necklace', 'Beautiful crystal necklace with a sterling silver chain.', 'Necklace', 8, '', '', '', '', '', ''),
(20, 'Gold Chain Bracelet', 'Chic gold chain bracelet suitable for everyday wear.', 'Bracelet', 9, '', '', '', '', '', ''),
(21, 'Statement Earrings', 'Bold statement earrings featuring intricate designs.', 'Earrings', 10, '', '', '', '', '', ''),
(22, 'Copper Bracelet', 'Unique copper bracelet with hammered metal texture.', 'Bracelet', 11, '', '', '', '', '', ''),
(23, 'Brass Necklace', 'Classic brass necklace with a timeless design.', 'Necklace', 12, '', '', '', '', '', ''),
(24, 'Silver Bangles', 'Simple yet elegant set of silver bangles.', 'Bangles', 6, '', '', '', '', '', ''),
(25, 'Pearl Anklet', 'Charming pearl anklet with a sterling silver clasp.', 'Anklet', 7, '', '', '', '', '', ''),
(26, 'Crystal Earrings', 'Gorgeous crystal earrings with a sparkling finish.', 'Earrings', 10, '', '', '', '', '', ''),
(27, 'Gold Chain Necklace', 'Versatile gold chain necklace suitable for layering.', 'Necklace', 8, '', '', '', '', '', ''),
(28, 'Statement Necklace', 'Eye-catching statement necklace with bold elements.', 'Necklace', 10, '', '', '', '', '', ''),
(29, 'Copper Earrings', 'Stunning copper earrings with intricate patterns.', 'Earrings', 11, '', '', '', '', '', ''),
(30, 'Brass Earrings', 'Classic brass earrings with a vintage-inspired design.', 'Earrings', 12, '', '', '', '', '', ''),
(31, 'Beaded Anklet', 'Colorful beaded anklet with a comfortable stretch band.', 'Anklet', 7, '', '', '', '', '', ''),
(32, 'Crystal Bracelet', 'Dazzling crystal bracelet with a secure lobster clasp.', 'Bracelet', 8, '', '', '', '', '', ''),
(33, 'Gold Statement Ring', 'Bold gold statement ring with intricate detailing.', 'Ring', 10, 'angthi, ring', '', '', '', '', ''),
(34, 'Copper Necklace', 'Chic copper necklace with a modern geometric pendant.', 'Necklace', 11, '', '', '', '', '', ''),
(35, 'Brass Bracelet', 'Vintage-inspired brass bracelet with ornate engravings.', 'Bracelet', 12, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

CREATE TABLE `products_attributes` (
  `id` int(25) NOT NULL,
  `product_id` int(25) NOT NULL,
  `product_attribute` varchar(25) NOT NULL,
  `product_attribute_value` varchar(25) NOT NULL,
  `product_attribute_image` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_attributes`
--

INSERT INTO `products_attributes` (`id`, `product_id`, `product_attribute`, `product_attribute_value`, `product_attribute_image`) VALUES
(1, 1, 'Material', '18k Gold', 'diamond_necklace_material'),
(2, 1, 'Color', 'Gold', 'diamond_necklace_color.jp'),
(3, 1, 'Weight', '10 grams', 'diamond_necklace_weight.j'),
(4, 2, 'Material', 'White Gold', 'sapphire_earrings_materia'),
(5, 2, 'Color', 'Blue', 'sapphire_earrings_color.j'),
(6, 2, 'Weight', '5 grams', 'sapphire_earrings_weight.');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `product_image_id` int(25) NOT NULL,
  `product_id` int(25) NOT NULL,
  `product_image_name` varchar(25) NOT NULL,
  `product_image_attribute` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `user_type` enum('admin','retailer','wholesaler','developer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `user_type`) VALUES
(1, 'admin1', 'admin123', 'admin1@example.com', 'admin'),
(2, 'retailer1', 'retailer123', 'retailer1@example.com', 'retailer'),
(3, 'wholesaler1', 'wholesaler123', 'wholesaler1@example.com', 'wholesaler'),
(4, 'developer1', 'developer123', 'developer1@example.com', 'developer'),
(5, 'admin2', 'admin456', 'admin2@example.com', 'admin'),
(6, 'retailer2', 'retailer456', 'retailer2@example.com', 'retailer'),
(7, 'wholesaler2', 'wholesaler456', 'wholesaler2@example.com', 'wholesaler'),
(8, 'developer2', 'developer456', 'developer2@example.com', 'developer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `current_price`
--
ALTER TABLE `current_price`
  ADD PRIMARY KEY (`current_price_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `orders_user_FK_1` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_cat_FK_1` (`cat_id`);

--
-- Indexes for table `products_attributes`
--
ALTER TABLE `products_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_images_FK_1` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `current_price`
--
ALTER TABLE `current_price`
  MODIFY `current_price_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `products_attributes`
--
ALTER TABLE `products_attributes`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `product_cat_FK_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_FK_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
