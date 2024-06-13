-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 13 juin 2024 à 12:27
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
-- Base de données : `ecf-back`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_23A0E66A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `titre`, `description`, `date`, `user_id`) VALUES
(1, 'Mon premier article', 'Réduire l’empreinte écologique de votre entrepôt, c’est également vous assurer que les déchets qui y sont produits y trouvent une fin de vie adéquate. Pour ce faire, vous devez mettre en place un système de tri et de valorisation des 5 flux de déchets les', '2024-06-12', 1),
(3, 'D\'où vient-il ?', 'Réduire l’empreinte écologique de votre entrepôt, c’est également vous assurer que les déchets qui y sont produits y trouvent une fin de vie adéquate. Pour ce faire, vous devez mettre en place un système de tri et de valorisation des 5 flux de déchets les', '2024-06-07', 2),
(4, 'Évitez la surconsommation', 'Réduire l’empreinte écologique de votre entrepôt, c’est également vous assurer que les déchets qui y sont produits y trouvent une fin de vie adéquate. Pour ce faire, vous devez mettre en place un système de tri et de valorisation des 5 flux de déchets les', '2024-06-11', 1),
(5, 'Utiliser des emballages réutilisables', 'Vous le savez sans doute : la tendance écologique du moment, c’est bel et bien la fin de l’emballage à usage unique. Tandis que chez les particuliers, cette tendance invite à consommer en vrac, pour les entreprises, il s’agit surtout de choisir des emball', '2024-06-08', 1),
(6, 'Faire de la compensation carbone', 'Dernière pratique éco-responsable à envisager pour votre stratégie logistique : la compensation carbone. L’idée est d’investir dans des projets écologiques, sociaux et éthiques, qui réduisent les émissions de CO2 à l’échelle mondiale, pour compenser toute', '2024-06-12', 1);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240612075421', '2024-06-12 08:09:32', 67),
('DoctrineMigrations\\Version20240612081037', '2024-06-12 08:11:07', 127),
('DoctrineMigrations\\Version20240612091711', '2024-06-12 09:17:30', 223),
('DoctrineMigrations\\Version20240613071815', '2024-06-13 07:18:37', 91),
('DoctrineMigrations\\Version20240613085542', '2024-06-13 08:55:58', 82);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_LOGIN` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `roles`, `email`, `is_verified`) VALUES
(1, 'greg', '$2y$13$x5sSgavc9luWlTSQ6NEdW.5CHSdGW6Vmt3.zTDPNVUVjE.4cnN2Ca', '[\"ROLE_ADMIN\"]', 'gregoire.herbin@free.fr', 0),
(2, 'jean', '$2y$13$vOMlnEFTUc0uR5XdZLoea.aXZWG/.n6pTeTDw/ztxZZuhzXJoTZa.', '[\"ROLE_EDITOR\"]', 'jean.dupond@free.fr', 0),
(3, 'Pierre', '$2y$13$7ZtpoPv13XX8bHy1XIcnTuiB9vyfihDJMsYKtq1LgpGEn6.ibaI12', '[\"ROLE_EDITOR\"]', 'pierre@gmail.com', 0),
(4, 'Paul', '$2y$13$hOUpYsIjXlnR6GEP0Q6CPeaelQg/sxtYp2w.fzdAsjUsTc.tn/ZWe', '[]', 'paulo@gmail.com', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E66A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
