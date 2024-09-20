-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 20 Eyl 2024, 11:11:20
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `crmdb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admins`
--

CREATE TABLE `admins` (
  `Adminid` int(11) NOT NULL,
  `KullaniciAd` varchar(10) DEFAULT NULL,
  `Sifre` varchar(10) DEFAULT NULL,
  `Yetki` char(1) DEFAULT NULL,
  `Durum` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ambars`
--

CREATE TABLE `ambars` (
  `AmbarID` int(11) NOT NULL,
  `AmbarAdi` varchar(30) DEFAULT NULL,
  `Durum` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `ambars`
--

INSERT INTO `ambars` (`AmbarID`, `AmbarAdi`, `Durum`) VALUES
(1, 'MERKEZ/ISTANBUL', 1),
(2, 'SUBE/MARDIN', 1),
(3, 'SUBE/KOCAELI', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bankalars`
--

CREATE TABLE `bankalars` (
  `Bankaid` int(11) NOT NULL,
  `BankaAdi` varchar(50) DEFAULT NULL,
  `BankaHesapNo` varchar(50) DEFAULT NULL,
  `BankaIbanNo` varchar(50) DEFAULT NULL,
  `BankaHesapSahibi` varchar(50) DEFAULT NULL,
  `BankaHesapTuru` varchar(50) DEFAULT NULL,
  `BankaBakiye` decimal(18,2) NOT NULL,
  `BankaAciklama` varchar(200) DEFAULT NULL,
  `Durum` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `bankalars`
--

INSERT INTO `bankalars` (`Bankaid`, `BankaAdi`, `BankaHesapNo`, `BankaIbanNo`, `BankaHesapSahibi`, `BankaHesapTuru`, `BankaBakiye`, `BankaAciklama`, `Durum`) VALUES
(1, 'BANKA_SECIMI', '0', '0', '0', 'TL', 0.00, NULL, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `carilers`
--

CREATE TABLE `carilers` (
  `Cariid` int(11) NOT NULL,
  `CariAd` varchar(30) NOT NULL,
  `CariSoyad` varchar(30) NOT NULL,
  `CariSehir` varchar(20) DEFAULT NULL,
  `CariMail` varchar(100) DEFAULT NULL,
  `CariOzelSoruCevap` varchar(80) DEFAULT NULL,
  `Durum` tinyint(1) NOT NULL,
  `CariBakiye` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `carilers`
--

INSERT INTO `carilers` (`Cariid`, `CariAd`, `CariSoyad`, `CariSehir`, `CariMail`, `CariOzelSoruCevap`, `Durum`, `CariBakiye`) VALUES
(1, 'Mahmut', 'Mardinli', 'Adana', NULL, NULL, 1, 0.00),
(2, 'Berna', 'Yonay', 'Adiyaman', NULL, NULL, 1, 0.00),
(3, 'Ozcan', 'Deniz', 'Adana', NULL, NULL, 1, 0.00),
(4, 'Mahmut', 'Tuncer', 'Adiyaman', NULL, NULL, 1, 0.00),
(5, 'Hande', 'Yener', 'Adana', NULL, NULL, 1, 0.00),
(6, 'Ahmet', 'Kaya Guncel', 'Adiyaman', 'b@b.com', NULL, 1, 0.00),
(7, 'Eric', 'Cantona', 'Adiyaman', NULL, NULL, 1, 0.00),
(8, 'Ibrahim', 'Tatlises', 'Adana', NULL, NULL, 1, 0.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `departmen`
--

CREATE TABLE `departmen` (
  `Departmanid` int(11) NOT NULL,
  `DepartmanAd` varchar(50) DEFAULT NULL,
  `Durum` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `departmen`
--

INSERT INTO `departmen` (`Departmanid`, `DepartmanAd`, `Durum`) VALUES
(1, 'Satis', 1),
(2, 'Muhasebe', 1),
(3, 'Hukuk', 1),
(4, 'Yazilim Gelistirme', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `detays`
--

CREATE TABLE `detays` (
  `Detayid` int(11) NOT NULL,
  `UrunAd` varchar(50) DEFAULT NULL,
  `UrunBilgi` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `detays`
--

INSERT INTO `detays` (`Detayid`, `UrunAd`, `UrunBilgi`) VALUES
(1, 'MacBookAir', 'Bellek :\r\n8 GB\r\nEkran Boyutu :\r\n13.3 inç\r\nİşlemci Tipi :\r\nApple M1\r\nİşletim Sistemi :\r\nmacOS\r\nEkran Tipi :\r\nRetina ekran\r\nEkran Modeli :\r\nIPS Ekran'),
(2, 'Buzdolabi', 'Ürün TipiDondurucu Altta No-Frost BuzdolabıÜrün RengiBeyazToplam Net Hacim (Lt)588Ürün Boyutları (cm) (YxGxD)186x84x75');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `faturakalems`
--

CREATE TABLE `faturakalems` (
  `FaturaKalemid` int(11) NOT NULL,
  `StokHareketTuru` varchar(30) DEFAULT NULL,
  `BelgeTuru` varchar(30) DEFAULT NULL,
  `Tarih` datetime NOT NULL,
  `BirimFiyat` decimal(18,2) NOT NULL,
  `KdvOrani` int(11) NOT NULL,
  `Tutar` decimal(18,2) NOT NULL,
  `Durum` tinyint(1) NOT NULL,
  `Urunid` int(11) NOT NULL,
  `Ambarid` int(11) NOT NULL,
  `Faturaid` int(11) NOT NULL,
  `Adet` int(11) NOT NULL,
  `OnayStatusu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `faturakalems`
--

INSERT INTO `faturakalems` (`FaturaKalemid`, `StokHareketTuru`, `BelgeTuru`, `Tarih`, `BirimFiyat`, `KdvOrani`, `Tutar`, `Durum`, `Urunid`, `Ambarid`, `Faturaid`, `Adet`, `OnayStatusu`) VALUES
(7, 'CIKIS', 'FATURA_SATIS', '2024-06-03 12:25:23', 1.00, 1, 1000.00, 1, 1, 1, 5, 1000, 'OnayBekliyor'),
(8, 'CIKIS', 'FATURA_SATIS', '2024-06-03 12:21:25', 1.00, 1, 2000.00, 1, 2, 1, 5, 2000, 'OnayBekliyor'),
(9, 'CIKIS', 'FATURA_SATIS', '2024-06-03 12:24:47', 1.00, 1, 2000.00, 1, 1, 1, 5, 2000, 'OnayBekliyor'),
(10, 'CIKIS', 'FATURA_SATIS', '2024-06-04 10:17:42', 1.00, 1, 2000.00, 1, 1, 1, 5, 2000, 'OnayBekliyor'),
(11, 'CIKIS', 'FATURA_SATIS', '2024-06-04 10:18:30', 1.00, 1, 3000.00, 1, 1, 1, 5, 3000, 'OnayBekliyor');

--
-- Tetikleyiciler `faturakalems`
--
DELIMITER $$
CREATE TRIGGER `Trigger_KalemEkle_StokGuncelle` AFTER INSERT ON `faturakalems` FOR EACH ROW begin
set @TOPLAMGIRISSTOKHAREKET=0;
set @TOPLAMCIKISSTOKHAREKET=0;
set @TOPLAMGIRISFATURAKALEM=0;
set @TOPLAMCIKISFATURAKALEM=0;
select  ifnull(sum(adet),0)  into @TOPLAMGIRISSTOKHAREKET  from stokharekets  where Urunid=new.Urunid and StokHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMCIKISSTOKHAREKET from stokharekets  where Urunid=new.Urunid and StokHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMGIRISFATURAKALEM  from faturakalems where Urunid=new.Urunid and StokHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMCIKISFATURAKALEM from faturakalems  where Urunid=new.Urunid and StokHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
set @STOKDURUM=(@TOPLAMGIRISSTOKHAREKET+@TOPLAMGIRISFATURAKALEM)-(@TOPLAMCIKISSTOKHAREKET+@TOPLAMCIKISFATURAKALEM);
-- if (new.OnayStatusu='Onaylandi') then 
update uruns set Stok=@STOKDURUM where Urunid=new.Urunid;
-- end if;
-- end;
-- end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Trigger_KalemEkle_TutarGuncelle` AFTER INSERT ON `faturakalems` FOR EACH ROW begin  
set @KALEMTOPLAM=0;
select  ifnull(sum(Tutar),0)  into @KALEMTOPLAM  from faturakalems  where Faturaid=new.Faturaid and Durum=1;
update faturalars  set GenelToplam =@KALEMTOPLAM where Faturaid=new.Faturaid;
update transactiontasks  set Tutar  =@KALEMTOPLAM where Belgeid =new.Faturaid and BelgeTuru =new.BelgeTuru;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Trigger_KalemGuncelle_StokGuncelle` AFTER UPDATE ON `faturakalems` FOR EACH ROW begin
set @TOPLAMGIRISSTOKHAREKET=0;
set @TOPLAMCIKISSTOKHAREKET=0;
set @TOPLAMGIRISFATURAKALEM=0;
set @TOPLAMCIKISFATURAKALEM=0;
select  ifnull(sum(adet),0)  into @TOPLAMGIRISSTOKHAREKET  from stokharekets  where Urunid=new.Urunid and StokHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMCIKISSTOKHAREKET from stokharekets  where Urunid=new.Urunid and StokHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMGIRISFATURAKALEM  from faturakalems where Urunid=new.Urunid and StokHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMCIKISFATURAKALEM from faturakalems  where Urunid=new.Urunid and StokHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
set @STOKDURUM=(@TOPLAMGIRISSTOKHAREKET+@TOPLAMGIRISFATURAKALEM)-(@TOPLAMCIKISSTOKHAREKET+@TOPLAMCIKISFATURAKALEM);
-- if (new.OnayStatusu='Onaylandi') then 
update uruns set Stok=@STOKDURUM where Urunid=new.Urunid;
-- end if;
-- end;
-- end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Trigger_KalemGuncelle_TutarGuncelle` AFTER UPDATE ON `faturakalems` FOR EACH ROW begin  
set @KALEMTOPLAM=0;
select  ifnull(sum(Tutar),0)  into @KALEMTOPLAM  from faturakalems  where Faturaid=old.Faturaid and Durum=1;
update faturalars  set GenelToplam =@KALEMTOPLAM where Faturaid=old.Faturaid;
update transactiontasks  set Tutar  =@KALEMTOPLAM where Belgeid =new.Faturaid and BelgeTuru =new.BelgeTuru;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Trigger_KalemSil_StokGuncelle` AFTER DELETE ON `faturakalems` FOR EACH ROW begin  
set @TOPLAMGIRISSTOKHAREKET=0;
set @TOPLAMCIKISSTOKHAREKET=0;
set @TOPLAMGIRISFATURAKALEM=0;
set @TOPLAMCIKISFATURAKALEM=0;
select  ifnull(sum(adet),0)  into @TOPLAMGIRISSTOKHAREKET  from stokharekets  where Urunid=old.Urunid and StokHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMCIKISSTOKHAREKET from stokharekets  where Urunid=old.Urunid and StokHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMGIRISFATURAKALEM  from faturakalems where Urunid=old.Urunid and StokHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMCIKISFATURAKALEM from faturakalems  where Urunid=old.Urunid and StokHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
set @STOKDURUM=(@TOPLAMGIRISSTOKHAREKET+@TOPLAMGIRISFATURAKALEM)-(@TOPLAMCIKISSTOKHAREKET+@TOPLAMCIKISFATURAKALEM);
-- if (old.OnayStatusu='Onaylandi') then 
update uruns set Stok=@STOKDURUM where Urunid=old.Urunid;
-- end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Trigger_KalemSil_TutarGuncelle` AFTER DELETE ON `faturakalems` FOR EACH ROW begin  
set @KALEMTOPLAM=0;
select  ifnull(sum(Tutar),0)  into @KALEMTOPLAM  from faturakalems  where Faturaid=old.Faturaid and Durum=1;
update faturalars  set GenelToplam =@KALEMTOPLAM where Faturaid=old.Faturaid;
update transactiontasks  set Tutar  =@KALEMTOPLAM where Belgeid =old.Faturaid and BelgeTuru =old.BelgeTuru;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `faturalars`
--

CREATE TABLE `faturalars` (
  `Faturaid` int(11) NOT NULL,
  `FaturaSeriNo` char(5) DEFAULT NULL,
  `FaturaSiraNo` varchar(6) DEFAULT NULL,
  `Tarih` datetime NOT NULL,
  `VergiDairesi` varchar(30) DEFAULT NULL,
  `VergiNo` varchar(30) DEFAULT NULL,
  `Saat` char(5) DEFAULT NULL,
  `TeslimEden` varchar(30) DEFAULT NULL,
  `TeslimAlan` varchar(30) DEFAULT NULL,
  `Durum` tinyint(1) NOT NULL,
  `KdvTutar` decimal(18,2) NOT NULL,
  `GenelToplam` decimal(18,2) NOT NULL,
  `OdemeTuru` varchar(30) DEFAULT NULL,
  `Cariid` int(11) NOT NULL,
  `Personelid` int(11) NOT NULL,
  `Ambarid` int(11) NOT NULL,
  `BelgeTuru` varchar(50) DEFAULT NULL,
  `FaturaHareketTuru` varchar(30) DEFAULT NULL,
  `Kasaid` int(11) NOT NULL,
  `OnayStatusu` varchar(50) DEFAULT NULL,
  `FinansHesapid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `faturalars`
--

INSERT INTO `faturalars` (`Faturaid`, `FaturaSeriNo`, `FaturaSiraNo`, `Tarih`, `VergiDairesi`, `VergiNo`, `Saat`, `TeslimEden`, `TeslimAlan`, `Durum`, `KdvTutar`, `GenelToplam`, `OdemeTuru`, `Cariid`, `Personelid`, `Ambarid`, `BelgeTuru`, `FaturaHareketTuru`, `Kasaid`, `OnayStatusu`, `FinansHesapid`) VALUES
(5, 'A', NULL, '2024-06-04 00:00:00', 'ADANA', NULL, '12:21', 'Seda Sayan', 'Mahmut Mardinli', 1, 0.00, 10000.00, 'ODEME_NAKIT', 1, 1, 1, 'FATURA_SATIS', 'CIKIS', 2, 'OnayBekliyor', 6);

--
-- Tetikleyiciler `faturalars`
--
DELIMITER $$
CREATE TRIGGER `Trigger_FaturaEkle_CariBakiyeHesapla` AFTER INSERT ON `faturalars` FOR EACH ROW begin
set @TOPLAMALACAKFATURA_CARI=0;
set @TOPLAMBORCFATURA_CARI=0;
set @TOPLAMALACAKFINANSHAREKET_CARI=0;
set @TOPLAMBORCFINANSHAREKET_CARI=0;
set @TOPLAMGIRISFINANSHAREKET_FINANSHESAP=0;
set @TOPLAMCIKISFINANSHAREKET_FINANSHESAP=0;
select  ifnull(sum(GenelToplam),0)  into @TOPLAMALACAKFATURA_CARI  from faturalars where Cariid=new.Cariid and FaturaHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(GenelToplam),0)  into @TOPLAMBORCFATURA_CARI from faturalars  where Cariid=new.Cariid and FaturaHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMALACAKFINANSHAREKET_CARI  from finansalharekets where Cariid=new.Cariid and FinansalHareketTuruCari ='ALACAK' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMBORCFINANSHAREKET_CARI from finansalharekets  where Cariid=new.Cariid and FinansalHareketTuruCari ='BORC' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMGIRISFINANSHAREKET_FINANSHESAP  from finansalharekets where FinansHesapid=new.FinansHesapid and FinansalHareketTuruFinansHesap ='BORC' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMCIKISFINANSHAREKET_FINANSHESAP from finansalharekets  where FinansHesapid=new.FinansHesapid and FinansalHareketTuruFinansHesap ='ALACAK' and Durum=1 and OnayStatusu='Onaylandi';

set @CARISONBAKIYE=(@TOPLAMALACAKFATURA_CARI+@TOPLAMALACAKFINANSHAREKET_CARI)-(@TOPLAMBORCFATURA_CARI+@TOPLAMBORCFINANSHAREKET_CARI);
set @FINANSSONBAKIYE=(@TOPLAMGIRISFINANSHAREKET_FINANSHESAP-@TOPLAMCIKISFINANSHAREKET_FINANSHESAP);
update carilers  set CariBakiye =@CARISONBAKIYE where Cariid=new.Cariid;
update finanshesaplaris  set FinansHesapBakiye =@FINANSSONBAKIYE where FinansHesapid=new.FinansHesapid;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Trigger_FaturaGuncelle_CariBakiyeHesapla` AFTER UPDATE ON `faturalars` FOR EACH ROW begin
set @TOPLAMALACAKFATURA_CARI=0;
set @TOPLAMBORCFATURA_CARI=0;
set @TOPLAMALACAKFINANSHAREKET_CARI=0;
set @TOPLAMBORCFINANSHAREKET_CARI=0;
set @TOPLAMGIRISFINANSHAREKET_FINANSHESAP=0;
set @TOPLAMCIKISFINANSHAREKET_FINANSHESAP=0;
select  ifnull(sum(GenelToplam),0)  into @TOPLAMALACAKFATURA_CARI  from faturalars where Cariid=new.Cariid and FaturaHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(GenelToplam),0)  into @TOPLAMBORCFATURA_CARI from faturalars  where Cariid=new.Cariid and FaturaHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMALACAKFINANSHAREKET_CARI  from finansalharekets where Cariid=new.Cariid and FinansalHareketTuruCari ='ALACAK' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMBORCFINANSHAREKET_CARI from finansalharekets  where Cariid=new.Cariid and FinansalHareketTuruCari ='BORC' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMGIRISFINANSHAREKET_FINANSHESAP  from finansalharekets where FinansHesapid=new.FinansHesapid and FinansalHareketTuruFinansHesap ='BORC' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMCIKISFINANSHAREKET_FINANSHESAP from finansalharekets  where FinansHesapid=new.FinansHesapid and FinansalHareketTuruFinansHesap ='ALACAK' and Durum=1 and OnayStatusu='Onaylandi';

set @CARISONBAKIYE=(@TOPLAMALACAKFATURA_CARI+@TOPLAMALACAKFINANSHAREKET_CARI)-(@TOPLAMBORCFATURA_CARI+@TOPLAMBORCFINANSHAREKET_CARI);
set @FINANSSONBAKIYE=(@TOPLAMGIRISFINANSHAREKET_FINANSHESAP-@TOPLAMCIKISFINANSHAREKET_FINANSHESAP);
update carilers  set CariBakiye =@CARISONBAKIYE where Cariid=new.Cariid;
update finanshesaplaris  set FinansHesapBakiye =@FINANSSONBAKIYE where FinansHesapid=new.FinansHesapid;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Trigger_FaturaSil_CariBakiyeHesapla` AFTER DELETE ON `faturalars` FOR EACH ROW begin
set @TOPLAMALACAKFATURA_CARI=0;
set @TOPLAMBORCFATURA_CARI=0;
set @TOPLAMALACAKFINANSHAREKET_CARI=0;
set @TOPLAMBORCFINANSHAREKET_CARI=0;
set @TOPLAMGIRISFINANSHAREKET_FINANSHESAP=0;
set @TOPLAMCIKISFINANSHAREKET_FINANSHESAP=0;
select  ifnull(sum(GenelToplam),0)  into @TOPLAMALACAKFATURA_CARI  from faturalars where Cariid=old.Cariid and FaturaHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(GenelToplam),0)  into @TOPLAMBORCFATURA_CARI from faturalars  where Cariid=old.Cariid and FaturaHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMALACAKFINANSHAREKET_CARI  from finansalharekets where Cariid=old.Cariid and FinansalHareketTuruCari ='ALACAK' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMBORCFINANSHAREKET_CARI from finansalharekets  where Cariid=old.Cariid and FinansalHareketTuruCari ='BORC' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMGIRISFINANSHAREKET_FINANSHESAP  from finansalharekets where FinansHesapid=old.FinansHesapid and FinansalHareketTuruFinansHesap ='BORC' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMCIKISFINANSHAREKET_FINANSHESAP from finansalharekets  where FinansHesapid=old.FinansHesapid and FinansalHareketTuruFinansHesap ='ALACAK' and Durum=1 and OnayStatusu='Onaylandi';

set @CARISONBAKIYE=(@TOPLAMALACAKFATURA_CARI+@TOPLAMALACAKFINANSHAREKET_CARI)-(@TOPLAMBORCFATURA_CARI+@TOPLAMBORCFINANSHAREKET_CARI);
set @FINANSSONBAKIYE=(@TOPLAMGIRISFINANSHAREKET_FINANSHESAP-@TOPLAMCIKISFINANSHAREKET_FINANSHESAP);
update carilers  set CariBakiye =@CARISONBAKIYE where Cariid=old.Cariid;
update finanshesaplaris  set FinansHesapBakiye  =@FINANSSONBAKIYE where FinansHesapid=old.FinansHesapid;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `finansalharekets`
--

CREATE TABLE `finansalharekets` (
  `FinansalHareketid` int(11) NOT NULL,
  `Tarih` datetime NOT NULL,
  `Saat` char(5) DEFAULT NULL,
  `Tutar` decimal(18,2) NOT NULL,
  `BelgeTuru` varchar(50) DEFAULT NULL,
  `Cariid` int(11) NOT NULL,
  `Personelid` int(11) NOT NULL,
  `FinansHesapid` int(11) NOT NULL,
  `Durum` tinyint(1) NOT NULL,
  `KrediKartNo` varchar(50) DEFAULT NULL,
  `KrediKartSKT` varchar(50) DEFAULT NULL,
  `KrediKartCVC` varchar(50) DEFAULT NULL,
  `KrediKartTIP` varchar(50) DEFAULT NULL,
  `CekSenetNo` varchar(50) DEFAULT NULL,
  `CekSenetOdemeTarihi` datetime NOT NULL,
  `Aciklama` varchar(200) DEFAULT NULL,
  `OnayStatusu` varchar(50) DEFAULT NULL,
  `FinansalHareketTuruCari` varchar(30) DEFAULT NULL,
  `FinansalHareketTuruFinansHesap` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `finansalharekets`
--

INSERT INTO `finansalharekets` (`FinansalHareketid`, `Tarih`, `Saat`, `Tutar`, `BelgeTuru`, `Cariid`, `Personelid`, `FinansHesapid`, `Durum`, `KrediKartNo`, `KrediKartSKT`, `KrediKartCVC`, `KrediKartTIP`, `CekSenetNo`, `CekSenetOdemeTarihi`, `Aciklama`, `OnayStatusu`, `FinansalHareketTuruCari`, `FinansalHareketTuruFinansHesap`) VALUES
(10, '2024-06-01 19:37:27', '19:37', 5000.00, 'TAHSILAT_NAKIT', 1, 1, 6, 1, NULL, NULL, NULL, NULL, NULL, '0001-01-01 00:00:00', NULL, 'OnayBekliyor', 'ALACAK', 'BORC'),
(11, '2024-06-01 19:37:32', '19:37', 5000.00, 'ODEME_NAKIT', 1, 1, 6, 1, NULL, NULL, NULL, NULL, NULL, '0001-01-01 00:00:00', NULL, 'OnayBekliyor', 'BORC', 'ALACAK');

--
-- Tetikleyiciler `finansalharekets`
--
DELIMITER $$
CREATE TRIGGER `Trigger_FinansalHareketEkle_CariBakiyeHesapla` AFTER INSERT ON `finansalharekets` FOR EACH ROW begin
set @TOPLAMALACAKFATURA_CARI=0;
set @TOPLAMBORCFATURA_CARI=0;
set @TOPLAMALACAKFINANSHAREKET_CARI=0;
set @TOPLAMBORCFINANSHAREKET_CARI=0;
set @TOPLAMGIRISFINANSHAREKET_FINANSHESAP=0;
set @TOPLAMCIKISFINANSHAREKET_FINANSHESAP=0;
select  ifnull(sum(GenelToplam),0)  into @TOPLAMALACAKFATURA_CARI  from faturalars where Cariid=new.Cariid and FaturaHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(GenelToplam),0)  into @TOPLAMBORCFATURA_CARI from faturalars  where Cariid=new.Cariid and FaturaHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMALACAKFINANSHAREKET_CARI  from finansalharekets where Cariid=new.Cariid and FinansalHareketTuruCari ='ALACAK' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMBORCFINANSHAREKET_CARI from finansalharekets  where Cariid=new.Cariid and FinansalHareketTuruCari ='BORC' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMGIRISFINANSHAREKET_FINANSHESAP  from finansalharekets where FinansHesapid=new.FinansHesapid and FinansalHareketTuruFinansHesap ='BORC' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMCIKISFINANSHAREKET_FINANSHESAP from finansalharekets  where FinansHesapid=new.FinansHesapid and FinansalHareketTuruFinansHesap ='ALACAK' and Durum=1 and OnayStatusu='Onaylandi';

set @CARISONBAKIYE=(@TOPLAMALACAKFATURA_CARI+@TOPLAMALACAKFINANSHAREKET_CARI)-(@TOPLAMBORCFATURA_CARI+@TOPLAMBORCFINANSHAREKET_CARI);
set @FINANSSONBAKIYE=(@TOPLAMGIRISFINANSHAREKET_FINANSHESAP-@TOPLAMCIKISFINANSHAREKET_FINANSHESAP);
update carilers  set CariBakiye =@CARISONBAKIYE where Cariid=new.Cariid;
update finanshesaplaris  set FinansHesapBakiye =@FINANSSONBAKIYE where FinansHesapid=new.FinansHesapid;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Trigger_FinansalHareketGuncelle_CariBakiyeHesapla` AFTER UPDATE ON `finansalharekets` FOR EACH ROW begin
set @TOPLAMALACAKFATURA_CARI=0;
set @TOPLAMBORCFATURA_CARI=0;
set @TOPLAMALACAKFINANSHAREKET_CARI=0;
set @TOPLAMBORCFINANSHAREKET_CARI=0;
set @TOPLAMGIRISFINANSHAREKET_FINANSHESAP=0;
set @TOPLAMCIKISFINANSHAREKET_FINANSHESAP=0;
select  ifnull(sum(GenelToplam),0)  into @TOPLAMALACAKFATURA_CARI  from faturalars where Cariid=new.Cariid and FaturaHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(GenelToplam),0)  into @TOPLAMBORCFATURA_CARI from faturalars  where Cariid=new.Cariid and FaturaHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMALACAKFINANSHAREKET_CARI  from finansalharekets where Cariid=new.Cariid and FinansalHareketTuruCari ='ALACAK' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMBORCFINANSHAREKET_CARI from finansalharekets  where Cariid=new.Cariid and FinansalHareketTuruCari ='BORC' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMGIRISFINANSHAREKET_FINANSHESAP  from finansalharekets where FinansHesapid=new.FinansHesapid and FinansalHareketTuruFinansHesap ='BORC' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMCIKISFINANSHAREKET_FINANSHESAP from finansalharekets  where FinansHesapid=new.FinansHesapid and FinansalHareketTuruFinansHesap ='ALACAK' and Durum=1 and OnayStatusu='Onaylandi';

set @CARISONBAKIYE=(@TOPLAMALACAKFATURA_CARI+@TOPLAMALACAKFINANSHAREKET_CARI)-(@TOPLAMBORCFATURA_CARI+@TOPLAMBORCFINANSHAREKET_CARI);
set @FINANSSONBAKIYE=(@TOPLAMGIRISFINANSHAREKET_FINANSHESAP-@TOPLAMCIKISFINANSHAREKET_FINANSHESAP);
update carilers  set CariBakiye =@CARISONBAKIYE where Cariid=new.Cariid;
update finanshesaplaris  set FinansHesapBakiye =@FINANSSONBAKIYE where FinansHesapid=new.FinansHesapid;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Trigger_FinansalHareketSil_CariBakiyeHesapla` AFTER DELETE ON `finansalharekets` FOR EACH ROW begin
set @TOPLAMALACAKFATURA_CARI=0;
set @TOPLAMBORCFATURA_CARI=0;
set @TOPLAMALACAKFINANSHAREKET_CARI=0;
set @TOPLAMBORCFINANSHAREKET_CARI=0;
set @TOPLAMGIRISFINANSHAREKET_FINANSHESAP=0;
set @TOPLAMCIKISFINANSHAREKET_FINANSHESAP=0;
select  ifnull(sum(GenelToplam),0)  into @TOPLAMALACAKFATURA_CARI  from faturalars where Cariid=old.Cariid and FaturaHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(GenelToplam),0)  into @TOPLAMBORCFATURA_CARI from faturalars  where Cariid=old.Cariid and FaturaHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMALACAKFINANSHAREKET_CARI  from finansalharekets where Cariid=old.Cariid and FinansalHareketTuruCari ='ALACAK' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMBORCFINANSHAREKET_CARI from finansalharekets  where Cariid=old.Cariid and FinansalHareketTuruCari ='BORC' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMGIRISFINANSHAREKET_FINANSHESAP  from finansalharekets where FinansHesapid=old.FinansHesapid and FinansalHareketTuruFinansHesap ='BORC' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(Tutar),0)  into @TOPLAMCIKISFINANSHAREKET_FINANSHESAP from finansalharekets  where FinansHesapid=old.FinansHesapid and FinansalHareketTuruFinansHesap ='ALACAK' and Durum=1 and OnayStatusu='Onaylandi';

set @CARISONBAKIYE=(@TOPLAMALACAKFATURA_CARI+@TOPLAMALACAKFINANSHAREKET_CARI)-(@TOPLAMBORCFATURA_CARI+@TOPLAMBORCFINANSHAREKET_CARI);
set @FINANSSONBAKIYE=(@TOPLAMGIRISFINANSHAREKET_FINANSHESAP-@TOPLAMCIKISFINANSHAREKET_FINANSHESAP);
update carilers  set CariBakiye =@CARISONBAKIYE where Cariid=old.Cariid;
update finanshesaplaris  set FinansHesapBakiye  =@FINANSSONBAKIYE where FinansHesapid=old.FinansHesapid;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `finanshesaplaris`
--

CREATE TABLE `finanshesaplaris` (
  `FinansHesapid` int(11) NOT NULL,
  `FinansHesapAdi` varchar(50) DEFAULT NULL,
  `FinansHesapTuru` varchar(50) DEFAULT NULL,
  `FinansHesapNo` varchar(50) DEFAULT NULL,
  `FinansHesapIbanNo` varchar(50) DEFAULT NULL,
  `FinansHesapSahibi` varchar(50) DEFAULT NULL,
  `FinansHesapBakiye` decimal(18,2) NOT NULL,
  `FinansHesapAciklama` varchar(200) DEFAULT NULL,
  `Durum` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `finanshesaplaris`
--

INSERT INTO `finanshesaplaris` (`FinansHesapid`, `FinansHesapAdi`, `FinansHesapTuru`, `FinansHesapNo`, `FinansHesapIbanNo`, `FinansHesapSahibi`, `FinansHesapBakiye`, `FinansHesapAciklama`, `Durum`) VALUES
(1, 'MERKEZ NAKIT KASA', 'KASA_NAKIT', '101', NULL, NULL, 0.00, NULL, 1),
(2, 'TURKIYE FINANS BANKASI HESABI', 'BANKA_NORMAL', '102', '102', NULL, 0.00, NULL, 1),
(3, 'TICKET YEMEK CEKI HESABI', 'YEMEK_CEKI_KARTI', NULL, NULL, NULL, 0.00, NULL, 1),
(4, 'SETCARD YEMEK CEKI HESABI', 'YEMEK_CEKI_KARTI', NULL, NULL, NULL, 0.00, NULL, 1),
(5, 'MUSTAFA ALTUNDAG_AKBANK', 'BANKA_FINANS_KURULUSU', '101', '101', NULL, 0.00, NULL, 1),
(6, 'M_T_AKBANK', 'BANKA_HESABI', '101', '101', NULL, 0.00, NULL, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `giders`
--

CREATE TABLE `giders` (
  `Giderid` int(11) NOT NULL,
  `Aciklama` varchar(100) DEFAULT NULL,
  `Tarih` datetime NOT NULL,
  `Tutar` decimal(18,2) NOT NULL,
  `Durum` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kasalars`
--

CREATE TABLE `kasalars` (
  `Kasaid` int(11) NOT NULL,
  `KasaAdi` varchar(50) DEFAULT NULL,
  `KasaBakiye` decimal(18,2) NOT NULL,
  `Personelid` int(11) NOT NULL,
  `Durum` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kasalars`
--

INSERT INTO `kasalars` (`Kasaid`, `KasaAdi`, `KasaBakiye`, `Personelid`, `Durum`) VALUES
(1, 'KASA_SECIMI', 0.00, 1, 0),
(2, 'KASA_01', 0.00, 4, 1),
(3, 'KASA_02', 0.00, 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoris`
--

CREATE TABLE `kategoris` (
  `KategoriID` int(11) NOT NULL,
  `KategoriAd` varchar(30) DEFAULT NULL,
  `Durum` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kategoris`
--

INSERT INTO `kategoris` (`KategoriID`, `KategoriAd`, `Durum`) VALUES
(1, 'Beyaz Esya', 1),
(2, 'Gıda', 1),
(3, 'Bilgisayar', 1),
(4, 'Hukuk', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `markas`
--

CREATE TABLE `markas` (
  `MarkaID` int(11) NOT NULL,
  `MarkaAd` varchar(50) DEFAULT NULL,
  `Durum` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `markas`
--

INSERT INTO `markas` (`MarkaID`, `MarkaAd`, `Durum`) VALUES
(1, 'Beko', 1),
(2, 'Samsung', 1),
(3, 'Apple', 1),
(4, 'Hukuk', 1),
(5, 'Sony', 1),
(6, 'Xiaomi', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `parametres`
--

CREATE TABLE `parametres` (
  `ParametreID` int(11) NOT NULL,
  `ParametreTuru` varchar(30) DEFAULT NULL,
  `ParametreAciklamasi` varchar(30) DEFAULT NULL,
  `Durum` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `parametres`
--

INSERT INTO `parametres` (`ParametreID`, `ParametreTuru`, `ParametreAciklamasi`, `Durum`) VALUES
(8, 'KASIYER_01', 'Kasiyer 01', 0),
(9, 'KASIYER_02', 'Kasiyer 02', 0),
(10, 'KASA_01', 'Merkez Kasa', 0),
(11, 'KASA_02', 'Sube Kasa', 0),
(15, 'STOKHAREKETBELGETURU_01', 'IRSALIYE_ALIS', 0),
(16, 'STOKHAREKETBELGETURU_02', 'IRSALIYE_SATIS', 0),
(17, 'FATURAHAREKETTURU_01', 'GIRIS', 0),
(18, 'FATURAHAREKETTURU_02', 'CIKIS', 0),
(19, 'FINANSALISLEM_TAHSILAT_01', 'TAHSILAT_NAKIT', 0),
(20, 'FINANSALISLEM_TAHSILAT_02', 'TAHSILAT_HAVALE_EFT_FAST', 0),
(21, 'FINANSALISLEM_TAHSILAT_03', 'TAHSILAT_KREDI_KARTI', 0),
(22, 'FINANSALISLEM_TAHSILAT_04', 'TAHSILAT_YEMEK_CEKI', 0),
(23, 'FINANSALISLEM_ODEME_01', 'ODEME_NAKIT', 0),
(24, 'FINANSALISLEM_ODEME_02', 'ODEME_HAVALE_EFT_FAST', 0),
(25, 'STOKHAREKETTURU_01', 'GIRIS', 0),
(26, 'VERGIDAIRESI_01', 'ADANA', 1),
(27, 'VERGIDAIRESI_02', 'ADIYAMAN', 1),
(28, 'FATURASERI_01', 'A00', 0),
(29, 'FATURASERI_02', 'B00', 0),
(30, 'SEHIR_01', 'Adana', 1),
(31, 'SEHIR_02', 'Adiyaman', 1),
(32, 'FATURABELGETURU_01', 'FATURA_ALIS', 0),
(33, 'FATURABELGETURU_02', 'FATURA_SATIS', 0),
(34, 'STOKHAREKETTURU_02', 'CIKIS', 0),
(35, 'STOKHAREKETTURU_03', 'AMBAR TRANSFERI', 0),
(36, 'FINANSALISLEM_ODEME_03', 'ODEME_KREDI_KARTI', 0),
(37, 'FINANSALISLEM_ODEME_04', 'ODEME_YEMEK_CEKI', 0),
(38, 'FINANSALISLEM_ODEME_05', 'ODEME_CEK_SENET', 0),
(39, 'FINANSALISLEM_TAHSILAT_05', 'TAHSILAT_CEK_SENET', 0),
(40, 'FINANSHESAPTURU_01', 'KASA_NAKIT', 0),
(41, 'FINANSHESAPTURU_02', 'KASA_DEGERLI_MADEN', 0),
(42, 'FINANSHESAPTURU_03', 'KASA_DEGERLI_EVRAK_CEK_SENET', 0),
(43, 'FINANSHESAPTURU_04', 'BANKA_NORMAL', 0),
(44, 'FINANSHESAPTURU_05', 'YEMEK_CEKI_KARTI', 0),
(45, 'FINANSHESAPTURU_06', 'FIZIKI_POS', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personels`
--

CREATE TABLE `personels` (
  `Personelid` int(11) NOT NULL,
  `PersonelAd` varchar(50) DEFAULT NULL,
  `PersonelSoyad` varchar(50) DEFAULT NULL,
  `PersonelGorsel` varchar(250) DEFAULT NULL,
  `Durum` tinyint(1) NOT NULL,
  `Departmanid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `personels`
--

INSERT INTO `personels` (`Personelid`, `PersonelAd`, `PersonelSoyad`, `PersonelGorsel`, `Durum`, `Departmanid`) VALUES
(1, 'Seda', 'Sayan', NULL, 1, 2),
(2, 'Berna', 'Yoneyoglu', NULL, 1, 3),
(4, 'Mustafa', 'Altundag', NULL, 1, 4),
(5, 'Hande', 'Yener', NULL, 1, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `satisharekets`
--

CREATE TABLE `satisharekets` (
  `Satisid` int(11) NOT NULL,
  `Tarih` datetime NOT NULL,
  `Adet` int(11) NOT NULL,
  `Fiyat` decimal(18,2) NOT NULL,
  `ToplamTutar` decimal(18,2) NOT NULL,
  `Urunid` int(11) NOT NULL,
  `Cariid` int(11) NOT NULL,
  `Personelid` int(11) NOT NULL,
  `Durum` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `satisharekets`
--
DELIMITER $$
CREATE TRIGGER `SATISGUNCELLE` AFTER UPDATE ON `satisharekets` FOR EACH ROW begin  
	if (old.Durum=1) and (new.Durum=1) then 
		update uruns set stok=stok+old.Adet where Urunid=old.Urunid; ## eskisatisekleniyor
		update uruns set stok=stok-new.Adet where Urunid=new.Urunid; ## yenisatisdusuluyor
	else if (old.Durum=1) and (new.Durum=0) then
		update uruns set stok=stok+old.Adet where Urunid=old.Urunid; ## eskisatisekleniyor
	else if (old.Durum=0)and (new.Durum=1) then
		update uruns set stok=stok-new.Adet where Urunid=new.Urunid; ## yenisatisdusuluyor
		END if;
	END if;
	END if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `SATISSTOKAZALT` AFTER INSERT ON `satisharekets` FOR EACH ROW begin  
	update uruns set stok=stok-new.Adet where Urunid=new.Urunid;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `stokharekets`
--

CREATE TABLE `stokharekets` (
  `StokHareketid` int(11) NOT NULL,
  `Tarih` datetime NOT NULL,
  `Adet` int(11) NOT NULL,
  `Fiyat` decimal(18,2) NOT NULL,
  `ToplamTutar` decimal(18,2) NOT NULL,
  `StokHareketTuru` varchar(30) DEFAULT NULL,
  `Urunid` int(11) NOT NULL,
  `Cariid` int(11) NOT NULL,
  `Personelid` int(11) NOT NULL,
  `Ambarid` int(11) NOT NULL,
  `Durum` tinyint(1) NOT NULL,
  `BelgeTuru` varchar(30) DEFAULT NULL,
  `OnayStatusu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `stokharekets`
--
DELIMITER $$
CREATE TRIGGER `Trigger_StokHareketEkle_StokGuncelle` AFTER INSERT ON `stokharekets` FOR EACH ROW begin  
set @TOPLAMGIRISSTOKHAREKET=0;
set @TOPLAMCIKISSTOKHAREKET=0;
set @TOPLAMGIRISFATURAKALEM=0;
set @TOPLAMCIKISFATURAKALEM=0;
select  ifnull(sum(adet),0)  into @TOPLAMGIRISSTOKHAREKET  from stokharekets  where Urunid=new.Urunid and StokHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMCIKISSTOKHAREKET from stokharekets  where Urunid=new.Urunid and StokHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMGIRISFATURAKALEM  from faturakalems where Urunid=new.Urunid and StokHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMCIKISFATURAKALEM from faturakalems  where Urunid=new.Urunid and StokHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
set @STOKDURUM=(@TOPLAMGIRISSTOKHAREKET+@TOPLAMGIRISFATURAKALEM)-(@TOPLAMCIKISSTOKHAREKET+@TOPLAMCIKISFATURAKALEM);
-- if (new.OnayStatusu='Onaylandi') then 
update uruns set Stok=@STOKDURUM where Urunid=new.Urunid;
-- end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Trigger_StokHareketGuncelle_StokGuncelle` AFTER UPDATE ON `stokharekets` FOR EACH ROW begin  
set @TOPLAMGIRISSTOKHAREKET=0;
set @TOPLAMCIKISSTOKHAREKET=0;
set @TOPLAMGIRISFATURAKALEM=0;
set @TOPLAMCIKISFATURAKALEM=0;
select  ifnull(sum(adet),0)  into @TOPLAMGIRISSTOKHAREKET  from stokharekets  where Urunid=new.Urunid and StokHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMCIKISSTOKHAREKET from stokharekets  where Urunid=new.Urunid and StokHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMGIRISFATURAKALEM  from faturakalems where Urunid=new.Urunid and StokHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMCIKISFATURAKALEM from faturakalems  where Urunid=new.Urunid and StokHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
set @STOKDURUM=(@TOPLAMGIRISSTOKHAREKET+@TOPLAMGIRISFATURAKALEM)-(@TOPLAMCIKISSTOKHAREKET+@TOPLAMCIKISFATURAKALEM);
-- if (new.OnayStatusu='Onaylandi') then 
update uruns set Stok=@STOKDURUM where Urunid=new.Urunid;
-- end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Trigger_StokHareketSil_StokGuncelle` AFTER DELETE ON `stokharekets` FOR EACH ROW begin  
set @TOPLAMGIRISSTOKHAREKET=0;
set @TOPLAMCIKISSTOKHAREKET=0;
set @TOPLAMGIRISFATURAKALEM=0;
set @TOPLAMCIKISFATURAKALEM=0;
select  ifnull(sum(adet),0)  into @TOPLAMGIRISSTOKHAREKET  from stokharekets  where Urunid=old.Urunid and StokHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMCIKISSTOKHAREKET from stokharekets  where Urunid=old.Urunid and StokHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMGIRISFATURAKALEM  from faturakalems where Urunid=old.Urunid and StokHareketTuru ='GIRIS' and Durum=1 and OnayStatusu='Onaylandi';
select  ifnull(sum(adet),0)  into @TOPLAMCIKISFATURAKALEM from faturakalems  where Urunid=old.Urunid and StokHareketTuru ='CIKIS' and Durum=1 and OnayStatusu='Onaylandi';
set @STOKDURUM=(@TOPLAMGIRISSTOKHAREKET+@TOPLAMGIRISFATURAKALEM)-(@TOPLAMCIKISSTOKHAREKET+@TOPLAMCIKISFATURAKALEM);
-- if (old.OnayStatusu='Onaylandi') then 
update uruns set Stok=@STOKDURUM where Urunid=old.Urunid;
-- end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `transactiontasks`
--

CREATE TABLE `transactiontasks` (
  `TransactionTaskid` int(11) NOT NULL,
  `Belgeid` int(11) NOT NULL,
  `AcilisTarihi` datetime NOT NULL,
  `SonIslemTarihi` datetime NOT NULL,
  `BelgeTuru` varchar(50) DEFAULT NULL,
  `KayitAcanUser` varchar(50) DEFAULT NULL,
  `KayitOnaylayanUser` varchar(50) DEFAULT NULL,
  `OnayStatusu` varchar(50) DEFAULT NULL,
  `Durum` tinyint(1) NOT NULL,
  `CariBilgisi` varchar(50) DEFAULT NULL,
  `Tutar` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `transactiontasks`
--

INSERT INTO `transactiontasks` (`TransactionTaskid`, `Belgeid`, `AcilisTarihi`, `SonIslemTarihi`, `BelgeTuru`, `KayitAcanUser`, `KayitOnaylayanUser`, `OnayStatusu`, `Durum`, `CariBilgisi`, `Tutar`) VALUES
(13, 5, '2024-06-03 18:36:07', '2024-06-04 10:18:48', 'FATURA_SATIS', 'Seda Sayan', 'Seda Sayan', 'OnayBekliyor', 1, 'Mahmut Mardinli', 10000.00),
(14, 10, '2024-06-01 19:16:22', '2024-06-04 10:17:13', 'TAHSILAT_NAKIT', 'Seda Sayan', 'Mustafa Altundag', 'OnayBekliyor', 1, 'Mahmut Mardinli', 5000.00),
(15, 11, '2024-06-01 19:35:36', '2024-06-04 10:17:08', 'ODEME_NAKIT', 'Seda Sayan', 'Mustafa Altundag', 'OnayBekliyor', 1, 'Mahmut Mardinli', 5000.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uruns`
--

CREATE TABLE `uruns` (
  `Urunid` int(11) NOT NULL,
  `UrunAd` varchar(30) DEFAULT NULL,
  `Stok` smallint(6) NOT NULL,
  `AlisFiyat` decimal(18,2) NOT NULL,
  `SatisFiyat` decimal(18,2) NOT NULL,
  `Durum` tinyint(1) NOT NULL,
  `UrunGorsel` varchar(200) DEFAULT NULL,
  `Barkod` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Kategoriid` int(11) NOT NULL,
  `Markaid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `uruns`
--

INSERT INTO `uruns` (`Urunid`, `UrunAd`, `Stok`, `AlisFiyat`, `SatisFiyat`, `Durum`, `UrunGorsel`, `Barkod`, `Kategoriid`, `Markaid`) VALUES
(1, 'MacBook Air', 0, 30000.00, 36000.00, 1, 'https://st-troy.mncdn.com/mnresize/1500/1500/Content/media/ProductImg/original/mgn63tua-apple-macbook-air-13-apple-m1-8gb-256gb-ssd-uzay-grisi-mgn63tua-637883993057945209.jpg', '1234567890', 3, 3),
(2, 'Buzdolabi', 0, 21000.00, 0.00, 1, 'https://statics.vestel.com.tr/productimages/20264833_r1_1000_1000.jpg', '1234567890', 1, 1),
(3, 'Firin', 0, 25000.00, 0.00, 1, 'https://www.istockphoto.com/resources/images/PhotoFTLP/1040315976.jpg', '1234567890', 1, 1),
(4, 'Hukuki Yardim', 0, 1000.00, 0.00, 1, '\\thumber\\images\\img_4.jpg', '1234567890', 4, 4),
(7, '32\" TV', 0, 10000.00, 11000.00, 1, 'https://www.istockphoto.com/resources/images/PhotoFTLP/1040315976.jpg', '1234567890', 1, 1),
(8, '44\" Beko Televizyon', 0, 12000.00, 110.00, 1, '\\thumber\\images\\img_4.jpg', '1234567890', 1, 1),
(9, 'Beko Air Fryer', 0, 9000.00, 0.00, 1, '\\thumber\\images\\img_4.jpg', '1234567890', 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `__migrationhistory`
--

CREATE TABLE `__migrationhistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ContextKey` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Model` longblob NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `__migrationhistory`
--

INSERT INTO `__migrationhistory` (`MigrationId`, `ContextKey`, `Model`, `ProductVersion`) VALUES
('202405251210409_initial', 'mvc_net_Crm.Migrations.Configuration', 0x1f8b0800000000000400ed5ddb6ee438927d5f60ff21918f831e675dd08d9e823d03975dd563b8ab6c54ba1b3b4f053a93b6052ba55c49699467b15fb60ffb49f30b435d28f112bc49a494e92ed44339493122481e06836404f9affffbffe3bf7ddbc4b3279ce5519a9ccc5f1fbd9acf70b24ad751727f32df15777ffe79feb7bffee77f1c7f586fbecd7ea7dfbd2dbf232593fc64fe5014db778b45be7ac01b941f6da25596e6e95d71b44a370bb44e176f5ebdfacbe2f5eb052624e684d66c76fc659714d106573fc8cfb33459e16db143f1a7748de3bc492739cb8aeaec33dae07c8b56f864be795a7d4d70f1f52cdb1cd55f1f2da324ba8b51369f9dc61122222d717c379fa124490b541081dffd96e36591a5c9fd724b12507cf3bcc5e4bb3b14e7b8a9c8bbee73db3abd7a53d669d115a4a456bbbc48378e045fbf6d1a692116efd5d4f3b61149337e20cd5d3c97b5ae9af2647ebade4484aec8e9dd599c955f699bf9a82afcc38cf9e487161a0441e5bf1f6667bbb8d865f824c1bb2243f10fb3ebdd6d1cad2ef1f34dfa8893936417c7ac8c444a92c72590a4eb2cdde2ac78fe82ef58c9a3f57cb6e00b2fc4d26d59b1605dc18ba478fb663efb4cc440b7316ec1c034c6b24833fc0b4e70860abcbe46458133d297176b5c35a72482c0f0b2249d44abe8b4654a404806d67cf6097dfb1527f7c503197264247d8cbee1354d68e4f88d9424ed7e322fb21d36b15a4677190ecde41fb8788c744c3cf038df65bb0de5f13e4d638c12a0935822c78b0edd7acc6f6e4b1dd113f365e1c9305f32bf38ef81795a702ccc570c4fd73a98bcf581c51e3821443ea3a7e8beaaa7387e8af4f1ef28c38fb8c8e7b32f38ae3eca1fa26d3d991c311f7c6d70f4314b375fd2982f5d677ebd41d93d2e887ca9ea8b65bacb567d91cc90eb8b6786c454a86644e8a3cf85e263219c746df440d99d131237c49031434f9a8c2a786865d653f8183da396c4395e451b14cf67d719f9abb1e57e9ecf962b541274a77e936e63b4b9d91525d203f1603af0860ce7d02ae33d8eeff1188c7ecb761676869ec61941d9501ad76420a7098e87d2a914d650229e1576a383876b6aaa87d59a9aea725bd1caae8bb159b8f63b58bc265b2b20fdc655448a0ca38cdd87b090345f2b65fb91ab98e540328a587f048b57e66945ab3e80c4b29e8adb5eec370d37c5a79a82a99a719d7bedd493bf49b7e4a75d45592aee1e5a78993ea38938e38728d3707ee363b22a197d4251ac5d3cfa6274f54f1c2fd36c77869fd056c3f1675f0cdfa3c7e81907b3607caf424862ae5f86305f801308902f2f46a08f86ad47188abd17240c8dc95624a50cbdd622b4e0f755c8a1ad425e9ab5ee592769add93eda4832c7742acb8b41db19a9bc7eed0485bf9014a7e2334875f6326b6b735525a49c2b09087c3248af77cdda4fa7d3f253e973764cb9aa74fbf1e84fab539e5a53f7471fc611e564b26ebd32fb25cd72acb334df7861d74f038a44f016650541bcb33e568efb962438f8dbdc76bdcc8d7e205b1afed037aecac96c83f656a7a2e63768dd5e1a8b69e37e2aab253095cee280e7aab41c50eb4f6bb54cc3ab2dcfc60d33d2fc8c4811e2ba51db0bdfb5edd00fda65d9a9504dad6c5740db59e7feb05cf2f3b1d1643ef960eaf4fa27f7955b1ce561d75e95520ecbc2cb445df698d1b0f0b2a1f41e658f6970157749707b9f0e5f4f7e22d2227fc60b150bd49434b3da4fe794249f23592c42b6abb152d51194a8ca91c561922559d83cff5693f3da4e9c4a34cbbf5e3349d7a1fd66135a7eaa1985f2efe316c3961dcd1bace1197e76f16c24358368c8b017b1acd00abd70dce8807e20ae0a4f85e08a791ff8b605c7c26ec5f0e0ac7b35702d660711b2d0ccd10bafef51f288e2fe8e88b4fc54a8adf8f731e5db8263a1b662a8f745f402db8acfdf718eb69fd351785ddca264245655b596e821ba1db1190d4e5afeb8053e1eae01b88a1e63b441da83fc89b4a7b5d2ba434497a04bd20e9bbe7a8b213195eafad889d0478109c5c752632fd54d725f8eb0df4759b409bbd171b97ebaca50120d1334ec39b8b7cd98bd7037adc7aabfed0fb5bf29a3d7647f532953b22be52f5ccfbeebaac60af1dadcaf8cfae2ac5ef80b697b44f199b7c36fb621449f4e314fdb8ac37d3a9916ed37d7b504a69de9fa4f72a39ae916138e1793afaeda126791de78f6c72aca9096d54f7b338d1264de47e728ca701e3c76abe2a56d173f872ca89bd10375f30dcee368f381003db8b154713a8d51704e5eec0062f084b5564a7513d7ee81c178d4837844d3fb6a8d37a398defbe4afe8c5dcbb44f928c65e670449a69e9025992862becfb0a28e36e08529656a44ebeb7fc9db963ecd50b5aca0b56a7f9c995b98cced5790984da64642fa85576fd68e7cf719245ee75da594affd64e041623ec4566e8a4f778c98f7b293ed348ecfe3c37c8cbdec924de05dd13d7574d70e3a3a92a12127e601a79db9c7e1f6314a5042080e0cb711c84cb650e5c5e8b56295491c5614ce180b95a0c6f8782b78beabff68a6725dfdea886c1ae5294e16195e4797282bc21f46b6ac969737a3f13afbfd6c345e3717d7a1799de1c725517523f416e5542f684b25190dd692e1ce51fb2db97855042ebce04f64835cf19df322ac530f6486873d35455e5219b5f8c2a7c66a88dffb5d0509ccc0b590e21ba3e43e0d35a66987186a2d99690db576eee967a4594e5dfe0c3486ed088b2786db78d6d0488e470cb371dc8f1886e3f81f310c03af805954be04efa05fa275ff1b70aac25369b58a791f7dd6161c4b935900c5cf3d2d7ed6b47be7ab621ff38e32f27f515ea7da33e89d12982cea9d0ad0c7b79c2b3c16b85ba663ace85b667448853ff1f688d7d33c4f5751d5eab27f60732ac5cbf22159cf8cb7dfd5d517ee56230d41201a6d0928892427f33f49f5d4d16e1d883adacda1194ff5f55c84f455728e635ce0d9e9aabe3dfb0ce52bb4969b99b4d19a4f21a3006725e8507c46160c645c4549210f992859455b149b64170a82a34d71376f295dcb47cc39c75b9c9463c3d431d602c873582940cb476836532b1d2f189819d007dd01a30489f642180683dc7d520e20d45e7fd5d16f17eb7b87444d056cb000dfe7e786454d1f0d136104344221fb2ab068e3f73bac30374a04448b5e2c00c2dd86876978f402a2a6716c40a0b9c4c2098c9ac6f020c60880ecf69cb8d05f55e7c39f43b054f57f20542a040380e9a6bb7b8153df4a36c0604f6406c053df2ac3051901a0420cafaaff5501bd5dbf77f1e4a3005275b1402750ed441e0480706bd8f4b73a6add097870ed5d04980c706cecadaa73c140dcae679b90ef517006de18310ac88046b0e9604554b913bc804a5bb39e0c58c00d1baa4ed55db7a1efdb4028d3dded38ead4aa6e191b00c0b73c39414fdd12c3041863290c5cee6fb35da25b080fdf8c39c865b05afeb156c1eafed9fb4530f880830d54e40372af48948ed5c75ece0cc6a2588311971aba7e3a888586f466870d64f8604faf68e4c244c79cf507a390957ca45959d5277b3f27cbd1d92a6c6842b53b7070f760d8e34e1de4bdff87234ad96dfadec7e188b263ac05980c7d62b8980a1fcad8b10e1d4c4cba3dee543167fb8f3a85e463614ed121878438d30a441316e80d7587b8f6504a3fd2ca43d92f7bbfee50c4789a6102077c5aa030d06e8ce946949ef6c0403842ad648309d55d203d510935c950314639e71022f8549daf0ee763cf3a7257a5a80c023c8845b04afa1117c0aa7e3988c5af1c526ed63d527cb9b769598c4b37237b7a042aa5b7e97f38c8bba70214fa6518ff51b167d47dbadb03bca1ef3035a05afe1175a0ba7f0e420b4a57bcd9ec97a8b6003d6cc51cd616a04af291b600557db2f75b80aa484da5a632856d329a50bc8bc1411f1a823e0f62a9acafc3580b667d7fedffb2d910926b8b20657c6e10bcaaa27b256e4c00ecbee3575127abd5ad2e3c76109c15ddea45a809d06db6418d51db41f07ca056a9a11663daa6867edb430bb58eb022650a520267743220bff137e862a5df72dc4400e64ddc9788ae92de1217f42860bd89ca1746ba482e7ae8526600e0148a97270960f1faccc6509c39b385887047e80652cd940a91698d139334fcd357b2389c6f9b815817dc2113ea06ab81481b1c005161a23e0c649a5764240af522c250987ae342043a876a0391caed12a2d0f8c91a8ad30765200add63350622fcad8e121d6eb166454a2110b3f7606cda5c45a4dde43249c2ab34501e7106b222d9cee66a928cd964205985a243849ab07cd358a2e1b0e060ea82a105328c4a05550ebd2095f94e563cd0b138374bab2356db6a888a4e9a376c6254196a54eb8a13365f619bc6802223a1f6304650f295d0c550b2adc22b5c5db3e8a226198add2c30b86dc0a775e5a63186f371f5d005f431d560f5bea6557471780c3546fec1ada20816031ac626ac8cab8d21b0cca64236f48006d2e2b04723898f0eca8da30b69e22aa1086a628467e6674d63286291183a8dac832bcf3d5c27d75c195bc3890b45d730b25273425361282826406da13753e54a9be23e38c935911fa60a98e88c807d28c2c030c35a4c289a5084a1b3ec38b309e8f06e6817781f42591169176268cb48fb0d81e614c9eddad02ef2b98cb20adcc9ccd0f6e0ce6202e812e09926b9210cdec2ca8324a569ca2f8b344da1f6100e619a4acf18c84da1755de577d214ceab5233c480f05a4ae3348146911abc2915c26b94a873438ca34055af33e85a44ede3a7a80ae8e537a46d40e73ccbc1d7cbf014ef80874c4f9d979960342afccc38f333373788d2b32cd08c023c8fa1c309e8f0a4e851d1e569083a4427278b661dd4183a58985c701455d041c3b93dc68287fc8e9f7e9e35181c4a5790a1b36c688343794134000f1b0f05ede9956eca9136317570317825049a7e4c97529b9b4c7b68deebd8dc5713aa0eca25faeca6b0f726d56a27ab235ab7435a5fade75b6bd16b15db43bf36ef78b15c3de00d6a128e17e49315de163b14d7377cd28c4f68bb8d92fbbc2bd9a4cc965bb42a4fcbfebc9ccfbe6de2243f993f14c5f6dd629157a4f3a34db4cad23cbd2b8e56e96681d6e9e2cdab577f59bc7ebdd8d434162bce98128f285b4e459aa17b2ce49667976bfc31caf2e21c15e81695974a9ead37c067f511a7e2648072e14e31e53ea36705f4f3f2efba88ee7ad4faec533e0d6ea87c24f5da94a7cad595a2ace50f972325cb6b645126bd0b4d3e2fcf91cfd278b749844411816a3a97e5259d49b48a4e055a5c863dbd6574579ea6b0949a247b1affc0c563c4d36892ec69345792b2349a2499c6f142e81ce9685e0283301e4568d901af5eeb79031eb48eb5011e5c4e093c1a7ec8014f159368a0535d5a2f11aa525f5457735b46be3a9cf57070ef766d69e5e8ee0a89ba47c8b2efbee6426e965693e400a6753977f2aa503eadd651f8183d23814493e45093eabdd6e66a70ae3e6c86832eed9ab4be385ad1de75a63d5de63d2b9622936c4f8bba3eb38454eed06a2ad44195a5a2725a555361ddab584a3ab72b0da668a0b3a49fdce81c807a6ad73abe5493628567a1969425c342a72c215a4034cd8dca327d4600a126d991167e883280569dec46eb138a6299549dea46e9ea9f385ea6d9ee0c3fa1ad4c52c876a34d5f261189d2f41735ec4c87ba3dcd02d6d3b0875da02dae9caaca5292494013bf1b03c38d81973bd11ec048d5b967f51ba5aa4d288b11aa2e3a4e7fd152e27cc9a6bb5303e64d21cb9de62f6996e318264af3c2e0544983bdb19da3a4bbca7d32dc33be84be80df799ebb235f53d677831be989e8e7325e94f253f9dbf5eb7fe83ccca2ebe1626127cbb284d8cd34cd6d152f2fdd9d0c9a38ca019384497690a6b4c900626cfab82ab16c514851b3e90e7b1b287b4c853ea3690ebbe2cc2df2dca6b8e6767935b5f6de709694f232f1c9c679e70cec6bacb7213eeee35d5dd4d467e2deb4ee49023335e95884497f515abe718bf6d5f5756c967bbf2bca698796d8e3ca27020c74c4be6e135f544777f170befaba8da273ef6e7551b5824f6465da26ba4c1449d9b91140c8f1fca92ad33e532c516b731c29d26788258234a38f84f4a961584a9adb8732709e20e4395285b602b90cd7be6e5f98953bbccd7a5123dde0c2da6fb0b3a1aeeee35d5b5ab91dd7151207be90f5b2ced6f66333f47d94451b60c5c0a63bd855eba7ab8c2cba05abaa4d75681d606bd57553d5d7fa65f85ad3d76963770da93c4cf66ab5c138f8fa524d5df0bcbb62d294f5d7d463288d9aff126791683cf039ce14a30c29283639e32ab6df71761f9da328c3b9a04cf81c478a6215db44972d167973c5f1ec08e771b4f9b0c689d0484cba2bb5d31881d4eaf471552651f780f6ee52ed29956fb2c7f5891a4f8ccb70c5bad23000b2ed695fadf10618e54cf2619fe3f99ac2e86db2fcb60b7cc3ec849b65b9dfc94b114764b555a628e9a7817554a4f5739be846075aebb1e9df8fa6d57694187ee0cd9a12aefee96153992828b5305f5032b1e4ec716d0f0f33bc87c58b57ab916f5260e6833e38ecf94ab83e52aeadf26649354d2fd65186d7d125ca0ad116e5327ad05b5ede280856393d289efd7ea6a058e5f4a0787371ada058e538200e3f2e890d2835229bee4ead36d64a7d11c164b90f1c6c27707352b72f39e974c3c4f2f99d6e94118ed6d38d86c2988a8029281949625e2faa2a15dd6bc39d292aadf1f9ac5e34a1a30c20bb176de84403c8ee451b324b81ec7ea800473cf8c18bb2579beb1c7da98dfa12487765a128a7dc67283f1795439b1852cf87b463c7de429fca7bb7bb02d417ecba8b43dda1a729ab347c6911d1d581cb7030a46931791611b27ad0a46816f765c10f0e1068528cbdf849cbbd49697fb731f64d7c3b17785fd5bb0ca3afea9b37b1f662c07bfdc97c461ae7a9543f27f34fcfcbff8e8fcafca3eacfb3382215eebef8840866715edca48f383999ff78f4e37c761a4728afaf476842f9df89b7815bc5f6bf7e5bc6f6e3f566211677bf21a0a492e76bcead9d199fed79a614267f7c899fc5fea5d861de2d8563e38f1762e9635165d382f5bdc151d9b6d5902eb7983354e0f5352a0a9c9116bb286f6f27f2ce679fcbe8f9dbfa4e963897af1716973f6cb07dcde70965ab87ea0d2af4ed579cdc170f27f3d7af58cad50ded06c24decbd4f924d287e4d52a6e74aae19c335b9db348d0d8dc70e5d3d52802789ed900207b35b2085160c88942e405edda76f9dfb34582728a3ccedba421b546eee10a178c06e694caf9ac39ad02ca20d2e75305e4579a54d5fb977f5ba7ba7a312dab17ce39bd1c84404d9a09813e9f5cfa421c8544bb2dfb8d7980d630bc443f2c3f18979669fd42759eafac1f49bf4d0c645b2c6df4ee6ff53157937bbf8afaf75a91f66571999b1dfcd5ecdfed7b9b1e876aa1be3bad420c6eceeab1bf3aee42001da334637ee4db141ac83294ef815372ba509efab9bb5250020df6a9286d4db0e386ba24d88a07fba75a8bd9aee1b6705d185ddebacb25e6485d07b35fd9f7b91a7fb5d81b47d38234419d26e6985c071ec16f6072df8ddf23830cbe3fb2c3efa2c1e6cf85f83f1f276435f7db26c1efd8a16f5ad00ae99b07bb5c6ffd159e35ff3d1f72148d3f04ecdf4ea4edc154700053634dc6d2c30451d068335941501f07658d644bc9bc1ac6a13df68e6c2e87d622e987a015efab6ea0e3846c0dc13c0d4e4bb136890bbcf75711df45e53ccc95c1df7312c9890f7505b0e4c1cfc9ed8b970ff9875a7bb914f03e56b9a899f81c7c6ccbb29d3aee420c3a28db477e3de140ba1c6e1e0763bb5a10e6737ab0eb66cc8d30c2646fe2076a981a073bbce50449a9b7ba22d18b01bdaf0f5839846e14870bb6e50847f9bbba12d18b01bba90729ffdc087967ba74c5db2c2884c9db2c25037ede9f7a41d78f74b0844d7ed38eecfa0558673db8d5b6df4b679f40ac5038ee1433c88dac78d4136663cd038ea42c9fb8b19766fd18ffd3fc9eee484276d5d5cb51b6f5a2e841daf081a77517efdf55e68b3c5462bb94fa57c10bac289e8c79e549b4074b5bc3fed8312e5e3d37daafc3658ddebc60deab4f5f09e6243d8bdce764c30fb946b4e70420a3b9f70a1ee81780081ef3e5b998981f749f68f7b9836e1444d23c95df7faf2609b6d4078bced5e1b14146fb3cf263581ff3db6dcffa6021b721f48914c3e3282ad85b5d1ee9626a129b0ddc23694491c98f389677b23e8d41bca488682edbf4f8c3e86bf10d0ebb896640b8faa85005dcd5e06e07512e02e050842b9ba1c2008e5ea92009f94d9eb0242d0e5ee0bf0bb57e7632fd971f65304dfbbcc7e8a587bdb990f1ad9be673d317edfbfea0f748e21c4f207221de2ec0888e80f443eb0fd0b06f81fc6610f10326f37b01571f2e621dd160c38986d7aa1873b7e08cb78bf8e25ecfd6fe178774b075c7580bb85072e5b38a40b2e1f33efd3520783e6f7d1a98679925e3e34fd0a05e37e48d6b32f69c9a6ce6d642883d29bc7ac679f7671116de368451896b1c5225eae92731ce302cf4e5775ccfa19ca57682d579a08bd56716763545919b8745e923f490c08627156c207c567699217198ae45b07aeb32859455b1473f516be028781f281ede3454b54cc39c75b9c949006ea69cd13badee478d192165ad9d40ac70b062606f430413b5fe168b8ae0b693edb7d6dda382062638c381471194160a47e6d57ee54d5a57b2e38d23f30eac273041cb50ee5ed0e42ae8451e75ecff620933a0a94a89c9c105d621008e95ee5738a247042d2351899d38fe90850a2e27ed53cdcdbb71f5fa05a72eadd6bcd159e2175939eef08a0a2ced25f816716998e6c5dc6d94eec1247015315e9c2f2af13828047f3749c8b4fbc1378144f53aaf94d069acab5db8098daa99dedae26e5c56145f5d69cb5bf7e1894285f781c0522a598961395555fbdc009caba2755cff9849c98d43cc7587c314bf703587b4db6801f7be5e5b8829f74e1c562083605f7cd569e0c469358ca8e589adc5066f104c45cefc974361986469dcc1cb133e95cc6c428edf536341b4bc5cac0a5bf806d68fd03a2fbb60ddd8678ec3576ba4014560226f505e046f7bae3fea266ffade769b033b2e5ec069e49ede60e3beaf79bfb77df8b9bbcdc7a56fd3a6bc0194cc774941de62a00e2301661345a83dfe6ce036aa229165feac71ef770e1d529243894a657e7bda8c9cca53b550f6d069bccd40c47c5ce41689f69e033850672c3d0e43a885dc4efede6cf7446d0989b3faed6cfa49b3f4224d5212cc78430424e1189792f6269667c6778df166802a6f4a12f62cf76dfc93dcbe4fd41b0667ef5d3314e2838f48cdc2740e061d85693836d123bab07c446b6b63ef0afd951152bbe3c2781ab79208f6eb8560fb3cdbae000ba0d5ea7d7efd69dccd7b76564581d5d5065e552df4a94eb8d7499729d0e522eb3cc94b95339893e970b71613e30f36aad08894f9b03f168322deac2f9cbc895e1b2c1da70be4226769df290587559109bce0bdbc482f1bb96783079109326bbbc64c8c0a45e1e48f4eb648874ed746722db79664aa4bb2c883ccd35b368bcf924fa4d3a44bcca32536eaf6295897759107d9a6b66c12d89242e5c2ec4e88edd1937f16296ef1227260fe2d366dbf478aee0d1e6c0fd9ddbd197a648b92ee217608df88f6cf93296a9822ff3859a2ff36ebc896f1d6d2a736bd2211ecdd3d246d5d5c62302baabcb039557f792b0c885995cc109a6393f9e31dfc9f30c74c8cc1951dc5c58bd26dca4487682c2278529c9a58b861c5f1d9baa42f15a506d8d715df0829c11bc4dd3551a980eeb5a731983ab0d851701b536462171c24b335f253993aaa9b83831d74f4eb789832bac088201ea6c132ed35ff4497a5b08d6002aad0be710ce4a780ba112b74bd454963559aa5275c2e0cab1410540cd9431079c709c555249d7a44c5021c0051ea897c951de5dd449a009b96c1b269b80da779c2907f23036d459b507e0470d8d5eed1a7efa2a438703c3203d4a3565bf4da09e06e7cec1b613b04ea94a72e983ab2a3a190215d5fa210eaea6b444aaca31a91eaba8514e06b7392faa69ccaa720e5cdafaaa5dbd86083f0194256723d046d2392479d2c5c27abc31af72ef7ddcd2d475afc241a49fb893c159d7a726470f4fbd1abeba92a78161d6f13ebb8e34e5280ec6a1aeb53943f7a39be13daeba8fc53cef4d20ed63999bc2707ca93bfc95aac6e4ed6d13693580d5a1a42f3d10a419e8dd56ed59589b77bca8b7039b04f2b34833748f3fa56b1ce755eaf1e2cb2e296f79ab7f9de33cbaef481c139a095e71676fed3717c95d4a8f010589e827c2ad5d9f7081d6a840a75911dda15541b25738cfa3e47e3efb1dc53bf2c987cd2d5e5f2457bb62bb2b4895f1e6367e661ba33c4ad4f13f5e48321f5f6dcb5fb98f2a1031a3f262bcabe4fd2e8ad7addc1f813bc71424ca33cae61ab7b22f8bf23ab7fbe796d26702233b424df3b547ab377843866281f3ab64899e701fd97ecbf1aff81ead9e49fa53bd67ad2262ee08bed98fcf23749fa14dded0e8ca939f04c3ebcdb7bffe1b398141ddfc780100, '6.4.4'),
('202405271048199_AutomaticMigration', 'mvc_net_Crm.Migrations.Configuration', 0x1f8b0800000000000400ed3ddb6edc3a92ef0bec3f34fa7170c69d0bcee04c60cfc0b19333868f6323ed1cec3c054c376d0b564bbd92da8867b15fb60ffb49fb0b4b5d28f152bc49a4d4ed13e4216e52ac2ab28ac5225955fcbffff9dfe3bf7fdfc4b3279ce5519a9ccc5f1fbd9acf70b24ad751727f32df15777ffe65fef7bffdfbbf1d7f586fbecf7ea7dfbd2dbf232d93fc64fe5014db778b45be7ac01b941f6da25596e6e95d71b44a370bb44e176f5ebdfaebe2f5eb052620e604d66c76fc799714d106573fc8cfb33459e16db143f155bac671de94939a650575f6096d70be452b7c32df3cadbe26b8f87a966d8eeaaf8f965112ddc5289bcf4ee30811929638be9bcf5092a4052a08c1efbee47859646972bfdc920214df3e6f31f9ee0ec5396e3af2aefbdcb64fafde947d5a740d29a8d52e2fd28d23c0d76f9b415a88cd7b0df5bc1d44328c1fc87017cf65afaba13c999fae3711812b627a771667e557da613eaa1aff34633ef9a9150d2241e5bf9f6667bbb8d865f824c1bb2243f14fb39bddb7385a5de2e7dbf4112727c92e8e591a0995a48e2b20453759bac559f1fc19dfb19447ebf96cc1375e88addbb662c3ba831749f1f6cd7cf6899081bec5b81506663096459ae15f71823354e0f50d2a0a9c115e5eac71359c120902c2cb127412ada2d31629114232b1e6b32bf4fd379cdc170f64ca9199f431fa8ed7b4a0a1e30b6949c6fd645e643b6c42b58cee321c1ac93f71f118e99078c071becb761b8ae37d9ac6182500935820c78b4ebaf532bff956ea889e325f369e4ce64be417e73d649e361c4be62b84a76b9d98bcf5218b3de48400f9849ea2fbaa9fe2fc29d2c77fa00c3fe2229fcf3ee3b8fa287f88b6f56272c47cf0b591a38f59baf99cc67cebbaf2eb2dcaee7141e84b555f2cd35db6ea2bc90cb8bef2cc80984aaa1912fae873a1f958124e581b3d5074e704c42d3164cca2272d4695786869d643f8183da316c4395e451b14cf673719f9abb1e57e99cf962b540274877e9b6e63b4b9dd15a5a407c2c130f0964ce7d02ae33d8eeff11888be643b0b3b430fe38c48d95018376422a7098e87c2a914d650209e1576a383876b6aaa87d59a9aea725bd24ad6c5d84c5cfb1d4c5e53ad25907ee34a22950c238ddd873091b45e4b65fb912b99e5443292587f049357d66949ab3e80c8b25e8a5b2ef65b869be6532dc154cdb8aebd76eac9dfa25be2d3eea22c15770f2dbc4c9fd14498f143946930bff1b1589588ae50146b378fbe105dff0bc7cb34db9de127b4d560fcc517c2f7e8317ac6c12c18dfbb105298ebb721cc17e00202d4cb9b11e8a361fb110662ef0d090363b21d494943afbd086df863177268bb909766ad7bd6495a6bb68f3692cc319dcaf262d076462aaf5f3b42e12f24c5a9f80c529dbdccdada5c551129d74a04029f0cd2ebddb0f6d3e9b4fd54fa9c9d53ae2add7e3efad3ea14a7d6d4fdd98771443199ac5bafc87e4db31ceb2ccd375ed0f5d3802210bc45594124de591f2be77d0b129cfc6d6dbb5fe6663f502d4d7fe81b57e564b6417bab5351f31bb46e2f8dc58c713f95d502984a677182e7aab41ca4d69fd66a9186575b9e8d1b66a6f99991a288eb666d2ff9ae6d877ea25db69d4aaaa995ed2ad076d6b93f592ef1f9386832df7c307d7afd17f79d5b1ce561f75e95520e8bc2cb425d72cc68587839507a8fb2c734b88abb24727b9f0edf4f5e116a913fe38592056a4a5a599da7734a92af912c16a1dad558a9fa085254d5c8e430c5122d6c9d7fabc9796f272e259aed5faf95a46368bfd584b69f6a45a1f8fbb8c5b06d47f3066b70865f5d3c1b49cd241a32ed45595668855e72dce8807e425c359e4a822be47dc4b76d3896ec56080fceba570baec5ea208a2cb472f492d7f7287944717f4744da7e2aa9adf0f731e5db8663496d8550ef8be8456c2b3cffc039da7e4a47c175f10d2523a1aabab5440fd1b71187d1e0a4e50f5be0ebe15a0057d1638c36487b913f91f6b4565a7788e8127449c661d3576f3120a6525d1f3b12fa2830a1f9586aeca5ba49eecb15f6fb288b36610f3a2ed74fd7194aa2618486bd07f77618b317eea6f55cf577fca1f63765f49aec6f2a554a76a5fc85ebdd77ddd558415e5bfb95515f9cd50b7f211d8f283ef376f9cd0e84e8d329d6694771b84f2733a2fdd6ba16c0b42b5dff456e5433dd62c1f162f2d55d5be22cd21bcffe504519d2a2facbde2ca34432efa3731465380f1ebb55e1d28e8b9f4b16d4ade881d87c8bf338da7c20821edc58aa309dc62838262f76003178c25a2ba5ba896bf7c06038ea493ca2e97dbdc69b514cef7df257f462ee5da27c1463af338224534fa8924c14b1de675851071bf0c2942a35a4f5f5bfe46d4b9f66a89a56d05ab5bfcecc2d4ce6f62b88cca6524321fdc2ab376b07befb0c22aff3ae52d2d77e32f022311f622b37cda7bb46cc7bd9c9761ac7e7f5613ec659768926f0a9e89e3aba6b271d9dc9d09413eb80dbcedce374fb18252821000786db086026dba8f264f4dab1ca200e2b0a678c8d4a50637cbc1d3ccfea3f9aa95c77bfba229b46798a8b4586d7d125ca8af097912daae5e5ed68b8ce7e3f1b0dd7edc54d685c67f8714954dd08dca298ea0d6da924a3c15a72b47bd4eb043d2fc9fab0cbfdebb37ebb3b5eeb817b3cf813d9f6577ce7bcdfeb3411312660a7501197d4464dbef0a9b11be2f77e375c023270dba5f8c648b94f9b9019da2136610b665a9bb05de6fad98396aba43f5b90413bc23e8dc1369ee135928f13836c1c4f2706e138ae4e0cc2c09b6d562a5f8223d2afd1ba7fb29daaf1545aad42de479fb50dc7d2641682e227258c9fedf3deb9c5d887d7a38cfc5f94995b7bc6d753009305d85302fab8b1738dc712ee16e91887072d323aa5c25fae8794d7dbacb45d57251b6e51fed8576a053053c9ae40461fd50c8018d56b66f0ddeb2a8aa3dcd3067d992617798c379ec08d76a878899ea3e27485922f39d6a55bf387ac3c6188d1f33818431e6784d33da7799eaea26aa6c86ed0cde53b4fcb87643d3326f9acbb2fa490240341544cb4254a85507232ff93d44f1decd64fb283ddf806f0505fcf4595749d9ce318177876baaa1f093843f90aade5612663b4e64b8816c359a928507c962639d18b5152c82a2f4a56d116c526da8586a0b654a4202fa96bf18835e7788b93529f9918634d80aca44b025a3cc2b09946e978c1889941faa054574a21d1e6bd6264904b9be72084da2c7f1dfcf6a070ef2451d3011b5980d396bac9a28647c34818411aa1cc242a61d1a629e96485499c13505af4640122dc1db69aa6472f41d40c8e8d106872f53809a366303c9031824076e7dd5c860315f3e1cf21b154f13f90542a080304d34d77f7124efd28d908067bf13c403cf5a3329c901104544855a0e2bf2a6f41c7f72e6dc62802a9ca9fd21154c7ca04114078346cf8ad4ecee1247870ef5d08984ce0d814032ae682f9063ace36992d4691333031ce2842060c820d8315c9339cc40be8b435eac9040b4824a462aa2eab909eb781a44c97c276d4a5553d3236020027b373123df5480c23608cad30f08689cd71896e233cfc30e620b7c16afac7da05abf9b3f79b60f09d1a1b51919d73bc4aa2e4d233f67666b02c8a3d1871aba1e3d3416c34a4a7896c44868f69f72a8d5c34fc98abfe602964291f695556f164efd7643909854a363419293ae1e0d2fdd8cb9d3a97c5fe5f8e2869b7e1bd8fcb112563ac09984cfac4a858957c2843643be960526fd8cb9d2ab476ffa54e41f95832a760c821499c6907a2897ef6267587b8f750523fd2ce43c997bddf772842d9cd6202c7b55b4861a0d31853e2a79ef6c040718446c9462654298f7a4a25342443c918e59e43085456315f1db5ccde75e4ae4a5119eb7c109b6015f5236e80557c3988cdaf9c39c3ac7ba4341ade966531fd8659b2a7974025f536fc877359f45480025f86e11f55f68cba4f9724c59bf41da60654d33fa20e54f3e720b4a094c9d2e6bc447504e8e128e6b08e0055948f7404a8e2c9de1f01aaa2c4959aca1432ce684231e58c833e34049c1fc45659df87b136cc7a7eedffb6d9900ec0568294b90182c8ab2ab380848d09bedf77f955f4c96a77ab0bcd1f24ce0ab67a216a02e936dba0c68c1141e4f940ad52432fc6b44d0d7cdb430bb58eb0226d0ad20267743120bff177287fdc971c37719c7913f7254a57096f890b7a15b0de44e5434a5d2417bd74292b00e1149a97370960f3facec6d09cb9b385807057e80650cd920a81698d131335fc0b7f32399c6f9b015817dc2103ea26ab01481b1c004161a23e0c609ac7b22408f526c2d0987ae342003a876a0390caed1282d0f8c91a9ad377b32008dd9b5c06207cf25a090eb759b302a52088397b300e6dae02d21e729928e1551a488fb80259816c57733548c66c3280acd26040809a9420a6b94443f1c1c9d4256230801122be21605294bc0092d1d2a016a3a9a599ef645d06ddb4730bbf3a08b6ed92a83ba5a5c826ec95814615b96803f01db6190c28d8121a0f635026df095d58263b2abc0ed70d8b2e109381d82d2c83c7067c945c1e1a638420d70f5d8c20d30d7629d18c8a2eb48f81c6d03f785414f167c0c0d844aa71bd31c4aad974c8061e30405a39ec3148e273adf2e0e8a2a4b84e28e2a418e299255f33188af026064e43ebe0ce734f7eca3d5786eb70e442013b0cadd442d174188ab309d05be8b569b9d3a650128e724d3089a903263823c83e14b46058612d16144d74c3d055769cd504f4a1378c0b7cb4a1ec8874b0317464a4238c406b8ae4c96d1817f9aa47d905eeb267e87870d73b017409f0c09d3c10060764e5dd94d234e5775a9aa1503b1d87304da50760e4a1d07ac3f287730a7f5869186280782da4718640a3480d0e9a0ae2354ad47920c651a0aa776d7423a2761b547405741c1c3236a0bf9fe5e4eb65788aaf6740a6a7ce714d301a15ae6b9cf9999b0744e9ac166845011e16d2c909e843a5e0a8e84535443a44bf298b611d34183ab13079f528baa0130de7f1184b3ce41750f5ebacc1e0507a970c5d65431b1cca7cf78078d8383d682fc4744b8e742eaa131783a343a0e5c79463df3c64da7bf85e37f1be865075f72ec167cf99bd0fa9563b59ddfabaddfbfa1a3ddf5a8b666a6cef11dbbae3c572f58037a829385e904f56785bec505ca77ea5155768bb8d92fbbc6bd994cc965bb42a2fe0febc9ccfbe6fe2243f993f14c5f6dd629157a0f3a34db4cad23cbd2b8e56e96681d6e9e2cdab577f5dbc7ebdd8d430162bce98126f3d5b4c459aa17b2cd496d7a16bfc31caf2e21c15e81b2af3549ead37c067f5ada9e2968062e12e46659ed11b03fa79f977dd449737b7be4e952f981b281f49bf36e54575955996b5fce176a46599151b656252d8f2f3f26afa2c8d779b44281425500de7b2ccfb9944abe85480c555d8c35b4677e5050d0ba929b287f14f5c3c463c8ca6c81e4693e59485d114c9308e170273a4db7e491884f9288a969de0d57b3d6f8207ed636d040f6ea7143c1ad1c8099e2accd100a77a8343025495be2856734746be18ce3a4db8b35ddb5a39bbbb46a2ee11aaecd9d7bc2fc0c26a8a1c84695dae9dbc2a942fc075103e46cf4800d11439f4a47ae9ba79e980eb0f5be1a04bbb21ad536c2bc6bbaeb487cb24ed662132c5f6b0a837350b48e561ad86427d5e59282a3f583514d6638b85a4f3e4d2c8148d9d96f4931b9c03504fed5ec7976a52ecf02cd492b26558d1295b8816102d7383b24c9f1100a8297684851fa20c805517bbc1ba42512c83aa4bdd205dff0bc7cb34db9de127b495410ad56eb0e9434b22505afea2a69de952b7a759c03a2ff6b00bb4cd954b55d94a320968e10f6360b831f07217da0398a93af7ac7eb3547508653143d54dc7e1176d25ae976cb93b3460dd14aadc61fe9a66398e61a0b42e8c9c2a61b049e03948baecf093c93de34be84bf03b677677c9d7b4f53de04678a2f473152f4af9a9fcedfaf11fba0fb3603ddc2cec6259b610d94ccbdc76f1f2d6ddc9a089a31c30499862076a4a9b0c00c6968fab12cb118514355bee70b681b2c754e0192d7338156712d37387e29a84f56a686d2a721694323ff964f3bc7306f635d7dba821f7f9ae6e6ae2997836ad7be5c00c4dba1661ca5f94966fdca27db1be0ef772e7bba29d766a891c57be3a608023f2ba2d7c518cee42ec7cf1ba0dcc7367b7baa95ac127b2326d0b5d168aa4646e040072bc7faadab4afae4bd0da1a4788f455750920ade843217d391da692d6f6810cdc2708758e50a1a340aec295d7ed83d932c3dbaa1735d30d2eacfd263b1b3deb3edfb5ad95c7715d2371e20b552feb6e6d3f0e43df4759b401760c6cb9835db57ebacec8a65bb0aada5287d1018e565d0f557ded5f86ef357ddd3676994de569b257bb0dc6c1d7976aeae2f1dd1593a6adbfa11e4369d4f897388b44e381af718618654801b1a91957b1fd8eb3fbe81c4519ce0565c2d7384214bbd816ba1cb1c8872b8e7747388fa3cd87354e844162ca5da19dc6088456978fab3289ba07b477576a0fe9579ce0b8be51e3817115aeb2ae340c806a7bd8d76bbc016639537cd8f778be96309aa0963f768193d64e785896fb5dbc1471445647658a967e06580745da3fb7856e70a0bd1e5bfee36a5a6d4789e107deac29219b500f9bca0441a985f986928925578f6b7b7858e13d6c5ebc5a8dfc90022b1ff4c161af5742464ab9b7ca64956a985eaca30cafa34b9415a22dca55f480b7bcbc5500ac6a7a403cfbfd4c01b1aae901f1f6e24601b1aa719038fcb82436a034886cb93bb4da582bf5450483e53e70b09dc0c3c93ee792d7097a5e16c44ecd453b93add8b3e58b890df4bb7c292326ad972f0d8431150bd35032bac4ba5e50552abfd7013ed3543a33e0ab7ac184ae4680ea5eb0a11b12a0ba176cc8cc05aafb4905a841c00f5e94fddb649cf4a536ea3c95eeca42d14e796e517e2e2a87b6708a75c3875d3cf691fc54dec05d96525f62d7e53675173d4d5ba5214d9b88ae135c8583614e9bc9ab8850d503269566f19c17fce045099a94c7d697b889d96fdd85ce0841a923f886a20e04aa1d77c4926f082d74d2aa719443663e5fe37062902617798c37104cb16e9a13804bf41c15a72b947cc9b17830cf5739c22cf71d317a560216eac3ef74f65e2148493cc44f5aec4d49fbbb4de2d124d0e0327b54fd2ef37454fdcd9b641e62468dfa93f98c0cce53698f9cccaf9e97ff191f95f547d59f6771443adc7d71858856c179719b3ee2e464fef3d1cff3d9691ca1bccebfd2e40a7927be6060953ce4f5db3279085e6f166273f7142425943c5f7371338c066d1d26a43c1cc797f859e42f951de6ad6538f9c6f1426c7d2c6a1bdab04e4f1e95635ba9dbf20e2b43055edfa0a2c01919b18bf2c50942ef7cf6a94ccff1ad4efa14e7724a747126b2d93c6a3c4f285b3d54efe6a1efbfe1e4be783899bf7ec542ae5e9530006e927bf804d9e4faa841caf05cc13573b806f72d4d63c3e0b153572f29c033ea76920267cbb09014da30a0a4741938d43c7debccd3604c50a6b1b06385366b85992142f3806c69f6623586358159441b5cea60bc8af24a9bbe7267f5ba7b5ba822dab17de3fcd5d04408d9a09823e9f52f6420c8524baadfb8f7988d930d844372f4f329f38c19e6132cf52d63f8263d0e7491acf1f793f97f554ddecd2efee36bddeaa7d9754656ec77b357b3ff761e2c7a5fe386b86e3508317bbde386bc6b398880d689c10d7bd36c10ea608a137e79d24a69c21777666d0908906f35497376d84e386ba04d0cb27fb8752e0f35dc37ce0aa2cbeba1b3ca7a8115727ba8e1ffd20b3c3d000fa4edc31921ca9c199656089c28c3c2fea00d7f581e076679fc58c5475fc5834dff1b302187ddd457bbae9867bf62447d2b801b26af875ae3ffecacf16ff8f41e2140d3f871cdf2ea0edc558e00086cee09b7b9c03475980cd6a2acc8b06127cb9a941a6661568d896f69e6f274f894b960ea454e7d61c70e3808c9cc096069f2cd049a45c3e7beb8ceaa5143ccc95a1df7312c989c1aa18e1c98441b7b62e7c2fc31eb4e77239f66e2a861267e261e9b94c34d99762d0719166d2a0f37ec4db3106a1cce9e61a736d4f932ccaa836d1bf2368349c27110a7d440560b3b662852599839d1360cc886363fc6412ca370aa093b3628f24b98d9d0360cc8862e67854f3ef0b92bbc43a63e9a6148a65e9a61a09bcef47bc20e7cfa2564bad09d38eecfa455e68bb09bb7daf410e6d92b340f38870ff1226a1f0f06d9a41481e65197aba23f9961cf16fdd8ff939c4e4e78d3d6256e70c34ddb85b0e31559295c945f7fbd17da6cb1d14aee4b299fe542e144f4734fa84da60b35bd7fd90725ca27c0f0a9f2db6c185e0f6e50a7ad87738acd91e175b563b2654cb9e70417a4b0eb09974b23100e20b386cf5166926cf804fbc7bd4c9b70a1a6a92a5ccffaf260876d40fe0ddbb33628eb86cd399b3404fecfd872ff870a6c4e8f408a64f299116c2fac4da76169129a326758d886328803733ef16c6f045d7a4319c950368f1f0ba38fe92f44f83bee25d9c6a36a214057b3d946bc2e025cd6912090abec2341205759487c4266f3918480cb2524f17b5617e62c998bdeeb3f228ecbaa22cd87cbb2aac8ea61bba4422ac3f7722a660af1bfa604ba2011b28604021de2520ac81d12087c60c31a4c257218b74840720ebb89adc8c8619ed26dc38093d9860b3dfcfc4398dcfb75df61efd80b67d6b0f4ec55a7d2b070ed651b87f4ede5b373f8dc0280e9390ec25b479bdbc28ef9c634166611004084be8d1170b8eb23263786df2dbb9022c32bf0407b6c216b8677d042de0c9ff03d99e0e1a6ec699ea7aba8da45cb0e145fa1c0fc0fc97af6392dd1d4b50d0d65828aa3a6e46a1717d1368e5604619967409ce5d7c9398e718167a7ab3a7fc519ca57682d779a10bd566167e3d5591ab8729e923f4908889ec15939d1517c96267991a148ce40729345c92adaa298ebb7f015a8bc14f909ca9eb540c59a73bcc549a97c807e5ae384b2f41c2f5ad0c2289b46e178c18889417a9800beaf70646cc7425acfb2af2d1b4788d878434e8ab88a2062048e8e82a9aa0cbf2e72a47fcddc05e70872d40697b4a789b9528cba501b96834ce928a244e9e488e80a838890ee0960a7a8222749ba01a3f4fa211d419428b95fd919a09626273ebe40b5e4c4dd1b4dbef090ba498f7704a1a281135f81379d1946b6e1232c13bbc25184a98a7a63f1d705418447f34ead4b7c8c93f028dec156e39b4c68aa300f83c4d4012e2cbb9a9217272baa876dad6377c24889f239e95144a424d372a1b2e2d50b5ca0ac39a97a3b30e4c2a4c639c6e68bd9ba1fc0de6bb20dfcd83b2fc71dfca41b2f5686605370df6ce5c9c468124bd95196263794597902f22fecc97236990c8dba9839cacea46b1913afb8d7c7d06c5c254b0357fe028ea1f5af95efdb31741beeb5d7b2d305a5b11430a52f406e744f49efafd4ecbff53c8dec8c6c39bb09cfa47673273b4cacbb7af3eec8be17b778b97156fd147cc0154c87749413e62a18ea30366134728b3fe6ce036aa229365fea97a5f770e3d5292438acae17f35ed462e6c24ed5abdec1163335c25165e720b4cf34e23385067293a1c97510bb89dfdbc39fe98ca0310f7f5cad9f490f7f84a8ca43d88e0921c59c2212eb5ec4d64c1743ed8c760299d247ab899cedbe9339cbd4fd4164cdfc24b863685f70d133629f40020fc3b69a5cd826b1b37a88d8c8d6d607fe654baa62c5572825e16a1ecba407aed5238db32e38801e83d7e5f51b9627f3f5b73298b38e2ea8aa7289b712e4fa205d865c978390cb2a3364ee564e82cfd54258980fccb85a2b42c2d3d640389a4a8bbe70fe327267b86ab0379caf90095da73c24545d1584a6f3c236a160fcae251c4c1d84a4a92e138e1990d4db03097e5d0c81ae9dee4c603bcf4c0974570581a7b566148d379f04bf298780575566c86d5a6619785705c1a7b56614dc9648c2c2d54288eed89371132e66fb2e6162ea203c6db50dc773058eb606e6776e075f5a22e5be885f803de23fb2c5cb58a60abccc176abced4766bc7580b88cad298770545516aaab0d2106745757072a2f5a6dc62246accab8a42f208cd27bf3225e66510717b6e6de7ac67c27af6fd0e53667bc716b70f5da7c5322d9270a5f18a625572e1a907c776cba0ac58941bd35c693c107010ce16d99aed3c0325cf79aab18dc6d28ac09e8b531fa89235e5a712bca99524dc74583a06ada150eeeb022f806e8b34d984e7fd227e1b6102402745a174622dcd1f09649456e57a8e92c6b2a55adea82c19d638319809e29631d38e2386ba8a2ae2999a04380eb3dd02f9383be3ba9938826e42a6e586c026adf71961cc8b3d9d067d5d9831f35347ab76bf1d37719ba941826d2a37453f61705fa69702a1d6c3b01fba3aa25573eb8aba27323d051adffe3e06e4a5bb3aa1d53eab18b1ae56470d7f3a29ac6ec2ae738a6edafdac56c08f11388b2e4e404da483a47284fba58380768ccabdc3b8f5b983af62a1c53fa913b9938eb786a7230f1c4d5f0dd953c1c0cab8ef7d575a4254771210fb1d6e6eede8f6e86cfd66a1e8b75de87403a3f330f85e1da5477e92c758da9dbdb21d26a00abcb505f7a20c830d09c5aed1d5c5b77bca80f059b02f2b34833748fafd2358ef3aaf478f179979439d7ea5fe7388fee3b10c704668257dc9d5ffbcd457297d2eb478122fa89902dec0a17688d0a749a15d11d5a15a47a85f33c4aeee7b3df51bc239f7cd87cc3eb8be47a576c7705e932de7c8b9fd9c128af3075f88f1712cdc7d7dbf257eea30b84cca84c53779dbcdf45f1baa5fb2390eb4c01a2bc1b6d12fd95bc2cca847ff7cf2da44f448cec0035c3d75ee9dee20d998a05ceaf93257ac27d68fb92e3dff03d5a3d93f2a7faac5c05c4cc087ed88fcf23749fa14ddec0e8da939f4486d79bef7ffb7f4ccdeaf61b870100, '6.4.4'),
('202405271142249_AutomaticMigration', 'mvc_net_Crm.Migrations.Configuration', 0x1f8b0800000000000400ed3ddb6edc3a92ef0bec3f34fa7170c61d27388333813d03c74ece183e898db473b0f314d0ddb42d582df54aea209ec57ed93eec27ed2f2c75a1c44bf1269152b74f9087b849b1aac82a168b6455f1fffee77f4ffefe7d13cfbee12c8fd2e4747e7cf46a3ec3c92a5d47c9c3e97c57dcfff997f9dffff6efff76f27ebdf93efb9d7ef7a6fc8eb44cf2d3f963516cdf2e16f9ea116f507eb48956599aa7f7c5d12add2cd03a5dbc7ef5eaaf8be3e3052620e604d66c76f2799714d106573fc8cff33459e16db143f1c7748de3bc292735cb0aeaec13dae07c8b56f874bef9b6fa9ae0e2eb79b639aabf3e5a4649741fa36c3e3b8b2344485ae2f87e3e43499216a82004bffd92e36591a5c9c3724b0a507cfbbcc5e4bb7b14e7b8e9c8dbee73db3ebd7a5df669d135a4a056bbbc48378e008fdf3483b4109bf71aea793b886418df93e12e9ecb5e5743793a3f5b6f220257c4f4f63ccecaafb4c37c5435fe69c67cf2532b1a4482ca7f3fcdce7771b1cbf06982774586e29f6637bbbb385a5de1e7dbf40927a7c92e8e591a0995a48e2b20453759bac559f1fc19dfb39447ebf96cc1375e88addbb662c3ba839749f1e6f57cf6899081ee62dc0a033318cb22cdf0af38c1192af0fa061505ce082f2fd7b81a4e890401e155093a8956d1598b9408219958f3d947f4fd379c3c148f64ca9199f421fa8ed7b4a0a1e30b6949c6fd745e643b6c42b58cee331c1ac93f71f114e99078c071b1cb761b8ae35d9ac6182500935820278b4ebaf532bfb92b75444f992f1b4f26f325f2cb8b1e324f1b8e25f315c2b3b54e4cdef890c51e7242807c42dfa287aa9fe2fc29d2a77fa00c3fe1229fcf3ee3b8fa287f8cb6f56272c47cf0b591a30f59baf99cc67cebbaf2eb2dca1e7041e84b555f2cd35db6ea2bc90cb8bef2cc80984aaa1912fae873a1f958124e581b3d52741704c42d3164cca2272d4695786869d643f8103da316c4055e451b14cf673719f9abb1e57e99cf962b540274877e9b6e63b4b9dd15a5a407c2c130f0964ce7d02ae31d8e1ff01888be643b0b3b430fe39c48d95018376422a7098e87c2a914d650209e1576a383876b6aaa87d59a9aea725bd24ad6c5d84c5cfb1d4c5e53ad25907ee34a22950c238ddd873091b45e4b65fb912b99e5443292587f049357d66949ab3e80c8b25e8a5b2ef65b869be6532dc154cdb8aebd76eac9dfa25be2d3eea22c15770f2dbc4c9fd14498f163946930bff6b15895883ea228d66e1e7d21bafe178e9769b63bc7dfd05683f1175f08dfa1a7e81907b3607cef424861aedf86305f800b08502f6f46a08f86ed471888bd37240c8cc97624250dbdf622b4e18f5dc8a1ed425e9ab5ee592769add93eda4832c7742acb8b41db19a9bc7eed0885bf9014a7e2334875f6326b6b735545a45c2b11087c3248af77c3da4fa7d3f653e973764eb9aa74fbf9e84fab539c5a53f7671fc611c564b26ebd22fb35cd72acb3345f7b41d74f038a40f01665059178677dac9cf72d4870f2b7b5ed7e999bfd40b534fda16f5c9593d906edad4e45cd6fd0babd341633c6fd54560b602a9dc5099eabd272905a7f5aab451a5e6d79366e9899e667468a22ae9bb5bde4bbb61dfa8976d9762aa9a656b6ab40db59e7fe64b9c4e7e3a0c97cf3c1f4e9f82fee3bb738cac3eebd2aa51c16859785bae498d1b0f072a0f40e654f6970157745e4f6211dbe9ffc48a845fe8c174a16a8296965759ece2949be46b258846a5763a5ea234851552393c3144bb4b075fead26e7bd9db89468b67fbd56928ea1fd5613da7eaa1585e2efe316c3b61dcd1bacc1197e75f16c24359368c8b4176559a1157ac971a303fa0971d5782a09ae90f711dfb6e158b25b213c38eb5e2db816ab8328b2d0cad14b5edfa1e409c5fd1d1169fba9a4b6c2dfc7946f1b8e25b51542bd2fa217b1adf0fc03e768fb291d05d7e51d4a464255756b891ea3bb1187d1e0a4e50f5be0ebe15a0057d1538c36487b913f91f6b4565af788e8127445c661d3576f3120a6525d1f3a12fa2830a1f9586aeca5ba49eecb15f6bb288b36610f3aaed6dfae339444c3080d7b0feeed30662fdc4debb9eaeff843ed6fcae835d9df54aa94ec4af90bd7bbefbaabb182bcb6f62ba3be38ab17fe423a1e517ce6edf29b1d08d1a753acd38ee2709f4e6644fbad752d806957bafe8bdca866bac582e3c5e4abbbb6c459a4379efda18a32a445f597bd594689643e441728ca701e3c76abc2a51d173f972ca85bd103b1f916e771b4794f043db8b154613a8b51704c5eec0062f084b5564a7513d7ee81c170d4937844d3fb7a8d37a398defbe4afe8c5dcbb42b9bbb1278e7e829e976449dbe5fe57a21e7665676f4956a55025594362bdcf08a60e36e0f029556a48ebebeac99bb13e2d5e35ada0616c7f739a5b58e7ed5710994da58642fa8557c7d90e7cf719445ee7c8a5a4affd64e09d653ec42c6f9a4f776399f732c9ed949bcf9bca7c8c63f3124de003d83df5a9d74e3a3a93a12927d60117abb9c7e9f6214a5042000e8cec11c04cb627e6c9e8b53996411c56c0cf187ba2a076ff7887053cabff685679ddfdea366e1ae5292e16195e4757282bc2df7bb6a89657b7a3e13afffd7c345cb79737a1719de3a725517523708b62aaf7cea5928c066bc9d1ae6c27d9726a7777bcd603f778f027b2edaff8ce79bfd76922624cc0fea7222ea98d9a7ce1536337c4effd6eb80464e0b64bf18d91729f362133b4436cc216ccb43661bbccf5b3072d57497fb6208376847d1a836d3cc36b24772a06d9384e550cc271bcaa18848137dbac54be049fa75fa375ffbc3e55e3a9b45a85bc8f3e6b1b8ea5c92c04c54ff6193fdbe7bdf3c0b18fe44719f9bf2893c4f60ce5a700268be5a704f4f198e71a8f25dc2dd2310e0f5a64744a85bfc70f29afb75969bbae4a36dca2fca9afd40a60a6925d818c3eaa190031aa83cee06bde551447b9a70dfa324d2ef3186f3c811bed50f10a3d47c5d90a255f72accbece60f5979c210a3e77130863cce08a77bcef23c5d45d54c913dae9bcb779e96f7c97a66cc275a775fc856490682a898684b940aa1e474fe27a99f3ad8ad4b6607bbf10de0a11ecf4595749d5ce018177876b6aadf233847f90aade5612663b4e64b8816c359a928507c9e2639d18b5152c82a2f4a56d116c526da8586a0b654643b2fa96bf1883517788b93529f9918634d80aca44b025a3cc2b09946e964c1889941faa0ac5a4a21d1a6d8626490cbd0e72084da84821dfcf6a070ef2451d3011b598033a4bac9a28647c34818411aa124282a61d16644e96485c9d113505af4640122dc1db69aa6472f41d40c8e8d1068d2023909a366303c9031824076e7dd5c320515f3e1cf21b154f13f90542a080304d34d77f7124efd28d908067bf13c403cf5a3329c90110454c88aa0e2bf2a4542c7f72e43c72802a94ad5d2115487e504114078346cf8adce03e2247870ef5d08984ce0d86c062ae682a90d3ace3649344691333007cf2842060c820d8315793a9cc40be8b435eac9040bc859a462aa2e81919eb781a44c972d77d4a5553d32360200e7cd73123df5480c23608cad30f05c8acd71896e233cfc30e620b7c16afac7da05abf9b3f79b60f0491c1b51919d73bc4aa2e4d233f67666b02c8a3d1871aba1e3d3416c34a457906c44860f9ff72a8d5ce0fd98abfe602964291f695556f164efd76439df854a3634c92f3ae1e0320bd9cb9d3a6dc6fe5f8e2869b7e1bd8fcb112563ac09984cfac4a858957c2843643be960b27cd8cb9d2ab476ffa54e41f95832a760c821499c6907a2897ef6267587b8f750523fd2ce43c997bddf772842d9cd6202c7b55b4861a0d318538ea99ef6c040718446c9462654d9957a4a25342443c918e59e43085456315f1db5ccde75e4ae4a5119eb7c109b6015f5236e80557c3988cdaf9c39c3ac7ba4341ade966531fd8659b2a7974025f536fc877359f45480025f86e11f55f68cba4f9724c59bf41da60654d33fa20e54f3e720b4a09434d3e6bc447504e8e128e6b08e0055948f7404a8e2c9de1f01aaa2c4959aca1432ce684231e58c833e34049c1fc45659df87b136cc7a7eedffb6d9900ec0568294b90182c8ab2ab380848d09bedf77f955f4c96a77ab0bcd1f24ce0ab67a216a02e936dba0c68c1141e4f940ad52432fc6b44d0d7cdb430bb58eb0226d0ad20267743120bff177287fdc971c37719c7913f7254a57096f890b7a15b0de44e59b4d5d2417bd74292b00e1149a97370960f3facec6d09cb9b385807057e80650cd920a81698d131335fc638232399c6f9b015817dc2103ea26ab01481b1c004161a23e0c609a77b92408f526c2d0987ae342003a876a0390caed1282d0f8c91a9ad327ba2008ddf35f06207cf25a090eb759b302a52088397b300e6dae02d21e729928e1551a488fb80259816c57733548c66c3280acd26040809a9420a6b94443f1c1c9d4256230801122be21605294bc0092d1d2a016a3a9a599ef645d06ddb4730bbf3a08b6ed92a83ba5a5c826ec95814615b96803f01db6190c28d8121a0f635026df095d58263b2abc0ed70d8b2e109381d82d2c83c7067cff5c1e1a638420d70f5d8c20d30d7629d18c8a2eb48f81c6d03f785414f167c0c0d844aa71bd31c4aad974c8061e30405a39ec3148e2cbb0f2e0e8a2a4b84e28e2a418e299255f33188af026064e43ebe0ce73af8bca3d5786eb70e442013b0cadd442d174188ab309d05be8616bb9d3a650128e724d3089a903263823c83e14b46058612d16144d74c3d055769cd504f4a1378c0b7cb4a1ec8874b0317464a4238c406b8ae4c96d1817f9aa47d905eeb267e87870d73b017409f0969e3c10060764e5dd94d234e5775a9aa1503b1d87304da50760e4a1d07ac3f287730a7f5869186280782da4718640a3480d0e9a0ae2354ad47920c651a0aa776d7423a2761b547405741c1c3236a0bf9fe5e4eb65788aaf6740a6a7ce714d301a15ae6b9cf9999b0744e9ac166845011e16d2c909e843a5e0a8e84535443a44bf298b611d34183ab13079f528baa0130de7f1184b3ce4c756f5ebacc1e0507a970c5d65431b1cca7cf78078d8383d682fc4744b8e742eaa131783a343a0e5c79463df3c64da7bf85e37f1be865075f72ec167cf99bd0fa9563b59ddfabaddfbfa1a3ddf5a8b666a6cef11dbba93c572f58837a8293859904f56785bec505ca77ea5151fd1761b250f79d7b229992db768555ec0fd79399f7ddfc4497e3a7f2c8aeddbc522af40e7479b6895a5797a5f1cadd2cd02add3c5eb57affeba383e5e6c6a188b15674c89b79e2da622cdd003166acbebd035fe10657971810a7487ca3c95e7eb0df0597d6baab825a058b88b519967f4c6807e5efe5d37d1e5cdadaf53e50be606ca07d2af4d79515d6596652d7fb81d695966c546999814b6fcbcbc9a3e4fe3dd26110a450954c3b92af37e26d12a3a13607115f6f096d17d7941c3426a8aec61fc13174f110fa329b287d1643965613445328c9385c01ce9b65f1206613e8aa2652778f55ecf9be041fb581bc183db29058f46347282a70a7334c0a9dee0900055a52f8ad5dc91912f86b34e13ee6cd7b656ceeeae91a87b842a7bf635ef0bb0b09a2207615a976b27af0ae50b701d840fd133124034450e3da91ed56e5e3ae0fac35638e8d26e48eb14db8af1ae2bede13249bb59884cb13d2cea4dcd02527958aba1509f57168aca0f560d85f5d86221e93cb934324563a725fde406e700d453bbd7f1a59a143b3c0bb5a46c195674ca16a20544cbdca02cd36704006a8a1d61e1c7280360d5c56eb03ea2289641d5a56e90aeff85e3659aedcef137b495410ad56eb0e9434b22505afea2a69de952b7a759c03a2ff6b00bb4cd954b55d94a320968e10f6360b831f07217da0398a93af7ac7eb3547508653143d54dc7e1176d25ae976cb93b3460dd14aadc61fe9a66398e61a0b42e8c9c2a61b049e03948baecf093c93de34be84bf03b677677c9d7b4f53de04678a2f473152f4af9a9fcedfaf11fba0fb3603ddc2cec6259b610d94ccbdc76f1f2d6ddc9a089a31c30499862076a4a9b0c00c6968fab12cb118514355bee70b681b2a754e0192d7338156712d37387e29a84f56a686d2a721694323ff964f3bc7306f635d7dba821f7f9ae6e6ae2997836ad7be5c00c4dba1661ca5f94966fdca27db1be0ef772e7bba29d766a891c57be3a608023f2ba2d7c518cee42ec7cf1ba0dcc7367b7baa95ac127b2326d0b5d168aa4646e040072bc7faadab4afae4bd0da1a4788f455750920ade843217d391da692d6f6810cdc2708758e50a1a340aec295d7ed83d932c3dbaa1735d30d2eacfd263b1b3deb3edfb5ad95c7715d2371e20b552feb6e6d3f0e43df4559b401760c6cb9835db5fe769d914db76055b5a50ea3031cadba1eaafadabf0cdf6bfaba6dec329bcad364af761b8c83af2fd5d4c5e3bb2b264d5b7f433d86d2a8f12f711689c6035fe30c31ca9002625333ae62fb1d670fd1058a329c0bca84af71842876b12d743962910f571cef8e701e479bf76b9c0883c494bb423b8b1108ad2e1f576512750f68efaed41ed2af38c1717da3c603e32a5c655d691800d5f6b0afd77803cc72a6f8b0eff17c2d6134412d7fec0227add58c76829e9705e1572e8e375bb137cb611bb3e3efec0d8c4bb23a7a53b40ccbb0b285b41f6f0bdde0407b47b6fcc755b7da2e13c319bc59674276a21e369a098252abf30d25934dae1ed796f1603178d80c79b542f921055652e883c35eff840c97726f95c92fd530bd585b195e4757282b44db96abe8016f7975ab0058d5f48078fefbb9026255d303e2ede58d026255e32071f869496c4a6910d9727768b5f157ea8b0806cb7de0608b81879d7dce390fcc8e92620dfd2e5fca084cebe54b03614cc5c234948c2eb1ae175495caef7521c03495ce20f8aa5e30a1ab16a0ba176ce8c605a8ee051b327381ea7e52016a10f0831765ff36192c7da98d3aefa5bbb250b4539e83949f8bcaa12d9c62ddf061178f7dc43f95777197f5d497d875b952dd454fd3566948d326a22b0657e16098d366f22a2254f58049a5593c37063f78518226e5c5f5256e62365d77a1334250ea08bea1a803816ac71db1e46b420b9db46a1ce59099cfd7389c18a4c9651ee30d0453ac9be604e00a3d47c5d90a255f722c1ef4f3558e30cb7d478c9e958085faf03b9dbd5708525210f193167b53d2fe6e9382340939b84c2155bfcbbc1f557ff326398898a1a3fe643e2383f3adb4474ee71f9f97ff191f95f547d59fe771443adc7df11111ad82f3e2367dc2c9e9fce7a39fe7b3b33842799dcfa5c93df2567c11c12a19c9f19b3219095e6f166273f7942625943c5f7371388c066d1d30a4bc1e2757f859e42f951de6ed663899c7c9426c7d226a1bdab04e771e95635ba9dbf24e2c43055edfa0a2c01919b1cbf2050b42ef7cf6a94cf7715727918a7339c5ba3813d9ec20359e6f285b3d56eff0a1efbfe1e4a1783c9d1fbf622157af54180037c9427c826c7287d4206578aee09a395c83bb4bd3d83078ecd4d54b0af02cbb9da4c0d9372c2485360c28295d460f354fdf38f3341813946931ec58a1cd82616688d03c205b9abd588d614d6016d106973a18afa2bcd2a6afdc59bdeede2aaa88766cdf3893353411423628e6483afe850c04596a49f56bf71eb371b78170488e833e659e31c37c82a5be6a0cdfa4c7862e9335fe7e3affafaac9dbd9e57f7cad5bfd34bbcec88afd76f66af6dfce8345ef6bdc10d7ad062166af77dc90772d0711d03a45b8616f9a0d421d4c71c22f595a294df8e2ceac2d0101f2ad26690e10db09670db48969f60fb7ce0da286fbda59417479427456592fb042ae1035fc5f7a81a707e081b47d3823449983c3d20a81136f58d81fb4e10fcbe3c02c8f1fabf8e8ab78b0e97f0326f8b09bfa6ad715f3ec578ca86f0570c3e409516bfc9f9d35fe0d9f2e2404681a8fae595edd81bbca110081cd65e1361798a60e93c15a9415193bec645993a2c32cccaa31f12dcd5cde0f9f32174cbdc8a934ecd80107359939012c4dbe9940b372f8dc17d7593a6a883959abe33e860593a323d4910393b8634fec5c983f66dde96ee4d3cc1e35ccc4cfc463937cb829d3aee520c3a24d0de286bd6916428dc3d938ecd4863aff865975b06d43de6630493d0ee2941ac89261c70c456a0c3327da8601d9d0e6db388865144e5d61c70645be0a331bda8601d9d0e5c0f0c9073e178677c8d447330cc9d44b330c74d3997e4fd8814fbf84cc19ba13c7fd99b4cafc1376f3569b6ec23c7b85e601e7f0215e44ede3c1209be422d03cea725ff42733ecd9a21ffb7f92d3c9096fdaba44106eb869bb1076bc22cb858bf2ebaff7429b2d365ac97d29e5b366289c887eee09b5c99ca1a6f72ffba044f9841a3e557e9b5dc3ebc10deab4f5704eb13937bcae764cf68d29f79ce08214763de1727304c20164eaf039ca4cd20e9f60ffb89769132ed4345585eb595feeb6480342c4fa95f75fb31c4ef180c41eb68778503a0f9b033c696cfd1fdee5fe4f2bd864218134d4e4532ed8265b9ba7c3d2d634a5e4b0303a651007e6d5e2d99009baa687b2bea134213f565c1fd35f481de0b849651b8faa85005dcda631f1ba0870e94c8240aed29a04815ca537f109994d7412022e97e9c4ef21609843eab1cd376dfe10976555912ec47649855486efe5544c41e27f4d0974f322a42309043ac46d1790942410f8c0863598a3e430aea780ac1f76135b91eac33ca5db860127b30d177a04108430b9f7eb22c5de63184ed961e932acced161e133cc360ee934cca7fdf0b90500f37e1c841b903669861df38df931cc220080087dcd23e070d7474cd20dbf5b7621f78657e081f6d8423a0eefa085841c3ee17b32c1c34dd9b33c4f5751b58b963d33be4211ffef93f5ec735aa2a96b1b1acacc17474dc9c75d5c44db385a118465020371965f271738c6059e9dadeac418e7285fa1b5dc6942f45a859d0d846769e0ca794afe2421207a0667e54447f1799ae445862239b5c94d1625ab688b62aedfc257a0f252243e287bd602156b2ef01627a5f201fa698d134aff73b268410ba36c1a859305232606e9612203bfc221b71d0b693dcbbeb66c1c216203193929e22a828811383a0aa6aa5207bbc891fed975179c23c8511bb5d29e26e64a31ea6278580e32a5a38812a59323a22b0c2242bab78a9dc2959c24e9060cffeb87740451a2e47e6567805a9a9cf8f802d59213776f3489c843ea263dde11848a46647c051e9f6618d9c6a5b04cec0a4711a62a9c8ec55f1704111ecd83ba2e81374ec2a378b05b8d6f32a1a9e2470c125347ceb0ec6a4a5e9caca85ee0b50e0a0a2325ca77af471191924ccb85ca8a572f7081b2e6a4ea91c3900b931ae7189b2f66eb7e007bafc936f063efbc1c77f0936ebc5819824dc17db3952713a3492c6547599adc5066e50948ecb027cbd9643234ea62e6283b93ae654c20e45e1f43b3019b2c0d5cf90b3886d63fabbe6fc7d06d1cd95ecb4e17edc652c094be00b9d1bd79bdbf52b3ffd6f334b233b2e5ec263c93dacd9dec3041f4eacdbb23fb5edce2e5c659f59bf50157301dd2514e98ab60a8c3d884d1c82dfe983b0fa889a6d87ca99facdec38d57a790e0b0ba5ecc7b518b990b3b55cf85075bccd40847959d83d03ed388cf141ac84d8626d741ec267e6f0f7fa63382c63cfc71b57e263dfc11a22a0f613b268414738a48ac7b115b335d0cb533da09644a1fad2672b6fb4ee62c53f7079135f35be38ea17dc145cf887d02093c0cdb6a72619bc4ceea2162235b5beff92733a98a159fb79484ab7985931eb856af3fcebae0007a0c5e97d78f639eced7776530671d5d5055e5126f25c8f541ba0cb92e0721975566c8dcad9c049fab85b0301f9871b5568484a7ad81703495167de1fc65e4ce70d5606f385f2113ba4e7948a8ba2a084de7856d42c1f85d4b38983a0849535d66323320a9b70712fcba18025d3bdd99c0769e9912e8ae0a024f6bcd281a6f3e097e530e01afaacc90db7ccf32f0ae0a824f6bcd28b82d918485ab8510ddb327e3265cccf65dc2c4d44178da6a1b8ee70a1c6d0dccefdc0ebeb444ca7d11bf007bc47f648b97b14c1578992fd478db8fcc78eb0071195b530ee1a8aa2c54571b420ce8aeae0e545eb4da8c458c589571495f4018a587ec45bccca20e2e6ccdbdf58cf94e5edfa0cb6dce78e3d6e0ea19fba644b24f14be304c4bae5c3420f9eed874158a13837a6b8c27830f0218c2db325da78165b8ee355731b8db505813d06b63f41347bcb4e2569433a59a8e8b0641d5b42b1cdc6145f00dd0679b309dfea44fc26d214804e8b42e8c44b8a3e12d938adcae50d359d654aa5ad505833bc70633003d53c63a70c471d650455d5332418700d77ba05f26077d775227114dc855dcb0d804d4bee32c399067b3a1cfaab3073f6a68f46ed7e2a7ef327429314ca447e9a6ec2f0af4d3e0543ad87602f647554bae7c705745e746a0a35affc7c1dd94b666553ba6d4631735cac9e0aee745358dd955ce714cdb5fb58bd910e2271065c9c909b491748e509e74b1700ed09857b9771eb73075ec5538a6f423773271d6f1d4e460e289abe1bb2b793818561defabeb484b8ee2421e62adcdddbd1fdd0c9fadd53c16ebbc0f81747e661e0ac3b5a9eed259ea1a53b7b743a4d5005697a1bef4409061a039b5da3bb8b6ee64511f0a3605e4679166e8017f4cd738ceabd293c5e75d52e65cab7f5de03c7ae8409c1098095e71777eed3797c97d4aaf1f058ae82742b6b08fb8406b54a0b3ac88eed1aa20d52b9ce751f2309ffd8ee21df9e4fde60eaf2f93eb5db1dd15a4cb7873173fb383515e61eaf09f2c249a4faeb7e5afdc471708995199a6ee3a79b78be2754bf70720d79902447937da24fa2b79599409ff1e9e5b489f8818d9016a86afbdd2bdc51b32150b9c5f274bf40df7a1ed4b8e7fc30f68f54ccabfd567e52a206646f0c37e7211a1870c6df20646d79efc2432bcde7cffdbff03bcf2968f2f880100, '6.4.4');
INSERT INTO `__migrationhistory` (`MigrationId`, `ContextKey`, `Model`, `ProductVersion`) VALUES
('202405290639132_AutomaticMigration', 'mvc_net_Crm.Migrations.Configuration', 0x1f8b0800000000000400ed3ddb6edc3a92ef0bec3f34fa7170c61d27388333813d03c74ece183e898db473b0f314d0ddb42d582df54aea209ec57ed93eec27ed2f2c75a1c44bf1269152b74f9087b879a92ab28ac5225955fabffff9df93bf7fdfc4b36f38cba334399d1f1fbd9acf70b24ad751f2703adf15f77ffe65fef7bffdfbbf9dbc5f6fbecf7ea7edde94ed48cf243f9d3f16c5f6ed6291af1ef106e5479b6895a5797a5f1cadd2cd02add3c5eb57affeba383e5e6002624e60cd66279f7749116d70f583fc3c4f9315de163b147f4cd738ce9b7252b3aca0ce3ea10dceb768854fe79b6fabaf092ebe9e679ba3baf5d1324aa2fb1865f3d9591c2142d212c7f7f3194a92b4400521f8ed971c2f8b2c4d1e965b5280e2dbe72d26edee519ce366206fbbe6b6637af5ba1cd3a2eb4841ad7679916e1c011ebf6926692176ef35d5f37612c934be27d35d3c97a3aea6f2747eb6de4404ae88e9ed799c95adb4d37c5475fe69c634f9a9150d2241e5bf9f66e7bbb8d865f834c1bb2243f14fb39bdd5d1cadaef0f36dfa8493d36417c72c8d844a52c71590a29b2cdde2ac78fe8cef59caa3f57cb6e03b2fc4de6d5fb1633dc0cba478f37a3efb44c84077316e8581998c659166f8579ce00c15787d838a02678497976b5c4da7448280f0aa049d44abe8ac454a84902cacf9ec23fafe1b4e1e8a47b2e4c84afa107dc76b5ad0d0f185f424f37e3a2fb21d36a15a46f7190e8de49fb8788a74483ce0b8d865bb0dc5f12e4d638c1280492c90934527dd7a99dfdc953aa2a7cc979d2793f912f9e5450f99a71dc792f90ae1d95a27266f7cc8620f3921403ea16fd143354e71fd14e9d33f50869f7091cf679f715c35ca1fa36dbd991c310dbe3672f4214b379fd398ef5d577ebd45d9032e087da9aac532dd65abbe92cc80eb2bcf0c88a9a49a21a18f3e17ba8f25e184b5d12345774140dc1243c62c7ad26654898796663d840fd1336a415ce055b441f17c769391bf1a5bee97f96cb942254077e8b7e936469bdb5d514a7a201c0c036fc9720ead32dee1f8018f81e84bb6b3b033f430ce89940d85714316729ae078289c4a610d05e25961373a78b8a6a67a58ada9a92eb725ad645d8ccdc4b5ed60f29a6a2d81b48d2b8954328c34760d612269bd96cab6912b99e5423292583782c92bebb4a4550d20b2acb7e2968bfdb6e1a6fb545b305533ae7baf9d7af2b7e996f8b4a7284bc5dd430b2fd367341166fc18651accaf7d6c5625a28f288ab587475f88aeff85e3659aedcef137b4d560fcc517c277e8297ac6c12c18dfa7105298eb8f214c0b700301eae5c308d468d8798481d8fb40c2c098ec4452d2d0eb2c423bfe38851cda29e4a559eb9e7592d69aeda38d24734ca7b2bc18b49d91caebd78e50b885a43815cd20d5d9cbacadcd55159172ad4420d064905eefa6b59f4ea7fda7d2e7ec9a7255e9f6ebd19f56a738b5a6eecf3e8c238ac964dd7a45f66b9ae5586769bef682ae9f061481e02dca0a22f1cefa58b9ee5b90e0e26f6bdbf332b7fa816a69f9436d5c9593d906edad4e45cd6fd0babd341633c7fd54560b602a9dc5099eabd272905a7f5aab451a5e6d79366e9895e667458a22ae5bb5bde4bbb61dfa8976d9772aa9a656b6ab40db59e7fe64b9c4e7e3a2c9fcf2c18ce9f82fee27b738cac39ebd2aa51c1685978dbae498d1b0f072a1f40e654f6970157745e4f6211d7e9efc48a845fe8c174a16a8296965759fce2949be46b258846a5763a51a234851552393c3144bb4b075fead26e7b39db895688e7fbd76928ea1fd7613da7faa1d85e2efe316c3f61dcd1bacc1197e77f16c24358b68c8b2176559a1157ac971a303fa0971d5792a09ae90f711dfb6e358b25b213c38eb5e2db816bb8328b2d0ced14b5edfa1e409c5fd1d1169ffa9a4b6c2dfc7946f3b8e25b51542bd2fa217b1adf0fc03e768fb291d05d7e51d4a4642550d6b891ea3bb11a7d1e0a4e50f5be0e7e15a0057d1538c3648fb903f91f6b4565af788e8127445e661d3576f3120a6525d1f3a12fa2830a1fb586aeca5ba49eecb13f6bb288b36612f3aaed6dfae339444c3080dfb0eeeed32662fdc4debb53a14ca75829e976415ef72fffb510fd7564685caaead52a564c2ca2d5c9fd9eb598d15e4b5b55f194dc919d8700be92646d1ccdb3b3b3b11a2fba858a79dc5e1eea3cc8cf6db565b00d36eaafdf7d3514f04167b9b17ebb21eda126791de4ef7872aca9016d55ff666c72692f9105da028c379f030b10a97765efcbce7a0ce7808c4e65b9cc7d1e63d11f4e0765985e92c46c131793139886d15d6302ad54d5c7b2206c3512fe211adfceb35de8c62e5ef936ba417cbf20ae52fcdaeecec2dc9aa14aa246b48acf7192cd5c1067c4ba54a0d697dbd4a7933d6a7c5aba615348ced1f69730bebbc6d0591d9546a28a42dbcfae876e0bb6610799dcf9892beb6c9c0e7d17c8859de749fee7134ef6592db29379f8fa2f91837f4259ac077bd7beabeaf5d747425434b4eac03de70738fcbed4394a084001c1844248099ec4ccc93d1eb702c8338acd8a231ce4441edfef12e0b7856ffd1acf27af8d5c3df34ca53dc2c32bc8eae5056847f626d512daf6e47c375fefbf968b86e2f6f42e33ac74f4ba2ea46e016c5549f9d4b25190dd692a3bd0e4f72e4d49eee78ad079ef1e026b2edaf68e77cdeeb341131266057571197d4474dbed0d4380cb1bddf0397800c3c7629da1829f7691332533bc4266cc14c6b13b6db5c3f7bd07297f4670b32684738a731d8c633bc46f2dc62908de3bfc5201cc7818b4118f8b0cd4ae54b70affa355af74f2154759e4aab55c8fbe8b3b6e3589acc4250fc24baf1737cde3b671ffba4012823ff17653eda9e59032880c9d2065002fa38e7739dc712ee16e91897072d32baa4c2bfe38794d7dbacb45d57251b6e51fed4576a053053c9ae40461fd50c8018d54167f033ef2a8aa3dcd3017d992697798c379ec08d76a978859ea3e26c85922f39d62591f387acbc6188d1f33818435e6784d33d67799eaea26aa5c8ceddcde33b4fcbfb643d33a62ead872f24c6241341544cb4254a8550723aff93344e1decd625b383ddf806f0508fe7a24aba4e2e708c0b3c3b5bd59f3e3847f90aade5692673b4e64b8816c359a928507c9e2639d18b5152c82a2f4a56d116c526da858ea0b65424562fa96bf1883517788b93529f9918634d80aca44b025a3cc2b49966e964c1889941faa0045e4a21d166f36264904b06e82084dadc851dfcf6a270ef245133001b598093b1bac9a28647c34818411aa17c2b2a61d1265fe96485490714505af4640122dc5db69a96472f41d44c8e8d106832103909a366323c9031824076f7dd5cde0615f3e1e69058aaf81f482a15840182e9a6bb7b09a77e966c04837d781e209efa59194ec808022a246050f15f958da1e37b970c641481546585e908aac3728208203c1b36fc56a71c71123c78f42e044c26706ce2041573c12c0a1d679b7c1da3c81998ee6714210326c186c18a94204ee2050cda1af5648205a447523155972b49cfdb4052a64bcc3bead6aa9e191b018053f439899e7a26861130c65118f8328bcd7589ee203cfc32e6208fc16afac73a05abf9b3f78760f0eb3b36a2223be7789544c9a567ece3cc6059144730e25143c7a7833868481f5cb211193e7cdeab347281f763eefa83a590a57ca45d59c593bddf93e57c172ad9d024bfe884834b62642f77eab419fbff38a2a4dd86f73e1e47948cb1266032e913a36255f2a10c91eda483c9f2612f77aad0dafd973a05e563c99c8221872471a6138826fad99bd41de2d94349fd48270f255ff6fedca10865378b091cd76e2185816e634c39a67ada0303c5119a251b99506557ea2995d0940c256394770e215059c57c75d432fbd691bb2a4565acf3411c8255d48f780056f1e5200ebf72e60cb3ee91d26878db96c5f41b66c99e5e0295d4dbf01fce65d153010a7c19867f54d933ea3e5d92146fd277981a504dff883a50cd9f83d08252d24c9bfb12d515a087ab98c3ba0254513ed215a08a277b7f05a88a12576a2a53c838a309c594330efad010707e104765fd18c63a30ebf9b5ffc766433a005b0952e6060822afaacc02123626f87edfe5573126abd3ad2e347f90382bd8ea85a809a4db6c831a33460491e703b54a0da318d33635f06d0f2dd43ac28af429480f9cd1cd80fcc6dfa1fc715f72dcc471e64ddc97285d25bc252ee853c07a13959f87ea22b9e8a34b590108a7d0bd7c4900bbd76f3686eecc9b2d04847b4237806ab654084c6b9c98a8e1bf5b2893c3f9b6198075c11d32a06eb11a80b4c101101426eac300a6f9049804a13e44183a536f5c0840e7506d0052b95d42101a3f594377fa35300842f7a53103103e79ad04873bac59815210c4dc3d18a7365701692fb94c94f02a0da447dc81ac40b6bbb91a246336194056693020404d4a10d35aa2a1f8e062ea123118c00811df1030294a5e00c96869508bd1d4d24c3b5997412feddcc6af0e826d8724ea4e692bb2097b65a051452eda00fc806d26030ab684e6c31894c90f421796c9ce0aafc375d3a20bc46420761bcbe0b9013fb52e4f8d3142901b872e46901906bb9568664517dac74063e81f3c2b8af83360626c22d5b8d11862d56c0664030f9820ad1cf69824f123b4f2e4e8a2a4b84128e2a418e2992d5f33198af026064e43ebe0c1731f329547ae0cd7e1c8850276185aa985a2193014671360b4d037b4e5419b424938ca35c124a60198e08c20fb50d0826187b5d85034d10d4377d9717613d087de302ff0d5867220d2c5c6d09991ae3002ed299227b7615ee4a71ee510b8c79ea1f3c13def04d025c0b7f4e4893038202bdfa694a6297fd2d24c85dae93884692a7d00469e0aad372c7f39a7f08795a6210688d7421a670a348ad4e0a0a9205ea3449d27621c05aafaae8d6e46d46e838aa1808e8343e606f4f7b35c7cbd0c4ff1eb1990e9a9735c138c4685eb1a677ee6e609513aab05da51800f0be9e404f4a1527054f4a21a221da2df94c5b40e9a0c9d5898bc7a1443d08986f37c8c251ef2c756f5fbacc1e0507a970cdd65431b1cca7cf78078d8383d681fc4745b8e742faa131783a343a0edc79463df3c65da77f85e2ff1bea650f5f62ec167ef99bd4fa9563b59bdfababdfbfa9a3ddf5a8b666a6cdf11dbba93c572f58837a829385990262bbc2d7628ae53bfd28a8f68bb8d9287bcebd994cc965bb42a1fe0febc9ccfbe6fe2243f9d3f16c5f6ed629157a0f3a34db4cad23cbd2f8e56e96681d6e9e2f5ab577f5d1c1f2f36358cc58a33a6c457cf16539166e8010bb5e573e81a7f88b2bcb84005ba43659ecaf3f5066856bf9a2a5e092816ee6154e6197d31a0cdcbbfeb2ebabcb9f573aafcc0dc40f940c6b5291faaabccb2ace50ff7233dcbacd8281393c296cdcba7e9f334de6d12a1509440359cab32ef6712ada233011657610f6f19dd970f342ca4a6c81ec63f71f114f1309a227b184d965316465324c3385908cc915efb256110d6a3285a7682579ff5bc091e748eb5113cb89f52f06844232778aa3047039cea1b1c12a0aaf445b19abb32f2c570d669c29deddadecad5dd7512758f5065cfbee6fb022caca6c84198d6e5dec9ab42f9015c07e143f48c04104d91c348aa8f6a375f3ae0c6c35638e8d26e4aeb14db8af9ae2bede13249bb59884cb13d2cea4dcd02527958aba1509f57168aca0f560d85f5d86221e93cb934324563a725fde406e700d4537bd6f1a59a14273c0bb5a4ec195674ca1ea20544cbdca02cd36704006a8a1d61e1c7280360d5c56eb03ea2289641d5a56e90aeff85e3659aedcef137b495410ad56eb0e9879644a0b4fc452d3bd3a36e4fb380755eec611768bb2bb7aab2976412d0c21fc6c07063e0e56eb407b05275ee59fd56a9ea12ca6285aabb8ec32fda4bdc2fd9727768c0be2954b9c3fc35cd721cc340695d183955c26093c0739074d9e127937bc697d097e077ceecee92afe9eb7bc28df044e9e72a5e94f253f9dbf5e33ff41e66c17ab85bd8cdb2ec21b29996b99de2e5a3bb9341134739609230c50ed4943619008c2d1f572596330a296ab6dce16e03654fa9c0335ae6702bce24a6e72ec53509ebd5d0da54e42c28657ef2c9d679e70cec6badb75143eeeb5dddd5c433f16e5af795033334e95984297f515abe718bf6c5fa3adccb9def8a7edaa525725cf9d501031c91d76de18b62741762e78bd76d609e3bbbd55dd50a3e9195695be8b251242573230090e3fb53d5a7fdeaba04adad718448bfaa2e01a4157d28a45f4e87a9a4b57d2003ef09429d2354e82a90ab70e575fbc16c99e16dd58b5ae90617d67e8b9d8d9e755fefdadecaebb8ae93b8f085aa97f5b6b61f97a1efa22cda002706b6dcc1ae5a7fbbcec8a15bb0aada5287d901ae565d2f557d9d5f869f357dbd3676994de565e20689fb24310b8cabd83365e7d5aee9e2fbdd159da66f78d6f9544235fe25ce22d118e16b9c21461952406c6ac65594bfe3ec21ba405186734139f1358e10c521b6852e5736f2658de35b14cee368f37e8d13619298725768673102a1d5e5e3aa60b27d00bb41576a0fe9579ce0b87ea1e3817115aeb2ae3434806a0705bdc61b609533c587fd2ee86b4ba4096ff96b1c3809ae66b60f6b3b6c6380fcdde581714e5657798a9e611956f690cef76da11b1ce82cca96ff783a57db6562788437eb4cc876d4c3463341506a75bea364b2c9d5e3da321e2c060f872baf56283fa5c04e0a3538ecfd4fc898298f56994c530dd38bb595e1757485b242b46db98a1ef09657b70a80554d0f88e7bf9f2b2056353d20de5ede282056350e12879f96c4a69426912d7787561b7fa5be8860b05c03075b0cbc3ced736f7a60769414bbe877fb5246745a6f5f1a08632a16a6a364748975bda0aa547eaf0706a6ab7407c157f582093ddd00d5bd60432f3840752fd890990b54f7930a5083800d5e94fddb64c4f4a536ea3c9aeeca42d14f790f52361795435b38c5bee1c32e1efbc9602a6fe52e8baa2fb1eb72afba8b9ea6afd290a65d44d70eaec2c130a7dde45d44a8ea01934ab3786f0c3678518226e5d9f5256e62765e77a1334250ea08bea3a803816ac713b1e4bb420b9db46a1ce59099cfd738dc18a4c9651ee30d0453ac9be606e00a3d47c5d90a255f722c5ef4f3558e30cb73478c9e958085faf0279dbd5708529211b1498bbd29697fb749469a041f5ce6916adc651e916abc79936c44ccf8513799cfc8e47c2bed91d3f9c7e7e57fc64765fd51f5e7791c9101772d3e22a255705edca64f38399dff7cf4f37c76164728aff3c334b94cde8a5f58b04a6e72fca64c6e82d79b85d8dd3d454a0925cfd75c5c0fa3415b870e294fc8c9157e16f94b6587f916349c1ce46421f63e11b50ded58a74f8fcab9add46df92696a102af6f5051e08cccd865f9450c42ef7cf6a94c1f725727a58a733965bbb812d96c23359e6f285b3d56dff543df7fc3c943f1783a3f7ec542aebe7a6100dc241ff109b2c945528394e1b9826bd6700dee2e4d63c3e4b14b572f29c067deed2405cee6612129b4634049e93284a879fac699a7c198a04cb361c70a6d560d334384ee01d9d29cc56a0c6b02b38836b8d4c17815e595367de5ceea75f7eda38a68c7fe8d735a4313216483628ea4e35fc84490ad9654bf761f311bc71b0887e488e853e61933cc2758eafbc6f04dfa78d165b2c6df4fe7ff5575793bbbfc8faf75af9f66d719d9b1dfce5ecdfedb79b2e87b8d1be2bad720c4ecf38e1bf2aee720025aa70837ec4db741a883294ef8cb98564a137eb8336b4b40807cab499a53c476c159036d62a4fdc3ad738da8e1be7656105dde119d55d60bac907b440dff975ee0e90578206d1fce0851e6f4b0b442e0441e16f607edf8c3f23830cbe3c72e3efa2e1e6cf9df800943ec96beda75c5bcfa1533ea5b01dc307947d41aff67678d7fc3a71f09019ac6b76bb65777e0ae720440607363b8ad05a6abc362b016654506103b59d6a4fc300bb36a4e7c4b339747c4a7cc05532f726a0e3b76c04152664e005b936f26d02c1f3ecfc575d68f1a624ef6eab88f61c1e4fc0875e5c02402d9133b17e68f5977ba1bf93453480d33f1b3f0d8a4216ecab4eb39c8b068538db8616fba8550e370760f3bb5a1cee761561d6cdf90af194c929083b8a506b26ed83143916ac3cc89b6634036b4f93b0e621b855361d8b14191ffc2cc86b66340367439357cf281cfade11d32f5d10c4332f5d20c03dd74a7df1376e0db2f211387eec6717f16ad329f85ddbad5a6af30af5ea17bc0357c880f51fb7831c826cd08b48eba5c1afdc90c7bb7e8c7fe9fe47672c297b62e11841b6eda6f1072ce65adffce62ad5715e9335cb46a7f851ada1eb25177ee7b349f8e43e19df4734fa84d4a0e35bd7fd907edcc67eaf0b997b4693bbcde08a16e1b18ce29369987d76d9449eb31e56116dce9c26e545cd28f40388014203e6799c906e213ec1ff7956e420b80e6c070bd44cc0f6df7073386d8de0e4279426c6e06a5b9f57f2b98fbbf0661b39004d250932fb960a7776d02104b5bd394ebc3c2e894411c98bb8c674326e89e1ecafa86f28ffcd8717d2c7f212781e3e997ed3caa160274359b1fc5eb26c0e5490902b9ca971204729537c5276436834a08b85c0a15bfb78b616ebf47bfbcd1252671d9561579486cb7544865f8de4ec5dc26fef794404f3a429e9340a0433ca301d94e02810f6c5883c94f0ee3dd0b482762b7b0153944cc4bbaed187031db70a147644208937bbf5e68ec5d91e15c2096bec8eae41f16cec86ce790dec87c3e119f470030a1c841f81769b371d831df9878c32c020088d0cf3c020e777dc464f3f07b6417927a78051ee88c2de4f9f00e5ac8f4e113be27133cdc923dcbf3741555a768d9e5e32b944ae07db29e7d4e4b34756d43439952e3a829f9b88b8b681b472b82b0cc8c20aef2ebe402c7b8c0b3b3559d71e31ce52bb496074d885eabb0b311f62c0d5c394fc99f240444cfe0ac5ce8283e4f93bcc85024e74cb9c9a264156d51cc8d5b68052a2f45468572642d50b1e6026f71522a1f609cd638a1bc42278b16b430cba6593859306262901e26e4f02b1ccbdbb190d6b3ec6bcbc611223642929322ae22881881b3a360aa2a27b18b1ce9bf0fef827304396ac361dadbc45c29465d7010cb41a6741451a27472447485414448f75165a738282749ba01e30afb211d419428b95fd915a09626273ebe40b5e4c4dd1b4d86f390ba498f7704a1a2a11e5f81af64338c6c035e58267685a3085315a7c7e2af0b82088fe6cbbf2e113d4ec2a3f8b2b81adf64425305a61824a60ec961d9d594bc3859517d2ad83ada288c94283fd03d8a8894645a6e5456bc7a811b943527555f630cb931a9718e71f8628eee0770f69aec003ff6c9cbf1043fe9c18b9521d814dc375b7932319ac4527694a5c90d65569e808c117bb29d4d2643a36e668eb233e95ec64458eef535341b09cad2c095bf806b68fdf7dff7ed1aba8d23db6bd9e9a2dd580a98d2172037ba8f69efafd4ecbff53c8dec8c6c39bb09cfa47673273b4c74befaf0eec8be17b779b9715615d91b7407d3211de586b90a863a8c43188ddce2afb9f3809a688ac397fa5bd87b78f0ea14121c56d78b792f6a337361a7ea3be4c1363335c25165e720b4cf34e23385067293a1c975107b88dfdbcb9fe98ca0312f7f5cad9f492f7f84a8ca43388e0921c59c2212eb5ec4d14c1743ed8c760299d247ab899ceddac99c65eafe20b266fe88b963685f70d133629f40020fc3b69a5cd826b1b37a88d8c8d6d67bfe5b9c54c58adfcd9484abf9bc27bd70ad3e2b39eb8203e835785d5e7f75f374bebe2b8339ebe882aa2a97782b41ae2fd265c8753908b9ac3243e65ee524f85c2d84856960c6d55a11129eb606c2d1545a8c85f3979107c35583a3e17c854ce83ae521a1eaaa20349d17b60905e3772de160ea20244d7599c9cc80a43e1e48f0eb620874ed746702db79664aa0bb2a083cad35a368bcf924f84d3904bcaa32436e1349cbc0bb2a083ead35a3e08e441216ae164274cfde8c9b7031c77709135307e169ab6d389e2b70b43530bf733bf8d216298f456c018e886f648b97b14c157899166abc6d2333de3a405cc6d6944338aa2a0bd5d5861003baabab039517ad3663112356655c520b08a3d048c6cb6ceae0c6d6bc5bcf9876f2fe063d6e73c61bb707133c6d89649f287c61989e5cb96840f2c3b1192a1427068dd6184f065f043084b765ba4103db703d6aae62f0b0a1b02660d4c6e8278e7869c7ad28674a3503170d82aa6b573878c08ae01b60cc36613afd499f84db42900830685d1889f046c35b2615b95da166b0aca954f5aa0b060f8e0d660046a68c75e088e3aca18abaa664820101aef7c0b84c0efaeea44e229a90abb861b309a87dc7d97220cf66c39855770f7ed4d0e8c3aec54f3f64e8516298488f324cd95f1418a7c1a974b0ed049c8faa9e5cf9e0a18ace8dc040b5fe8f8387291dcdaa7e4ca9c7216a9493c15dcf8b6a1a73a89ce39876bc6a17b321c44f20ca9293136823e91ca13ce962e11ea031af72ef3c6e61ead8ab704ce947ee64e2ace3a9c9c1c41357c30f57f27030ec3ade77d791b61cc5833cc45a9bb77b3fba19be5bab792cd6799f02e9fecc3c15866753dda3b33434a66e6fa748ab01ac1e437de98120d340736ab56f706dddc9a2be146c0ac8cf22cdd003fe98ae719c57a5278bcfbba4ccb956ffbac079f4d08138213013bce2defcda3697c97d4a9f1f058a6813215bd8475ca0352ad0595644f7685590ea15cef3287998cf7e47f18e3479bfb9c3ebcbe47a576c77051932dedcc5cfec64944f983afc270b89e693eb6df92bf73104426654a6a9bb4edeeda278ddd2fd01c875a60051be8d3689fe4a5e1665c2bf87e716d227224676809ae96b9f746ff1862cc502e7d7c9127dc37d68fb92e3dff0035a3d93f26ff55db90a889911fcb49f5c44e821439bbc81d1f5273f890caf37dffff6ff55acac4343890100, '6.4.4'),
('202406011433077_deneme', 'mvc_net_Crm.Migrations.Configuration', 0x1f8b0800000000000400ed3dd96e1b4992ef0bec3f107c1cf488b61bdde831a419c892dd23a86d09a6dcd8793252644a4aa858c5ad2a1ad62cf6cbf6613f697f61b3ee3c22afaacc2a92d3f083c53c2222332223228f88fabffff9dfd3bf7ddf44b36f38cd48129fcd5f9fbc9acf70bc4ad6247e3c9beff2873fff32ffdb5ffffddf4edfaf37df67bf37ed7e2cdad19e7176367fcaf3eddbc5225b3de10dca4e3664952659f2909fac92cd02ad93c59b57affeb278fd7a8129883985359b9d7edec539d9e0f207fd7991c42bbccd7728fa98ac7194d5e5b46659429d7d421b9c6dd10a9fcd37df565f639c7fbd48372755eb932589c94384d2f9ec3c228892b4c4d1c37c86e238c9514e097efb25c3cb3c4de2c7e59616a0e8ee658b69bb071465b81ec8dbaeb9ed985ebd29c6b4e83a36a056bb2c4f368e005fff584fd242ecde6baae7ed24d2697c4fa73b7f29465d4ee5d9fc7cbd2114ae88e9ed459416adb4d37c5276fe61c634f9a1150d2a41c5bf1f6617bb28dfa5f82cc6bb3c45d10fb3dbdd7d4456d7f8e52e79c6f159bc8b2296464a25ade30a68d16d9a6c719abf7cc60f2ce5643d9f2df8ce0bb177db57ec580df02ace7f7c339f7da264a0fb08b7c2c04cc6324f52fc2b8e718a72bcbe45798e53cacbab352ea753224140785d808ec98a9cb748a910d285359f7d44df7fc3f163fe44971c5d491fc877bc6e0a6a3abed09e74decfe679bac326544bf290e2d048fe81f367a243e201c7e52edd6d1a1cef9224c2280698c402395d74d2ad97f9cd7da1237aca7cd17932992f905f5df690f9a6e358325f223c5febc4e4471fb2d8434e28904fe81b792cc729ae9f3c79fe3b4af133ceb3f9ec338eca46d913d956c6e48469f0b596a30f69b2f99c447cefaaf2eb1d4a1f714ee94b542d96c92e5df59564065c5f7966404c25d50c097df4b9d07d2c09a7ac254f0dba4b0ae28e3a3266d1938c51291e5a9af5103e9017d482b8c42bb241d17c769bd2bf6a5fee97f96cb942054077e877c936429bbb5d5e487a201c0c03efe8720ead32dee1e8118f81e84bbab3f033f4302ea8940d85714b177212e368289c52610d05d24f610b406e62f4b2a4cb7897e998f8532f262a6d43adee871b8546e5ab8d4263366c492ba424c266e2da76307975b596c0a68d2b898d101a69ec1ac24436f55a2adb46ae64166bd64862d50826afa8d392563680c8b2b6fa2d17fb59fcbafb54d6bed168ae66de4e13fab3ef053eed86cdd246f450f8cbe4054d84193f915483f98d0fbb5820fa8848a4dda7fa4274f34f1c2d93747781bfa1ad06e32fbe10be43cfe4050773967c6f786861a6dff1302d400302d4cbfb1ea8d1b0ad0f03b1f7de878131d9e6a7a0a1d7b6a7e9f8c786e7d0363cc7b631f0ac93b4de6c1f6d24b9633a95e5c5a1ed9c545ebf7684c22d24c5a96806a9ce5e6e6de5aeaa88946b2502812683f47a37adfd747ad37f2a7dceae2957956ebf1efd69f506a7d6d5edb79356603279b75e91fd9aa419d6799a6fbca0f372aa7189b728cda9c43beb63e5ba6f41828bbfad6df7cbdcea07aaa5e50fb571554e661fb4b73a1535bf41ebf6d258cc1cf753592d80a974162778ae4acb416afd69ad166978b5e5d9b961569a9f15298ab86ed5f692efca77e827da45dfa9a4baf1b25d05dace3bf727cb053e1f074de64b16664caf7f76dfb945240bbbf72a957258145e0c75c131a363e1e540e91d4a9f93e02aee9acaed63327c3ff991528bfc392f0d59a0a66c2acbf3744e49f23592c72254bb3a2be518418aca1a991ca658a285adf3ef3539efed4453a2d9fef5b2241d43fb5993a6ff5416a5c1dfe7050edb77b4876735cef0d6c5b393542fa221cb5e94658556e825c7b50ee827c465e7a924b844de477cdb8e63c96e89f0e0bc7bb5e05a5807516421cbd14b5edfa1f81945fddf3c36fda792da127f1f57beed3896d49608f5cf1ebd886d89e7ef3843db4fc928b8aeee513c12aa72584bf444ee479c46c37b307fd8025f0f5702b822cf11da20ed45fe44dad35a693d20aa4bd0359d874d5fbdc580984a757de848e8a3c084ee63a9b1637d91b92f57d8ef484a36610f3aaed7df6e521493618486bd07f77618b3172f5babb53a14ca9e3d6d6554a8fcb455aa945c58b985eb357b35ab9182bcb6f62ba32939071b6e219dc4289a79bb676727427c3e2ad6696771f8f3516646fb99d516c0b446b5bf3d1d75476061dbbc7897d5d09638257a3fdd1f2a92222daa9ff7c66253c97c249788a4380b1e9156e2d2ce8b9ffb1cd4390f81d87c87b3886cde53410fee979598ce23141c93179783fa56611da342dd44d54bc46038aa453ca2977fb3c69b51bcfc7d7a1ae9c5b3bc46d960bff20389519c95671d47e6a276ae9be4a00a55926325d6fb8cbbea6003cf54a54a0d697d1fa8f21eb14fe7594d2be8635b13dc892885055ffb32a8c4d620d97c231de5424b57e28b356adea5b4ad2062eb4a0d914d0baf6f953bf05d3388bceeed9c92beb6c9b00d8ac8d99edb141ecc649b155ef13aef585cf4b6bf6d0b837684eb0c06db285ba50e5df83b0d06d93897280cc2716e511884816f3758a93c863b8ed61cf47d0f934d790cd3b8a5ee4f616cdc599fcf60b231ee640b3481e5dfd7ae24d09b66c58b9d4ce95c8875c0ab9dccbb6381a28161a30298691d8b968cfece0507e2b0a249c738050b7ad233def130cfea02e545e95c873d8b01d03246fc5fe924c8e3018c9f43cc14afc9354af3f01e698b6a797d371aae8bdf2f46c37577751b1ad7057e5e52653b02b71a4cd5796da1a6c9603d3d9ab73ec9d9a4f618905780e06120dc443e6751b40b72ce26e0d29db6e99b1a8731f4e44d7fb82520038fb8146d8c94fbf14a7f25ebfec99ccace5379a025f23e7e67db712c6fd342fff84939e4c7adddbb6757f6e91b504affcf8b24c43df3373400264be0d010d0274c82eb3c9670b748c7b85c6d91354b2afc8b8a90f27a97161a7d55b0e10e65cf7da556003395ec0a64f451cd0088519f4a0dbe705f9188649edcd665125f6511de780257a68723d123d1ae192f4efc919c5a5ca317929faf50fc25c3babc84fe90151b8808bd8c8331e46e259c123dcfb26445ca252fc70bd48f30785adec7eb99311b6e357c21d72a9d08aa2bc9966a474ac9d9fc4fd23875b0db57be1decfa8d080ff5f55cd4ad37f1258e708e67e7abeac31d17285ba1b53ccd748ed67c0955c7382d341e8a2ee85e842a7812e7b2ee26f18a6c5164a25de808aa7dc567010aea5a3c62cd25dee2b850cc26c65813205b9b8280168f306da6593a5d306266903e28279c5248b409e21819e4f24b3a08a1361d6607bf3d07d83b49d40cc04616e0fcbe6eb2a8e1d1301246904628858f4a58b4f97c3a5961324c0594163d598008776729a6e5d14b1035936323049aa4564ec2a8990c0f648c2090dd7116970a44c57cb83924962afe07924a05618060bae9ee5ec2a99f251bc160ef950688a77e5686133282800a393d54fc5725f8e8f8dee5971945205589863a82aa48af200208cf860dbfd5596c9c040f1ebd0b0193091c9b8b43c55c303147c7d93a05cc28720666901a45c88049b061b022cb8c93780183b6463d99600119b7544cd5a5dfd2f3369094e9723d8f6a5ad53363230070d64727d153cfc43002c6d80a031ffbb1392ed16d84871fc61ce436584dff58bb60357ff67e130c7ed0c94654e4bb77af9228ddd88fbd9d192c8be20846dc6ae8f874101b0de91b5e3622c36764f02a8d5c2e8731adfe602964291fc92aab78b2f736594ea1a2920d4d3e954e38b8bc58f672a7cec4b2ff97234ada6d78efe37244c9186b0226933e313a5a251fca50e94e3a98c431f672a70ab1de7fa953503e96cc291872481267da8168a2e0bd49dd21ee3d94d48fb4f350f265eff71d8a9406663181f31b584861a0d31853dab29efec040718466c946265409bb7a4a25342543c918573885d7f41652a07a54ef4d51aa9ee1b318c42080fd559c8ad15849892e61435f8985d9e7859c516ee884185e9538a9037ad95bbacc554a9561c007717ca3a27ec4a31b155f0ee2d8464e9f63d666522e1d6f7a52ccc16396ece9255049bd0dffe1340f3d15a1c09761f847953da3eed3654af2267d87a901d5f48fa803d5fc39082d286510b639e9531d5e7b38443cacc36b15e5231d5eab78b2f787d7aaf065a5a632c5328bbb09261b8b833e3444421fc4218f7e0c631df5e8f9b5ff073e8638755b09b2d95ffb93d7a3d86bdb8d69e41db71d5b0f65dfadcc5e602b685a4fd49f3c1fa8576a18c598bea9816f7be8a156b181b44f4e7be0b43106f437fe0ea556fb92e13a943aab231645e92ae02d71de5c62ad37a4f8565e1783d85c17161580700add8b3b30b07b75db68e8cebc368080708f3f0ca06a930a81699d131335fc475c6572b8579906605d58920ca85bac06206d580b048589573280a9bf872841a8361186cecd3b720840170a6000523e188620d42fbc0ddd9b4f234210bacf2e1a80f0e9b72538dc66cd0a948220e6ecc10486b79b2030d14131722b53d1d59e9b5951d56a4935558c5133802c33d14080eaac3ca6b5d464c3001753970bc5004648ba00019312550820192d0d6ab126393ed34ed665d01b11cef0abc3b7db2189ba5332453601db0cb446918b3e003f609bc980c284a1f9308613f383d00514b3b3c2eb70ddb4e8428819889d61193c3750d02a3035c6d8566e1cbae8566618ac29d1cc8a2e289581c6d03f7856149193c0c4d8c45872a3314459da0cc8061e30415a39ec3149e217b9e5c9d1c5f771835044f831c433265f33198ac03c064e4debe0c1735f759647ae0c34e3c88542cd185a1b0f45336028422cc06881f02660d0a620288e724d18946900263823c83e146e63b0b0160645139733d4ca8e634dc0e80fc3bcc0471bca8148071b4367463ac2086453a41804c3bcc8573dca2170973d43e783bbde09a04b800f8bca1361783aafbc9b52baa6fc4e4b3315eae7f2215c53e91356f25468df71f387738a97dcd2344400f15a48e34c8146911a9e162b88d72851e789184781aabecca59b11f58357c550c027af43e6067ca96ab9f8864d927814a19d27dd0d916a648adba141b3a5b80362614aa7301ebc75f16b1c90bfae7bed2778da8af77e9ccf9e99e745f9c22f9019063ec9a6131af0e19982b1e2d3b32142223e36b398d64193a1130bd35328c51074a2e13c1f638987f4d8c6e09c18bc34e5939ca1ae49682f4d99bd1e100f9b9722da5b449d9d964e7e75e262781d12c8669b32e69ba7ccc134593e5ff03585d3182b75f27ef35cdae828d365b9afd9f3adb59ac4acede56b5b77ba58ae9ef006d505a70bda6485b7f90e4555caeaa6e223da6e49fc98753deb92d9728b56c5ade59f97f3d9f74d146767f3a73cdfbe5d2cb2127476b221ab34c99287fc64956c16689d2cdebc7af597c5ebd78b4d0563b1e23c50f1aab8c59427297ac4426d7187bcc61f489ae5972847f7a8484b7bb1de00cdaaab66c5d54a8385bb4d9679d65cb334cd8bbfab2eba7cdfd51db47c2b5f43f940c7b5296ef7cb8cd8ec7609ee477b16b998512a26b32e9a17f7f91749b4dbc442a128816a38d7459adf98acc8b9008babb087b7240fc5ad160ba92eb287f10f9c3f131e465d640fa34e6accc2a88b6418a70b8139d21309491884f5288a969de0551b646f82076dfe6d040feea714bc268099133c5554b3014ef9ed450950597a54ace6ced97c319c7d69e2ce766d6fe5eaee3a89ba47a8b2675ffd5d1416565de4204cebc276f2aa50bee2d741f8405e9000a22e72184942fd9b4d9d5f9f1b0f5be1a04bbb29ad32ea2be6bbaab487cbe4e8672132c5f6b09a27e82c20d5b3743594e6a1300b45f578580d857de6c642d23d7fd3c854932a41d24f6e705cd4930a06f73500161257b137eaaedd3bf952758a1da3859a53f60c2b8a450fd1a36acadca02c93170400aa8b1d61e1279202b0aa6237581f1189645055a91ba49b7fe26899a4bb0bfcadf8eea70852a87683dd7c755904da941f979761b859efe966b02f487bf819daee4ad357f4925c8ca6f00fe762b87371bc86fb0056aaee8d5cbf55aa3ad4b258a1eaaee3f0abe925da4bb6dc1d1a6037852a7798bf2669862318685337ae63c87d438283a4fbb8c46472cf3ce8f425f85d4481bbe46bfafa9e70233c51fab98aa3527eaa478ffdf80fddaf59b01eee16d658163d443637656ea702f25180934313910c70499862076a0a9f0c00c6968fab128b198514355bee705682d2e744e05953e670cace7cd7823b64d77cef420dadfd92010b4af97983c9d679f722dbd75a6f43b7dcd7bbbaab8967e259b7ee23296668d2350b537e545abe7e9bee8bf555cc9d3bdf15fdb44b4be4b8f2a325063822afdbc2a3627417e7e88bd76d74a43bbbd55dd50a3e9695695be86228e282b90400e4789f55f6295f4b7c4a00686d8d23c4ab7b1483009b8a3e142ed113b987c6ccd5f6810cdc4f08758e50a1a340aec295d7f557ce2186b75547b5d20def88fb2d763684d97dbd6b7b2b8fe3ba4ee2c217aa8eebae6e3f0e43df91946c801d035beee057adbfdda474d32d78556da9c3ec0047abae87aabef62fc3f79abe6e2fbbc4c8f232718374607798cc03645faaae4bb2e0aee8347dc3b3cea712aaf02f714a446784af71864852a48058d78cab287fc7e923b94424c599a09cf81a4788e210db4297231bf9b0c6f12e0a6711d9bc5fe3589824a6dc15da7984406855f9b82a989a0fc01a74a5f6907ec5318eaa1b3a1e1857e12aeb4a4703a87650d06bbc015639537cd8f782be4c629375983fc68133116b38c92791e3ef86b5f9e5341c3c30132bc6057833b4fa68091b736b8230265b998ed2018358d70b2aa048c4ca5e70257bcc57f582091d6300d5bd6043a71940752fd8d0f10350dd4f2ac0a308b0c1511d48b4818efe2e18c0604eabfb0545cfb056a4e821e984b6d00d0e24a16cf91fef790c968c8901f36bc9baa4757d2d9906825ebfb41d616bc6558fbbc1f2b08df170e2e3756bcc4f69d1fda28c0fd5cc7bd768101ec65618d1716d0f7b4b10c25bf3b2014df19a5ca334173d1daea207bce5f59d026059d303e2c5ef170a88654d0f887757b70a88658d83c4e1e725dd664b93c896bb43abf6c385b6223058ae81c3f61474e2fa786e07b60dac13adfa3299557a567743a9e8a73cd9299a8b4aa32d9c82ed3e8cead8972053bdbfee92f3fa12bb2ea5afbbe869fa2aed60d3457cacc25538d8d5a69beccb08553d6036d22c9e84830d8e4ad0a4f4cdbec44d4cfaec2e7446084a1dc17714752050ede84e4baf719a4227ad1a910cb2d27c8dc3762389afb2086f2098629d638c1a891e89b834b88ac3ddd25ca317929faf50fc25c3e2750a5fe508b3706522f4a2042cd487779ef65e4949a961c4262df6baa4fddda686a9d3b270f962ca7117d95fcaf166758a18314f4bd5643ea393f3adf091cee61f5f96ff199d14f527e59f1711a103ee5a7c4454d3e12cbf4b9e717c36ffe9e4a7f9ec3c2228abb2fad41968de8a1f13b14a49f3fac722250d5e6f166277f7c43605942c5b73d1538c566f9fcd48d95d4eaff18bc8df4676ba4fb72852ba9c2ec4dea7a2066c3a565f0a20c5dc9626a0b8794c518ed7b728cf714a67ecaaf8f80ba5773efb54247db9af52894599fc75027125b239622a3cdf50ba7a2a3f6189beff86e3c7fce96cfefa150bb9fcc08b01709d32c627c83a834c055286e70aae5ec315b8fb24890c93c72e5dbda4c8e9582c2505cec16221294dc78092d2e57551f3f447679e06638232398a1d2bb4b950cc0c11ba07644bbd3fac30ac29cc9c6c70a183f18a3a1e85367de5ceea75f799af9268c7fef513c09a264ac806451c49af7fa113414d2dad7ee33e62365a3a100ee9b9a74f9967dc309f609b17860cdfa4ef745dc56bfcfd6cfe5f6597b7b3abfff85af5fa617693528bfd76f66af6dfce93d51c01bb21ae7a0d42cc9e18bb21ef7a0e22a07d7ae286bdee3608b5abe2942170deb05a107f3208a2b54686bf2e6ba58de14b06b31a0624d3b7fe6d52c2d8ae646ba07588bb7fb855aa1835dc37ce9aa74b1ba373f77a811552c7a8e1ffd20b7c73311ec88c84f36e9429592cdd1b380f8b8563d374fcc3a5393097e60ff76074f720d8f2bf05f3bdd82d7df535bb79f52b66d4b702b865d2c6f4774cd4708da6b53fe8263d81c6bcba031feeeb71a94ddcd602d3d56131588bb222818b9d2c6b32b69885593527bea5994b03e353e682a91739b38a1d3be01837332700d3e49b094d92169f1bee2a694b0531a3b63aeae35830295b429d6530795cf6c4cf85f963d69dee4e7e93e8a58219fb59786cce173765daf51ce458b49962dcb0d7dd42a87138398b9dda50a76331ab0eb66fc86b1226c7cb411c7f034953ec98a1c89462e644db31201bdaf42b076146e14c26766c50a42f31b3a1ed18900d5d4a149f7ce053a37887dc84158521b9092c0a03dd7459d01376e0d32f21918aeec4717f16ad321d89ddbad5661f31af5ea17bc0357c88375cfb7830c8e63c09b48eba5428fdc90c7bb6e8c7ff9fe47472c22bbc2e8f871beea6df20e463dffe29b29fb868d5fe0a35b43f64a3eedc6d349f4d45f1ece9a79e50eb8c2a6a7a7fde07edcc275af1694bdaac2b5e4f8450670686738acdc5e2d58c325959a6dccc82962eaca1e272b604c2016470f139cb4c32179f60ff756fe926f4009a6c01ae8788d950eb2f84c63afa1f6ce7c372427439612c5d115d50b1853fa29c78df4e899856c6ab6722e6960904dcf7790d90652610f810e74140ae9950260cca3b7318e737601617db7b0828778bcd1d84a4c5fddf3f64fe0f5cd9cc3081046972e31e4cceb449595c4c8926ff8aad39e1401cd8c33ccf5ba6a0bb8750fb7c553e189ffebd290bcc1f7b091fea664ffc6a0f3b71364b8d57a3c365ab0902b9cc5a13047299bdc62764368f4d08b85c221bbff72661fcc2b1778440ca183be3adc8136336d96dc78086da86393d023242d8fffdba98b27f810de77bb17c82ad4ef062f1069bed1c5086849c313efd033069cc413cabd2665cb163be31b98a59040010a16fb7041ceefa88c9d8e277ff20246ef10a9c4be1e2d33e1fe43e4548f7e21db490f0c5277c4f6e45384d739e65c98a943b03f981ce5728a3c4fb783dfb9c1468aada9a8622b3ca495df27117e5641b9115455824c81095d34d7c89239ce3d9f9aa4abc7281b2155acb83a644af55d8d9440b2c0d5c394fc99f2404543de2b4d04f28ba48e22c4f119153e7dca6245e912d8ab8710bad409dab48ac518cac052ad65ce22d8e0b9d098cd31a2794f2ea74d1821666d9340ba70b464c0cd2c304887e8523af3b1636f52cfbdab27184888d67e5a488ab082246e0ec2898aaca76eb2247cad05d679c23c8511bbcd49e90644a31ea42b9580e32a5a388524327474457184484745f309719aafdceb88324dd8251a0fd908e204a0db95fd915a09626273e1ea15a72e2eead26777648dda4c73b82503581395f814fd2338c6cc39358267685a308531955c9e2af0a82088fe633db2ef1574ec223478d1af04d26346518914162aa002a965d75c9d1c98aeabbdcd6b16161a4a48d719c44440a322d0d9515af8ed040597352f5e9d39086498d738ccd17b3753f80bdd7641bf8b1775e8e3bf849375eac0cc1aee0bef9ca9389d1249eb2a32c4dee28b3f204e4f7d8137336990c8d6acc1c6567525bc6c4c3eef531341bb7cbd2c0951fc131b4323e59877332e969a3fef65a76bad8449602a6f408e446f7e5fafd959afdf79ea7919d913d6737e199d46fee6487c9a5a0debc3bb2efe88c971b675571d8412d980ee9b802a58d1e63644a68c749965877c44acafc0d77c7f0ba803acb887794bb8c3274e930b6fb4d9c157fa1920514a729b6f9eaaf89efe116bfd35470105c2fe61d95467261a7ea4beec154901ae1a8b27310da671af1994203b9c9d0e43a883d2edadb63c6e9dced318f195dfdec498f1985f0c443d8f80b01c0b297cfd41dc521802ee2d919ed043275c0fbb7c9656de2bd5c0fd1db871d9d288187e15b4d2e6c93f8593d446c646feb3dfff1df46c58a1fea9584abfe9e7073b45f7ec776d685a134172e5579f599dfb3f9fabe0849aee258caaa4ce2ad04b9bab2912157e520e4a2ca0c99bbff95e073b51016a6811957eb454878da1a08475d693116ee65963c18ae1a1c0df72acd84ae531e12aaae0a42d3bdf737a1605ef84b38983a08495d5d64383420a9b60712fcaa18025d3def3481edde004ba0bb2a087c536b4651bf1b95e0d7e510f0b2ca0cb94d302f03efaa20f84dad1905b72592b070b510a207f60ec6848bd9be4b98983a084f5b6d8145f4e0645c620b1023dfc846d232c5d8da1a58ce32977131a659312ea6857a5c6d2333de2a83828cad2e8770945516aaab8db107745757072aafa6da8c450ce99671492d208c4223192f63d441c356bf909831ed64fb063da3e09c37ce06533c6d89e49f285e5d313db972d181e4876333542822111aad3172113e0860086fcb748306cc70356aae62f0b0a1003a60d4c6383b8e78c9e2969433a59a818b0e41d9b52b1c3c6045981730669b80b0fea44fc26d211c0918b42e6049b8a3e13d9392dcae503358d6552a7b55058307c786cd00235346d570c471de50495d5d32c18080200f605ca65010775227114d2828c1606c026adf714c0ef486de3066d5d9831f3534fab02bf1d30f19ba941826d2a30c537e990c8cd3f07c79b0ef04ec8fca9e5cf9e0a18acf6881816a5fda0e1ea6b4352bfb31a51e87a8514e8687a15e54d39843e59e286ac7ab7ecc3884f8494559da666bc7afbf7fd0dddeb01321d64d2a07d27b2fd05dd4bd09f3649684a389dad3ccbc8b7b0b53c769c51b9d7ee44eb6b2753c35bdb5f1c4d5f0c3951e7b180cb07747632495a5789b00b1d6e619831f33051ff7316a8ea9f33e0536badbe5f63d8c069f748ab41ac0ea5ed8971e08320d4d22bbf63ab2ad3b5d54e7a37501fd9927297ac41f93358eb2b2f474f1791717f919ab5f9738238f1d88530a33c62beefab36d73153f24cd4dac4051d34448d1f711e7688d72749ee6e401ad725abdc25946e2c7f9ec7714ed6893f79b7bbcbe8a6f76f97697d321e3cd7df4c24e46719babc37fba90683ebdd916bf321f43a0649222a5e54dfc6e47a2754bf70720c1a00244714d5c27052d789917c9411f5f5a489fa818d901aaa7afbdddbec31bba14739cddc44bf40df7a1ed4b867fc38f68f542cbbf55d7062a206646f0d37e7a49d0638a36590da3eb4f7f52195e6fbefff5ff01bc257b2722970100, '6.4.4'),
('202406041146239_AutomaticMigration', 'mvc_net_Crm.Migrations.Configuration', 0x1f8b0800000000000400ed3dd96e1b4992ef0bec3f107c1cf488b61bdde831a419c892dd23a86d09a6dcd8793252644a4aa858c5ad2a1ad62cf6cbf6613f697f61b3ee3c22afaacc2a92d3f083c53c2222332223228f88fabffff9dfd3bf7ddf44b36f38cd48129fcd5f9fbc9acf70bc4ad6247e3c9beff2873fff32ffdb5ffffddf4edfaf37df67bf37ed7e2cdad19e7176367fcaf3eddbc5225b3de10dca4e3664952659f2909fac92cd02ad93c59b57affeb278fd7a8129883985359b9d7edec539d9e0f207fd7991c42bbccd7728fa98ac7194d5e5b46659429d7d421b9c6dd10a9fcd37df565f639c7fbd48372755eb932589c94384d2f9ec3c228892b4c4d1c37c86e238c9514e097efb25c3cb3c4de2c7e59616a0e8ee658b69bb071465b81ec8dbaeb9ed985ebd29c6b4e83a36a056bb2c4f368e005fff584fd242ecde6baae7ed24d2697c4fa73b7f29465d4ee5d9fc7cbd2114ae88e9ed459416adb4d37c5276fe61c634f9a1150d2a41c5bf1f6617bb28dfa5f82cc6bb3c45d10fb3dbdd7d4456d7f8e52e79c6f159bc8b2296464a25ade30a68d16d9a6c719abf7cc60f2ce5643d9f2df8ce0bb177db57ec580df02ace7f7c339f7da264a0fb08b7c2c04cc6324f52fc2b8e718a72bcbe45798e53cacbab352ea753224140785d808ec98a9cb748a910d285359f7d44df7fc3f163fe44971c5d491fc877bc6e0a6a3abed09e74decfe679bac326544bf290e2d048fe81f367a243e201c7e52edd6d1a1cef9224c2280698c402395d74d2ad97f9cd7da1237aca7cd17932992f905f5df690f9a6e358325f223c5febc4e4471fb2d8434e28904fe81b792cc729ae9f3c79fe3b4af133ceb3f9ec338eca46d913d956c6e48469f0b596a30f69b2f99c447cefaaf2eb1d4a1f714ee94b542d96c92e5df59564065c5f7966404c25d50c097df4b9d07d2c09a7ac254f0dba4b0ae28e3a3266d1938c51291e5a9af5103e9017d482b8c42bb241d17c769bd2bf6a5fee97f96cb942054077e877c936429bbb5d5e487a201c0c03efe8720ead32dee1e8118f81e84bbab3f033f4302ea8940d85714b177212e368289c52610d05d24f610b406e62f4b2a4cb7897e998f8532f262a6d43adee871b8546e5ab8d4263366c492ba424c266e2da76307975b596c0a68d2b898d101a69ec1ac24436f55a2adb46ae64166bd64862d50826afa8d392563680c8b2b6fa2d17fb59fcbafb54d6bed168ae66de4e13fab3ef053eed86cdd246f450f8cbe4054d84193f915483f98d0fbb5820fa8848a4dda7fa4274f34f1c2d93747781bfa1ad06e32fbe10be43cfe4050773967c6f786861a6dff1302d400302d4cbfb1ea8d1b0ad0f03b1f7de878131d9e6a7a0a1d7b6a7e9f8c786e7d0363cc7b631f0ac93b4de6c1f6d24b9633a95e5c5a1ed9c545ebf7684c22d24c5a96806a9ce5e6e6de5aeaa88946b2502812683f47a37adfd747ad37f2a7dceae2957956ebf1efd69f506a7d6d5edb79356603279b75e91fd9aa419d6799a6fbca0f372aa7189b728cda9c43beb63e5ba6f41828bbfad6df7cbdcea07aaa5e50fb571554e661fb4b73a1535bf41ebf6d258cc1cf753592d80a974162778ae4acb416afd69ad166978b5e5d9b961569a9f15298ab86ed5f692efca77e827da45dfa9a4baf1b25d05dace3bf727cb053e1f074de64b16664caf7f76dfb945240bbbf72a957258145e0c75c131b363e1e508eb1d4a9f93e03aee9a0aee63327c43f991528bfc792f0d59a0aa6c2acb03754e4bf23592cb2254bb7a2be518418aca1a991ca658a285adf3ef36396fee445ba2d9fff532251d43fb9993a6ff5426a5c1dfe7090edb77b4976735cef0e6c5b397542fa221cb5e94658556e825c7b50ee827c465e7a924b844de477cdb8e63c96e89f0e0dc7bb5e05a5807516421cbd14b5edfa1f81945fd1f3d36fda792da127f1f5fbeed3896d49608f5ef1ebd886d89e7ef3843db4fc928b8aeee513c12aa72584bf444ee479c46c383307fd802df0f5702b822cf11daa0e0db9390cfb41f10d525e89acec3a6afde62404ca5ba3e7424f4516042f7b1d4d8b13ec9dc973bec7724259bb0271dd7eb6f37298ac93042c35e847b3b8dd98ba7add55a1d0a65cfdeb6322a547edb2a554a2eacdcc2f59ebd9ad548415e5bfb95d1949c830db7904e6214cdbc5db4b31321be1f15ebb4b338fcfd2833a3fdcc6a0b605aa3dadf9e8eba23b0b06d5ebccb6a684b9c12bd9fee0f15499116d5cf7b63b1a9643e924b44529c050f492b7169e7c5cf850eea9c87406cbec3594436efa9a007f7cb4a4ce7110a8ec98bcb417dabb08e51a16ea2ea2962301cd5221ed1cbbf59e3cd285efe3ebd8df4e2595ea36cb05ff981c428cecab38e2373513bd74d7250852ac9b112eb7d065e75b08177aa52a586b4be2f54798fd8a7f3aca615f4b1ad09ee4494c282af7d1954626b906cbe918e72a1a52bf1c51a35ef52da5610b175a586c8a685d7c7ca1df8ae19445ef7784e495fdb64d80645e46ccf6d0a0f66b2cd0aaf789d772c2e7adbdfb685413bc27506836d94ad52872efc9d06836c9c4b1406e138b7280cc2c0b71bac541ec31d476b0efabe87c9a63c8669dc52f7a73036eeaccf6730d91877b2059ac0f2ef6b5712e851b3e2c54ea6742ec43ae0d54ee6ddb140d1c0b85101ccb48e454b467fe782037158e1a4639c82053de919ef7898677581f2a274aec39ec500681923feaf7412e4f100c6cf21668ad7e41aa579788fb445b5bcbe1b0dd7c5ef17a3e1babbba0d8deb023f2fa9b21d815b0da6eabcb650d364b09e1ecd5b9fe46c527b0cc82b40f030106e229fb328da0539671370e94edbf44d8dc3187af2a63fdc129081475c8a3646cafd78a5bf9275ff6c4e65e7a93cd012791fbfb3ed3896b769a17ffce41cf2e3d6eeddb32bfbfc0d28a5ffe74516e29e091c1a009365706808e81326c1751e4bb85ba4635caeb6c89a2515fe45454879bd4b0b8dbe2ad87087b2e7be522b80994a760532faa86600c4a84fa5065fb8af4844324f6eeb3289afb2086f3c812bf3c391e89168d78c1727fe484e2daed10bc9cf5728fe92615d62427fc88a0d44845ec6c11872b7124e899e6759b222e59297e305ea47183c2defe3f5cc980eb71abe906c954e04d595644bb523a5e46cfe27699c3ad8ed2bdf0e76fd468487fa7a2eead69bf8124738c7b3f355f5e58e0b94add05a9e663a476bbe84aa639c161a0f4517742f42153c89735977937845b62832d12e7404d5bee2bb0005752d1eb1e6126f715c28661363ac0990ad4d41408b479836d32c9d2e183133481f94144e2924da0c718c0c7209261d84509b0fb383df9e03ec9d246a0660230b70825f3759d4f068180923482394c347252cda843e9dac3029a6024a8b9e2c4084bbb314d3f2e825889ac9b111024d562b2761d44c8607324610c8ee388b4b05a2623edc1c124b15ff0349a582304030dd74772fe1d4cf928d60b0f74a03c4533f2bc309194140859c1e2afeab127c747ceff2cb8c2290aa44431d4155a45710018467c386dfea2c364e82078fde8580c9048ecdc5a1622e9898a3e36c9d026614390333488d2264c024d830589165c649bc80415ba39e4cb0808c5b2aa6ead26fe9791b48ca74c99e4735adea99b1110038eda393e8a967621801636c8581affdd81c97e836c2c30f630e721baca67fac5db09a3f7bbf0906bfe864232af2ddbb5749946eecc7dece0c96457104236e35747c3a888d86f4112f1b91e133327895462e97c398567fb014b2948f6495553cd97b9b2ca75051c986269f4a271c5c5e2c7bb9536762d9ffcb1125ed36bcf77139a2648c350193499f181dad920f65a874271d4ce2187bb9538558efbfd429281f4be6140c39248933ed403451f0dea4ee10f71e4aea47da7928f9b2f7fb0e454a03b398c0f90d2ca430d0698c296d594f7f60a03842b3642313aa845d3da5129a92a1648c2b9cc26b7a0b29503daaf7a62855cff0590c6210c0fe2a4ec568aca44497b0a1afc4c2ecf342ce283774420caf4a9cd401bdec2d5de62aa5ca30e08338be51513fe2d18d8a2f07716c23a7cf316b3329978e373d29e6e0314bf6f412a8a4de86ff709a879e8a50e0cb30fca3ca9e51f7e932257993bec3d4806afa47d4816afe1c8416943208db9cf4a90eaf3d1c221ed6e1b58af2910eaf553cd9fbc36b55f8b25253996299c5dd04938dc5411f1a22a10fe290473f86b18e7af4fcdaff031f439cbaad04d9ecaffdc9eb51ecb5edc634f28edb8ead87b2ef56662fb01534ad27ea4f9e0fd42b358c624cdfd4c0b73df450abd840da27a73d70da1803fa1b7f8752ab7dc9701d4a9dd5118ba27415f096386f2eb1d61b527c2baf8b416cae0b8b0a403885eec51d18d8bdba6d3474675e1b4040b8c71f0650b54985c0b4ce89891afe23ae3239dcab4c03b02e2c4906d42d56039036ac0582c2c42b19c0d4df439420549b0843e7e61d3904a00b053000291f0c4310ea17de86eecda7112108dd67170d40f8f4db121c6eb366054a411073f66002c3db4d1098e8a018b995a9e86acfcdaca86ab5a49a2ac6a81940969968204075561ed35a6ab261808ba9cb85620023245d808049892a04908c9606b558931c9f6927eb32e88d0867f8d5e1dbed9044dd2999229b806d065aa3c8451f801fb0cd644061c2d07c18c389f941e8028ad959e175b86e5a7421c40cc4ceb00c9e1b286815981a636c2b370e5d742b330cd6946866451794ca4063e81f3c2b8ac84960626c622cb9d118a22c6d0664030f9820ad1cf69824f18bdcf2e4e8e2fbb8412822fc18e21993af990c45601e03a7a675f0e0b9af3acb2357069a71e442a1660cad8d87a2193014211660b4407813306853101447b9260cca3400139c11641f0ab73158580b83a289cb196a65c7b12660f487615ee0a30de540a4838da133231d6104b229520c82615ee4ab1ee510b8cb9ea1f3c15def04d025c08745e589303c9d57de4d295d537ea7a5990af573f910aea9f4092b792ab4efb8f9c339c54b6e691a2280782da471a640a3480d4f8b15c46b94a8f3448ca340555fe6d2cd88fac1ab6228e093d7217303be54b55c7cc326493c8ad0ce93ee86483532c5edd0a0d952dc01b130a553180fdebaf8350ec85fd7bdf6133c6dc57b3fce67cfccf3a27ce117c80c039f64d3090df8f04cc158f1e9d91021111f9b594ceba0c9d08985e9299462083ad1709e8fb1c4437a6c63704e0c5e9af249ce50d724b497a6cc5e0f8887cd4b11ed2da2ce4e4b27bf3a7131bc0e0964b34d19f3cd53e6609a2c9f2ff89ac2698c953a79bf792e6d7494e9b2dcd7ecf9d65a4d62d6f6f2b5ad3b5d2c574f7883ea82d3056db2c2db7c87a22a657553f1116db7247eccba9e75c96cb945abe2d6f2cfcbf9ecfb268ab3b3f9539e6fdf2e1659093a3bd990559a64c9437eb24a360bb44e166f5ebdfacbe2f5ebc5a682b158711ea87855dc62ca93143d62a1b6b8435ee30f24cdf24b94a37b54a4a5bd586f8066d555b3e26aa5c1c2dd26cb3c6bae599ae6c5df55175dbeefea0e5abe95afa17ca0e3da14b7fb65466c76bb04f7a33d8b5ccc2815935917cd8bfbfc8b24da6d62a1509440359ceb22cd6f4c56e45c80c555d8c35b9287e2568b855417d9c3f807ce9f090fa32eb2875127356661d445328cd385c01ce98984240cc27a1445cb4ef0aa0db237c18336ff368207f7530a5e13c0cc099e2aaad900a7fcf6a204a82c3d2a5673e76cbe18cebe347167bbb6b77275779d44dd2354d9b3affe2e0a0bab2e7210a675613b7955285ff1eb207c202f48005117398c24a1fecda6ceafcf8d87ad70d0a5dd945619f515f35d55dac36572f4b31099627b58cd13741690ea59ba1a4af3509885a27a3cac86c23e736321e99ebf6964aa499520e92737382eea490583fb1a000b89abd81b75d7ee9d7ca93ac58ed142cd297b8615c5a287e85135656e5096c90b0200d5c58eb0f01349015855b11bac8f884432a8aad40dd2cd3f71b44cd2dd05fe567cf753042954bbc16ebeba2c026dca8fcbcb30dcacf77433d817a43dfc0c6d77a5e92b7a492e4653f8877331dcb9385ec37d002b55f746aedf2a551d6a59ac5075d771f8d5f412ed255bee0e0db09b42953bcc5f9334c3110cb4a91bd731e4be21c141d27d5c6232b9671e74fa12fc2ea2c05df2357d7d4fb8119e28fd5cc551293fd5a3c77efc87eed72c580f770b6b2c8b1e229b9b32b75301f928c0c9a1894806b8244cb10335854f060063cbc75589c58c428a9a2d77382b41e97322f0ac2973386567be6bc11db26bbe77a186d67ec98005a5fcbcc164ebbc7b91ed6badb7a15beeeb5dddd5c433f1ac5bf791143334e99a85293f2a2d5fbf4df7c5fa2ae6ce9def8a7edaa525725cf9d112031c91d76de15131ba8b73f4c5eb363ad29dddeaae6a051fcbcab42d74311471c15c020072bccf2afb94af253e2500b4b6c611e2d53d8a41804d451f0a97e889dc4363e66afb4006ee27843a47a8d0512057e1caebfa2be710c3dbaaa35ae98677c4fd163b1bc2ecbedeb5bd95c7715d2771e10b55c77557b71f87a1ef484a36c08e812d77f0abd6df6e52bae916bcaab6d4617680a355d743555ffb97e17b4d5fb7975d62647999b8413ab03b4ce601b22f55d725597057749abee159e7530955f8973825a233c2d7384324295240ac6bc65594bfe3f4915c2292e24c504e7c8d234471886da1cb918d7c58e3781785b3886cdeaf712c4c1253ee0aed3c4220b4aa7c5c154ccd07600dba527b48bfe21847d50d1d0f8cab709575a5a301543b28e835de00ab9c293eec7b415f26b1c93acc1fe3c09988359ce493c8f177c3dafc721a0e1e988915e302bc195a7db4848db935411893ad4c47e98041aceb0515502462652fb8923de6ab7ac1848e3180ea5eb0a1d30ca0ba176ce8f801a8ee2715e05104d8e0a80e24da40477f170c6030a7d5fd82a267582b52f49074425be806079250b6fc8ff73c064bc6c480f9b5645dd2babe964c0341af5fda8eb035e3aac7dd6079d8c67838f1f1ba35e6a7b4e87e51c6876ae6bd6b34080f632b8ce8b8b687bd2508e1ad79d980a6784dae519a8b9e0e57d103def2fa4e01b0ace901f1e2f70b05c4b2a607c4bbab5b05c4b2c641e2f0f3926eb3a54964cbdda155fbe1425b11182cd7c0617b0a3a717d3cb703db06d689567d99cc2a3dabbba154f4539eec14cd45a5d1164ec1761f4675ec4b90a9de5f77c9797d895d97d2d75df4347d9576b0e9223e56e12a1cec6ad34df66584aa1e301b69164fc2c10647256852fa665fe226267d76173a2304a58ee03b8a3a10a87674a7a5d7384da193568d48065969bec661bb91c457598437104cb1ce31468d448f445c1a5cc5e16e69aed10bc9cf5728fe9261f13a85af728459b832117a510216eac33b4f7bafa4a4d4306293167b5dd2fe6e53c3d46959b87c31e5b88bec2fe578b33a458c98a7a56a329fd1c9f956f84867f38f2fcbff8c4e8afa93f2cf8b88d001772d3e22aae97096df25cf383e9bff74f2d37c761e119455597dea0c346fc58f8958a5a479fd63919206af370bb1bb7b629b024a96adb9e82946abb7cf66a4ec2ea7d7f845e46f233bdda75b14295d4e1762ef535103361dab2f0590626e4b1350dc3ca628c7eb5b94e738a53376557cfc85d23b9f7d2a92bedc57a9c4a24cfe3a81b812d91c31159e6f285d3d959fb044df7fc3f163fe74367ffd8a855c7ee0c500b84e19e313649d41a60229c3730557afe10adc7d924486c96397ae5e52e4742c969202e760b19094a6634049e9f2baa879faa3334f833141991cc58e15da5c28668608dd03b2a5de1f5618d614664e36b8d0c178451d8f429bbe7267f5bafbcc5749b463fffa09604d13256483228ea4d7bfd089a0a69656bf711f311b2d1d0887f4dcd3a7cc336e984fb0cd0b43866fd277baaee235fe7e36ffafb2cbdbd9d57f7cad7afd30bb49a9c57e3b7b35fb6fe7c96a8e80dd1057bd0621664f8cdd90773d0711d03e3d71c35e771b84da5571ca10386f582d883f1904d15a23c35f97b5d2c6f02583590d0392e95bff3629616c57b235d03ac4dd3fdc2a558c1aee1b67cdd3a58dd1b97bbdc00aa963d4f07fe905beb9180f6446c27937ca942c96ee0d9c87c5c2b1693afee1d21c984bf3877b30ba7b106cf9df82f95eec96befa9addbcfa1533ea5b01dc326963fa3b266ab846d3da1f74939e40635edd810ff7f5b8d4266e6b81e9eab018ac455991c0c54e9635195bccc2ac9a13dfd2cca581f12973c1d48b9c59c58e1d708c9b99138069f2cd8426498bcf0d7795b4a58298515b1df5712c98942da1ce32983c2e7be2e7c2fcb1d09dee9b8826d34b0534f6b3f2d8a42f6edab4eb39c8b36853c5b861afbb85d0e37076163bbda1cec762d61d6cdf90f7244c92978338ff06b2a6d83143912ac5cc89b6634036b4f9570ec28ec2a94cecd8a0c85f626643db31201bba9c283ef9c0e746f10eb9892b0a437213591406bae9b6a027ecc0c75f422615af763dd8a255e623b15bb7daf423e6d52b740fb8860ff18a6b1f4f06d9a42781d651970ba53f99610f17fd6c0026399e9cf00eaf4be4e186bbe93708f9d8d77f8af4272e5ab5bf420ded0fd9a83b771bcda75351bc7bfaa927d43aa58a9ade9ff7413bf399567cda9236ed8ad72321d49981e19c6293b17835a34c5a962937b3a0a50b6ba8b8a42d817000295c7cce3293cdc527d87fdd6bba093d80265d80eb216236d4fa0bb1b18efe07dbf9b09c105d52184b574417556ce18f2827deb75322e695f1ea9988c9650201f77d5e03a49909043ec47910906c2694098312cf1cc6f90d98c6c5f61e024ade627307216971fff70f99ff035736354c20419adcb80793336d56161753a249c0626b4e381007f632cff39629e8ee21d43e5f9510c6a77f6f4a03f3c75ec287bad913bfdac34e9c4d53e3d5e870e96a82402ed3d604815ca6aff109994d6413022e97c9c6efbd4918bf70ec1d219033c6ce782b12c5984d76db31a0a1b6614e8f888c10f67fbf2ea6ec9f60c3095f2cdf60ab33bc583cc2663b07942121698c4fff00cc1a7310cfaab42957ec986fccae6216010044e8db2d0187bb3e6252b6f8dd3f08995bbc02e772b8f8b4cf07b94f11f2bd78072d647cf109df935b114ed39c6759b222e5ce407ea0f3154a29f13e5ecf3e27059aaab6a6a148ad7252977cdc4539d94664451116193244e574135fe208e77876beaa32af5ca06c85d6f2a029d16b157636d3024b0357ce53f2270901558f382df4138a2e9238cb5344e4dc39b7298957648b226edc422b50e72a326b14236b818a3597788be3426702e3b4c609e5bc3a5db4a0855936cdc2e982111383f43011a25fe1d0eb8e854d3dcbbeb66c1c2162035a3929e22a828811383b0aa6aad2ddbac8913276d719e70872d4462fb5272499528cba582e96834ce928a2d4d0c911d115061121dd27cc65866a3f34ee2049b76018683fa423885243ee577605a8a5c9898f47a8969cb87bab499e1d5237e9f18e20544d60ce57e09bf40c23dbf02496895de128c2548655b2f8ab8220c2a3f9ceb64bfc9593f0c861a3067c93094d19466490982a808a65575d7274b2a2fa30b7756c58182969631c271191824c4b4365c5ab233450d69c547dfb34a46152e31c63f3c56cdd0f60ef35d9067eec9d97e30e7ed28d172b43b02bb86fbef264623489a7ec284b933bcaac3c01093ef6c49c4d2643a31a3347d999d49631f1b07b7d0ccdc6edb23470e547700cad8c4fd6e19c4c7adaa8bfbd969d2e3691a580293d02b9d17dba7e7fa566ffbde769646764cfd94d7826f59b3bd9617229a837ef8eec3b3ae3e5c659551c76500ba6433aae4069a3c7189912da719225d61db192327fc4dd31bc2ea0ce32e21de52ea30c5d3a8ced7e1367c55fa86401c5698a6dbefa73e27bb8c5ef34151c04d78b7947a5915cd8a9fa947b3015a44638aaec1c84f699467ca6d0406e3234b90e628f8bf6f698713a777bcc6346573f7bd26346213cf11036fe4200b0ece53375477108a08b7876463b814c1df0fe6d72599b782fd743f4f66147274ae061f856930bdb247e560f111bd9db7acf7ffdb751b1e2977a25e1aa3f28dc1ced971fb29d756128cd854b555e7de7f76cbebe2f4292ab3896b22a93782b41aeae6c64c8553908b9a83243e6ee7f25f85c2d84856960c6d57a11129eb606c251575a8c857b99250f86ab0647c3bd4a33a1eb948784aaab82d074effd4d289817fe120ea60e42525717190e0d48aaed8104bf2a864057cf3b4d60bb37c012e8ae0a02dfd49a51d4ef4625f8753904bcac32436e13cccbc0bb2a087e536b46c16d89242c5c2d84e881bd8331e162b6ef1226a60ec2d3565b60113d381997d802c4c837b291b44c31b6b60696b3cc655c8c69568c8b69a11e57dbc88cb7caa02063abcb211c659585ea6a63ec01ddd5d581caaba936631143ba655c520b08a3d048c6cb1875d0b0d52f24664c3bd9be41cf2838e78db3c1144f5b22f9278a57574c4fae5c7420f9e1d80c158a4884466b8c5c840f0218c2db32dda001335c8d9aab183c6c28800e18b531ce8e235eb2b825e54ca966e0a2435076ed0a070f5811e6058cd92620ac3fe993705b08470206ad0b5812ee6878cfa424b72bd40c967595ca5e55c1e0c1b16133c0c89451351c719c37545257974c302020c80318972914c49dd44944130a4a30189b80da771c9303bda1378c5975f6e0470d8d3eec4afcf443862e258689f428c3945f2603e3343c5f1eec3b01fba3b227573e78a8e2335a60a0da97b68387296dcdca7e4ca9c7216a9493e161a817d534e650b9278adaf1aa1f330e217e525196b6d9daf1ebef1f74b737ec44887593ca81f4de0b7417756fc23c9925e168a2f63433efe2dec2d4715af146a71fb993ad6c1d4f4d6f6d3c7135fc70a5c71e0603ecddd118496529de2640acb579c6e0c74cc1c77d8c9a63eabc4f818dee76b97d0fa3c1279d22ad06b0ba17f6a507824c4393c8aebd8e6ceb4e17d5f9685d407fe6498a1ef1c7648da3ac2c3d5d7cdec5457ec6ead725cec86307e294c28cf18abbfe6cdb5cc50f4973132b50d4341152f47dc4395aa31c9da7397940ab9c56af709691f8713efb1d453bdae4fde61eafafe29b5dbedde574c878731fbdb09351dce6eaf09f2e249a4f6fb6c5afccc7102899a448697913bfdb9168ddd2fd014830a800515c13d749410b5ee64572d0c79716d2272a467680eae96b6fb7eff0862ec51c6737f1127dc37d68fb92e1dff0235abdd0f26fd5b5810a889911fcb49f5e12f498a24d56c3e8fad39f5486d79bef7ffd7f4dce774e24970100, '6.4.4');
INSERT INTO `__migrationhistory` (`MigrationId`, `ContextKey`, `Model`, `ProductVersion`) VALUES
('202406041243053_AutomaticMigration', 'mvc_net_Crm.Migrations.Configuration', 0x1f8b0800000000000400ed3dcb6e1c3992f705f61f0a751cf4a86c37bad16348339025bb4750db125c7263e764505594945056666d669661cd62bf6c0ffb49fb0b4be6938fe02b93ccacaa69f860151f1124231811242322ffef7ffef7f46fdf37f1ec1bcef2284dcee6af4f5ecd673859a5eb28793c9bef8a873fff32ffdb5ffffddf4edfaf37df67bf37ed7ea4ed48cf243f9b3f15c5f6ed6291af9ef006e5279b6895a579fa509cacd2cd02add3c59b57affeb278fd7a8109883981359b9d7ede2545b4c1e50ff2f3224d56785bec50fc315de338afcb49cdb2843afb843638dfa2153e9b6fbeadbe26b8f87a916d4eaad627cb28891e6294cd67e77184c89096387e98cf5092a4052ac880df7ec9f1b2c8d2e471b9250528be7bd962d2ee01c539ae27f2b66b6e3ba7576fe89c165dc706d46a9717e9c611e0eb1feb455a88dd7b2df5bc5d44b28cefc972172f74d6e5529ecdcfd79b88c01531bdbd8833da4abbcc2765e71f664c931f5ad6201c44fffd30bbd8c5c52ec36709de15198a7f98ddeeeee368758d5feed2679c9c25bb3866c7484649eab80252749ba55b9c152f9ff1033bf2683d9f2df8ce0bb177db57ec584df02a297e7c339f7d22c340f7316e9981598c659166f8579ce00c15787d8b8a02678496576b5c2ea7340401e135059d44abe8bc454a98906cacf9ec23fafe1b4e1e8b27b2e5c84efa107dc7eba6a01ec717d293acfbd9bcc876d8846a193d643834927fe0e239d221f180e37297ed360d8e77691a6394004462819c2e3aeed6f3fce69eca889e3c4f3b4fc6f314f9d5650f9e6f3a8ec5f325c2f3b58e4d7ef4c18b3df88400f984be458fe53cc5fd53a4cf7f47197ec6453e9f7dc671d9287f8ab6953239611a7cadf9e843966e3ea731dfbbaafc7a87b2475c90f1a5aa16cb7497adfa723203ae2f3f3320a6e26a66087de4b9d07d2c0e27a48d9e1a749704c41d3164ccac2729a3923db463d643f810bda016c4255e451b14cf67b719f9abb6e57e99cf962b4401ba43bf4bb731dadced0acae981703004bc23db39b4c87887e3473c06a22fd9cec2ced0c3b8205c3614c62dd9c86982e3a1704a813514483f812d00b949d0cb926ce35dae23e24fbd88a8d40db5b81fae141a91af560a8ddab01d1ae592189b07d7b6838757576b07d8b4711d62c384c631760de14136f5da51b68d5c8749f7ac718855237878b44e3bb4b201342c6baddf52b19fc6afbb4fa5ed1b89e6aae6ed24a13ffd4ef1690f6c963aa287c05fa62f6822ccf829ca3498dff8d08b14d14714c5da73aa2f4437ffc4f132cd7617f81bda6a30fee20be13bf41cbde060c692ef030f29ccf5271ea605a840807af9dc03351a76f46120f63efb3030263bfcd031f43af6341dff38f01cda81e7d80e069e6592d69aed238d24734c27b2bc18b49d91cacbd76ea0700b49702a9a41a2b397595b99abaa41cab5d200812683e47ab7acfd647ad37f2a79ceee2957916ebf1ffd49f506a7d6d4ed779256603259b75e91fd9a6639d6599a6fbca0f372ab7189b7282b08c73bcb63e5be6f41829bbfad6dcfcbdcee07aaa5ed0fb571154e661bb4b7381525bf41eaf69258cc1af713592d80a96416c778ae42cb816bfd49ad166978b1e5d9b861769a9f1d29b2b86ed7f6e2efca76e8c7dab4ef545cdd58d9ae0c6d679dfbe3658acfc74593f9918599d3eb9fdd4f6e7194873d7b9542392c0a2f8a9a52cc6c5878b9c27a87b2e734b88cbb268cfb980e3f507e24a345feac976658a0a86c2acb0b754e4af23592c92254bb5a2be51cc1119535f2709862692c6c9d7fb3c9f97027ea12cdf9af972ae908da4f9d34fda752290dfe3e2e386cdfd13ccf6a9ce1d58b672ba9de4443b6bdc8cb0aa9d08b8f6b19d08f89cbce53717089bc0ffbb61dc7e2dd12e1c199f76ac6b5d00e22cb429aa317bfbe43c9338afb3b3d36fda7e2da127f1f5bbeed3816d79608f57e8f5ed8b6c4f3779ca3eda774145c57f72819095539ad257a8aee475c468343983f6c81df872b065c45cf31daa0e0c793906eda97b8402ffdefd448e7e9eed308f27e776975c7bdb97bf0c2f714cbbb287ed46d67c28feea8ac79e9011142a36bb2a7367d398a0131155f7de886d087bb84ee63f1d8b1baf7ee8b3fc4bb288b36616fcdaed7df6e329444c3061ad6a9c2dbcdde5eb849577b7528943df3936644a8ec272d554ac721b985abcf46b5aab162786ded574652728735b88574aba768e6cd69835d08d11759acd3aee2705f646645fba9d516c0b44ab5bf3e1df57469a1dbbc586cd5d496388bf4673e7fa8a20c6951fdbc371a9b70e6637489a20ce7c1c31b4b5cda75f1f338883ae3211099ef701e479bf784d183db6525a6f31805c7e4c5e420b65558c3888a9bb8726b0d86a3dac4235af9376bbc19c5cadf273f5b2f96e535ca07db951fa2042579796f7664266a67ba4906aa5025195662bdcf20be0e36e0f32c556a86d6d7db99b7887d1acfeab18236b6f5803b1625b06017020695d81a1c36df483772a1a5ebe0e91e359f52da56d060eb4acd209b165e1ddf3bf05d3368789d23a6727c6d9361071491b23d8f293c98c90e2bbce0753eb1b8c86d7fc71606ed084f630cb6518e4a1dbaf0ef630cb2711ee41884e3bcc8310803bf94b15c790cef65ad3ae8eb5b954f790dd398a5ee6e5536e6ac4f97aa7c8cf77d8a2630fffb3a9504729057787fe54ae342ac033cc072ef86058a07c6200b60a6352cda61f4372e3810636d4a3f177b63dc8205bde919ef7a9827354579511ad761ef6200b48c12ff57ba09f27801e3e71233c3ebe81a6545788bb445b5bcbe1b0dd7c5ef17a3e1babbba0d8deb023f2f89b01d815a0da6eabe968ae968b09c1ecd5a9fe46e527b0dc80b40f032106e22dfb328da05b9671370e96edbf44d8dd3187af3a6bfdc129081575c8a36c691fbb14a7f8dd6fd3383959da7b2404be47decceb6e358d6a685fcf193bfca8f59bb776e57f6b9405046fe2f6846eb9ec9401a009365036906d027e486eb3c1673b748c7785c6d91355b2abc4745487ebdcba8445f5132dca1fcb92fd70a60a6e25d61187d443300625457a9c10feeab288e724f66eb324daef2186f3c812b730d52a77aed9ef162c41fc9adc5357a898af3154abee45897e4d21f327a8088d1cb3818439e56c209d1f33c4f5751b9e5e57881da09831fcbfb643d33a656aea62f24ee250b416465b425d2918ce46cfe27699e3ad8ad976f07bbf611e1a1be9e8bb2f526b9c4312ef0ec7c557d05e602e52bb4969799acd19a2f21e2186754e2a1f8829c4588808f924296dd51b28ab628368d5de8088a7dc53726e8e85a3c62cd25dee2840a661361ac07206b1b3a80168fb06ca6553a5d306c66e03e28c1a09249b4d906191ee492953a30a136b76a07bfbd07d83b4ed44cc08617e064d16ebca8a1d1b0218cc08d503e2815b368934375bcc2a42b0bc82dfa61012cdcdda598b6472f46d42c8e0d136832a43931a366313c0c630486ecaeb3b8b4322ae2c3cd21b654d13f10572a060630a69beceec59cfa55b2610cf65d69007bea5765f840466050213f8c8afeaa64311dddbb5c45a330a42a695537a02ad22b0803c2ab61436f75462427c68367ef3280c9188ecdeba2222e98e4a5a36c9d4e68143e03b3918dc264c022d8105891b1c889bd80495ba39e8cb180ec6d2aa2ea52b9e9691b88cb7489c34755adea95b161003885a813eba95762d800c6380a035f8eb2b92ed11d84875fc61ce431583dfeb14ec16afaecfd2118fc3a980dabc86fef5e39517ab11ffb38339817c5198c78d4d0d1e9200e1ad207e16c5886cfc8e0951bb95c0e636afdc15cc88e7c24adaca2c9deeb6439858a8a3734f9543ae6e0f262d9f39d3a13cbfe3f8e28c76e437b1f8f234ac2580f6032ee13a3a355fca10c95eeb883491c63cf77aa10ebfde73ac5c8c7e23905410e89e34c27104d14bc37ae3bc4b38772f4239d3c9474d9fb738722a581994de0fc06165c18e836c694b6aca73d30901da155b2e10955c2ae9e5c092dc9d0618ccb9c8237bd0517a89ceabd094a951b3e8b410c02d85fc1a9988d1597e81236f4e558987c5e8633ca0b9d10c3ab622775402ffb4a97bb72a9320cf820ae6f54a31ff1ea46459783b8b691d3e798a599944bc79b9c1473f098397b7a0e548ede86fe709a879e8250a0cb30fca3f29e51f6e9322579e3bec39480eaf18f2803d5f4390829286510b6b9e9535d5e7bb8443caccb6bd5c847babc56d164ef2faf55e1cb4a49658a65164f134c361607796888843e884b1efd1cc6baead1d36bff2f7c0c71eab61c6473bef6c7af4771d6b69bd3c8276e3bb21ecab95b99bdc096d1b496a83f7e3e50abd4308b316d5303ddf6d042ad6203499f82f4c059a30cc86ffc1d4aadf625c77528755e472c8adc45e12d71d13c62ad3711fdee621783d83c17d20a803985eef40d0cec5ebd361aba33de061010cef9c300aa56a91098d638318d86ff20b03c1cce2bd300ac0b4b9201759bd500a40d6b81a030f14a0630f5b7352508d521c2d0b9f123870074a1000620a5c33004a1f6f036746f3eb30941e83ee1695ccc02bdc00b597e4fcfd09dcfde2d01e1ce7a56a014f361ae2e4c6078b50b0213ed1b23b173d5b8da6b37ab51b542563d2a46271a4096896c204075521fd3566c9269807bb14ba5620023e46c808049792e04908c90078560935b9f69278b42c8c584b31bd4d1dfed9444d12b69329b786f065aa3074413829fb0cd624051c6d07a18a391f949e8e291d955e155806e597411c80cc44e2f0d5e1b28e615581a63682c370f5d702c330d561369564517d3ca4063c63f7855148197c0c2d8846872b3310469da4cc8061eb0405a3eecb148e2c7e1e5c5d1850772935004083283672c06cd6228e2fa1838f558074f9efbc0b83c73659c1a375c28528d196b63e068260c059805982d101d054cda1443c58d5c1345659a8009ce08bc0f45eb1834ac8542d184f50cd5b2e368133078c4b02ef0cd887222d2bdc8d095916e4002e9142984c1b02ef24b91720adc5bd1d0f5e05e8702c812e0bba4f242183cef954f5b4ad3943f69699642ed6d1fc23495be80252f85d60d9cbfdb5338824bcb100383d7421a67093482d4e099ac18bc46883a2fc4380254f5612fdd8aa8fd651553013d6687ac0de8e86ab9f9862d927815a15d27dd03936a668ac7a541aba5784262614ab7301eac75f1631e90bdae7316142c6d85bb2067b3e7e675513a080652c3c017dd744c03faad29082b7aae0d6112d157cd6259072d868e2d4c9e548a29e858c3793dc6620fc957c7609c18ac34a547cf50d324b495a64c7e0fb0878da389f61152a7a7a59b5f1dbb189c4b02e96c53c27df39239a8264bef075f4b388db252e7fe37afa58d8c32bdb5fb5a3ddf52abc9ebdabeddb675a78be5ea096f505d70ba204d56785bec505c65bc6e2a3ea2ed364a1ef3ae675d325b6ed18a3e7afe79399f7ddfc4497e367f2a8aeddbc5222f41e7279b6895a579fa509cacd2cd02add3c59b57affeb278fd7ab1a9602c569c052abe34b7988a34438f58a8a54fd06bfc21caf2e21215e81ed1acb617eb0dd0ac7aa9563cad3458b8c7689966cd334bd39cfe5d75d1a50baf9eb0e547fd1aca0732af0d750e28136ab3c725b81fe9495339a34ccc854d9b5377808b34de6d12a150e440359c6b9a25388956d1b9008babb087b78c1ee8ab160ba92eb287f10f5c3c473c8cbac81e469d1399855117c9304e170271240f0b891984fd28b2961de35507646f8c071dfe6d180feea764bc26fe99633c5550b4014ef9e9460950597a54a4e6eed97c119c75547127bbb6b77277779d44d92354d993affeac0a0bab2e7260a635d59dbc28949ff875103e442f4800511739cc2425f6cda64ecfcfcd87ad7090a5dd925609f915eb5d55dac36552fcb31099627b588d073b0b48e5d5ae86d2f819b35054bec76a28ac971c0b49e73da7e1a926d382249fdce0b88827150cee63022c24ae626fc45d7b76f225ea1427460b31a7ec199615690fd1a26acadca02cd3170400aa8b1d61e1a728036055c56eb03ea228964155a56e906efe89e3659aed2ef037fad95011a450ed06bbf968b308b4293f2e2bc3f0b2ded3cc601d507bd819daee4ad5477b49264653f8877131dcb8385ec57d003b55e723d76f97aa2eb52c76a8baeb38f46a7a89fa922d778706e84da1ca1de6af6996e31806dad48d6b18729fa0e020e9be4d3119df330e9dbe18bf0b4870e77c4d5fdf0b6e8427723f577154c24fe5f4d88ffed0fb9a05e9e16e619525ed2192b92973bb1590af029c0c9a38ca0193842976180db5c900606cf9b82291ae2824a8d97287bb12943da702cd9a32875b76e6b318dc25bbe673196a68ed87105850caaf234cb6cf3b8f6c5f7bbd8dfc72dfefeaae269a8977ddba6fac98a149cf2c4cf95149f9da37dd17e9ab903d77ba2bfa69b7964871e5374f0c70445ab7854745e82e4cd217addbe04a7772abbbaa057c220bd3b6d045512494b81100c8f13dabec537a4b7c4a01686d8d23c4ab7b9480009b8a3e235ca2a7e81e9a3357db0732f03e21d4394285ae02b90a575ad71f498708de561dd54eaf6399fd9ddc6804749f531bd84f7dc222cde5d35a5d38b6f54e7b94df099701d5c57b436e83db783fa2b311ebeea4d7f656debe769d443610aa8eeb69763feebedf4559b4010e886cb98319bdfe7693a144d83d5da9c3ea0037e9ae77e8be8eabc3af167c3d567769b4e56de206e9c09eac197f735fa2aecba9e12ee8347dc393cea710aaf02f711689b6275fe30c31ca9002625d33aea0fc1d678fd1258a329c0bc289af7184284eb12d74b9a193efe61c9f1e711e479bf76b9c088bc494bb423b8f1108ad2a1f570413f5016883aed41ed2af38c171f520cb03e32a5c795d696800d50e027a8d37c02e678a0ffb19d8974a6c7254f3b77670de6a0d25f99483bc2b80361ba1868207a662c530106f8a561f1c63a36e4d10c6242bd351ba4f12eb7a4105048958d90baea48ff9aa5e30a15b2ba0ba176ce8f20aa8ee051bba6d02aafb710578f3043638aafba736aed5df7b1218bb6bf59ca4e819568bd01e924c680bdde0401cca96ffe1be65d0644cc89f5f4dd6e528ecabc93410f4f2a5ed086b33ae7adc039687638c871b1faf47637e4969f78b321c58b3ee5da34178185d6144c7b53dec2341086bcdcb0134c3ebe81a658568e970153de02dafef1400cb9a1e102f7ebf50402c6b7a40bcbbba55402c6b1c380e3f2fc9315b5a44b6dc1d5a751ea6d22a82c1720d1c8ea7a011d7c7723bb063609d57d797caacb2f1ba2b4a453fe5cd0e6d2e0a8db6700ab2fb50aa633f824ce56edfe562f6c5765d066777d6d3f455eac1a68be89bc45538e8d5a69b6ccb08553d6036dc2cde84830d8e8ad1a46cddbed84dccf1edce7446084a19c17714652050ed684e4bce574da193548da31cd2d27c8dc371234daef2186f2098629d63482275f310b7065771b8479a6bf41215e72b947cc9b1f89cc25739c2a4a64c8c5e948085faf0c6d3de0b29291390d8a4c55e97b4bfdb4c4075161e2e3d50396f9aeca79c6f5e670412d3f2544de633b238dfa88d7436fff8b2fccff884d69f947f5ec4119970d7e22322920ee7c55dfa8c93b3f94f273fcd67e77184f22a89539d70e8adf8e919ab0c44af7fa41988f07ab310bbbbe731a250f27ccd05cb3152bd759b9192f99c5ee31791be0def741ffa5164f0395d88bd4f4509d874ac3e0c11d1b52d55007d79cc5081d7b7a828704656ec8a7e2a888c773efb4473fcdc5799e3e25cfe1885b813d99440159e6f285b3d951f3c45df7fc3c963f174367ffd8a855c7e0ec800b8ce10e413649d30a80229c3730557efe10adc7d9ac686c563b7ae9e53e4ec3b969c02a7dcb1e094a663404ee9d2f8a869faa3334d831141990bc78e14dad437668208dd0392a53e1f5618d60466116d3095c178450c0f2a4d5fb9937add7d14ae1cb463ffda05b01e1319c806c5dc905eff421682a85a52fdc67dc66c707c201c92bba74f9e67cc309f601b0f43866ed257ddae9235fe7e36ffafb2cbdbd9d57f7cad7afd30bbc988c67e3b7b35fb6fe7c56aae80dd1057bd0621666f8cdd90773d070da0753d71c35e771b84da5570ca10386b58cd883f1918d15a22c3df22b692c6f02383590c039ce95bfe3619806c77b235d03aa3817fb855662035dc37ce92a7cb12a433f77a81153205a9e1ffd20b7cf3301e488d84b36e9419782ccd1b38ed8e8561d374fcc3a4393093e60ff36074f320d8f6bf05d3fbd86d7df533bb79f72b56d4b700b865b204f5374cd4708daab53fe8261b8546bdba031f6eeb71996cdcf602d3d5613358b3b2225f8f1d2f6b12f4989959b526beb999cbfae393e782891739918e1d39e01837332500d5e49b084d54afcf037795a3a78298135d1df7312c980c3da1ee3298b43d7b62e7c2f4b1909dee878826b14f0534f1b3f3d81c3f6ed2b4eb39c8b2683303b961afbb8590e370321e3bb9a14ebf63961d6cdf90ef244c4e9f83b8ff0692e4d811439119c74c89b6634032b4e9760e428fc2996becc8a04857632643db312019ba14383ee9c0a7c2f10eb9892b0a33e426b2280c74d36b414fd881afbf84c4395ef57ab04d0ba4a2b13d8c80f9676c0e2275c749ed5f77166212dc6849ebeb01419929c68e3edac430662a09dd03d2ea101f1ff7f1ce964d471348c275596afa0f33ecb5af9fa3d92417c713beae762956dc7037fd06211ffb61569198c645aaf617a8a12d551b71e7aefaf844370a8fb49f7a42ad93dda8c7fbf33e48673e078e4f5dd226c4f17a59873a35309c526c9a1caf6a94499833e53503a8e9c22a2a2e9d4e201c40721d9fabcce4d9f109f65ff70175420ba049e4e07abd9b0fd5fe42d4b2a3fdc1763e2c234497aec7d214d1c57b5bd823ca85f76d9488197fbc5a2662da9f40c07ddfa401098002810f715307a4010aa5c2a094408771b30626d8b17d2182d2ead8bc0e4952dcffcb50eeff2a9c4dda1388912657eec1f84c9b2fc745956852e3d8aa130ec481f94c7a3e32053d3d843ae7ab52f5f8b4ef4d097afe384bf810377b62577b3889b30984bc2a1d2e915010c86542a12090cbc4423e21b3298642c0e5720cf97d370963178e7d2204b2f9d8296f450a1fb3ca6e3b0654d436c4e9112b1342ffefd7c394bd733c9c8ac7d23b5e9d7bc7c23d9eed1c908784743e3eed03309fcf4138bc6993e1d811df98f7c6cc020088d0af5b020e7779c424d3f17b7e1072ea7805ce65d7f1a99f0ff29c2264e2f10e5ac8c5e313be27b3229ca439cff37415952703d941e72b94ece37db29e7d4e299aaab61e034d7a7352977cdcc545b48da3154148739788c2e926b9c4312ef0ec7c55e5c4b940f90aade5499341af55d8d91c18ec18b8727e247f921010f188332a9f507c91267991a148ce6a749b45c92adaa2989bb7d00a94b98a9c2774662d50b1e6126f71426526304f6b9c5036b2d3450b5a5865d32a9c2e183631700f13bbfb150e8aef48d8d4b3e46bcbc6612236d498e322ae22081b81aba320aa2a11b10b1f29a3aa9d718ec0476d5c597b43922bd9a88bb26329c8948ec24acd38b9417485415848115fa820a826a0d089936ec100dd7e484760a566b85fd91da0e626273a1ea15872a2eead26ad7948d9a4c73b0253352153a52ba89a99dac03196885de128cc5406bcb2f8ab8220cca3f9e0bd4b649c13f3c801bd067c93314d19e065e0982ab48d25575d7274bca2f8d23d4038e5f7ec4370491b7d3a098bd0615a2a2a2b5a1da182b2a6a4eaabb42115931ae718872fe6e87e0067afc90ef0639fbc1c4ff0931ebc581e824dc17db3952763a3492c65475e9adc5066f90948bdb227ea6c321e1a559939f2cea4ba8c8987ddeb6b68366e971d03577e04d7d0caf8641dcec9b8a78dfadb6bdee96213d91130a547c0378af8cb3de79afdb79ea7e19d912d6737e699d46eee7887c9a5a03ebc3b92efe894971b655571d84135980ee9b80ca58d1e63784a68c771965877c4424abb5e2a62eb3fa71a4c6619f18ef29651862e1dc671bf89b3e21f54f280ec34c5315ffda1f73d3ce277920a0e82eb45bca392482ee484a301038a2035c25179e720a4cf34ec33850472e3a1c965107b5db4b7d78cd399db635e33badad9935e330ae1898770f0170280652b9fa93b8a4b005dc4b333da0978ea80cf6f93f3dac467b91eacb70f273a91030fc3b69a9cd926b1b37ab0d8c8d6d67bfebbcc8d8815bfa12c3157fda9e7e66abffcc4f0ac0b43691e5caaf2ea0bcc67f3f53d0d49aee258caaa5ca2ad04b97ab2912157e520645a6586ccbdff4af0b95a080bd3c08cabb522243c6d0d84a3aeb4980be799254f86ab0667c379a599d075c24342d55541683a7f7f130ac6c35fc2c1d44148ea6a9ae1d080a43a1e48f0ab620874e5de6902dbf9004ba0bb2a087c536b4651fb8d4af0eb720878596586dca6fe9781775510fca6d686b634513944d7b21ca629a93243e60e5b127cae16c2f2c0beee98703117031226a60ec2d3565b60116d431997d802c4c837b2e1e15c31b7b606e6e0dc655e8cd257cc8b69a19e57dbc88cb7cacd2063abcb211c659585506ca3f701a9d8d58162b1a936631183c5655c520b08a3d048c6cb980ba0caac7d2f664c3b5973420e1a9c59c8697782a72d912c1f853f17d3932b174d537e3a365385621da1d91a6322e12b0666e06d996ed28082af66cd550c9e36149a07ccda18c1c70d5ed2e5e5c89952cdc44553a3ecda150e9eb022800c98b34da859ffa14f426d21d00998b42e144a78fde16d9e72b85da166b2ac1156f6aa0a064f8e0dc80166a68cd7e106c7d959e5e8ea92092604848f00f3320599b80f7512d684c21d0cca26a0f41d47e540def98639ab6e35fc88a1d1a75db19f7ecad073c730961e659ab2cf33304f8363f460db09381f953db9f2c153151d7481896a7d78074f533a9a95fd98528f53d4082783cba917d134e65439e747ed7cd56e9243063f292b4bc76cedfcf52f1bba77217621c4ba49f940f22403cd459db79927b5245c4dd49666ee9ddd5b983a4a2bbc7ffa0d77b29dada3a9c98bc71355c34f577223312860ef86c648224be1f50091d6c641c28f9a82affb1831c7d4795f021bd9edf2ae1f46824fba445a0960f5e2ec4b0e04598626455efbd0d9d69d2eaafbd1ba80fc2cd20c3de28fe91ac779597abaf8bc4b68e6c7ead725cea3c70ec4298199e015f7b0dab6b94a1ed2e68d571851d34448fef71117688d0a749e15d1035a15a47a85f33c4a1ee7b3df51bc234dde6feef1fa2ab9d915db5d41a68c37f7f10bbb18f49d5887ff74218df9f4664b7fe53ea6408619d1649937c9bb5d14afdb717f0052172a40d007e83add28a56541d38e3ebeb4903e1136b203542f5ffb6e7e8737642b1638bf4996e81bee33b62f39fe0d3fa2d50b29ff563d1ba8809809c12ffbe965841e33b4c96b185d7ff293f0f07af3fdafff0ffa07baf7929d0100, '6.4.4');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`Adminid`);

--
-- Tablo için indeksler `ambars`
--
ALTER TABLE `ambars`
  ADD PRIMARY KEY (`AmbarID`);

--
-- Tablo için indeksler `bankalars`
--
ALTER TABLE `bankalars`
  ADD PRIMARY KEY (`Bankaid`);

--
-- Tablo için indeksler `carilers`
--
ALTER TABLE `carilers`
  ADD PRIMARY KEY (`Cariid`);

--
-- Tablo için indeksler `departmen`
--
ALTER TABLE `departmen`
  ADD PRIMARY KEY (`Departmanid`);

--
-- Tablo için indeksler `detays`
--
ALTER TABLE `detays`
  ADD PRIMARY KEY (`Detayid`);

--
-- Tablo için indeksler `faturakalems`
--
ALTER TABLE `faturakalems`
  ADD PRIMARY KEY (`FaturaKalemid`),
  ADD KEY `IX_Urunid` (`Urunid`) USING HASH,
  ADD KEY `IX_Ambarid` (`Ambarid`) USING HASH,
  ADD KEY `IX_Faturaid` (`Faturaid`) USING HASH;

--
-- Tablo için indeksler `faturalars`
--
ALTER TABLE `faturalars`
  ADD PRIMARY KEY (`Faturaid`),
  ADD KEY `IX_Cariid` (`Cariid`) USING HASH,
  ADD KEY `IX_Personelid` (`Personelid`) USING HASH,
  ADD KEY `IX_Ambarid` (`Ambarid`) USING HASH,
  ADD KEY `IX_Kasaid` (`Kasaid`) USING HASH,
  ADD KEY `IX_FinansHesapid` (`FinansHesapid`) USING HASH;

--
-- Tablo için indeksler `finansalharekets`
--
ALTER TABLE `finansalharekets`
  ADD PRIMARY KEY (`FinansalHareketid`),
  ADD KEY `IX_Cariid` (`Cariid`) USING HASH,
  ADD KEY `IX_Personelid` (`Personelid`) USING HASH,
  ADD KEY `IX_FinansHesapid` (`FinansHesapid`) USING HASH;

--
-- Tablo için indeksler `finanshesaplaris`
--
ALTER TABLE `finanshesaplaris`
  ADD PRIMARY KEY (`FinansHesapid`);

--
-- Tablo için indeksler `giders`
--
ALTER TABLE `giders`
  ADD PRIMARY KEY (`Giderid`);

--
-- Tablo için indeksler `kasalars`
--
ALTER TABLE `kasalars`
  ADD PRIMARY KEY (`Kasaid`),
  ADD KEY `IX_Personelid` (`Personelid`) USING HASH;

--
-- Tablo için indeksler `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`KategoriID`);

--
-- Tablo için indeksler `markas`
--
ALTER TABLE `markas`
  ADD PRIMARY KEY (`MarkaID`);

--
-- Tablo için indeksler `parametres`
--
ALTER TABLE `parametres`
  ADD PRIMARY KEY (`ParametreID`);

--
-- Tablo için indeksler `personels`
--
ALTER TABLE `personels`
  ADD PRIMARY KEY (`Personelid`),
  ADD KEY `IX_Departmanid` (`Departmanid`) USING HASH;

--
-- Tablo için indeksler `satisharekets`
--
ALTER TABLE `satisharekets`
  ADD PRIMARY KEY (`Satisid`),
  ADD KEY `IX_Urunid` (`Urunid`) USING HASH,
  ADD KEY `IX_Cariid` (`Cariid`) USING HASH,
  ADD KEY `IX_Personelid` (`Personelid`) USING HASH;

--
-- Tablo için indeksler `stokharekets`
--
ALTER TABLE `stokharekets`
  ADD PRIMARY KEY (`StokHareketid`),
  ADD KEY `IX_Urunid` (`Urunid`) USING HASH,
  ADD KEY `IX_Cariid` (`Cariid`) USING HASH,
  ADD KEY `IX_Personelid` (`Personelid`) USING HASH,
  ADD KEY `IX_Ambarid` (`Ambarid`) USING HASH;

--
-- Tablo için indeksler `transactiontasks`
--
ALTER TABLE `transactiontasks`
  ADD PRIMARY KEY (`TransactionTaskid`);

--
-- Tablo için indeksler `uruns`
--
ALTER TABLE `uruns`
  ADD PRIMARY KEY (`Urunid`),
  ADD KEY `IX_Kategoriid` (`Kategoriid`) USING HASH,
  ADD KEY `IX_Markaid` (`Markaid`) USING HASH;

--
-- Tablo için indeksler `__migrationhistory`
--
ALTER TABLE `__migrationhistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admins`
--
ALTER TABLE `admins`
  MODIFY `Adminid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ambars`
--
ALTER TABLE `ambars`
  MODIFY `AmbarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `bankalars`
--
ALTER TABLE `bankalars`
  MODIFY `Bankaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `carilers`
--
ALTER TABLE `carilers`
  MODIFY `Cariid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `departmen`
--
ALTER TABLE `departmen`
  MODIFY `Departmanid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `detays`
--
ALTER TABLE `detays`
  MODIFY `Detayid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `faturakalems`
--
ALTER TABLE `faturakalems`
  MODIFY `FaturaKalemid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `faturalars`
--
ALTER TABLE `faturalars`
  MODIFY `Faturaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `finansalharekets`
--
ALTER TABLE `finansalharekets`
  MODIFY `FinansalHareketid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `finanshesaplaris`
--
ALTER TABLE `finanshesaplaris`
  MODIFY `FinansHesapid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `giders`
--
ALTER TABLE `giders`
  MODIFY `Giderid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kasalars`
--
ALTER TABLE `kasalars`
  MODIFY `Kasaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `KategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `markas`
--
ALTER TABLE `markas`
  MODIFY `MarkaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `parametres`
--
ALTER TABLE `parametres`
  MODIFY `ParametreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Tablo için AUTO_INCREMENT değeri `personels`
--
ALTER TABLE `personels`
  MODIFY `Personelid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `satisharekets`
--
ALTER TABLE `satisharekets`
  MODIFY `Satisid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Tablo için AUTO_INCREMENT değeri `stokharekets`
--
ALTER TABLE `stokharekets`
  MODIFY `StokHareketid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `transactiontasks`
--
ALTER TABLE `transactiontasks`
  MODIFY `TransactionTaskid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `uruns`
--
ALTER TABLE `uruns`
  MODIFY `Urunid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `faturakalems`
--
ALTER TABLE `faturakalems`
  ADD CONSTRAINT `FK_faturaKalems_Ambars_Ambarid` FOREIGN KEY (`Ambarid`) REFERENCES `ambars` (`AmbarID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faturaKalems_Faturalars_Faturaid` FOREIGN KEY (`Faturaid`) REFERENCES `faturalars` (`Faturaid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_faturaKalems_Uruns_Urunid` FOREIGN KEY (`Urunid`) REFERENCES `uruns` (`Urunid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `faturalars`
--
ALTER TABLE `faturalars`
  ADD CONSTRAINT `FK_Faturalars_Ambars_Ambarid` FOREIGN KEY (`Ambarid`) REFERENCES `ambars` (`AmbarID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Faturalars_Carilers_Cariid` FOREIGN KEY (`Cariid`) REFERENCES `carilers` (`Cariid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Faturalars_FinansHesaplaris_FinansHesapid` FOREIGN KEY (`FinansHesapid`) REFERENCES `finanshesaplaris` (`FinansHesapid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Faturalars_Kasalars_Kasaid` FOREIGN KEY (`Kasaid`) REFERENCES `kasalars` (`Kasaid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Faturalars_Personels_Personelid` FOREIGN KEY (`Personelid`) REFERENCES `personels` (`Personelid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `finansalharekets`
--
ALTER TABLE `finansalharekets`
  ADD CONSTRAINT `FK_FinansalHarekets_Carilers_Cariid` FOREIGN KEY (`Cariid`) REFERENCES `carilers` (`Cariid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_FinansalHarekets_FinansHesaplaris_FinansHesapid` FOREIGN KEY (`FinansHesapid`) REFERENCES `finanshesaplaris` (`FinansHesapid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_FinansalHarekets_Personels_Personelid` FOREIGN KEY (`Personelid`) REFERENCES `personels` (`Personelid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `kasalars`
--
ALTER TABLE `kasalars`
  ADD CONSTRAINT `FK_Kasalars_Personels_Personelid` FOREIGN KEY (`Personelid`) REFERENCES `personels` (`Personelid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `personels`
--
ALTER TABLE `personels`
  ADD CONSTRAINT `FK_Personels_Departmen_Departmanid` FOREIGN KEY (`Departmanid`) REFERENCES `departmen` (`Departmanid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `satisharekets`
--
ALTER TABLE `satisharekets`
  ADD CONSTRAINT `FK_SatisHarekets_Carilers_Cariid` FOREIGN KEY (`Cariid`) REFERENCES `carilers` (`Cariid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SatisHarekets_Personels_Personelid` FOREIGN KEY (`Personelid`) REFERENCES `personels` (`Personelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SatisHarekets_Uruns_Urunid` FOREIGN KEY (`Urunid`) REFERENCES `uruns` (`Urunid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `stokharekets`
--
ALTER TABLE `stokharekets`
  ADD CONSTRAINT `FK_StokHarekets_Ambars_Ambarid` FOREIGN KEY (`Ambarid`) REFERENCES `ambars` (`AmbarID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_StokHarekets_Carilers_Cariid` FOREIGN KEY (`Cariid`) REFERENCES `carilers` (`Cariid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_StokHarekets_Personels_Personelid` FOREIGN KEY (`Personelid`) REFERENCES `personels` (`Personelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_StokHarekets_Uruns_Urunid` FOREIGN KEY (`Urunid`) REFERENCES `uruns` (`Urunid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `uruns`
--
ALTER TABLE `uruns`
  ADD CONSTRAINT `FK_Uruns_Kategoris_Kategoriid` FOREIGN KEY (`Kategoriid`) REFERENCES `kategoris` (`KategoriID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Uruns_Markas_Markaid` FOREIGN KEY (`Markaid`) REFERENCES `markas` (`MarkaID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
