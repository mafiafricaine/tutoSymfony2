-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 18 juil. 2024 à 10:51
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `recipe_dev2`
--

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
('DoctrineMigrations\\Version20240405133912', '2024-04-05 13:52:40', 122),
('DoctrineMigrations\\Version20240408095707', '2024-04-08 09:57:46', 75),
('DoctrineMigrations\\Version20240527074752', '2024-05-27 09:49:19', 85),
('DoctrineMigrations\\Version20240527094635', '2024-05-27 11:47:22', 142),
('DoctrineMigrations\\Version20240530092222', '2024-05-30 11:23:06', 176),
('DoctrineMigrations\\Version20240603080138', '2024-06-03 10:02:02', 153),
('DoctrineMigrations\\Version20240624093021', '2024-06-24 11:31:05', 97),
('DoctrineMigrations\\Version20240708133757', '2024-07-08 15:39:10', 244),
('DoctrineMigrations\\Version20240715140117', '2024-07-15 16:02:29', 165),
('DoctrineMigrations\\Version20240718094355', '2024-07-18 11:47:46', 84);

-- --------------------------------------------------------

--
-- Structure de la table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
CREATE TABLE IF NOT EXISTS `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `duration` int DEFAULT NULL,
  `image_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `image_size` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A369E2B5A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipes`
--

INSERT INTO `recipes` (`id`, `title`, `slug`, `content`, `created_at`, `updated_at`, `duration`, `image_name`, `user_id`, `image_size`) VALUES
(1, 'Poulet Mayo', 'poulet-mayo', 'Du poulet et de la mayonnaise, la base pour moi. Le bon poulet rôti du dimanche accompagné de pommes de terre mais aujourd\'hui je vais vous parler d\'une tout autre version. Le poulet mayo de la RDC qui est très populaire et qui a vu le jour il y a une dizaine d\'années à peine dans les bars et les rues de Kinshasa.\r\n \r\nLe poulet mayo est tout simplement du poulet cuit au feu de bois, qui va ensuite être emballé dans du papier (en papillote) et cuit à l\'étouffé avec des oignons, poivrons. On va ensuite l\'enrober généreusement de mayonnaise.\r\nLe poulet mayo a prit une place importante dans la street food congolaise au même titre que les kamundele (brochettes), le dibi congolais version chèvre avec le ntaba. .. On parle de street food et de plat conviviaux qui sont généralement cuits en barbecue mais voici une version au four hyper simple à réaliser. J\'ai hâte de démarrer la saison des barbecues pour tester la version braisé au charbon de bois qui est juste dingue.\r\n\r\nC\'est proposé avec des bananes plantains (makemba) mais aussi avec de la chikwangue (bâton de manioc). La chikwangue est une racine/feuille de manioc écrasée et cuite entouré d\'une feuille.\r\nIngrédients pour 4 personnes\r\n1 poulet entier\r\n\r\n4 c.à s. d\'huile d\'olive\r\n\r\n1 c.à s. de gingembre en poudre\r\n\r\nSel et poivre\r\n\r\n1 c.à s. de muscade en poudre\r\n\r\n1 zestes d\'un citron vert\r\n\r\n1 c.à s. d\'épices\r\n\r\n2 poivrons\r\n\r\n1 jus d\'un citron jaune ( bio )\r\n\r\n1 oignon blanc\r\n\r\n2 branche d\'oignons verts\r\n\r\n3 c.à s. de mayonnaise\r\n\r\n\r\nÉtape 1/3\r\nPrenez votre poulet entier et coupez les parties indésirables (croupe de poulet,..). Nettoyez le poulet avec un citron jaune en frottant le citron coupé en deux sur et dans le poulet. Mettez votre poulet dans un grand récipient et ajoutez y l\'huile, le gingembre, le sel, le poivre , la muscade , l\'ail écrasé, le zeste et jus du citron vert, le mélange d\'épice pour poulet. Mélangez le tout et mettez au frigo pour minimum 4 heures voir une nuit.\r\n\r\nÉtape 2/3\r\nAprès le temps de pause, préchauffez votre four à 200 degrés sur chaleur tournante. Mettez votre poulet sur une plaque recouverte de papier sulfurisé. Faites le cuire durant une grosse demie heure voir 40 minutes.\r\n\r\nÉtape 3/3\r\nAprès ce temps de cuisson, sortez le et coupez le en morceaux. Mettez ces morceaux dans du papier sulfurisé, ajoutez y vos poivrons et oignons émincés, les jeunes oignons, le jus du citron jaune ainsi que la mayonnaise. Mélangez le tout.', '2024-04-11 06:57:31', '2024-07-18 12:01:35', 60, 'img-3693-500x500-6698e7ffb5bd4349035783.jpg', 2, 83149),
(2, 'Pondu (Saka Saka)', 'pondu-saka-saka', 'Pour ceux et celles qui ne savent pas ce qu\'est le pondu, il s\'agit en fait de feuilles de manioc pilées préparées avec des aubergines, poireaux, c\'est un accompagnement très apprécié au Congo.\r\n\r\nIngrédients pour 8 personnes\r\n2 sachets de pondu\r\n\r\n1 piment\r\n\r\n1 aubergine\r\n\r\n1 poireau\r\n\r\n2 oignons blancs\r\n\r\n2 gousses d\'ail ( bio )\r\n\r\n2 cubes de bouillon de légumes\r\n\r\n1 pincée de sel\r\n\r\n200 grammes de cacahuètes ( moulues )\r\n\r\n\r\nÉtape 1/5\r\nPour commencer laisser dégeler entièrement le pondu dans un casserole. Le rincer plusieurs fois afin d’éliminer toutes les « saletés »(utiliser une passoire à très très petits trous). Une fois bien rincé à l’eau claire ajoutez un peu d\'eau et le faire cuire durant 20 minutes.\r\n\r\nÉtape 2/5\r\nEnsuite ,jetez l’eau puis remettez de l’eau propre(environ 3L) et remettez le pondu sur feu moyen(+ 1 cuillère à café de bicarbonate de soude alimentaire afin d’accélérer le temps de cuisson). Mettez y le piment (sans le percer) cuisez le tout durant 30 minutes. Ajoutez l’aubergine coupée en morceaux, les oignons émincés, l’ail râpé,le poireau émincé, le bouillon cube de légumes,et l’huile de palme/ou l’huile olive.\r\n\r\nÉtape 3/5\r\nAssaisonnez avec le sel selon vos goûts et laissez cuire au moins 2-3 heures,puis mélangez(rajoutez de l\'eau entre temps, si besoin). 20 minutes avant la fin de cuisson, rajoutez votre poudre d\'arachide ( cacahuètes que vous avez moulues au blinder et qui sont devenus une poudre). Ne mélangez pas et laissez cuire tranquillement.\r\n\r\nÉtape 4/5\r\nLe pondu doit être bien tendre et l’eau doit avoir très très bien réduit. Moi j’adore le manger avec du riz blanc. C’est un délice !\r\n\r\nÉtape 5/5\r\nBon appétit mes gourmands.', '2024-04-11 07:08:16', '2024-07-18 11:55:46', 130, 'vegan-saka-saka-congolese-cassava-leaf-spinach-stew-xx1-scaled-6698e6a2708c4766715659.jpg', 1, 623787),
(3, 'Poulet DG', 'poulet-dg', 'Aujourd\'hui, je vous présente une recette tout droit venue du Cameroun. C\'est leur plat national. DG veut dire directeur général. Le poulet DG est né dans les années 80 et à cette époque, il était réservé aux personnes d’une certaine importance. Depuis il est devenu accessible à tous. C’est un bon ragoût avec tout ce que j’aime dedans et en plus ce petit goût sucré-salé qu’apporte la banane plantain au plat toute la famille adore ce plat!\r\n\r\nIngrédients pour 4 personnes\r\n1 poulet entier\r\n\r\n200 grammes d\'haricots verts\r\n\r\n3 carotte\r\n\r\n2 poivrons\r\n\r\n2 gousses d\'ail\r\n\r\n3 bananes plantain jaunes\r\n\r\n1 boîte de tomate ( pelées )\r\n\r\nLaurier\r\n\r\n1 c.à s. de persil ( haché )\r\n\r\n1 c.à.c de gingembre en poudre\r\n\r\n1 cube de bouillon de poulet\r\n\r\n1 verre d\'eau\r\n\r\n2 c.à s. d\'huile d\'olive\r\n\r\nSel et poivre\r\n\r\n\r\nÉtape 1/3\r\nCoupez le poulet en plus ou moins 4 parts, si il est en entier et le nettoyer avec du citron. Mettez l’huile dans une marmite et faites frire les morceaux de poulet.\r\n\r\nÉtape 2/3\r\nPendant ce temps épluchez et coupez en fines lamelles les oignons et les poivrons. Une fois les morceaux de poulet bien doré, les retirer et réservez. Faites rissoler les oignons avec l’ail écrasé (environ 3 minutes) et lorsqu’ils deviennent translucides ajouter la boîte de tomates pelées. Laissez mijoter 5 minutes. Ajoutez les haricots verts, les poivrons et les carottes. Ajoutez le gingembre, le piment en poudre, le bouillon et les feuilles de laurier. Saler et poivrer.\r\n\r\nÉtape 3/3\r\nAjoutez le poulet, le verre d’eau et laisser mijoter environ 30 minutes. Faites frire les bananes plantain et les ajouter dans les 10 dernières minutes de cuisson. C\'est un plat complet donc il se mange comme cela. Bon appétit les gourmands.', '2024-04-11 07:08:52', '2024-07-18 12:01:54', 55, 'poulet-dg-from-cameroon-6698e812c3f41079845020.jpg', 2, 505672),
(8, 'Tajin d\'agneau', 'tajin-d-agneau', 'Tu prends un agneau.', '2024-04-19 12:54:53', '2024-07-18 12:02:09', 95, 'no-image-available-6698e8216d02d249178178.svg', 2, 2046),
(25, 'Recette sans image', 'recette-sans-image', 'Tu ne peux pas le faire monsieur', '2024-05-27 10:06:58', '2024-07-18 11:58:58', 5, 'african-food-logo-map-design-600nw-2222642379-6698e76244809799577269.webp', 1, 9376),
(26, 'Mikate (beignet)', 'mikate-beignet', 'Comment faire de bon beignets (mikate) pour accompagner votre repas', '2024-05-27 10:43:42', '2024-07-18 12:02:22', 50, 'mikate-768x1024-6698e82ed98f7316265102.jpeg', 2, 169230),
(27, 'Tilapia braisé', 'tilapia-braise', 'Comment faire un bon tilapia braisé au makala', '2024-05-27 10:46:03', '2024-07-18 11:59:19', 45, '20230624173436-img-6060-1024x1536-6698e7775e270712762754.jpg', 1, 104657),
(29, 'Sushi Au Saumon', 'sushi-au-saumon', 'Tu prends du riz et du saumon.', '2024-06-03 09:45:57', '2024-07-18 12:00:18', 45, '20230624173436-img-6060-1024x1536-6698e7b22de69636994370.jpg', 1, 104657),
(30, 'Recette de James Bond', 'recette-de-james-bond', 'Voici la recette de l\'agent 007 le plus connu au monde', '2024-06-24 09:33:40', '2024-07-18 12:00:41', 40, 'james-bond-sean-connery-6698e7c967072816004855.jpg', 1, 24872),
(32, 'qf:klklskfqs', 'qf-klklskfqs', 'mksqjkfjlkqlsknflmqkljsknflkmqkslflkmlqskfl', '2024-07-18 12:32:54', '2024-07-18 12:32:54', 5, 'default.svg', 2, NULL),
(33, 'kws;,ws;vnw<', 'kws-ws-vnw', 'kljwsflmklksfmlqklsfmlqks', '2024-07-18 12:35:47', '2024-07-18 12:35:59', 5, NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reset_password_request`
--

