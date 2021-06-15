-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 13 Ara 2018, 18:14:47
-- Sunucu sürümü: 5.7.14
-- PHP Sürümü: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `dokuman_sistemi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dosyalar`
--

CREATE TABLE `dosyalar` (
  `dosya_id` int(11) NOT NULL,
  `dosya_acilis_tarihi` date NOT NULL,
  `dosya_yeri` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `dosya_tur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `dosyalar`
--

INSERT INTO `dosyalar` (`dosya_id`, `dosya_acilis_tarihi`, `dosya_yeri`, `dosya_tur_id`) VALUES
(1, '2000-12-12', 'A27879', 2),
(2, '2000-12-12', 'A27879', 2),
(7, '2000-12-12', 'A2787998', 2),
(10, '2000-12-12', 'a100', 1),
(28, '2000-12-12', 'A27879', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dosya_m_d`
--

CREATE TABLE `dosya_m_d` (
  `musteri_id` int(11) NOT NULL,
  `dosya_id` int(11) NOT NULL,
  `dosya_tur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `dosya_m_d`
--

INSERT INTO `dosya_m_d` (`musteri_id`, `dosya_id`, `dosya_tur_id`) VALUES
(8465, 1, 2),
(84657, 2, 2),
(846577, 28, 1),
(78996, 10, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dosya_tur`
--

CREATE TABLE `dosya_tur` (
  `dosya_tur_id` int(11) NOT NULL,
  `dosya_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `dosya_tur`
--

INSERT INTO `dosya_tur` (`dosya_tur_id`, `dosya_ad`) VALUES
(1, 'bireysel'),
(2, 'ticari');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteriler`
--

CREATE TABLE `musteriler` (
  `musteri_id` int(11) NOT NULL,
  `musteri_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `musteri_soyad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `musteri_tc` int(11) NOT NULL,
  `dosya_tur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `musteriler`
--

INSERT INTO `musteriler` (`musteri_id`, `musteri_ad`, `musteri_soyad`, `musteri_tc`, `dosya_tur_id`) VALUES
(8465, 'OZGUR', 'IUSAHDIU', 751, 2),
(78996, 'alexxxxx', 'IUSAHDIU', 751, 1),
(84657, 'OZGUR', 'IUSAHDIU', 751, 2),
(846577, 'ojıhuytgh', 'IUSAHDIU', 751, 1),
(846577888, 'sdgfhj', 'IUSAHDIU', 751, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyeler`
--

CREATE TABLE `uyeler` (
  `kullanici` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sifre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `uyeler`
--

INSERT INTO `uyeler` (`kullanici`, `sifre`) VALUES
('ali', 1234);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `dosyalar`
--
ALTER TABLE `dosyalar`
  ADD PRIMARY KEY (`dosya_id`),
  ADD KEY `dosya_tur_id` (`dosya_tur_id`);

--
-- Tablo için indeksler `dosya_m_d`
--
ALTER TABLE `dosya_m_d`
  ADD KEY `musteri_id` (`musteri_id`),
  ADD KEY `dosya_id` (`dosya_id`),
  ADD KEY `dosya_tur_id` (`dosya_tur_id`);

--
-- Tablo için indeksler `dosya_tur`
--
ALTER TABLE `dosya_tur`
  ADD PRIMARY KEY (`dosya_tur_id`);

--
-- Tablo için indeksler `musteriler`
--
ALTER TABLE `musteriler`
  ADD PRIMARY KEY (`musteri_id`),
  ADD KEY `dosya_tur_id` (`dosya_tur_id`);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `dosyalar`
--
ALTER TABLE `dosyalar`
  ADD CONSTRAINT `dosyalar_ibfk_1` FOREIGN KEY (`dosya_tur_id`) REFERENCES `dosya_tur` (`dosya_tur_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `dosya_m_d`
--
ALTER TABLE `dosya_m_d`
  ADD CONSTRAINT `dosya_m_d_ibfk_1` FOREIGN KEY (`musteri_id`) REFERENCES `musteriler` (`musteri_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dosya_m_d_ibfk_2` FOREIGN KEY (`dosya_id`) REFERENCES `dosyalar` (`dosya_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dosya_m_d_ibfk_3` FOREIGN KEY (`dosya_tur_id`) REFERENCES `dosya_tur` (`dosya_tur_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `musteriler`
--
ALTER TABLE `musteriler`
  ADD CONSTRAINT `musteriler_ibfk_1` FOREIGN KEY (`dosya_tur_id`) REFERENCES `dosya_tur` (`dosya_tur_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
