-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 08 mars 2024 à 19:29
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `electricity`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `motDePasse` varchar(255) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `adresse`, `motDePasse`, `email`) VALUES
(1, 'akoubri', 'ayoub', 'mhammid marrakech', 'motdepasse', 'ayoub@gmail.com'),
(2, 'jone', 'doe', 'targa, marrakech', 'motdepasse', 'jone@gmail.com'),
(3, 'mustafa', 'mohammed', 'sidi youssef, marrakech', 'motdepasse', 'mustafa@gmail.com'),
(4, 'fekir', 'nabil', 'saada, marrakech', 'motdepasse', 'fekir@gmail.com'),
(5, 'ali', 'mohammed', 'targa, marrakech', 'motdepasse', 'ali@gmail.com'),
(6, 'benacer', 'brahim', 'gueliz, marrakech', 'motdepasse', 'benacer@gmail.com'),
(7, 'mahrez', 'ryad', 'mhamid, marrakech', 'motdepasse', 'ryad@gmail.com'),
(16, 'Salah', 'Mohammed', 'Hivernage, marrakech', 'motdepasse', 'salah@gmail.com'),
(17, 'elothmani', 'abderahim', 'hadak lkssre li flkssre lkbir', 'motdepasse', 'abderahim@gmail.com'),
(18, 'Elkharraz', 'Saad', 'centre,temara', 'motdepasse', 'saad@gmail.com'),
(19, 'test', 'test22', 'tetouan', 'motdepasse', 'tester@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `consommation_annuelle`
--

DROP TABLE IF EXISTS `consommation_annuelle`;
CREATE TABLE IF NOT EXISTS `consommation_annuelle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_client` int DEFAULT NULL,
  `consommation` int DEFAULT NULL,
  `dateDeSaisie` varchar(50) DEFAULT NULL,
  `Annee` varchar(10) DEFAULT NULL,
  `STATUS` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_conso` (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `consommation_annuelle`
--

INSERT INTO `consommation_annuelle` (`id`, `id_client`, `consommation`, `dateDeSaisie`, `Annee`, `STATUS`) VALUES
(39, 17, 2900, '19-12-2023', '2023', 0),
(38, 16, 3000, '20-12-2023', '2023', 0),
(37, 7, 1500, '18-12-2023', '2023', 0),
(36, 6, 2800, '10-12-2023', '2023', 0),
(35, 5, 2500, '24-12-2023', '2023', 0),
(34, 4, 2900, '19-12-2023', '2023', 0),
(33, 3, 3000, '20-12-2023', '2023', 0),
(32, 2, 1500, '18-12-2023', '2023', 0),
(31, 1, 2800, '10-12-2023', '2023', 1),
(30, 18, 2500, '24-12-2023', '2023', 0);

-- --------------------------------------------------------

--
-- Structure de la table `consommation_mensuelle`
--

DROP TABLE IF EXISTS `consommation_mensuelle`;
CREATE TABLE IF NOT EXISTS `consommation_mensuelle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_client` int DEFAULT NULL,
  `consommation_compteur` int DEFAULT NULL,
  `mois` varchar(50) DEFAULT NULL,
  `photo_compteur` varchar(255) DEFAULT NULL,
  `annee` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_conso` (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=1122098 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `consommation_mensuelle`
--

INSERT INTO `consommation_mensuelle` (`id`, `id_client`, `consommation_compteur`, `mois`, `photo_compteur`, `annee`) VALUES
(1122038, 1, 1600, '2', '122024.jpg', '2024'),
(12, 1, 1400, '12', '1122023.jpg', '2023'),
(11, 1, 1250, '11', '1112023.jpg', '2023'),
(10, 1, 1100, '10', '1102023.jpg', '2023'),
(9, 1, 1000, '9', '192023.jpg', '2023'),
(8, 1, 2300, '8', '182023.jpg', '2023'),
(7, 1, 740, '7', '172023.jpg', '2023'),
(6, 1, 640, '6', '162023.jpg', '2023'),
(5, 1, 520, '5', '152023.jpg', '2023'),
(4, 1, 420, '4', '142023.jpg', '2023'),
(3, 1, 350, '3', '132023.jpg', '2023'),
(2, 1, 200, '2', '122023.jpg', '2023'),
(1, 1, 110, '1', '112023.jpg', '2023'),
(1122044, 16, 600, '2', '1622024.jpg', '2024'),
(1122037, 1, 1500, '1', '112024.jpg', '2024'),
(1122043, 16, 450, '1', '1612024.jpg', '2024'),
(1122045, 2, 200, '1', '212023.jpg', '2023'),
(1122046, 2, 300, '2', '222023.jpg', '2023'),
(1122047, 2, 600, '3', '232023.jpg', '2023'),
(1122048, 2, 700, '4', '242023.jpg', '2023'),
(1122049, 2, 900, '5', '252023.jpg', '2023'),
(1122050, 2, 1100, '6', '262023.jpg', '2023'),
(1122051, 2, 1250, '7', '272023.jpg', '2023'),
(1122052, 2, 1400, '8', '282023.jpg', '2023'),
(1122053, 2, 1600, '9', '292023.jpg', '2023'),
(1122054, 2, 1580, '10', '2102023.jpg', '2023'),
(1122055, 2, 1700, '11', '2112023.jpg', '2023'),
(1122056, 2, 1800, '12', '2122023.jpg', '2023'),
(1122057, 2, 1900, '1', '212024.jpg', '2024'),
(1122058, 2, 2000, '2', '222024.jpg', '2024'),
(1122059, 3, 350, '1', '312024.jpg', '2024'),
(1122060, 3, 600, '2', '322024.jpg', '2024'),
(1122061, 3, 800, '3', '332024.jpg', '2024'),
(1122062, 2, 2100, '3', '232024.jpg', '2024'),
(1122063, 4, 150, '1', '412023.jpg', '2023'),
(1122064, 4, 350, '2', '422023.jpg', '2023'),
(1122065, 4, 500, '3', '432023.jpg', '2023'),
(1122066, 4, 800, '4', '442023.jpg', '2023'),
(1122067, 4, 1000, '5', '452023.jpg', '2023'),
(1122068, 4, 1200, '6', '462023.jpg', '2023'),
(1122069, 4, 1300, '7', '472023.jpg', '2023'),
(1122070, 4, 1900, '8', '482023.jpg', '2023'),
(1122071, 4, 2000, '9', '492023.jpg', '2023'),
(1122072, 4, 2200, '10', '4102023.jpg', '2023'),
(1122073, 4, 2400, '11', '4112023.jpg', '2023'),
(1122074, 4, 2500, '12', '4122023.jpg', '2023'),
(1122075, 5, 200, '1', '512023.jpg', '2023'),
(1122076, 5, 300, '2', '522023.jpg', '2023'),
(1122077, 5, 400, '3', '532023.jpg', '2023'),
(1122093, 5, 800, '6', '562023.jpg', '2023'),
(1122092, 5, 600, '5', '552023.jpg', '2023'),
(1122097, 1, 12200, '3', '132024.jpg', '2024'),
(1122096, 18, 600, '3', '1832024.jpg', '2024'),
(1122095, 18, 300, '2', '1822024.jpg', '2024'),
(1122094, 18, 150, '1', '1812024.jpg', '2024'),
(1122087, 17, 150, '1', '1712023.jpg', '2023'),
(1122088, 17, 300, '2', '1722023.jpg', '2023'),
(1122089, 17, 400, '3', '1732023.jpg', '2023'),
(1122091, 5, 500, '4', '542023.jpg', '2023');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `id` int NOT NULL,
  `id_consommation` int DEFAULT NULL,
  `prix_ht` float DEFAULT NULL,
  `prix_ttc` float DEFAULT NULL,
  `statu` int DEFAULT NULL,
  `consommation` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_facture_conso` (`id_consommation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id`, `id_consommation`, `prix_ht`, `prix_ttc`, `statu`, `consommation`) VALUES
(112023, 1, 89, 95, 1, 110),
(1122023, 12, 120, 118, 1, 150),
(1112023, 11, 125, 143.75, 0, 150),
(1102023, 10, 250, 122, 1, 90),
(192023, 9, 89, 102.35, 0, 110),
(182023, 8, 1530, 1759.5, 0, 1560),
(172023, 7, 160, 123, 1, 100),
(162023, 6, 190, 128, 0, 80),
(152023, 5, 100, 115, 1, 100),
(142023, 4, 200, 130, 1, 70),
(132023, 3, 250, 122, 1, 150),
(122023, 2, 300, 145, 1, 90),
(122024, 1122038, 270, 310.5, 0, 300),
(112024, 1122037, 80, 92, 0, 100),
(1622024, 1122044, 125, 143.75, 0, 150),
(1612024, 1122043, 420, 483, 0, 450),
(212023, 1122045, 170, 195.5, 0, 200),
(222023, 1122046, 80, 92, 0, 100),
(232023, 1122047, 270, 310.5, 0, 300),
(242023, 1122048, 80, 92, 0, 100),
(252023, 1122049, 370, 425.5, 0, 400),
(262023, 1122050, 170, 195.5, 0, 200),
(272023, 1122051, 125, 143.75, 0, 150),
(282023, 1122052, 125, 143.75, 0, 150),
(292023, 1122053, 170, 195.5, 0, 200),
(2102023, 1122054, -16, -18.4, 2, -20),
(2112023, 1122055, 98, 112.7, 0, 120),
(2122023, 1122056, 80, 92, 0, 100),
(212024, 1122057, 80, 92, 0, 100),
(222024, 1122058, 80, 92, 0, 100),
(312024, 1122059, 320, 368, 0, 350),
(322024, 1122060, 220, 253, 0, 250),
(332024, 1122061, 170, 195.5, 0, 200),
(232024, 1122062, 80, 92, 0, 100),
(412023, 1122063, 125, 143.75, 1, 150),
(422023, 1122064, 170, 195.5, 1, 200),
(432023, 1122065, 125, 143.75, 1, 150),
(442023, 1122066, 270, 310.5, 1, 300),
(452023, 1122067, 170, 195.5, 1, 200),
(462023, 1122068, 170, 195.5, 1, 200),
(472023, 1122069, 80, 92, 0, 100),
(482023, 1122070, 570, 655.5, 0, 600),
(492023, 1122071, 80, 92, 1, 100),
(4102023, 1122072, 170, 195.5, 1, 200),
(4112023, 1122073, 170, 195.5, 1, 200),
(4122023, 1122074, 80, 92, 0, 100),
(512023, 1122075, 170, 195.5, 0, 200),
(522023, 1122076, 80, 92, 0, 100),
(532023, 1122077, 80, 92, 0, 100),
(562023, 1122093, 170, 195.5, 0, 200),
(552023, 1122092, 80, 92, 0, 100),
(132024, 1122097, 10570, 12155.5, 2, 10600),
(1832024, 1122096, 270, 310.5, 0, 300),
(1822024, 1122095, 125, 143.75, 0, 150),
(1812024, 1122094, 125, 143.75, 0, 150),
(1712023, 1122087, 125, 143.75, 0, 150),
(1722023, 1122088, 125, 143.75, 0, 150),
(1732023, 1122089, 80, 92, 0, 100),
(542023, 1122091, 80, 92, 0, 100);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id` int NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `motDePasse` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `Email`, `motDePasse`) VALUES
(1, 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_client` int DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `date_notification` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notif` (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`id`, `id_client`, `message`, `date_notification`) VALUES
(5, 1, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2024', '2024-03-01'),
(3, 1, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2024', '2024-03-01'),
(4, 1, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2024', '2024-03-01'),
(6, 1, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2024', '2024-03-01'),
(42, 1, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2022', '2024-03-08'),
(41, 1, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2024', '2024-03-08'),
(40, 1, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2022', '2024-03-07'),
(39, 1, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2024', '2024-03-07'),
(38, 18, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2024', '2024-03-07'),
(37, 3, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2020', '2024-03-06'),
(36, 3, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2022', '2024-03-06'),
(35, 1, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2019', '2024-03-06'),
(34, 1, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2022', '2024-03-06'),
(33, 2, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2023', '2024-03-05'),
(32, 2, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2023', '2024-03-05'),
(31, 1, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2022', '2024-03-02'),
(28, 1, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2024', '2024-03-01'),
(29, 1, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2024', '2024-03-01'),
(30, 1, 'Veuillez Visite Votre Agence Pour Regler Votre Situation De : 2022', '2024-03-01');

-- --------------------------------------------------------

--
-- Structure de la table `reclamation`
--

DROP TABLE IF EXISTS `reclamation`;
CREATE TABLE IF NOT EXISTS `reclamation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_client` int DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_reclamation` date DEFAULT NULL,
  `statu` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_reclamation` (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `reclamation`
--

INSERT INTO `reclamation` (`id`, `id_client`, `type`, `description`, `date_reclamation`, `statu`) VALUES
(1, 1, 'Fuite Interne', NULL, '2023-01-20', 0),
(2, 1, 'Fuite Externe', NULL, '2023-02-10', 1),
(27, 1, 'Fuite Interne', '', '2024-02-26', 1),
(4, 1, 'Fuite Externe', NULL, '2023-09-20', 0),
(5, 1, 'Fuite Interne', NULL, '2023-11-15', 1),
(6, 1, 'Autre', NULL, '2024-01-02', 1),
(7, 1, 'Autre', 'Court Circuit.', '2024-02-15', 1),
(12, 1, 'Fuite Externe', '', '2024-02-26', 1),
(13, 1, 'Autre', 'coupures', '2024-02-26', 1),
(32, 3, 'Fuite Externe', 'Consommation Trop Eleve\n', '2024-03-05', 0),
(31, 3, 'Fuite Interne', 'Consommation Trop Eleve\n', '2024-03-05', 0),
(30, 3, 'Autre', 'Consommation Trop Eleve\n', '2024-03-05', 1),
(29, 2, 'Fuite Externe', '', '2024-03-05', 1),
(28, 2, 'Fuite Interne', '', '2024-03-05', 0),
(33, 16, 'Factures', '', '2024-03-06', 1),
(34, 16, 'Fuite Interne', '', '2024-03-06', 0),
(35, 4, 'Autre', 'Je suis interdit dentrer la consommation la consommation du mois Fevrier', '2024-03-06', 1),
(36, 5, 'Fuite Interne', '', '2024-03-06', 1),
(37, 5, 'Factures', '', '2024-03-06', 0),
(38, 5, 'Fuite Externe', '', '2024-03-06', 1),
(39, 1, 'Fuite Interne', 'test', '2024-03-07', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