INSERT INTO `reset_password_request` (`id`, `user_id`, `selector`, `hashed_token`, `requested_at`, `expires_at`) VALUES
(1, 3, 'eenMyWXrMhTjMgKqrn2h', 'RMN6wmcO9OrMsu0u9fAWYim6GyP74LrcRK3l6cqjZaQ=', '2024-07-08 15:57:09', '2024-07-08 16:57:09'),
(2, 2, 'V0qWnVBtWOunltEfKxdV', 'N8ucJnzrscu4NBzLe76Kj6VHway/F2PB8ah1/2kM9pU=', '2024-07-12 08:51:23', '2024-07-12 09:51:23'),
(3, 1, 'RdS9ymqcwabauGHC0IUM', 'KZLgynsf0+l7hbGhY/LgXggTgZw0PRxzWPzSv30Lt9k=', '2024-07-12 08:53:44', '2024-07-12 09:53:44'),
(5, 5, 'NllsBWPHzYdIvwfqM2bk', 'ft+jCIu5xIeMoBiaczGC1BfFDycbUizOLINsg2P1pxA=', '2024-07-12 09:03:10', '2024-07-12 10:03:10'),
(8, 6, 'HqWpsPGi4u1vsk4Iaki1', 'w1uSX2h5nCdw1u5eS6CXEMCAq52M5cLGsvF7mA0CU/c=', '2024-07-12 09:11:17', '2024-07-12 10:11:17');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `is_verified` tinyint(1) NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_size` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`, `created_at`, `updated_at`, `is_verified`, `image_name`, `image_size`) VALUES
(1, 'jamesbond@cfitech.be', '[]', '$2y$13$7NkWDSYqEejJGeiUNDSCJehmIoM5h5Pg10ahyqKTW.XT3KLwFN49K', 'James', 'Bond', '2024-06-03 09:30:46', '2024-07-16 10:49:33', 1, 'james-bond-sean-connery-6696341dd8cfd096806380.jpg', 24872),
(2, 'julien@cfitech.be', '[]', '$2y$13$Fz.xemFNS3iKcCYiq6SvxeXu/RRNAkmm8jptmRWYqtWUWRTJUHiwi', 'Julien', 'Dunia', '2024-06-03 09:31:56', '2024-07-18 12:26:56', 1, 'default.jpg', NULL),
(3, 'rose@cfitech.be', '[]', '$2y$13$DdzsfqRDia8KJiVA8j3bBeeGuHuolmrU4fK7egxcx4fLQBHBM44hq', 'Rose', 'Cfitech', '2024-06-07 12:22:41', '2024-06-07 12:22:41', 0, 'default.jpg', NULL),
(4, 'testos@testos.be', '[]', '$2y$13$i5B0U9PTH74I9fGq6RLh4.SiS5dLaD9q44P6R4vbriLvkroX5Rv3i', 'Testos', 'Testos', '2024-06-28 15:23:29', '2024-06-28 15:23:29', 0, 'default.jpg', NULL),
(5, 'juliendunia@hotmail.com', '[]', '$2y$13$YsWE1W/iYDgZ/qU8sDo/X.zMP4uKG2HrQRDISIv4nvWYCGD4ew4dO', 'Julie', 'Dunia', '2024-07-01 13:42:25', '2024-07-12 11:18:27', 0, 'default.jpg', NULL),
(12, 'julien9@cfitech.be', '[]', '$2y$13$pfc94BwRqlX53fVn738eiuP8W7PPwCQHbP8/V8EP3m.4U6vT9bzvi', 'Julien', 'Dunia', '2024-07-16 11:41:06', '2024-07-16 11:42:42', 0, 'img-3693-500x500-66964092557a1657104922.jpg', 83149),
(13, 'julien10@cfitech.be', '[]', '$2y$13$AdGVHa8tkIr7iolQwzOIO.c/KZ8pVhkh1xSUUIOee21tPsEEPoP.i', 'Julien', 'Dunia', '2024-07-18 10:33:09', '2024-07-18 10:33:51', 0, '20230624173436-img-6060-1024x1536-6698d36f3a778023726267.jpg', 104657);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `FK_A369E2B5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
