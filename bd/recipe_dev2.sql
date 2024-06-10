-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 10 juin 2024 à 09:04
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
('DoctrineMigrations\\Version20240603080138', '2024-06-03 10:02:02', 153);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  PRIMARY KEY (`id`),
  KEY `IDX_A369E2B5A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipes`
--

INSERT INTO `recipes` (`id`, `title`, `slug`, `content`, `created_at`, `updated_at`, `duration`, `image_name`, `user_id`) VALUES
(1, 'Poulet Mayo', 'poulet-mayo', 'Du poulet et de la mayonnaise, la base pour moi. Le bon poulet rôti du dimanche accompagné de pommes de terre mais aujourd\'hui je vais vous parler d\'une tout autre version. Le poulet mayo de la RDC qui est très populaire et qui a vu le jour il y a une dizaine d\'années à peine dans les bars et les rues de Kinshasa.\n \nLe poulet mayo est tout simplement du poulet cuit au feu de bois, qui va ensuite être emballé dans du papier (en papillote) et cuit à l\'étouffé avec des oignons, poivrons. On va ensuite l\'enrober généreusement de mayonnaise.\nLe poulet mayo a prit une place importante dans la street food congolaise au même titre que les kamundele (brochettes), le dibi congolais version chèvre avec le ntaba. .. On parle de street food et de plat conviviaux qui sont généralement cuits en barbecue mais voici une version au four hyper simple à réaliser. J\'ai hâte de démarrer la saison des barbecues pour tester la version braisé au charbon de bois qui est juste dingue.\n\nC\'est proposé avec des bananes plantains (makemba) mais aussi avec de la chikwangue (bâton de manioc). La chikwangue est une racine/feuille de manioc écrasée et cuite entouré d\'une feuille.\nIngrédients pour 4 personnes\n1 poulet entier\n\n4 c.à s. d\'huile d\'olive\n\n1 c.à s. de gingembre en poudre\n\nSel et poivre\n\n1 c.à s. de muscade en poudre\n\n1 zestes d\'un citron vert\n\n1 c.à s. d\'épices\n\n2 poivrons\n\n1 jus d\'un citron jaune ( bio )\n\n1 oignon blanc\n\n2 branche d\'oignons verts\n\n3 c.à s. de mayonnaise\n\n\nÉtape 1/3\nPrenez votre poulet entier et coupez les parties indésirables (croupe de poulet,..). Nettoyez le poulet avec un citron jaune en frottant le citron coupé en deux sur et dans le poulet. Mettez votre poulet dans un grand récipient et ajoutez y l\'huile, le gingembre, le sel, le poivre , la muscade , l\'ail écrasé, le zeste et jus du citron vert, le mélange d\'épice pour poulet. Mélangez le tout et mettez au frigo pour minimum 4 heures voir une nuit.\n\nÉtape 2/3\nAprès le temps de pause, préchauffez votre four à 200 degrés sur chaleur tournante. Mettez votre poulet sur une plaque recouverte de papier sulfurisé. Faites le cuire durant une grosse demie heure voir 40 minutes.\n\nÉtape 3/3\nAprès ce temps de cuisson, sortez le et coupez le en morceaux. Mettez ces morceaux dans du papier sulfurisé, ajoutez y vos poivrons et oignons émincés, les jeunes oignons, le jus du citron jaune ainsi que la mayonnaise. Mélangez le tout.', '2024-04-11 06:57:31', '2024-05-27 10:37:03', 60, 'https://www.cuistopoulet.com/storage/images/product/poulet-mayo-62-1.png', 2),
(2, 'Pondu (Saka Saka)', 'pondu-saka-saka', 'Pour ceux et celles qui ne savent pas ce qu\'est le pondu, il s\'agit en fait de feuilles de manioc pilées préparées avec des aubergines, poireaux, c\'est un accompagnement très apprécié au Congo.\n\nIngrédients pour 8 personnes\n2 sachets de pondu\n\n1 piment\n\n1 aubergine\n\n1 poireau\n\n2 oignons blancs\n\n2 gousses d\'ail ( bio )\n\n2 cubes de bouillon de légumes\n\n1 pincée de sel\n\n200 grammes de cacahuètes ( moulues )\n\n\nÉtape 1/5\nPour commencer laisser dégeler entièrement le pondu dans un casserole. Le rincer plusieurs fois afin d’éliminer toutes les « saletés »(utiliser une passoire à très très petits trous). Une fois bien rincé à l’eau claire ajoutez un peu d\'eau et le faire cuire durant 20 minutes.\n\nÉtape 2/5\nEnsuite ,jetez l’eau puis remettez de l’eau propre(environ 3L) et remettez le pondu sur feu moyen(+ 1 cuillère à café de bicarbonate de soude alimentaire afin d’accélérer le temps de cuisson). Mettez y le piment (sans le percer) cuisez le tout durant 30 minutes. Ajoutez l’aubergine coupée en morceaux, les oignons émincés, l’ail râpé,le poireau émincé, le bouillon cube de légumes,et l’huile de palme/ou l’huile olive.\n\nÉtape 3/5\nAssaisonnez avec le sel selon vos goûts et laissez cuire au moins 2-3 heures,puis mélangez(rajoutez de l\'eau entre temps, si besoin). 20 minutes avant la fin de cuisson, rajoutez votre poudre d\'arachide ( cacahuètes que vous avez moulues au blinder et qui sont devenus une poudre). Ne mélangez pas et laissez cuire tranquillement.\n\nÉtape 4/5\nLe pondu doit être bien tendre et l’eau doit avoir très très bien réduit. Moi j’adore le manger avec du riz blanc. C’est un délice !\n\nÉtape 5/5\nBon appétit mes gourmands.', '2024-04-11 07:08:16', '2024-05-27 10:38:52', 130, 'https://muriellebanackissa.com/wp-content/uploads/2022/10/Vegan-Saka-Saka-Congolese-Cassava-Leaf-Spinach-Stew-XX1-scaled.jpg?ver=1.2.2', 1),
(3, 'Poulet DG', 'poulet-dg', 'Aujourd\'hui, je vous présente une recette tout droit venue du Cameroun. C\'est leur plat national. DG veut dire directeur général. Le poulet DG est né dans les années 80 et à cette époque, il était réservé aux personnes d’une certaine importance. Depuis il est devenu accessible à tous. C’est un bon ragoût avec tout ce que j’aime dedans et en plus ce petit goût sucré-salé qu’apporte la banane plantain au plat toute la famille adore ce plat!\n\nIngrédients pour 4 personnes\n1 poulet entier\n\n200 grammes d\'haricots verts\n\n3 carotte\n\n2 poivrons\n\n2 gousses d\'ail\n\n3 bananes plantain jaunes\n\n1 boîte de tomate ( pelées )\n\nLaurier\n\n1 c.à s. de persil ( haché )\n\n1 c.à.c de gingembre en poudre\n\n1 cube de bouillon de poulet\n\n1 verre d\'eau\n\n2 c.à s. d\'huile d\'olive\n\nSel et poivre\n\n\nÉtape 1/3\nCoupez le poulet en plus ou moins 4 parts, si il est en entier et le nettoyer avec du citron. Mettez l’huile dans une marmite et faites frire les morceaux de poulet.\n\nÉtape 2/3\nPendant ce temps épluchez et coupez en fines lamelles les oignons et les poivrons. Une fois les morceaux de poulet bien doré, les retirer et réservez. Faites rissoler les oignons avec l’ail écrasé (environ 3 minutes) et lorsqu’ils deviennent translucides ajouter la boîte de tomates pelées. Laissez mijoter 5 minutes. Ajoutez les haricots verts, les poivrons et les carottes. Ajoutez le gingembre, le piment en poudre, le bouillon et les feuilles de laurier. Saler et poivrer.\n\nÉtape 3/3\nAjoutez le poulet, le verre d’eau et laisser mijoter environ 30 minutes. Faites frire les bananes plantain et les ajouter dans les 10 dernières minutes de cuisson. C\'est un plat complet donc il se mange comme cela. Bon appétit les gourmands.', '2024-04-11 07:08:52', '2024-05-27 10:39:29', 55, 'https://rootsmagazine.fr/wp-content/uploads/2021/04/POULET-DG-FROM-CAMEROON.jpg', 2),
(8, 'Tajin d\'agneau', 'tajin-d-agneau', 'Tu prends un agneau.', '2024-04-19 12:54:53', '2024-05-27 10:46:50', 95, 'https://assets.afcdn.com/recipe/20181017/82766_w1024h1024c1cx1834cy2446cxt0cyt0cxb3669cyb4892.webp', 2),
(25, 'Recette sans image', 'recette-sans-image', 'Tu ne peux pas le faire monsieur', '2024-05-27 10:06:58', '2024-05-27 10:06:58', 5, 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', 1),
(26, 'Mikate (beignet)', 'mikate-beignet', 'Comment faire de bon beignets (mikate) pour accompagner votre repas', '2024-05-27 10:43:42', '2024-05-27 10:44:23', 50, 'https://recettes-africaines.fr/wp-content/uploads/2023/01/mikate-768x1024.jpeg', 2),
(27, 'Tilapia braisé', 'tilapia-braise', 'Comment faire un bon tilapia braisé au makala', '2024-05-27 10:46:03', '2024-05-27 10:46:03', 45, 'https://cookingwithclaudy.com/wp-content/uploads/2023/06/20230624173436_IMG_6060-1024x1536.jpg', 1),
(29, 'Sushi Au Saumon', 'sushi-au-saumon', 'Tu prends du riz et du saumon.', '2024-06-03 09:45:57', '2024-06-03 09:45:57', 45, 'https://th.bing.com/th/id/OIP.YzNBu-r2yymhRgwhGIZ_rgHaJ4?rs=1&pid=ImgDetMain', 1);

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`, `created_at`, `updated_at`) VALUES
(1, 'jamesbond@cfitech.be', '[]', '$2y$13$7NkWDSYqEejJGeiUNDSCJehmIoM5h5Pg10ahyqKTW.XT3KLwFN49K', 'James', 'Bond', '2024-06-03 09:30:46', '2024-06-03 09:30:46'),
(2, 'julien@cfitech.be', '[]', '$2y$13$Fz.xemFNS3iKcCYiq6SvxeXu/RRNAkmm8jptmRWYqtWUWRTJUHiwi', 'Julien', 'Dunia', '2024-06-03 09:31:56', '2024-06-03 09:31:56'),
(3, 'rose@cfitech.be', '[]', '$2y$13$DdzsfqRDia8KJiVA8j3bBeeGuHuolmrU4fK7egxcx4fLQBHBM44hq', 'Rose', 'Cfitech', '2024-06-07 12:22:41', '2024-06-07 12:22:41');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `FK_A369E2B5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
