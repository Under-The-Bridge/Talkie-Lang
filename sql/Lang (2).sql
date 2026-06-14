-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Июн 14 2026 г., 12:47
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Lang`
--

-- --------------------------------------------------------

--
-- Структура таблицы `completed_lessons`
--

CREATE TABLE `completed_lessons` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `lesson_id` int NOT NULL,
  `count` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `completed_lessons`
--

INSERT INTO `completed_lessons` (`id`, `user_id`, `lesson_id`, `count`) VALUES
(165, 2, 4, 4),
(166, 2, 5, 0),
(167, 9, 4, 0),
(168, 2, 1, 3),
(169, 12, 1, 4),
(170, 12, 2, 1),
(171, 32, 1, 4),
(172, 32, 2, 0),
(173, 114, 1, 4),
(174, 114, 2, 0),
(175, 115, 4, 0),
(176, 116, 4, 0),
(177, 25, 1, 1),
(178, 115, 1, 0),
(179, 117, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `langs`
--

CREATE TABLE `langs` (
  `lang_id` int NOT NULL,
  `lang_name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `langs`
--

INSERT INTO `langs` (`lang_id`, `lang_name`) VALUES
(1, 'Английский'),
(2, 'Японский');

-- --------------------------------------------------------

--
-- Структура таблицы `leagues`
--

