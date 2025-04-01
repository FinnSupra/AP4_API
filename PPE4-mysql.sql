SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `w639v7_ppe4` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `w639v7_ppe4`;

CREATE TABLE `administrateur` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `administrateur` (`id`) VALUES
(8);

CREATE TABLE `badge` (
  `id` int(11) NOT NULL,
  `uid` varchar(25) NOT NULL,
  `actif` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `badge` (`id`, `uid`, `actif`) VALUES
(1, '12345678', 1),
(2, '23456789', 1),
(3, '34567891', 0),
(4, '45678912', 1),
(5, '0449436A643481', 1),
(6, '0489967AAB4A80', 0),
(7, '0489967AAB4A80', 1),
(8, '0477987AAB4A81', 1),
(9, '046853D29C3981', 1),
(10, '043BB77AAB4A80', 1),
(12, '040A987AAB4A81', 1),
(13, '04565DD29C3980', 1),
(14, '5571819966', 1),
(15, '13644693255', 1),
(16, '552458599244', 1),
(17, '250415822255', 1),
(18, '73138197126120', 1),
(19, '136-4-10-152-30', 1),
(20, '136-4-222-78-28', 0),
(21, '136-4-10-152-30', 1),
(22, '136-4-222-78-28', 1),
(23, '136-4-46-93-255', 1),
(24, '996305625869', 1),
(25, '238644913052', 1),
(26, '236565062432', 1),
(27, '551448899156', 1),
(28, '2312481139913', 1),
(29, '5520969932', 1);

CREATE TABLE `categorie_indisponibilite` (
  `id` int(11) NOT NULL,
  `libelle` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `categorie_indisponibilite` (`id`, `libelle`) VALUES
(1, 'Mariage/Pacs'),
(2, 'Mariage enfant'),
(3, 'Formation'),
(4, 'Décès d\'un proche'),
(5, 'Congés'),
(6, 'Maladie'),
(7, 'Naissance/Adoption'),
(8, 'Décès enfant'),
(9, 'Congés sans solde'),
(10, 'Non justifiée'),
(11, 'Dispense de préavis'),
(12, 'Grève'),
(13, 'Repos compensateur'),
(14, 'Visite médicale'),
(15, 'Accident du travail ou maladie professionnelle'),
(16, 'Congé maternité/paternité'),
(17, 'Congé sabbatique'),
(18, 'Congé sans solde'),
(19, 'Crédits d’heures des représentants du personnel'),
(20, 'Les congés et absences liés à la vie politique, aux activités judiciaires et activités d’intérêt général et civiles'),
(21, 'Congé pour création d’entreprise'),
(23, 'Congé d’enseignement de recherche et d’innovation');

CREATE TABLE `categ_soins` (
  `id` int(11) NOT NULL,
  `libel` text NOT NULL,
  `description` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `categ_soins` (`id`, `libel`, `description`) VALUES
(1, 'Soins de pratique courante', ''),
(2, 'Soins spécialisés', 'Soins demandant une actualisation des compétences, un protocole thérapeutique, l\'élaboration et la tenue des dossiers de soins, la transmission d\'informations au médecin prescripteur.');

CREATE TABLE `chambre_forte` (
  `badge` varchar(25) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `acces_ok` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `chambre_forte` (`badge`, `date`, `acces_ok`) VALUES
('0449436A643481', '2017-02-20 21:49:26', 0),
('0449436A643481', '2017-02-20 21:49:30', 0),
('0449436A643481', '2017-02-20 21:53:59', 1),
('0449436A643481', '2017-02-20 21:57:18', 1),
('0449436A643481', '2017-02-20 21:59:08', 1),
('0449436A643481', '2017-02-27 11:44:05', 1),
('0449436A643481', '2017-02-27 12:39:37', 1),
('04DE4E6A643480', '2017-02-20 21:57:07', 0),
('04DE4E6A643480', '2017-02-20 21:59:07', 0),
('04DE4E6A643480', '2017-02-27 11:44:09', 0),
('04DE4E6A643480', '2017-02-27 12:39:21', 0),
('04DE4E6A643480', '2017-02-27 12:39:22', 0),
('12345', '2017-02-20 18:28:14', 0),
('12345678', '2017-02-17 16:54:10', 1),
('12345678', '2017-02-17 17:55:51', 1),
('12345678', '2017-02-17 17:57:14', 1),
('12345678', '2017-02-20 17:54:27', 1),
('12345678', '2017-02-20 19:40:27', 1),
('12345678', '2017-02-20 19:41:02', 1),
('12345678', '2017-02-20 19:48:59', 1),
('12345678', '2017-02-20 21:45:07', 0),
('12345678', '2017-02-20 21:45:37', 1),
('12345678', '2017-02-20 21:47:46', 1),
('12345678', '2017-02-20 21:48:57', 1),
('12345678', '2017-02-20 21:52:21', 1),
('12345678', '2017-02-20 23:22:42', 1),
('12345678', '2017-02-21 00:19:19', 1),
('12345678', '2017-02-21 01:24:58', 1),
('12345678', '2017-02-21 09:21:57', 1),
('12345678', '2017-02-21 18:04:03', 1),
('12345678', '2017-02-22 01:41:51', 1),
('12345678', '2017-02-22 07:40:32', 1),
('12345678', '2017-02-22 08:13:32', 1),
('12345678', '2017-02-22 09:31:19', 1),
('12345678', '2017-02-22 10:12:34', 1),
('12345678', '2017-02-22 11:37:27', 1),
('12345678', '2017-02-22 12:05:20', 1),
('12345678', '2017-02-22 14:03:54', 1),
('12345678', '2017-02-23 03:38:08', 1),
('12345678', '2017-02-23 12:45:29', 1),
('12345678', '2017-02-24 07:31:52', 1),
('12345678', '2017-02-24 13:21:58', 1),
('12345678', '2017-02-27 12:21:48', 1),
('12345678', '2017-02-28 14:13:24', 1),
('12345678', '2017-02-28 18:55:36', 1),
('12345678', '2017-02-28 19:46:19', 1),
('12345678', '2017-02-28 23:46:54', 1),
('12345678', '2017-03-01 21:02:53', 1),
('12345678', '2017-03-03 08:26:59', 1),
('12345678', '2017-03-03 08:27:04', 1),
('12345678', '2017-03-03 09:53:51', 1),
('12345678', '2017-03-03 10:22:36', 1),
('12345678', '2017-03-03 11:39:41', 1),
('12345678', '2017-03-03 16:27:44', 1),
('12345678', '2017-03-04 15:56:48', 1),
('12345678', '2017-03-04 18:01:31', 1),
('12345678', '2017-03-05 10:55:56', 1),
('12345678', '2017-03-05 19:32:53', 1),
('12345678', '2017-03-05 22:19:14', 1),
('12345678', '2017-03-05 23:44:35', 1),
('12345678', '2017-03-06 09:34:10', 1),
('12345678', '2017-03-06 11:15:04', 1),
('12345678', '2017-03-06 19:44:40', 1),
('12345678', '2017-03-07 00:42:48', 1),
('12345678', '2017-03-07 00:55:33', 1),
('12345678', '2017-03-07 11:58:13', 1),
('12345678', '2017-03-07 20:09:23', 1),
('12345678', '2017-03-08 03:27:20', 1),
('12345678', '2017-03-09 07:15:48', 1),
('12345678', '2017-03-10 01:00:53', 1),
('12345678', '2017-03-13 12:53:56', 1),
('12345678', '2017-03-14 07:35:59', 1),
('12345678', '2017-03-14 17:19:40', 1),
('12345678', '2017-03-14 20:39:09', 1),
('12345678', '2017-03-17 00:45:18', 1),
('12345678', '2017-03-17 02:38:47', 1),
('12345678', '2017-03-17 12:55:15', 1),
('12345678', '2017-03-17 18:27:50', 1),
('12345678', '2017-03-18 04:27:29', 1),
('123456789', '2017-02-17 17:57:20', 0),
('123456789', '2017-02-19 12:02:06', 0),
('123456789', '2017-02-19 22:20:02', 0),
('123456789', '2017-02-20 00:57:12', 0),
('123456789', '2017-02-20 15:36:14', 0),
('123456789', '2017-02-20 16:32:33', 0),
('234567890', '2017-02-17 16:53:55', 0),
('444444', '2017-02-17 17:55:30', 0),
('aaaa12', '2017-02-20 21:48:38', 0);

CREATE TABLE `convalescence` (
  `id_patient` int(11) NOT NULL,
  `id_lieux` int(11) NOT NULL,
  `date_deb` date NOT NULL,
  `date_fin` date DEFAULT NULL,
  `chambre` varchar(50) DEFAULT NULL,
  `tel_directe` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `indisponibilite` (
  `infirmiere` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `heure_deb` time DEFAULT NULL,
  `heure_fin` time DEFAULT NULL,
  `categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `infirmiere` (
  `id` int(11) NOT NULL,
  `fichier_photo` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `infirmiere` (`id`, `fichier_photo`) VALUES
(2, NULL),
(3, NULL),
(4, NULL),
(12, NULL),
(17, NULL);

CREATE TABLE `infirmiere_badge` (
  `id_infirmiere` int(11) NOT NULL,
  `id_badge` int(11) NOT NULL,
  `date_deb` date NOT NULL,
  `date_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `infirmiere_badge` (`id_infirmiere`, `id_badge`, `date_deb`, `date_fin`) VALUES
(2, 2, '2016-02-02', NULL),
(2, 14, '2020-03-11', NULL),
(2, 15, '2020-03-12', NULL),
(2, 16, '2020-03-12', NULL),
(2, 18, '2020-03-01', NULL),
(3, 5, '2015-05-07', NULL),
(3, 8, '2019-01-31', NULL),
(3, 9, '2019-03-20', NULL),
(3, 10, '2015-11-18', NULL),
(3, 12, '2019-01-31', NULL),
(3, 17, '2020-03-01', NULL),
(3, 21, '2021-01-20', NULL),
(3, 23, '2021-04-01', NULL),
(3, 25, '2022-01-01', NULL),
(3, 27, '2022-03-01', NULL),
(4, 3, '2014-11-03', '2015-05-06'),
(12, 1, '2016-11-06', NULL),
(12, 3, '2015-05-07', '2016-11-05'),
(12, 13, '2019-03-18', NULL),
(12, 22, '2021-01-20', NULL),
(12, 24, '2022-01-01', NULL),
(12, 28, '2022-03-01', NULL),
(17, 8, '2018-03-11', NULL),
(17, 26, '2022-01-01', NULL),
(17, 29, '2022-03-01', NULL);

CREATE TABLE `lieu_convalescence` (
  `id` int(11) NOT NULL,
  `titre` text NOT NULL,
  `ad1` varchar(255) NOT NULL,
  `ad2` varchar(255) NOT NULL,
  `cp` char(5) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `tel_fixe` char(10) NOT NULL,
  `contact` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `informations_medicales` text NOT NULL,
  `personne_de_confiance` int(11) DEFAULT NULL,
  `infirmiere_souhait` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `patient` (`id`, `informations_medicales`, `personne_de_confiance`, `infirmiere_souhait`) VALUES
(5, '', 1, 3),
(6, '', 7, 3),
(9, '', 1, NULL),
(10, '', 15, NULL),
(11, 'Diabete\r\nIntollérant à l\'aspirine', 14, NULL),
(13, '', NULL, NULL),
(14, '', NULL, NULL),
(16, '', NULL, NULL);

CREATE TABLE `personne` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `sexe` char(1) NOT NULL,
  `date_naiss` date DEFAULT NULL,
  `date_deces` date DEFAULT NULL,
  `ad1` varchar(100) DEFAULT NULL,
  `ad2` varchar(100) DEFAULT NULL,
  `cp` int(5) DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `tel_fixe` varchar(15) DEFAULT NULL,
  `tel_port` varchar(15) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `personne` (`id`, `nom`, `prenom`, `sexe`, `date_naiss`, `date_deces`, `ad1`, `ad2`, `cp`, `ville`, `tel_fixe`, `tel_port`, `mail`) VALUES
(1, 'Lagaffe', 'Gaston', 'H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Nightingale', 'Florence', 'F', '2017-05-07', NULL, 'mmm', NULL, 44000, 'nantes', '', '', 'test1234'),
(3, 'lwald', 'lwald', 'F', '2019-10-20', NULL, '', NULL, 0, '', '0101010101', '0606060606', 'Jeanne@spirou.fr'),
(4, 'Henderson', 'Virginia', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Fantassio', 'Archimede', 'H', '1954-10-06', NULL, '4 rue Fléchier', NULL, 44000, 'NANTES', '0901010101', '060101010101', 'Fantassio@gmail.com'),
(6, 'Prunelle', 'Léon', 'H', '1944-12-25', NULL, '54 Rue de la Mélinière', NULL, 44000, 'NANTES', '0901020304', '0601020304', 'Prunelle@gmail.com'),
(7, 'Lebrac', 'Yves', 'H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Boulier', 'Joseph', 'H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'De Mesmaeker', 'Aimé', 'H', '1947-01-07', NULL, '3 rue du chantier naval', NULL, 44000, 'NANTES', '0901010101', '0601010101', 'DeMesmaeker@gmail.com'),
(10, 'Molaire', 'Mélanie', 'F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Labévue', 'Bertrand', 'H', '1972-07-19', NULL, '37 rue de l\'oubli', NULL, 44250, 'Saint-Brevin-les-Pins', '0901010101', '0601010101', 'Labevub@gmail.com'),
(12, 'jeanne', 'jeanne', '', '1965-04-20', NULL, '5 rue du pain', NULL, 44100, 'nantes', '', '0632085145', 'jeanne@jeanne.jeanne'),
(13, 'Soutier', 'Jules', 'H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Longtarin', 'Joseph', 'H', '1965-03-04', NULL, '55 rue de la santé', NULL, 44320, 'Saint-Père-en-Retz', '0903030303', '0603030303', 'LongtarinJ@gmail.com'),
(15, 'Ducran & Lapoigne', '', 'H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Père Gustave', '', 'H', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'kilian', 'kilian', 'H', '1994-05-22', NULL, '3 rue du Moulin Blanc', NULL, 29000, 'BREST', NULL, '0611223344', 'kilian@gmail.com'),
(19, 'hoiu', 'oiuyo', 'm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

CREATE TABLE `personne_login` (
  `id` int(11) NOT NULL,
  `login` varchar(25) NOT NULL,
  `mp` char(32) NOT NULL,
  `derniere_connexion` date DEFAULT NULL,
  `nb_tentative_erreur` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `personne_login` (`id`, `login`, `mp`, `derniere_connexion`, `nb_tentative_erreur`) VALUES
(1, 'glagaffe', '09b44c0c838be81fb8aeb2a9a972a0e6', NULL, 0),
(2, 'fnightingale', 'a4c7007086840d5cb55ef9946be5317f', NULL, 0),
(3, 'lwald', 'a0598239fdcb83b9abe95367c3e9115d', NULL, 0),
(4, 'vhenderson', '84b9f62866f23bb3770f7b29a0d3e8b7', NULL, 0),
(5, 'fantasio', '597ed98e7e5e8ee4784c959e484a3b7f', NULL, 0),
(6, 'prunelle', 'c18c17af6a7954a2b09e665f595510d1', NULL, 0),
(8, 'jboullier', '28660c57898336b6864b0e17e5689124', NULL, 0),
(9, 'ademesmaeker', '4b05f51c4f2165b84ece820e11453afc', NULL, 0),
(10, 'mmolaire', '6ae6e4c3b09849e12610571a75fe10b9', NULL, 0),
(11, 'blabévue', '3f93f96aef6bdd188a8e5594c24ded1f', NULL, 0),
(12, 'jeanne', 'eca8a799a8b0306fca0200fbdf8d3e15', NULL, 0),
(13, 'jsoutier', '870a842c4116de2c0bda8e6fbe30e3be', NULL, 0),
(14, 'jlongtarin', '7a1f9f915d1daca480cd64487d1e1677', NULL, 0),
(16, 'gustave', 'e71d4f161eed99577821e3d5bf018f38', NULL, 0),
(17, 'kilian', 'dd1c7d693c6654ee8d38b65dd5467408', NULL, 0);

CREATE TABLE `soins` (
  `id_categ_soins` int(11) NOT NULL,
  `id_type_soins` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `libel` text NOT NULL,
  `description` text,
  `coefficient` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `soins` (`id_categ_soins`, `id_type_soins`, `id`, `libel`, `description`, `coefficient`, `date`) VALUES
(1, 1, 1, 'Prélèvement par ponction veineuse directe', NULL, 1.5, '2016-11-17 19:31:10'),
(1, 1, 2, 'Saignée', NULL, 5, '2016-11-17 19:33:28'),
(1, 1, 3, 'Prélèvement aseptique cutané ou de sécrétions muqueuses, prélèvement de selles ou d\'urine pour examens cytologiques, bactériologiques, mycologiques, virologiques ou parasitologiques', NULL, 5, '2016-11-17 19:33:28'),
(1, 1, 4, 'Injection intraveineuse directe isolée', NULL, 2, '2016-11-17 19:33:28'),
(1, 1, 5, 'Injection intraveineuse directe en série', NULL, 1.5, '2016-11-17 19:34:56'),
(1, 1, 6, 'Injection intraveineuse directe chez un enfant de moins de cinq ans ', NULL, 2, '2016-11-17 19:34:56'),
(1, 1, 7, 'Injection intramusculaire', NULL, 1, '2016-11-17 19:36:11'),
(1, 1, 8, 'Supplément pour vaccination antigrippale hors-primo injection dans le cadre de la campagne de vaccination anti-grippale organisée par l’assurance maladie', NULL, 1, '2016-11-17 19:36:11'),
(1, 1, 9, 'Injection d\'un sérum d\'origine humaine ou animale selon la méthode de Besredka, y compris la surveillance ', NULL, 5, '2016-11-17 19:37:03'),
(1, 1, 10, 'Injection sous-cutanée ', NULL, 1, '2016-11-17 19:37:03'),
(1, 1, 11, 'Supplément pour vaccination antigrippale hors-primo injection dans le cadre de la campagne de vaccination anti-grippale organisée par l’assurance maladie ', NULL, 1, '2016-11-17 19:37:59'),
(1, 1, 12, 'Injection intradermique ', '1', 0, '2016-11-17 19:37:59'),
(1, 1, 13, 'Injection d\'un ou plusieurs allergènes, poursuivant un traitement d\'hyposensibilisation spécifique, selon le protocole écrit, y compris la surveillance, la tenue du dossier de soins, la transmission des informations au médecin prescripteu', NULL, 3, '2016-11-17 19:39:22'),
(1, 1, 14, 'Injection d\'un implant souscutané ', NULL, 2.5, '2016-11-17 19:42:08'),
(1, 1, 15, 'Injection en goutte à goutte par voie rectale', NULL, 2, '2016-11-17 19:40:03'),
(1, 2, 1, 'Pansement de stomie', NULL, 2, '2016-11-17 19:43:40'),
(1, 2, 2, 'Pansement de trachéotomie, y compris l\'aspiration et l\'éventuel changement de canule ou sonde', NULL, 2.25, '2016-11-17 19:43:40'),
(1, 2, 3, 'Ablation de fils ou d\'agrafes, dix ou moins, y compris le pansement éventuel ', NULL, 2, '2016-11-17 19:45:01'),
(1, 2, 4, 'Ablation de fils ou d\'agrafes, plus de dix, y compris le pansement éventuel ', NULL, 4, '2016-11-17 19:45:01'),
(1, 2, 5, 'Autre pansement', NULL, 2, '2016-11-17 19:45:22'),
(1, 3, 1, 'Pansements de brûlure étendue ou de plaie chimique ou thermique étendue, sur une surface supérieure à 5 %\r\nde la surface corporelle\r\n', NULL, 4, '2016-11-17 19:51:17'),
(1, 3, 2, 'Pansement d\'ulcère étendu ou de greffe cutanée, sur une surface supérieure à 60 cm2', NULL, 4, '2016-11-17 19:51:17'),
(1, 3, 3, 'Pansement d\'amputation nécessitant détersion, épluchage et régularisation', NULL, 4, '2016-11-17 19:54:13'),
(1, 3, 4, 'Pansement de fistule digestive ', NULL, 4, '2016-11-17 19:54:13'),
(1, 3, 5, 'Pansement pour pertes de substance traumatique ou néoplasique, avec lésions profondes, sous\r\naponévrotiques, musculaires, tendineuses ou osseuses', NULL, 4, '2016-11-17 19:55:03'),
(1, 3, 6, 'Pansement chirurgical nécessitant un méchage ou une irrigation ', NULL, 4, '2016-11-17 19:55:03'),
(1, 3, 7, 'Pansement d\'escarre profonde et étendue atteignant les muscles ou les tendons ', NULL, 4, '2016-11-17 19:55:56'),
(1, 3, 8, 'Pansement chirurgical avec matériel d\'ostéosynthèse extériorisé', NULL, 4, '2016-11-17 19:55:56'),
(1, 4, 1, 'Pose de sonde gastrique', NULL, 3, '2016-11-17 19:57:19'),
(1, 4, 2, 'Alimentation entérale par gavage ou en déclive ou par nutri-pompe, y compris la surveillance, par séance', NULL, 3, '2016-11-17 19:57:19'),
(1, 4, 3, 'Alimentation entérale par voie jéjunale avec sondage de la stomie, y compris le pansement et la surveillance,\r\npar séance ', NULL, 4, '2016-11-17 19:57:53'),
(1, 5, 1, 'Séance d\'aérosol', NULL, 1.5, '2016-11-17 19:59:05'),
(1, 5, 2, 'Lavage d\'un sinus', NULL, 2, '2016-11-17 19:59:05'),
(1, 6, 1, 'Injection vaginale ', NULL, 1.25, '2016-11-17 20:04:25'),
(1, 6, 2, 'Soins gynécologiques au décours immédiat d\'un traitement par curiethérapie ', NULL, 1.5, '2016-11-17 20:04:25'),
(1, 6, 3, 'Cathétérisme urétral chez la femme ', NULL, 3, '2016-11-17 20:05:10'),
(1, 6, 4, 'Cathétérisme urétral chez l\'homme', NULL, 4, '2016-11-17 20:02:42'),
(1, 6, 5, 'Changement de sonde urinaire à demeure chez la femme', NULL, 3, '2016-11-17 20:05:10'),
(1, 6, 6, 'Changement de sonde urinaire chez l\'homme', '4', 0, '2016-11-17 20:02:42'),
(1, 6, 7, 'Éducation à l\'autosondage comprenant le sondage éventuel, avec un maximum de dix séances ', NULL, 3.5, '2016-11-17 20:06:27'),
(1, 6, 8, 'Réadaptation de vessie neurologique comprenant le sondage éventuel', NULL, 4.5, '2016-11-17 20:06:27'),
(1, 6, 9, 'Instillation et/ou lavage vésical (sonde en place)', NULL, 1.25, '2016-11-17 20:07:39'),
(1, 6, 10, 'Pose isolée d\'un étui pénien, une fois par vingt-quatre heures ', NULL, 1, '2016-11-17 20:07:39'),
(1, 7, 1, 'Soins de bouche avec application de produits médicamenteux au décours immédiat d\'une radiothérapie', NULL, 1.25, '2016-11-17 20:08:43'),
(1, 7, 2, 'Lavement évacuateur ou médicamenteux', NULL, 3, '2016-11-17 20:08:43'),
(1, 7, 3, 'Extraction de fécalome ou extraction manuelle des selles ', NULL, 3, '2016-11-17 20:09:07'),
(1, 8, 1, 'Pulvérisation de produit(s) médicamenteux', NULL, 1.25, '2016-11-17 20:10:24'),
(1, 8, 2, 'Réalisation de test tuberculinique', NULL, 0.5, '2016-11-17 20:10:24'),
(1, 8, 3, 'Lecture d\'un timbre tuberculinique et transmission d\'informations au médecin prescripteur', NULL, 1, '2016-11-17 20:10:56'),
(1, 10, 1, 'Administration et surveillance d’une thérapeutique orale au domicile(*) des patients présentant des troubles psychiatriques, avec établissement d’une fiche de surveillance', NULL, 1, '2016-11-17 20:15:24'),
(1, 10, 2, 'Surveillance et observation d\'un patient lors de la mise en œuvre d\'un traitement ou lors de la modification\r\nde celui-ci, sauf pour les patients diabétiques insulino-dépendants, avec établissement d\'une fiche de\r\nsurveillance', NULL, 1, '2016-11-17 20:15:24'),
(1, 11, 1, 'la première démarche de soins infirmiers', NULL, 1.5, '2016-11-17 20:20:06'),
(1, 11, 2, ' démarches de soins infirmiers suivantes', NULL, 1, '2016-11-17 20:20:06'),
(1, 11, 3, 'Séance de soins infirmiers, par séance d\'une demi-heure, à raison de 4 au maximum par 24 heures La séance de soins infirmiers comprend l\'ensemble des actions de soins liées aux fonctions d\'entretien et de continuité de la vie, visant à protéger, maintenir, restaurer ou compenser les capacités d\'autonomie de la personne ', NULL, 3, '2016-11-17 20:21:37'),
(1, 11, 4, 'Mise en œuvre d\'un programme d\'aide personnalisée en vue d\'insérer ou de maintenir le patient dans son cadre de vie, pendant lequel l\'infirmier l\'aide à accomplir les actes quotidiens de la vie, éduque son entourage ou organise le relais avec les travailleurs sociaux, par séance d\'une demi-heure, à raison de 4 au maximum par 24 heures', NULL, 3.1, '2016-11-17 20:21:37'),
(1, 11, 5, ' Séance hebdomadaire de surveillance clinique infirmière et de prévention, par séance d\'une demi-heure ', NULL, 4, '2016-11-17 20:22:17'),
(1, 12, 1, 'Entre huit heures et vingt heures', '', 13, '2016-11-17 20:24:00'),
(1, 12, 2, 'Entre vingt heures et huit heures', '', 16, '2016-11-17 20:24:18'),
(2, 1, 1, 'Cathéter péritonéal', '', 4, '2016-11-17 20:26:14'),
(2, 1, 2, 'Cathéter extériorisé ou site implantable ou cathéter veineux central implanté par voie périphérique', '', 4, '2016-11-17 20:26:15'),
(2, 2, 1, 'injection d\'analgésique(s), à l\'exclusion de la première, par l\'intermédiaire d\'un cathéter intrathécal ou péridural', NULL, 5, '2016-11-17 20:28:40'),
(2, 2, 2, 'injection intraveineuse par l\'intermédiaire d\'un site implanté, y compris l\'héparinisation et le pansement', NULL, 4, '2016-11-17 20:28:40'),
(2, 2, 3, 'Injection intraveineuse par l\'intermédiaire d\'un cathéter central, y compris l\'héparinisation et le pansement ', NULL, 3, '2016-11-17 20:29:50'),
(2, 2, 4, 'Prélèvement sanguin sur cathéter veineux central extériorisé ou chambre implantable', NULL, 1, '2016-11-17 20:29:50'),
(2, 3, 1, 'Forfait pour séance de perfusion courte, d\'une durée inférieure ou égale à une heure, sous surveillance continue', NULL, 9, '2016-11-17 20:30:46'),
(2, 3, 2, 'Supplément forfaitaire pour surveillance continue d\'une perfusion au-delà de la première heure, par heure (avec un\r\nmaximum de cinq heures) ', NULL, 6, '2016-11-17 20:31:39'),
(2, 3, 3, 'Forfait pour séance de perfusion d\'une durée supérieure à une heure, avec organisation d’une surveillance ', NULL, 14, '2016-11-17 20:31:39'),
(2, 3, 4, 'Forfait pour arrêt et retrait du dispositif d\'une perfusion, y compris le pansement, la tenue du dossier de soins\r\néventuellement la transmission l’informations nécessaires au médecin prescripteur ; ce forfait ne se cumule pas avec un forfait de perfusion sous surveillance continue', NULL, 5, '2016-11-17 20:32:51'),
(2, 3, 5, 'Forfait pour l\'organisation de la surveillance d\'une perfusion, de la planification des soins, y compris la\r\ncoordination avec les autres professionnels de santé, les prestataires et les services sociaux, à l\'exclusion du jour de\r\nla pose et de celui du retrait, par jour (ne peuvent être notés, à l’occasion de cet acte , des frais de déplacements ou\r\ndes majorations de nuit ou de dimanche) ', NULL, 5, '2016-11-17 20:32:51'),
(2, 3, 6, 'Changement de flacon(s) ou branchement en Y sur dispositif en place ou intervention pour débranchement ou\r\ndéplacement du dispositif ou contrôle du débit, pour une perfusion sans surveillance continue, en dehors de la\r\nséance de pose ', NULL, 4.1, '2016-11-17 20:33:20'),
(2, 4, 1, 'Séance d\'aérosols à visée prophylactique', NULL, 5, '2016-11-17 20:36:48'),
(2, 4, 2, 'Injection intramusculaire ou sous-cutanée ', NULL, 1.5, '2016-11-17 20:36:48'),
(2, 4, 3, 'Injection intraveineuse', NULL, 2.5, '2016-11-17 20:36:48'),
(2, 4, 4, 'Injection intraveineuse d\'un produit de chimiothérapie anticancéreuse', NULL, 7, '2016-11-17 20:37:37'),
(2, 4, 5, 'Forfait pour séance de perfusion courte, d\'une durée inférieure ou égale à une heure, sous surveillance\r\ncontinue ', NULL, 10, '2016-11-17 20:37:37'),
(2, 4, 6, 'Supplément forfaitaire pour surveillance continue d\'une perfusion au-delà de la première heure, par heure\r\n(avec un maximum de cinq heures)', NULL, 6, '2016-11-17 20:38:29'),
(2, 4, 7, 'Forfait pour séance de perfusion d\'une durée supérieure à une heure avec organisation d’une surveillance ', NULL, 15, '2016-11-17 20:38:29'),
(2, 4, 8, 'Forfait pour l\'organisation de la surveillance d\'une perfusion, de la planification des soins, y compris la\r\ncoordination avec les autres professionnels de santé, les prestataires et les services sociaux, à l\'exclusion\r\ndu jour de la pose et de celui du retrait, par jour (ne peuvent être notés, à l’occasion de cet acte, des frais de déplacements ou des majorations de nuit ou de dimanche) ', NULL, 4, '2016-11-17 20:39:31'),
(2, 4, 9, 'Forfait pour arrêt et retrait du dispositif d\'une perfusion, y compris le pansement, la tenue du dossier de\r\nsoins éventuellement la transmission d’informations nécessaires au médecin prescripteur; ce forfait ne se\r\ncumule pas avec un forfait de perfusion sous surveillance continue', NULL, 5, '2016-11-17 20:39:31'),
(2, 4, 10, 'Changement de flacon(s) ou branchement en Y sur dispositif en place ou intervention pour\r\ndébranchement ou déplacement du dispositif ou contrôle du débit, pour une perfusion sans surveillance\r\ncontinue, en dehors de la séance de pose ', NULL, 4.1, '2016-11-17 20:40:04'),
(2, 5, 1, 'Séance de perfusion intraveineuse d\'antibiotiques, quelle que soit la voie d\'abord, sous\r\nsurveillance continue,\r\nchez un patient atteint de mucoviscidose, la séance. ', NULL, 15, '2016-11-17 20:43:50'),
(2, 5, 2, 'Surveillance et observation d’un patient diabétique insulino-traité dont l’état nécessite une adaptation régulière des doses d’insuline en fonction des indications de la prescription médicale et du résultat du contrôle extemporané, y compris la tenue d’une fiche de surveillance', NULL, 1, '2016-11-17 20:42:41'),
(2, 5, 3, 'Injection sous-cutanée d’insuline', NULL, 1, '2016-11-17 20:42:41'),
(2, 5, 4, 'Séance hebdomadaire de surveillance clinique et de prévention, d\'une durée d\'une demi-heure, pour un patient\r\ninsulino-traité de plus de 75 ans ', NULL, 4, '2016-11-17 20:43:50'),
(2, 5, 5, 'Pansement lourd et complexe pour un patient diabétique insulino-traité, nécessitant des conditions d’asepsie rigoureuses et une détersion avec défibrination', NULL, 4, '2016-11-17 20:44:50'),
(2, 6, 1, 'Irrigation colique dans les suites immédiates d\'une stomie définitive, incluant le pansement et la surveillance de l\'évacuation, avec un maximum de vingt séances, par séance', NULL, 4, '2016-11-17 20:46:16'),
(2, 6, 2, 'Dialyse péritonéale, avec un maximum de quatre séances par jour', NULL, 4, '2016-11-17 20:46:16'),
(2, 6, 3, 'Dialyse péritonéale par cycleur :\r\n- branchement ou débranchement, par séance', NULL, 4, '2016-11-17 20:47:28'),
(2, 6, 4, 'Dialyse péritonéale par cycleur :\r\norganisation de la surveillance, par période de douze heures ', NULL, 4, '2016-11-17 20:47:28');

CREATE TABLE `soins_visite` (
  `visite` int(11) NOT NULL,
  `id_categ_soins` int(11) NOT NULL,
  `id_type_soins` int(11) NOT NULL,
  `id_soins` int(11) NOT NULL,
  `prevu` tinyint(1) NOT NULL,
  `realise` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `soins_visite` (`visite`, `id_categ_soins`, `id_type_soins`, `id_soins`, `prevu`, `realise`) VALUES
(1, 1, 1, 10, 1, 0),
(1, 1, 5, 2, 1, 0),
(2, 1, 1, 10, 1, 0),
(2, 1, 7, 1, 1, 0),
(3, 1, 2, 5, 1, 0),
(3, 1, 8, 1, 1, 0),
(4, 1, 5, 2, 1, 0),
(4, 1, 7, 1, 1, 0),
(5, 1, 1, 12, 1, 0),
(5, 1, 1, 15, 1, 0),
(5, 1, 2, 5, 1, 0),
(6, 1, 1, 1, 1, 0),
(6, 1, 1, 2, 1, 0),
(7, 1, 1, 3, 1, 0),
(8, 1, 1, 4, 1, 0),
(8, 1, 1, 5, 1, 0),
(8, 1, 1, 6, 1, 0),
(9, 1, 1, 7, 1, 0),
(9, 1, 2, 5, 1, 0);

CREATE TABLE `temoignage` (
  `id` int(11) NOT NULL,
  `personne_login` int(11) NOT NULL,
  `contenu` mediumtext NOT NULL,
  `date` datetime NOT NULL,
  `valide` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `temoignage` (`id`, `personne_login`, `contenu`, `date`, `valide`) VALUES
(1, 1, 'M\'enfin...', '0000-00-00 00:00:00', 1),
(2, 9, 'Je suis citoyen Russe, laissez-moi téléphoner à l´ambassade du Maroc!', '0000-00-00 00:00:00', 0),
(3, 6, 'Rogntudjuù!!', '0000-00-00 00:00:00', 0);

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `jeton` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `type_soins` (
  `id_categ_soins` int(11) NOT NULL,
  `id_type_soins` int(11) NOT NULL,
  `libel` text NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_soins` (`id_categ_soins`, `id_type_soins`, `libel`, `description`) VALUES
(1, 1, 'Prélèvements et injections', ''),
(1, 2, 'Pansements courants', ''),
(1, 3, 'Pansements lourds et complexes', 'nécessitant des conditions d\'asepsie rigoureuse'),
(1, 4, 'Pose de sonde et alimentation', ''),
(1, 5, 'Soins portant sur l\'appareil respiratoire', ''),
(1, 6, 'Soins portant sur l\'appareil génito-urinaire', ''),
(1, 7, 'Soins portant sur l\'appareil digestif', ''),
(1, 8, 'Tests et soins portant sur l\'enveloppe cutanée', ''),
(1, 10, 'Surveillance et observation d\'un patient à domicile', ''),
(1, 11, 'Soins infirmiers à domicile pour un patient, quel que soit son âge, en situation dépendance temporaire on permanente', 'Élaboration de la démarche de soins infirmiers à domicile nécessaires à la réalisation de séances de soins\r\ninfirmiers ou de séances de surveillance clinique infirmière et de prévention d\'un patient dépendant ou à la\r\nmise en œuvre d\'un programme d\'aide personnalisée en vue de favoriser son maintien, son insertion ou sa\r\nréinsertion dans son cadre de vie familial et social. '),
(1, 12, 'Garde à domicile', 'Garde d\'un malade à domicile, nécessitant une surveillance constante et exclusive et des soins infirmiers\r\nrépétés, y compris les soins d\'hygiène, effectuée selon un protocole écrit'),
(2, 1, 'Soins d\'entretien des cathéthers', 'Séance d\'entretien de cathéter(s) en dehors des perfusions, y compris le pansement: '),
(2, 2, 'Injections et prélèvements', ''),
(2, 3, 'Perfusion', 'Ces actes sont réalisés soit en application d’une prescription médicale qui sauf urgence, est écrite, qualitative et quantitative, datée et signée soit en application\r\nd’un protocole écrit, qualitatif et quantitatif préalablement établi, daté et signé par un médecin.\r\nLa séance de perfusion permet d\'administrer chez un patient des solutés et/ou des médicaments de façon continue ou discontinue par voie veineuse ou par voie\r\nsous cutanée ou par voie endorectale.\r\nSelon le protocole thérapeutique établi par le médecin prescripteur, la perfusion nécessite soit la surveillance continue de l’infirmier, soit l’organisation d’une\r\nsurveillance pour les perfusions dont la durée est supérieure à une heure.\r\nLa séance de perfusion sous surveillance continue comprend la préparation des produits à injecter, la préparation du matériel de perfusion, la perfusion des\r\nproduits de façon successive ou simultanée, la surveillance et l’arrêt de la perfusion avec le pansement.\r\nLa séance de perfusion supérieure à une heure, sans surveillance continue, comprend la préparation des produits à injecter, la préparation du matériel de\r\nperfusion, la pose de la perfusion, l’organisation de contrôles et la gestion des complications éventuelles ; ces contrôles et les interventions à domicile pour\r\ncomplications peuvent donner lieu à des frais de déplacement. '),
(2, 4, 'Actes du traitement à domicile d\'un patient immunodéprimé ou cancéreux', ''),
(2, 5, 'Traitement à domicile d\'un patient atteint de mucoviscidose par perfusions d\'antibiotiques sous surveillance continue selon le protocole thérapeutique rédigé par un des médecins de l\'équipe soignant le patient.', ''),
(2, 6, 'Prise en charge à domicile d’un patient insulino-traité', ''),
(2, 7, 'Soins portant sur l\'appareil digestif et urinaire', '');

CREATE TABLE `visite` (
  `id` int(11) NOT NULL,
  `patient` int(11) NOT NULL,
  `infirmiere` int(11) NOT NULL,
  `date_prevue` datetime NOT NULL,
  `date_reelle` datetime DEFAULT NULL,
  `duree` int(11) NOT NULL,
  `compte_rendu_infirmiere` text,
  `compte_rendu_patient` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `visite` (`id`, `patient`, `infirmiere`, `date_prevue`, `date_reelle`, `duree`, `compte_rendu_infirmiere`, `compte_rendu_patient`) VALUES
(1, 5, 3, '2024-05-18 14:00:00', '0000-00-00 00:00:00', 60, '', NULL),
(2, 6, 3, '2024-06-03 09:00:00', '0000-00-00 00:00:00', 30, '', NULL),
(3, 5, 3, '2024-05-31 10:30:00', '0000-00-00 00:00:00', 30, '', NULL),
(4, 5, 3, '2024-05-18 16:30:00', '0000-00-00 00:00:00', 45, '', NULL),
(6, 9, 3, '2024-06-02 09:15:00', '0000-00-00 00:00:00', 40, '', NULL),
(7, 11, 3, '2024-06-01 15:20:00', '0000-00-00 00:00:00', 35, '', NULL),
(8, 14, 3, '2024-06-02 16:40:00', '0000-00-00 00:00:00', 33, '', NULL),
(9, 9, 3, '2024-05-31 14:00:00', '0000-00-00 00:00:00', 50, NULL, NULL);


ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `badge`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `categorie_indisponibilite`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `categ_soins`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `chambre_forte`
  ADD PRIMARY KEY (`badge`,`date`);

ALTER TABLE `convalescence`
  ADD PRIMARY KEY (`id_patient`,`id_lieux`,`date_deb`),
  ADD KEY `id_lieux` (`id_lieux`);

ALTER TABLE `indisponibilite`
  ADD PRIMARY KEY (`infirmiere`,`date_debut`),
  ADD KEY `infirmiere` (`infirmiere`),
  ADD KEY `categorie` (`categorie`);

ALTER TABLE `infirmiere`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `infirmiere_badge`
  ADD PRIMARY KEY (`id_infirmiere`,`id_badge`,`date_deb`),
  ADD KEY `id_badge` (`id_badge`);

ALTER TABLE `lieu_convalescence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact` (`contact`);

ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personne_de_confiance` (`personne_de_confiance`),
  ADD KEY `infirmiere_souhait` (`infirmiere_souhait`);

ALTER TABLE `personne`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `personne_login`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `soins`
  ADD PRIMARY KEY (`id_categ_soins`,`id_type_soins`,`id`),
  ADD KEY `id_categ_soins` (`id_categ_soins`),
  ADD KEY `id_type_soins` (`id_type_soins`);

ALTER TABLE `soins_visite`
  ADD PRIMARY KEY (`visite`,`id_categ_soins`,`id_type_soins`,`id_soins`),
  ADD KEY `id_categ_soins` (`id_categ_soins`),
  ADD KEY `id_type_soins` (`id_type_soins`),
  ADD KEY `id_soins` (`id_soins`),
  ADD KEY `visite` (`visite`),
  ADD KEY `FK1` (`id_categ_soins`,`id_type_soins`,`id_soins`);

ALTER TABLE `temoignage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personne_login` (`personne_login`);

ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_login` (`id_login`);

ALTER TABLE `type_soins`
  ADD PRIMARY KEY (`id_categ_soins`,`id_type_soins`),
  ADD KEY `id_categ_soins` (`id_categ_soins`),
  ADD KEY `id_type_soins` (`id_type_soins`);

ALTER TABLE `visite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient` (`patient`),
  ADD KEY `infirmiere` (`infirmiere`);


ALTER TABLE `badge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

ALTER TABLE `categorie_indisponibilite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

ALTER TABLE `categ_soins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `personne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

ALTER TABLE `temoignage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `visite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


ALTER TABLE `infirmiere`
  ADD CONSTRAINT `infirmiere_ibfk_1` FOREIGN KEY (`id`) REFERENCES `personne` (`id`);

ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`id`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`personne_de_confiance`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `patient_ibfk_3` FOREIGN KEY (`infirmiere_souhait`) REFERENCES `infirmiere` (`id`);

ALTER TABLE `type_soins`
  ADD CONSTRAINT `type_soins_ibfk_1` FOREIGN KEY (`id_categ_soins`) REFERENCES `categ_soins` (`id`);

ALTER TABLE `visite`
  ADD CONSTRAINT `visite_ibfk_1` FOREIGN KEY (`patient`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `visite_ibfk_2` FOREIGN KEY (`infirmiere`) REFERENCES `infirmiere` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
