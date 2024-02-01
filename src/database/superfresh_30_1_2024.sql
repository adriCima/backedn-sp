-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 30-01-2024 a las 22:14:31
-- Versión del servidor: 8.2.0
-- Versión de PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `superfresh`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adress_type`
--

DROP TABLE IF EXISTS `adress_type`;
CREATE TABLE IF NOT EXISTS `adress_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adress_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `adress_type`
--

INSERT INTO `adress_type` (`id`, `adress_type`) VALUES
(1, 'Principal'),
(2, 'Secundaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `branchs`
--

DROP TABLE IF EXISTS `branchs`;
CREATE TABLE IF NOT EXISTS `branchs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_sucursal` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `branchs`
--

INSERT INTO `branchs` (`id`, `nombre_sucursal`, `direccion`) VALUES
(1, 'CASA MATRIZ', 'c. / Alto Beni 1582 z./ Villa Fátima');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category` (`category`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `category`, `image`) VALUES
(1, 'Raíces', 'https://res.cloudinary.com/drx69aehx/image/upload/v1706373647/bbdefatqykg5xviyii1f.jpg'),
(2, 'Tubérculos', 'https://res.cloudinary.com/drx69aehx/image/upload/v1705589555/cuhsxtecfbkoj1vrinkv.jpg'),
(3, 'Bulbos', 'https://res.cloudinary.com/drx69aehx/image/upload/v1705592473/opquaauehk3qbjeuxwya.avif'),
(4, 'Plantas aromáticas', 'https://res.cloudinary.com/drx69aehx/image/upload/v1705765458/yr6ianl0aiwzzxlxme6d.jpg'),
(5, 'Plantas medicinales', 'https://res.cloudinary.com/drx69aehx/image/upload/v1705765467/bbl5zto4onkoentufiis.webp'),
(8, 'Verduras', 'https://res.cloudinary.com/drx69aehx/image/upload/v1705767734/v5e5andfbntxuwiee0yd.jpg'),
(13, 'NATURALES', 'https://res.cloudinary.com/drx69aehx/image/upload/v1706038671/pwwmonamekvanlojzdln.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `zona` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user` (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id`, `id_user`, `zona`, `adress`, `referencia`, `phone`, `email`, `createAt`) VALUES
(1, 1, 'Miraflores', 'Calle Fermin Prudencio # 1130', 'Frente a la UPDS', '75226707', 'adrianriverosvallejos@gmail.com', '2024-01-30 18:27:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers_adress`
--

DROP TABLE IF EXISTS `customers_adress`;
CREATE TABLE IF NOT EXISTS `customers_adress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_customer` int NOT NULL,
  `zona` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_adress_type` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `customers_adress`
--

INSERT INTO `customers_adress` (`id`, `id_customer`, `zona`, `adress`, `referencia`, `id_adress_type`) VALUES
(1, 1, 'Miraflores', 'Calle Fermin Prudencio # 1130', 'Frente a la UPDS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employed`
--

DROP TABLE IF EXISTS `employed`;
CREATE TABLE IF NOT EXISTS `employed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_position` int NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_type_user` int NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `employed`
--

INSERT INTO `employed` (`id`, `id_user`, `id_position`, `email`, `phone`, `adress`, `id_type_user`, `createAt`) VALUES
(1, 7, 1, 'digipres@gmail.com', '77777777', 'plaza el camen 2085', 1, '2024-01-30 19:13:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_customer` int NOT NULL,
  `total_products` int NOT NULL,
  `total_order` decimal(10,2) NOT NULL,
  `id_branch` int NOT NULL,
  `status` int NOT NULL,
  `status_pay` int NOT NULL,
  `dateAtCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `id_customer`, `total_products`, `total_order`, `id_branch`, `status`, `status_pay`, `dateAtCreate`) VALUES
(1, 1, 10, 350.00, 1, 1, 1, '2024-01-27 17:36:15'),
(2, 2, 5, 20.00, 1, 2, 2, '2024-01-27 17:36:51'),
(3, 3, 35, 2000.00, 1, 3, 3, '2024-01-27 17:37:26'),
(4, 4, 85, 5000.00, 1, 4, 1, '2024-01-27 17:40:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders_status`
--

DROP TABLE IF EXISTS `orders_status`;
CREATE TABLE IF NOT EXISTS `orders_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `orders_status`
--

INSERT INTO `orders_status` (`id`, `status`) VALUES
(1, 'Solicitado'),
(2, 'En Preparación'),
(3, 'Enviado'),
(4, 'Entregado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `id_product` int NOT NULL,
  `single_price` decimal(10,2) NOT NULL,
  `q_product` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `order_detail`
--

INSERT INTO `order_detail` (`id`, `id_order`, `id_product`, `single_price`, `q_product`, `total_price`) VALUES
(1, 1, 4, 3.50, 1, 3.50),
(2, 1, 5, 4.00, 1, 8.00),
(3, 2, 6, 8.00, 3, 24.00),
(4, 2, 7, 2.00, 5, 10.00),
(5, 3, 10, 3.50, 4, 14.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_detail_temp`
--

DROP TABLE IF EXISTS `order_detail_temp`;
CREATE TABLE IF NOT EXISTS `order_detail_temp` (
  `id_c` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `id_product` int NOT NULL,
  `single_price` decimal(10,2) NOT NULL,
  `q_product` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_market`
--

DROP TABLE IF EXISTS `order_market`;
CREATE TABLE IF NOT EXISTS `order_market` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `id_shipping_type` int NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razon_social` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `cod_discount` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_pay_type` int NOT NULL,
  `cod_verificacion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_order` (`id_order`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `order_market`
--

INSERT INTO `order_market` (`id`, `id_order`, `id_shipping_type`, `direccion`, `nit`, `razon_social`, `shipping_cost`, `discount`, `cod_discount`, `total`, `id_pay_type`, `cod_verificacion`) VALUES
(1, 1, 1, 'sin direccion', '0', 'sin razon social', 0.00, 0.00, 'sin codigo', 350.00, 1, 'sin conf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE IF NOT EXISTS `position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `position`
--

INSERT INTO `position` (`id`, `position`) VALUES
(1, 'Administrador'),
(2, 'Despachador'),
(3, 'Cobrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_category` int NOT NULL,
  `id_subcategory` int NOT NULL,
  `product` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_weight` int NOT NULL,
  `buy_price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `min_stock` int NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `sku`, `id_category`, `id_subcategory`, `product`, `description`, `id_weight`, `buy_price`, `sale_price`, `stock`, `min_stock`, `image`, `createAt`) VALUES
(3, 'SKU-00003', 2, 3, 'Papa roja', 'papa roja', 1, 3.50, 4.00, 500, 100, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705589651/comxzinukjnutyx67b4y.jpg', '2024-01-18 14:54:12'),
(4, 'SKU-00004', 2, 3, 'Papa negra', 'papa negra', 1, 3.50, 4.00, 500, 100, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705589679/koddgpl0drycpxz5gz7b.jpg', '2024-01-18 14:54:40'),
(5, 'SKU-00005', 2, 3, 'Papa blanca', 'papa blanca', 1, 3.50, 4.00, 500, 100, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705589708/gfypclgps3dljkx5sle9.jpg', '2024-01-18 14:55:09'),
(6, 'SKU-00006', 2, 3, 'Papalisa', 'papalisa', 1, 3.50, 4.00, 500, 100, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705589745/umgmrz4hzrng203dkoqv.jpg', '2024-01-18 14:55:45'),
(7, 'SKU-00007', 2, 3, 'Racacha', 'racacha', 1, 3.50, 4.00, 500, 100, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705589772/auob3lnwxbqx7jqztyfr.jpg', '2024-01-18 14:56:13'),
(8, 'SKU-00008', 2, 3, 'chuño', 'chuño', 1, 3.50, 4.00, 500, 100, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705589791/tgje4obrf8gkaz4v3zgy.jpg', '2024-01-18 14:56:32'),
(9, 'SKU-00009', 2, 3, 'Tunta', 'tunta', 1, 3.50, 4.00, 500, 100, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705589831/qfbijx8c8rbfnwg1ld4n.png', '2024-01-18 14:57:13'),
(10, 'SKU-00010', 2, 3, 'Yuca', 'yuca', 1, 3.50, 4.00, 5, 100, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705589851/v1ms4we3awwxlkfqgsxm.jpg', '2024-01-18 14:57:32'),
(11, 'SKU-00011', 2, 3, 'Oca', 'oca', 1, 3.50, 4.00, 500, 100, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705589867/oo76sokg5sqwpupbwzxu.jpg', '2024-01-18 14:57:47'),
(12, 'SKU-00012', 2, 3, 'Jengibre', 'jengibre', 1, 3.50, 4.00, 500, 100, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705589888/gp093y5q0asdsoouo9kx.jpg', '2024-01-18 14:58:09'),
(13, 'SKU-00013', 3, 4, 'Cebolla roja', 'cebolla roja', 1, 1.80, 2.50, 500, 100, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705592514/vsy52jjn8ueqy91mfarz.jpg', '2024-01-18 15:41:55'),
(14, 'SKU-00014', 3, 4, 'Cebolla blanca', 'cebolla blanca', 1, 2.30, 3.00, 500, 100, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705592544/zmlkob4cadblm8expj76.jpg', '2024-01-18 15:42:25'),
(15, 'SKU-00015', 3, 4, 'Ajo', 'ajo', 1, 1.00, 1.50, 100, 20, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705592574/lfv9leo0vq9yietyy8wf.jpg', '2024-01-18 15:42:55'),
(16, 'SKU-00016', 3, 4, 'Puerro', 'puerro', 1, 0.80, 1.20, 100, 20, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705592600/er5xlzj1bvh0bmvk8med.jpg', '2024-01-18 15:43:21'),
(17, 'SKU-00017', 4, 4, 'Hierba buena', 'hierba buena', 1, 2.50, 3.00, 100, 20, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705598209/nx0dgmmjbksvz8z7dnrv.jpg', '2024-01-18 17:16:49'),
(18, 'SKU-00018', 4, 4, 'Hierba luisa', 'hierba luisa', 1, 2.50, 3.00, 100, 20, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705598244/kzfqhvld030lvic7k0wx.jpg', '2024-01-18 17:17:24'),
(19, 'SKU-00019', 4, 4, 'Huacataya', 'huacataya', 1, 2.50, 3.00, 100, 20, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705598266/tvwmzn1drgrmismtr32u.jpg', '2024-01-18 17:17:47'),
(20, 'SKU-00020', 4, 4, 'Orégano', 'orégano', 1, 2.50, 3.00, 100, 20, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705598290/yyuk9pjcfnepzflj1ohw.jpg', '2024-01-18 17:18:11'),
(21, 'SKU-00021', 4, 4, 'Cilantro', 'cilantro', 1, 2.50, 3.00, 100, 20, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705598313/nzjk9ywcfaqkp9eryg4h.jpg', '2024-01-18 17:18:34'),
(22, 'SKU-00022', 4, 4, 'Albahaca', 'albahaca', 1, 2.50, 3.00, 100, 20, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705598337/zy7lddmakowlmrtdv1oa.jpg', '2024-01-18 17:18:58'),
(23, 'SKU-00023', 4, 4, 'Quirquiña', 'quirquiña', 1, 2.50, 3.00, 100, 20, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705598359/uubkvyelkxozzjaghiii.webp', '2024-01-18 17:19:20'),
(24, 'SKU-00024', 4, 4, 'Menta', 'menta', 1, 2.50, 3.00, 100, 20, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705598381/buhze102tbfy54wbybzp.jpg', '2024-01-18 17:19:42'),
(25, 'SKU-00025', 4, 4, 'Tomillo', 'tomillo', 1, 2.50, 3.00, 2, 20, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705598399/wcrmbyjbsal2gzhrjp4t.jpg', '2024-01-18 17:19:59'),
(26, 'SKU-00026', 5, 2, 'Toronjil', 'Descripcion de toronjil', 1, 2.50, 3.00, 100, 20, 'https://res.cloudinary.com/drx69aehx/image/upload/v1705763242/lalklbcmayifrua4c8qg.jpg', '2024-01-20 15:07:23'),
(27, 'SKU-00027', 13, 4, 'Miel', '', 2, 150.00, 200.00, 20, 5, 'https://res.cloudinary.com/drx69aehx/image/upload/v1706038779/vihdbqss145gzoaoqxve.jpg', '2024-01-23 19:39:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shipping_type`
--

DROP TABLE IF EXISTS `shipping_type`;
CREATE TABLE IF NOT EXISTS `shipping_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shipping` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `shipping_type`
--

INSERT INTO `shipping_type` (`id`, `shipping`) VALUES
(1, 'retiro en tienda'),
(2, 'Envío regular'),
(3, 'envío express');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_pay`
--

DROP TABLE IF EXISTS `status_pay`;
CREATE TABLE IF NOT EXISTS `status_pay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status_pay` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `status_pay`
--

INSERT INTO `status_pay` (`id`, `status_pay`) VALUES
(1, 'PENDIENTE'),
(2, 'PAGADO'),
(3, 'DEVUELTO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
CREATE TABLE IF NOT EXISTS `subcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subcategory` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subcategory` (`subcategory`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subcategory`
--

INSERT INTO `subcategory` (`id`, `subcategory`) VALUES
(1, 'general'),
(2, 'oferta'),
(3, 'mas vendido'),
(4, 'nuevo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_pay`
--

DROP TABLE IF EXISTS `type_pay`;
CREATE TABLE IF NOT EXISTS `type_pay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `type_pay`
--

INSERT INTO `type_pay` (`id`, `type`) VALUES
(1, 'Efectivo'),
(2, 'Tigo Money'),
(3, 'Código QR ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_users`
--

DROP TABLE IF EXISTS `type_users`;
CREATE TABLE IF NOT EXISTS `type_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `type_users`
--

INSERT INTO `type_users` (`id`, `type`) VALUES
(1, 'Administrador'),
(2, 'Supervisor'),
(3, 'Asistente'),
(4, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_type` int NOT NULL DEFAULT '4',
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `correo`, `pass`, `id_type`, `createAt`) VALUES
(1, 'Adrian', 'Vallejos', 'adrianriverosvallejos@gmail.com', '123', 4, '2024-01-18 20:31:12'),
(2, 'Maria', 'Fernanda', 'mafer25dg@gmail.com', 'm4f3r', 4, '2024-01-20 15:17:39'),
(3, 'Prueba', 'salir', 'aksdjf@gmail.com', '123456', 4, '2024-01-20 15:24:30'),
(4, 'Prueba', 'salir', 'aksdjf@gmail.com', '123456', 4, '2024-01-20 15:25:02'),
(5, 'loiiiic', 'kajsdf', 'askjdfa64@gmail.com', '159789', 4, '2024-01-20 15:25:56'),
(6, 'Oscar', 'Oscar', 'oscar@gmail.com', '123', 4, '2024-01-20 15:28:05'),
(7, 'digipres', 'digipres', 'digipres@gmail.com', '456', 1, '2024-01-20 15:29:08'),
(8, 'Super', 'Fresh', 'superfresh@gmail.com', 'superfresh', 2, '2024-01-20 15:34:08'),
(9, 'Super', 'Fresh', 'super@fresh.com', '123456', 3, '2024-01-23 16:26:44'),
(10, 'sdskajf', 'assadf', 'correo@gmail.com', '123456', 1, '2024-01-23 16:28:32'),
(11, 'Adrian', 'Vallejos', 'adrianriverosvallejfdfos@gmail.com', '987', 2, '2024-01-23 16:54:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `weight`
--

DROP TABLE IF EXISTS `weight`;
CREATE TABLE IF NOT EXISTS `weight` (
  `id` int NOT NULL AUTO_INCREMENT,
  `weight` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `weight` (`weight`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `weight`
--

INSERT INTO `weight` (`id`, `weight`) VALUES
(1, 'Kilo'),
(2, 'Libra'),
(3, 'Arroba'),
(4, 'Quintal'),
(6, 'Frasco 35ml');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