CREATE TABLE `leagues` (
  `league_id` int NOT NULL,
  `league_name` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `leagues`
--

INSERT INTO `leagues` (`league_id`, `league_name`) VALUES
(1, 'Бронзавая лига'),
(2, 'Серебряная лига'),
(3, 'Золотая лига');

-- --------------------------------------------------------

--
-- Структура таблицы `league_users`
--

CREATE TABLE `league_users` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `weekly_league_id` varchar(12) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `league_users`
--

INSERT INTO `league_users` (`id`, `user_id`, `weekly_league_id`) VALUES
(24614, 6, 'MRQaKsrVlNYh'),
(24615, 28, 'MRQaKsrVlNYh'),
(24616, 61, 'MRQaKsrVlNYh'),
(24617, 69, 'MRQaKsrVlNYh'),
(24618, 75, 'MRQaKsrVlNYh'),
(24619, 57, 'MRQaKsrVlNYh'),
(24620, 27, 'MRQaKsrVlNYh'),
(24621, 12, 'MRQaKsrVlNYh'),
(24622, 48, 'MRQaKsrVlNYh'),
(24623, 24, 'MRQaKsrVlNYh'),
(24624, 111, 'MRQaKsrVlNYh'),
(24625, 54, 'MRQaKsrVlNYh'),
(24626, 30, 'MRQaKsrVlNYh'),
(24627, 80, 'MRQaKsrVlNYh'),
(24628, 35, 'MRQaKsrVlNYh'),
(24629, 10, 'UYjXibLQZQag'),
(24630, 67, 'UYjXibLQZQag'),
(24631, 38, 'UYjXibLQZQag'),
(24632, 78, 'UYjXibLQZQag'),
(24633, 16, 'UYjXibLQZQag'),
(24634, 55, 'UYjXibLQZQag'),
(24635, 26, 'UYjXibLQZQag'),
(24636, 60, 'UYjXibLQZQag'),
(24637, 42, 'vhvgFlBYyJvo'),
(24638, 47, 'vhvgFlBYyJvo'),
(24639, 33, 'vhvgFlBYyJvo'),
(24640, 81, 'vhvgFlBYyJvo'),
(24641, 52, 'vhvgFlBYyJvo'),
(24642, 88, 'vhvgFlBYyJvo'),
(24643, 44, 'vhvgFlBYyJvo'),
(24644, 34, 'vhvgFlBYyJvo'),
(24645, 8, 'vhvgFlBYyJvo'),
(24646, 79, 'vhvgFlBYyJvo'),
(24647, 71, 'vhvgFlBYyJvo'),
(24648, 113, 'vhvgFlBYyJvo'),
(24649, 87, 'vhvgFlBYyJvo'),
(24650, 112, 'vhvgFlBYyJvo'),
(24651, 114, 'vhvgFlBYyJvo'),
(24652, 22, 'eVLlbzcCxMwW'),
(24653, 73, 'eVLlbzcCxMwW'),
(24654, 41, 'eVLlbzcCxMwW'),
(24655, 89, 'eVLlbzcCxMwW'),
(24656, 36, 'eVLlbzcCxMwW'),
(24657, 74, 'eVLlbzcCxMwW'),
(24658, 66, 'eVLlbzcCxMwW'),
(24659, 2, 'eVLlbzcCxMwW'),
(24660, 32, 'eVLlbzcCxMwW'),
(24661, 14, 'eVLlbzcCxMwW'),
(24662, 72, 'eVLlbzcCxMwW'),
(24663, 59, 'eVLlbzcCxMwW'),
(24664, 91, 'eVLlbzcCxMwW'),
(24665, 18, 'eVLlbzcCxMwW'),
(24666, 115, 'eVLlbzcCxMwW'),
(24667, 110, 'DXqHcwVKBYzl'),
(24668, 86, 'DXqHcwVKBYzl'),
(24669, 40, 'DXqHcwVKBYzl'),
(24670, 39, 'DXqHcwVKBYzl'),
(24671, 15, 'DXqHcwVKBYzl'),
(24672, 11, 'VPfwJDagPmcX'),
(24673, 29, 'VPfwJDagPmcX'),
(24674, 23, 'VPfwJDagPmcX'),
(24675, 20, 'VPfwJDagPmcX'),
(24676, 108, 'VPfwJDagPmcX'),
(24677, 43, 'VPfwJDagPmcX'),
(24678, 31, 'VPfwJDagPmcX'),
(24679, 68, 'VPfwJDagPmcX'),
(24680, 65, 'VPfwJDagPmcX'),
(24681, 116, 'VPfwJDagPmcX'),
(24682, 46, 'VPfwJDagPmcX'),
(24683, 92, 'VPfwJDagPmcX'),
(24684, 64, 'VPfwJDagPmcX'),
(24685, 17, 'VPfwJDagPmcX'),
(24686, 45, 'VPfwJDagPmcX'),
(24687, 77, 'GHgrBBNFLoRM'),
(24688, 25, 'GHgrBBNFLoRM'),
(24689, 83, 'GHgrBBNFLoRM'),
(24690, 58, 'GHgrBBNFLoRM'),
(24691, 9, 'GHgrBBNFLoRM'),
(24692, 50, 'GHgrBBNFLoRM'),
(24693, 85, 'GHgrBBNFLoRM'),
(24694, 49, 'GHgrBBNFLoRM'),
(24695, 70, 'GHgrBBNFLoRM'),
(24696, 21, 'GHgrBBNFLoRM'),
(24697, 7, 'GHgrBBNFLoRM'),
(24698, 82, 'GHgrBBNFLoRM'),
(24699, 13, 'GHgrBBNFLoRM'),
(24700, 84, 'GHgrBBNFLoRM'),
(24701, 4, 'GHgrBBNFLoRM'),
(24702, 51, 'scNovvTwqslH'),
(24703, 5, 'scNovvTwqslH'),
(24704, 37, 'scNovvTwqslH'),
(24705, 53, 'scNovvTwqslH'),
(24706, 62, 'scNovvTwqslH'),
(24707, 56, 'scNovvTwqslH'),
(24708, 90, 'scNovvTwqslH'),
(24709, 76, 'scNovvTwqslH'),
(24710, 63, 'scNovvTwqslH'),
(24711, 19, 'scNovvTwqslH');

-- --------------------------------------------------------

--
-- Структура таблицы `lesson`
--

CREATE TABLE `lesson` (
  `lesson_id` int NOT NULL,
  `lesson_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `lesson_language` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `lesson`
--

INSERT INTO `lesson` (`lesson_id`, `lesson_name`, `lesson_language`) VALUES
(1, 'Английский: базовые слова', 1),
(2, 'Еда', 1),
(3, 'Животные', 1),
(4, 'Японский: базовые слова', 2),
(5, 'Еда', 2),
(6, 'Животные', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `lessons_words`
--

CREATE TABLE `lessons_words` (
  `id` int NOT NULL,
  `lesson_id` int NOT NULL,
  `word_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `lessons_words`
--

INSERT INTO `lessons_words` (`id`, `lesson_id`, `word_id`) VALUES
(7, 1, 19),
(8, 1, 20),
(9, 1, 21),
(10, 1, 22),
(11, 1, 23),
(12, 2, 24),
(13, 2, 25),
(14, 2, 26),
(15, 2, 27),
(16, 2, 28),
(19, 3, 31),
(20, 3, 32),
(21, 3, 33),
(22, 3, 34),
(23, 3, 35),
(24, 3, 36),
(25, 3, 37),
(26, 4, 38),
(27, 4, 39),
(28, 4, 40),
(29, 4, 41),
(30, 4, 42),
(31, 5, 43),
(32, 5, 44),
(33, 5, 45),
(34, 5, 46),
(35, 5, 47),
(36, 5, 48),
(37, 5, 49),
(38, 6, 50),
(39, 6, 51),
(40, 6, 52),
(41, 6, 53),
(42, 6, 54),
(43, 6, 55),
(44, 6, 56);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `user_login` text COLLATE utf8mb4_general_ci NOT NULL,
  `user_email` text COLLATE utf8mb4_general_ci NOT NULL,
  `user_password` text COLLATE utf8mb4_general_ci NOT NULL,
  `user_pfp` text COLLATE utf8mb4_general_ci,
  `user_role` enum('user','admin') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user',
  `user_banned` tinyint(1) NOT NULL DEFAULT '0',
  `user_weekly_xp` int NOT NULL DEFAULT '0',
  `user_league` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_email`, `user_password`, `user_pfp`, `user_role`, `user_banned`, `user_weekly_xp`, `user_league`) VALUES
(2, 'Under-The-Bridge', 'ramazanikbaev6@gmail.com', 'Under-The-Bridge', 'naClBRCcYgVJOVcB.jpg', 'user', 0, 0, 2),
(3, 'admin', 'admin@admin.admin', 'admin', '', 'admin', 0, 0, 1),
(4, 'qweqwe', 'qweqwe@qweqwe.qweqwe', 'qweqwe', '', 'user', 0, 0, 3),
(5, 'alex_smith', 'alex.smith@example.com', '123456', '', 'user', 0, 0, 3),
(6, 'maria_johnson', 'maria.johnson@example.com', '123456', '', 'user', 0, 0, 1),
(7, 'dmitry_volkov', 'dmitry.volkov@example.com', '123456', '', 'user', 0, 0, 3),
(8, 'elena_petrova', 'elena.petrova@example.com', '123456', '', 'user', 0, 0, 2),
(9, 'maxim_ivanov', 'maxim.ivanov@example.com', '123456', 'ZYgDMUwvxFQIudpF.jpg', 'user', 0, 0, 3),
(10, 'anna_kozlov', 'anna.kozlov@example.com', '123456', '', 'user', 0, 0, 1),
(11, 'sergey_nikolaev', 'sergey.nikolaev@example.com', '123456', '', 'user', 0, 0, 3),
(12, 'olga_smirnova', 'olga.smirnova@example.com', '123456', '', 'user', 0, 0, 1),
(13, 'ivan_morozov', 'ivan.morozov@example.com', '123456', '', 'user', 0, 0, 3),
(14, 'natalia_fedorova', 'natalia.fedorova@example.com', '123456', '', 'user', 0, 0, 2),
(15, 'andrey_popov', 'andrey.popov@example.com', '123456', '', 'user', 0, 0, 2),
(16, 'tatyana_sokolova', 'tatyana.sokolova@example.com', '123456', '', 'user', 0, 0, 1),
(17, 'pavel_lebenev', 'pavel.lebenev@example.com', '123456', '', 'user', 0, 0, 3),
(18, 'yulia_novikova', 'yulia.novikova@example.com', '123456', '', 'user', 0, 0, 2),
(19, 'vladimir_zaits', 'vladimir.zaits@example.com', '123456', '', 'user', 0, 0, 3),
(20, 'ekaterina_orlova', 'ekaterina.orlova@example.com', '123456', '', 'user', 0, 0, 3),
(21, 'konstantin_makarov', 'konstantin.makarov@example.com', '123456', '', 'user', 0, 0, 3),
(22, 'irina_pavlova', 'irina.pavlova@example.com', '123456', '', 'user', 0, 0, 2),
(23, 'artem_egorov', 'artem.egorov@example.com', '123456', '', 'user', 0, 0, 3),
(24, 'svetlana_timofeeva', 'svetlana.timofeeva@example.com', '123456', '', 'user', 0, 0, 1),
(25, 'denis_volkov', 'denis.volkov@example.com', '123456', '', 'user', 0, 0, 3),
(26, 'ksenia_morozova', 'ksenia.morozova@example.com', '123456', '', 'user', 0, 0, 1),
(27, 'roman_borisov', 'roman.borisov@example.com', '123456', '', 'user', 0, 0, 1),
(28, 'vera_kuznetsova', 'vera.kuznetsova@example.com', '123456', '', 'user', 0, 0, 1),
(29, 'nikita_sidorov', 'nikita.sidorov@example.com', '123456', '', 'user', 0, 0, 3),
(30, 'polina_vasilyeva', 'polina.vasilyeva@example.com', '123456', '', 'user', 0, 0, 1),
(31, 'oleg_timofeev', 'oleg.timofeev@example.com', '123456', '', 'user', 0, 0, 3),
(32, 'bash_ars', 'bash.bash@example.com', '123456', 'mgneafswCvlfKcvN.jpg', 'user', 0, 0, 2),
(33, 'user_001', 'user001@example.com', '123456', '', 'user', 0, 0, 2),
(34, 'user_002', 'user002@example.com', '123456', '', 'user', 0, 0, 2),
(35, 'user_003', 'user003@example.com', '123456', '', 'user', 0, 0, 1),
(36, 'user_004', 'user004@example.com', '123456', '', 'user', 0, 0, 2),
(37, 'user_005', 'user005@example.com', '123456', '', 'user', 0, 0, 3),
(38, 'user_006', 'user006@example.com', '123456', '', 'user', 0, 0, 1),
(39, 'user_007', 'user007@example.com', '123456', '', 'user', 0, 0, 2),
(40, 'user_008', 'user008@example.com', '123456', '', 'user', 0, 0, 2),
(41, 'user_009', 'user009@example.com', '123456', '', 'user', 0, 0, 2),
(42, 'user_010', 'user010@example.com', '123456', '', 'user', 0, 0, 2),
(43, 'user_011', 'user011@example.com', '123456', '', 'user', 0, 0, 3),
(44, 'user_012', 'user012@example.com', '123456', '', 'user', 0, 0, 2),
(45, 'user_013', 'user013@example.com', '123456', '', 'user', 0, 0, 3),
(46, 'user_014', 'user014@example.com', '123456', '', 'user', 0, 0, 3),
(47, 'user_015', 'user015@example.com', '123456', '', 'user', 0, 0, 2),
(48, 'user_016', 'user016@example.com', '123456', '', 'user', 0, 0, 1),
(49, 'user_017', 'user017@example.com', '123456', '', 'user', 0, 0, 3),
(50, 'user_018', 'user018@example.com', '123456', '', 'user', 0, 0, 3),
(51, 'user_019', 'user019@example.com', '123456', '', 'user', 0, 0, 3),
(52, 'user_020', 'user020@example.com', '123456', '', 'user', 0, 0, 2),
(53, 'user_021', 'user021@example.com', '123456', '', 'user', 0, 0, 3),
(54, 'user_022', 'user022@example.com', '123456', '', 'user', 0, 0, 1),
(55, 'user_023', 'user023@example.com', '123456', '', 'user', 0, 0, 1),
(56, 'user_024', 'user024@example.com', '123456', '', 'user', 0, 0, 3),
(57, 'user_025', 'user025@example.com', '123456', '', 'user', 0, 0, 1),
(58, 'user_026', 'user026@example.com', '123456', '', 'user', 0, 0, 3),
(59, 'user_027', 'user027@example.com', '123456', '', 'user', 0, 0, 2),
(60, 'user_028', 'user028@example.com', '123456', '', 'user', 0, 0, 1),
(61, 'user_029', 'user029@example.com', '123456', '', 'user', 0, 0, 1),
(62, 'user_030', 'user030@example.com', '123456', '', 'user', 0, 0, 3),
(63, 'user_031', 'user031@example.com', '123456', '', 'user', 0, 0, 3),
(64, 'user_032', 'user032@example.com', '123456', '', 'user', 0, 0, 3),
(65, 'user_033', 'user033@example.com', '123456', '', 'user', 0, 0, 3),
(66, 'user_034', 'user034@example.com', '123456', '', 'user', 0, 0, 2),
(67, 'user_035', 'user035@example.com', '123456', '', 'user', 0, 0, 1),
(68, 'user_036', 'user036@example.com', '123456', '', 'user', 0, 0, 3),
(69, 'user_037', 'user037@example.com', '123456', '', 'user', 0, 0, 1),
(70, 'user_038', 'user038@example.com', '123456', '', 'user', 0, 0, 3),
(71, 'user_039', 'user039@example.com', '123456', '', 'user', 0, 0, 2),
(72, 'user_040', 'user040@example.com', '123456', '', 'user', 0, 0, 2),
(73, 'user_041', 'user041@example.com', '123456', '', 'user', 0, 0, 2),
(74, 'user_042', 'user042@example.com', '123456', '', 'user', 0, 0, 2),
(75, 'user_043', 'user043@example.com', '123456', '', 'user', 0, 0, 1),
(76, 'user_044', 'user044@example.com', '123456', '', 'user', 0, 0, 3),
(77, 'user_045', 'user045@example.com', '123456', '', 'user', 0, 0, 3),
(78, 'user_046', 'user046@example.com', '123456', '', 'user', 0, 0, 1),
(79, 'user_047', 'user047@example.com', '123456', '', 'user', 0, 0, 2),
(80, 'user_048', 'user048@example.com', '123456', '', 'user', 0, 0, 1),
(81, 'user_049', 'user049@example.com', '123456', '', 'user', 0, 0, 2),
(82, 'user_050', 'user050@example.com', '123456', '', 'user', 0, 0, 3),
(83, 'user_051', 'user051@example.com', '123456', '', 'user', 0, 0, 3),
(84, 'user_052', 'user052@example.com', '123456', '', 'user', 0, 0, 3),
(85, 'user_053', 'user053@example.com', '123456', '', 'user', 0, 0, 3),
(86, 'user_054', 'user054@example.com', '123456', '', 'user', 0, 0, 2),
(87, 'user_055', 'user055@example.com', '123456', '', 'user', 0, 0, 2),
(88, 'user_056', 'user056@example.com', '123456', '', 'user', 0, 0, 2),
(89, 'user_057', 'user057@example.com', '123456', '', 'user', 0, 0, 2),
(90, 'user_058', 'user058@example.com', '123456', '', 'user', 0, 0, 3),
(91, 'user_059', 'user059@example.com', '123456', '', 'user', 0, 0, 2),
(92, 'user_060', 'user060@example.com', '123456', '', 'user', 0, 0, 3),
(108, 'ramz', 'ramz@ramz', 'ramz', '', 'user', 0, 0, 3),
(110, 'qqqq', 'qqqq@qqqq', 'qqqq', '', 'user', 0, 0, 2),
(111, 'zxczxczxc', 'zxczxczxc@zxczxczxc', 'zxczxczxc', '', 'user', 0, 0, 1),
(112, 'ramziktvt@gmail.com', 'ramziktvt@gmail.com', 'ramziktvt@gmail.com', '', 'user', 0, 0, 2),
(113, 'wwww', 'ww@ww', 'wwww', '', 'user', 0, 0, 2),
(114, 'rama', 'rama@rama', 'rama', 'VjMohxedYfLYNCtB.jpg', 'user', 0, 0, 2),
(115, 'temp1', 'temp1@gmail.com', 'temp1', NULL, 'user', 0, 0, 2),
(116, 'vadim', 'vadim@vadim.com', 'vadim', 'QEpwKOetlQaGKdmG.jpg', 'user', 0, 0, 3),
(117, 'asdasd', 'asdasd@asdasd.asdasd', 'asdasd', 'dyKBqjrkNAaErMZv.jpg', 'user', 0, 970, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user_lang_progress`
--

CREATE TABLE `user_lang_progress` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `lang_id` int NOT NULL,
  `progress` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_lang_progress`
--

INSERT INTO `user_lang_progress` (`id`, `user_id`, `lang_id`, `progress`) VALUES
(48, 2, 2, 1),
(49, 9, 2, 0),
(50, 2, 1, 0),
(51, 12, 1, 1),
(52, 32, 1, 1),
(53, 114, 1, 1),
(55, 115, 2, 0),
(57, 116, 2, 0),
(58, 25, 1, 0),
(59, 115, 1, 0),
(60, 117, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user_words`
--

CREATE TABLE `user_words` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `word_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user_words`
--

INSERT INTO `user_words` (`id`, `user_id`, `word_id`) VALUES
(1, 2, 20),
(2, 2, 23),
(3, 2, 24),
(4, 2, 25),
(5, 2, 38),
(6, 2, 40),
(7, 2, 41),
(8, 110, 42),
(9, 112, 23),
(10, 112, 42),
(11, 2, 21),
(12, 2, 39),
(13, 2, 42),
(14, 2, 22),
(15, 2, 19),
(16, 12, 22),
(17, 12, 19),
(18, 12, 21),
(19, 12, 23),
(20, 12, 26),
(21, 12, 20),
(22, 32, 23),
(23, 32, 19),
(24, 114, 22),
(25, 114, 23),
(26, 114, 21),
(27, 25, 20),
(28, 25, 23),
(29, 25, 22),
(30, 117, 19),
(31, 117, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `weekly_league`
--

CREATE TABLE `weekly_league` (
  `id` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `league_id` int NOT NULL,
  `time` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `weekly_league`
--

INSERT INTO `weekly_league` (`id`, `league_id`, `time`) VALUES
('DXqHcwVKBYzl', 2, '1781509013'),
('eVLlbzcCxMwW', 2, '1781509013'),
('GHgrBBNFLoRM', 3, '1781509013'),
('MRQaKsrVlNYh', 1, '1781509013'),
('scNovvTwqslH', 3, '1781509013'),
('UYjXibLQZQag', 1, '1781509013'),
('vhvgFlBYyJvo', 2, '1781509013'),
('VPfwJDagPmcX', 3, '1781509013');

-- --------------------------------------------------------

--
-- Структура таблицы `words`
--

CREATE TABLE `words` (
  `word_id` int NOT NULL,
  `word_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `word_transcription` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `word_translate` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `lang_id` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `words`
--

INSERT INTO `words` (`word_id`, `word_name`, `word_transcription`, `word_translate`, `lang_id`) VALUES
(19, 'house', '[haʊs]', 'дом', 1),
(20, 'car', '[kɑːr]', 'машина', 1),
(21, 'sun', '[sʌn]', 'солнце', 1),
(22, 'moon', '[muːn]', 'луна', 1),
(23, 'tree', '[triː]', 'дерево', 1),
(24, 'bread', '[bred]', 'хлеб', 1),
(25, 'cheese', '[tʃiːz]', 'сыр', 1),
(26, 'egg', '[eɡ]', 'яйцо', 1),
(27, 'meat', '[miːt]', 'мясо', 1),
(28, 'juice', '[dʒuːs]', 'сок', 1),
(31, 'lion', '[ˈlaɪən]', 'лев', 1),
(32, 'tiger', '[ˈtaɪɡər]', 'тигр', 1),
(33, 'elephant', '[ˈelɪfənt]', 'слон', 1),
(34, 'monkey', '[ˈmʌŋki]', 'обезьяна', 1),
(35, 'bear', '[beər]', 'медведь', 1),
(36, 'wolf', '[wʊlf]', 'волк', 1),
(37, 'fox', '[fɒks]', 'лиса', 1),
(38, 'いえ', '[ie]', 'дом', 2),
(39, 'くるま', '[kuruma]', 'машина', 2),
(40, 'たいよう', '[taiyou]', 'солнце', 2),
(41, 'つき', '[tsuki]', 'луна', 2),
(42, 'き', '[ki]', 'дерево', 2),
(43, 'パン', '[pan]', 'хлеб', 2),
(44, 'チーズ', '[chiizu]', 'сыр', 2),
(45, 'たまご', '[tamago]', 'яйцо', 2),
(46, 'にく', '[niku]', 'мясо', 2),
(47, 'ジュース', '[juusu]', 'сок', 2),
(48, 'バナナ', '[banana]', 'банан', 2),
(49, 'オレンジ', '[orenji]', 'апельсин', 2),
(50, 'ねこ', '[neko]', 'кот', 2),
(51, 'いぬ', '[inu]', 'собака', 2),
(52, 'うま', '[uma]', 'лошадь', 2),
(53, 'とり', '[tori]', 'птица', 2),
(54, 'くま', '[kuma]', 'медведь', 2),
(55, 'おおかみ', '[ookami]', 'волк', 2),
(56, 'きつね', '[kitsune]', 'лиса', 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `completed_lessons`
--
ALTER TABLE `completed_lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `langs`
--
ALTER TABLE `langs`
  ADD PRIMARY KEY (`lang_id`);

--
-- Индексы таблицы `leagues`
--
ALTER TABLE `leagues`
  ADD PRIMARY KEY (`league_id`);

--
-- Индексы таблицы `league_users`
--
ALTER TABLE `league_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user__id` (`user_id`),
  ADD UNIQUE KEY `user__id_2` (`user_id`),
  ADD KEY `league_users_ibfk_2` (`weekly_league_id`);

--
-- Индексы таблицы `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `lesson_language` (`lesson_language`);

--
-- Индексы таблицы `lessons_words`
--
ALTER TABLE `lessons_words`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`),
  ADD KEY `word_id` (`word_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_league` (`user_league`);

--
-- Индексы таблицы `user_lang_progress`
--
ALTER TABLE `user_lang_progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang_id` (`lang_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `user_words`
--
ALTER TABLE `user_words`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `word_id` (`word_id`);

--
-- Индексы таблицы `weekly_league`
--
ALTER TABLE `weekly_league`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`word_id`),
  ADD KEY `lang_id` (`lang_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `completed_lessons`
--
ALTER TABLE `completed_lessons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT для таблицы `langs`
--
ALTER TABLE `langs`
  MODIFY `lang_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `leagues`
--
ALTER TABLE `leagues`
  MODIFY `league_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `league_users`
--
ALTER TABLE `league_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24712;

--
-- AUTO_INCREMENT для таблицы `lesson`
--
ALTER TABLE `lesson`
  MODIFY `lesson_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `lessons_words`
--
ALTER TABLE `lessons_words`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT для таблицы `user_lang_progress`
--
ALTER TABLE `user_lang_progress`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT для таблицы `user_words`
--
ALTER TABLE `user_words`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `words`
--
ALTER TABLE `words`
  MODIFY `word_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `completed_lessons`
--
ALTER TABLE `completed_lessons`
  ADD CONSTRAINT `completed_lessons_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`),
  ADD CONSTRAINT `completed_lessons_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `league_users`
--
ALTER TABLE `league_users`
  ADD CONSTRAINT `league_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `league_users_ibfk_2` FOREIGN KEY (`weekly_league_id`) REFERENCES `weekly_league` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`lesson_language`) REFERENCES `langs` (`lang_id`);

--
-- Ограничения внешнего ключа таблицы `lessons_words`
--
ALTER TABLE `lessons_words`
  ADD CONSTRAINT `lessons_words_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lessons_words_ibfk_2` FOREIGN KEY (`word_id`) REFERENCES `words` (`word_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_league`) REFERENCES `leagues` (`league_id`);

--
-- Ограничения внешнего ключа таблицы `user_lang_progress`
--
ALTER TABLE `user_lang_progress`
  ADD CONSTRAINT `user_lang_progress_ibfk_1` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`lang_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_lang_progress_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `user_words`
--
ALTER TABLE `user_words`
  ADD CONSTRAINT `user_words_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_words_ibfk_2` FOREIGN KEY (`word_id`) REFERENCES `words` (`word_id`);

--
-- Ограничения внешнего ключа таблицы `words`
--
ALTER TABLE `words`
  ADD CONSTRAINT `words_ibfk_1` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`lang_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
