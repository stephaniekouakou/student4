-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 14 nov. 2020 à 22:27
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `baseattendance`
--

-- --------------------------------------------------------

--
-- Structure de la table `authentication_attendance`
--

CREATE TABLE `authentication_attendance` (
  `id` int(11) NOT NULL,
  `datesign` date NOT NULL,
  `timesign` time(6) NOT NULL,
  `student_id` int(11) NOT NULL,
  `horaire_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `authentication_attendance`
--

INSERT INTO `authentication_attendance` (`id`, `datesign`, `timesign`, `student_id`, `horaire_id`) VALUES
(1, '2020-10-11', '20:52:00.309453', 1, 4),
(2, '2020-10-12', '15:31:28.399250', 3, 5),
(3, '2020-10-12', '15:33:07.637530', 3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `authentication_horaire_cour`
--

CREATE TABLE `authentication_horaire_cour` (
  `id` int(11) NOT NULL,
  `debut_cour` time(6) NOT NULL,
  `fin_cour` time(6) NOT NULL,
  `date_cour` date NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `authentication_horaire_cour`
--

INSERT INTO `authentication_horaire_cour` (`id`, `debut_cour`, `fin_cour`, `date_cour`, `teacher_id`) VALUES
(3, '16:13:00.000000', '20:13:00.000000', '2020-10-06', 1),
(4, '12:35:00.000000', '22:35:00.000000', '2020-10-11', 1),
(5, '14:00:00.000000', '18:00:00.000000', '2020-10-12', 1);

-- --------------------------------------------------------

--
-- Structure de la table `authentication_photo`
--

CREATE TABLE `authentication_photo` (
  `id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `authentication_photo`
--

INSERT INTO `authentication_photo` (`id`, `photo`, `student_id`) VALUES
(1, 'student1.png', 1),
(2, 'student2.png', 2),
(3, 'student3.png', 3);

-- --------------------------------------------------------

--
-- Structure de la table `authentication_students`
--

CREATE TABLE `authentication_students` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `motpasse` varchar(256) NOT NULL,
  `phone` int(11) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `date_created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `authentication_students`
--

INSERT INTO `authentication_students` (`id`, `name`, `email`, `motpasse`, `phone`, `genre`, `date_created`) VALUES
(1, 'Kouakou stephanie', 'stephanie@gmail.com', '$pbkdf2-sha256$12000$nnNubc1ZixHCOEfo/T/nfG/tHYOQMqY0prQ2RmhNiXE$OwrJosJ/h.7ilS9MkeQLPJuGW6ZMWvlckJpeQdmCog4', 78443295, 'Masculin', '2020-10-11 09:09:40.320429'),
(2, 'kouakou roxanne', 'roxanne@gmail.com', '$pbkdf2-sha256$12000$F0KIMSYEQAhhDEFIifG.d845J2Qs5Vyr9b7XuhcixHg$V67pM7hx1r4pLQ5tYqqq7712QqpSJzFlXSI2k29dxS0', 46378965, 'Feminin', '2020-10-12 14:00:57.639973'),
(3, 'MANGO MEMEL', 'memel@gmail.com', '$pbkdf2-sha256$12000$WYuR0rrXuhcipJTy3hsjhFBqDeHcu5cSgpCyllKK8Z4$FM8t6wlvn9.UYXOvgu9bfk0VoSiKAYP79b8/ksndFoY', 47961322, 'Masculin', '2020-10-12 14:30:01.904773');

-- --------------------------------------------------------

--
-- Structure de la table `authentication_teacher`
--

CREATE TABLE `authentication_teacher` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `motpasse` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `authentication_teacher`
--

INSERT INTO `authentication_teacher` (`id`, `nom`, `email`, `motpasse`) VALUES
(1, 'koffi lambert', 'lambert@gmail.com', '$pbkdf2-sha256$29000$JSQkZEwJIUSotXbOuVeqVQ$KKkaH1JrT56F7NwPkuwDC5Fup8Rnr7HygD.00Umr16o');

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add students', 7, 'add_students'),
(26, 'Can change students', 7, 'change_students'),
(27, 'Can delete students', 7, 'delete_students'),
(28, 'Can view students', 7, 'view_students'),
(29, 'Can add attendance', 8, 'add_attendance'),
(30, 'Can change attendance', 8, 'change_attendance'),
(31, 'Can delete attendance', 8, 'delete_attendance'),
(32, 'Can view attendance', 8, 'view_attendance'),
(33, 'Can add photo', 9, 'add_photo'),
(34, 'Can change photo', 9, 'change_photo'),
(35, 'Can delete photo', 9, 'delete_photo'),
(36, 'Can view photo', 9, 'view_photo'),
(37, 'Can add horaire', 10, 'add_horaire'),
(38, 'Can change horaire', 10, 'change_horaire'),
(39, 'Can delete horaire', 10, 'delete_horaire'),
(40, 'Can view horaire', 10, 'view_horaire'),
(41, 'Can add teacher', 11, 'add_teacher'),
(42, 'Can change teacher', 11, 'change_teacher'),
(43, 'Can delete teacher', 11, 'delete_teacher'),
(44, 'Can view teacher', 11, 'view_teacher'),
(45, 'Can add absence', 12, 'add_absence'),
(46, 'Can change absence', 12, 'change_absence'),
(47, 'Can delete absence', 12, 'delete_absence'),
(48, 'Can view absence', 12, 'view_absence'),
(49, 'Can add horaire_cour', 10, 'add_horaire_cour'),
(50, 'Can change horaire_cour', 10, 'change_horaire_cour'),
(51, 'Can delete horaire_cour', 10, 'delete_horaire_cour'),
(52, 'Can view horaire_cour', 10, 'view_horaire_cour');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$CKn3KvMcqBMU$bxdDp7pV/vqQdzOLeUohvJbEkRIksxS5APzNFO8FFmE=', '2020-09-23 14:46:55.304454', 1, 'user', '', '', 'fannykouakou04@gmail.com', 1, 1, '2020-09-23 14:45:50.220369');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(12, 'authentication', 'absence'),
(8, 'authentication', 'attendance'),
(10, 'authentication', 'horaire_cour'),
(9, 'authentication', 'photo'),
(7, 'authentication', 'students'),
(11, 'authentication', 'teacher'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-09-04 14:06:07.530877'),
(2, 'auth', '0001_initial', '2020-09-04 14:06:09.250702'),
(3, 'admin', '0001_initial', '2020-09-04 14:06:17.269044'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-09-04 14:06:18.634800'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-09-04 14:06:18.662104'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-09-04 14:06:19.311342'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-09-04 14:06:20.093053'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-09-04 14:06:20.252979'),
(9, 'auth', '0004_alter_user_username_opts', '2020-09-04 14:06:20.345730'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-09-04 14:06:21.078680'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-09-04 14:06:21.093500'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-09-04 14:06:21.121236'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-09-04 14:06:21.522519'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-09-04 14:06:21.669790'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-09-04 14:06:21.810139'),
(16, 'auth', '0011_update_proxy_permissions', '2020-09-04 14:06:21.864137'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2020-09-04 14:06:22.021346'),
(18, 'authentication', '0001_initial', '2020-09-04 14:06:22.288254'),
(19, 'sessions', '0001_initial', '2020-09-04 14:06:22.630085'),
(20, 'authentication', '0002_auto_20200905_0846', '2020-09-05 07:46:34.833812'),
(21, 'authentication', '0003_attendance', '2020-09-05 19:59:21.438355'),
(22, 'authentication', '0004_auto_20200907_1736', '2020-09-07 16:52:23.806323'),
(23, 'authentication', '0005_auto_20200909_1813', '2020-09-09 17:13:56.524559'),
(24, 'authentication', '0006_auto_20200911_1649', '2020-09-11 15:49:40.536553'),
(25, 'authentication', '0007_auto_20200911_1854', '2020-09-11 17:55:20.671658'),
(26, 'authentication', '0008_auto_20200921_2014', '2020-09-21 19:15:41.452967'),
(27, 'authentication', '0009_remove_attendance_etat', '2020-09-21 19:25:00.902391'),
(28, 'authentication', '0010_auto_20200922_0649', '2020-09-22 05:50:26.068646'),
(29, 'authentication', '0011_auto_20200923_1619', '2020-09-23 15:19:44.643463'),
(30, 'authentication', '0012_auto_20200925_2233', '2020-09-25 21:34:03.197190'),
(31, 'authentication', '0013_auto_20200927_1800', '2020-09-27 17:03:41.092312'),
(32, 'authentication', '0014_auto_20201006_1548', '2020-10-06 14:48:44.211490');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0wuvr5287kfn2d80jgyefr124h390e4i', '.eJyrVspMUbIyNNFRyslPT09Nic_MU7IqKSpN1VFKzU3MzFGyUspNrEx0SAdx9JLzc5V0gDrii0tKU1LzSiA68xJzU4HqsvOTMzITFUDKlWoBATEdGA:1kQBV2:oRMKtziwNS8tYTjYEDJq256ju6z95dheGJ4TbrMxTEQ', '2020-10-21 15:37:04.601426'),
('5i3x9tjgf24gd5k5coq7p2r05z0d9y8l', 'eyJpZCI6MTMsImxvZ2dlZF9pbiI6dHJ1ZSwiZW1haWwiOiJ6aWthQGdtYWlsLmNvbSIsImlkX3N0dWRlbnQiOjQsIm5hbWUiOiJ6aWthIGFyaWFubmUifQ:1kKR3h:HZ3OkgBYEC5GrWQy8x8OsYR7JlyzEAJ5k5celMTQkGM', '2020-10-05 19:01:05.759904'),
('h19nhmd2cav8r93gw3m9n821ocomf1om', 'eyJsb2dnZWRfaW4iOnRydWUsImVtYWlsIjoiZ3JhY2VAZ21haWwuY29tIiwiaWRfc3R1ZGVudCI6MywibmFtZSI6IktvdWFrb3UgZ3JhY2UifQ:1kMZNj:wuUENomvEODyMvQkNv3wC4g5g2F7jfq31Ub1sRR1ai4', '2020-10-11 16:18:35.655643'),
('m2fhhls4svhly2663qtv346tdjtyhvp9', '.eJyrVkrNTczMUbJSKi5JLchIzMtMdUgHiegl5-cq6ShlpsQXl5SmpOaVKFkZ6ijlJeamAtV655cmZueXKsD1gFUqWRnXAgBnyxtC:1kSg9s:3mePfhGW4x8gnTv_UQnE-wEVTkZb4NE-3zpT3Up8Egk', '2020-10-28 12:45:32.904570'),
('v7fmubzrqwjcu3mlsuppsk546typfdyo', '.eJwlyzEKwzAMRuGrhH82gdJNU_ccIqi24prYFrjyFHL3uOn44HsHssYoYU0VZK2LgxROGYTY2Msr_mr2WuCQwvq1HqQa6OlQuchwi3betU-3_ysT9h9poMdQYyXsum1pylze0gznBYzCKF8:1kPo4n:pFJdOtuT4jQRAuM8a5nlrMuu6HbY3nJ01y_SiCJmUco', '2020-10-20 14:36:25.577678'),
('zd6lk1fuye9g5zq1lyutracr6oczdt9u', 'NTJkYTE3YWY2ODNiZGMxMWMzNjY0ZDQ0YzM2MzEwZWM4NmMyZGVkNDp7ImVtYWlsIjoic3RlcGhhbmllQGdtYWlsLmNvbSIsImlkX3N0dWRlbnQiOjEsIm5hbWUiOiJLb3Vha291IHN0ZXBoYW5pZSJ9', '2020-11-28 21:22:10.335703');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `authentication_attendance`
--
ALTER TABLE `authentication_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authentication_atten_student_id_0ff5c3da_fk_authentic` (`student_id`),
  ADD KEY `authentication_atten_horaire_id_8ca44f9a_fk_authentic` (`horaire_id`);

--
-- Index pour la table `authentication_horaire_cour`
--
ALTER TABLE `authentication_horaire_cour`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authentication_horai_teacher_id_f6b71f2e_fk_authentic` (`teacher_id`);

--
-- Index pour la table `authentication_photo`
--
ALTER TABLE `authentication_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authentication_photo_student_id_407a96d7_fk_authentic` (`student_id`);

--
-- Index pour la table `authentication_students`
--
ALTER TABLE `authentication_students`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `authentication_teacher`
--
ALTER TABLE `authentication_teacher`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `authentication_attendance`
--
ALTER TABLE `authentication_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `authentication_horaire_cour`
--
ALTER TABLE `authentication_horaire_cour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `authentication_photo`
--
ALTER TABLE `authentication_photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `authentication_students`
--
ALTER TABLE `authentication_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `authentication_teacher`
--
ALTER TABLE `authentication_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `authentication_attendance`
--
ALTER TABLE `authentication_attendance`
  ADD CONSTRAINT `authentication_atten_horaire_id_8ca44f9a_fk_authentic` FOREIGN KEY (`horaire_id`) REFERENCES `authentication_horaire_cour` (`id`);

--
-- Contraintes pour la table `authentication_horaire_cour`
--
ALTER TABLE `authentication_horaire_cour`
  ADD CONSTRAINT `authentication_horai_teacher_id_f6b71f2e_fk_authentic` FOREIGN KEY (`teacher_id`) REFERENCES `authentication_teacher` (`id`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
