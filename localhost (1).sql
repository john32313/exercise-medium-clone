-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 11 déc. 2020 à 21:23
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `clone_medium`
--
CREATE DATABASE IF NOT EXISTS `clone_medium` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `clone_medium`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `author` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_like` int(11) DEFAULT NULL,
  `date_writed` date NOT NULL,
  `image_article` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug_article` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `author`, `title`, `categorie`, `number_like`, `date_writed`, `image_article`, `content`, `slug_article`) VALUES
(1, 'Jonathan', 'Mon super article', 'Informatique', 0, '2020-12-11', 'url.jpg', 'lorem ipsum blablbalba', 'mon-super-article'),
(2, 'Eric', 'Mes Recette Préféré', 'recette', 5, '2020-12-11', 'urlrecette.png', 'j\'aime les tartes, les pizzas et les hamburgers', 'mes-recettes-preferes'),
(3, 'Albert', 'Vive le PHP', 'developpement', 55, '2020-12-11', 'urlphp.png', 'lorem ipsum dolor blabjazhehza php', 'vive-le-php'),
(4, 'Alain', 'Moi c\'est Javascript', 'developpement', 14, '2020-12-11', 'js.png', 'lorem ipsum dolor blabjazhehza js', 'moi-cest-javascript');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `author` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_posted` datetime NOT NULL,
  `avatar_author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `author`, `date_posted`, `avatar_author`, `comment_text`, `id_article`) VALUES
(1, 'Auhtor1', '2020-12-11 15:59:06', 'urlauhtor.png', 'super article', 2),
(2, 'Auhtor45', '2020-12-11 15:59:37', 'urlauhtor.png', 'super article js', 4),
(3, 'Auhtor5461', '2020-12-11 16:00:12', 'urlauhtor.png', '2eme comme art js', 4);

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `title_tag` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug_tag` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tag`
--

INSERT INTO `tag` (`id`, `title_tag`, `slug_tag`) VALUES
(1, 'JavaScript', 'javascript'),
(2, 'Node Js', 'node-js'),
(3, 'Dév Wev', 'dev-web'),
(4, 'Recette de Cuisine', 'recette-de-cuisine');

-- --------------------------------------------------------

--
-- Structure de la table `tag_article`
--

CREATE TABLE `tag_article` (
  `id` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tag_article`
--

INSERT INTO `tag_article` (`id`, `id_tag`, `id_article`) VALUES
(1, 4, 2),
(2, 3, 3),
(3, 1, 4),
(4, 2, 4),
(5, 3, 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_article` (`id_article`);

--
-- Index pour la table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tag_article`
--
ALTER TABLE `tag_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_article` (`id_article`),
  ADD KEY `id_tag` (`id_tag`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `tag_article`
--
ALTER TABLE `tag_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`);

--
-- Contraintes pour la table `tag_article`
--
ALTER TABLE `tag_article`
  ADD CONSTRAINT `tag_article_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `tag_article_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
