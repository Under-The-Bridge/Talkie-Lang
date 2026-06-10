-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 10 2026 г., 07:53
-- Версия сервера: 5.7.39
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
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0'
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
(177, 25, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `langs`
--

CREATE TABLE `langs` (
  `lang_id` int(11) NOT NULL,
  `lang_name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `langs`
--

INSERT INTO `langs` (`lang_id`, `lang_name`) VALUES
(1, 'Английский'),
(2, 'Японский'),
(4, 'Испанский');

-- --------------------------------------------------------

--
-- Структура таблицы `leagues`
--

CREATE TABLE `leagues` (
  `league_id` int(11) NOT NULL,
  `league_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `weekly_league_id` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `league_users`
--

INSERT INTO `league_users` (`id`, `user_id`, `weekly_league_id`) VALUES
(22752, 58, 'QXqcXByhPxTk'),
(22753, 23, 'QXqcXByhPxTk'),
(22754, 16, 'QXqcXByhPxTk'),
(22755, 78, 'QXqcXByhPxTk'),
(22756, 111, 'QXqcXByhPxTk'),
(22757, 68, 'QXqcXByhPxTk'),
(22758, 6, 'QXqcXByhPxTk'),
(22759, 114, 'QXqcXByhPxTk'),
(22760, 37, 'QXqcXByhPxTk'),
(22761, 49, 'QXqcXByhPxTk'),
(22762, 9, 'QXqcXByhPxTk'),
(22763, 79, 'QXqcXByhPxTk'),
(22764, 45, 'QXqcXByhPxTk'),
(22765, 57, 'QXqcXByhPxTk'),
(22766, 76, 'QXqcXByhPxTk'),
(22767, 116, 'UKfeaLeQslBV'),
(22768, 92, 'UKfeaLeQslBV'),
(22769, 70, 'UKfeaLeQslBV'),
(22770, 8, 'UKfeaLeQslBV'),
(22771, 85, 'UKfeaLeQslBV'),
(22772, 91, 'UKfeaLeQslBV'),
(22773, 86, 'UKfeaLeQslBV'),
(22774, 26, 'UKfeaLeQslBV'),
(22775, 110, 'DkSxSxtjsRyo'),
(22776, 63, 'DkSxSxtjsRyo'),
(22777, 74, 'DkSxSxtjsRyo'),
(22778, 34, 'DkSxSxtjsRyo'),
(22779, 75, 'DkSxSxtjsRyo'),
(22780, 10, 'DkSxSxtjsRyo'),
(22781, 65, 'DkSxSxtjsRyo'),
(22782, 32, 'DkSxSxtjsRyo'),
(22783, 55, 'DkSxSxtjsRyo'),
(22784, 28, 'DkSxSxtjsRyo'),
(22785, 66, 'DkSxSxtjsRyo'),
(22786, 43, 'DkSxSxtjsRyo'),
(22787, 72, 'DkSxSxtjsRyo'),
(22788, 47, 'DkSxSxtjsRyo'),
(22789, 35, 'DkSxSxtjsRyo'),
(22790, 80, 'xXVUSjOJqUrC'),
(22791, 12, 'xXVUSjOJqUrC'),
(22792, 13, 'xXVUSjOJqUrC'),
(22793, 56, 'xXVUSjOJqUrC'),
(22794, 59, 'xXVUSjOJqUrC'),
(22795, 29, 'xXVUSjOJqUrC'),
(22796, 33, 'xXVUSjOJqUrC'),
(22797, 27, 'xXVUSjOJqUrC'),
(22798, 31, 'xXVUSjOJqUrC'),
(22799, 50, 'xXVUSjOJqUrC'),
(22800, 48, 'xXVUSjOJqUrC'),
(22801, 67, 'xXVUSjOJqUrC'),
(22802, 18, 'xXVUSjOJqUrC'),
(22803, 73, 'xXVUSjOJqUrC'),
(22804, 14, 'xXVUSjOJqUrC'),
(22805, 44, 'ciJzRbFvAGxV'),
(22806, 17, 'ciJzRbFvAGxV'),
(22807, 115, 'ciJzRbFvAGxV'),
(22808, 19, 'ciJzRbFvAGxV'),
(22809, 42, 'ciJzRbFvAGxV'),
(22810, 88, 'ciJzRbFvAGxV'),
(22811, 60, 'ciJzRbFvAGxV'),
(22812, 71, 'ciJzRbFvAGxV'),
(22813, 20, 'ciJzRbFvAGxV'),
(22814, 7, 'ciJzRbFvAGxV'),
(22815, 69, 'ciJzRbFvAGxV'),
(22816, 15, 'ciJzRbFvAGxV'),
(22817, 89, 'ciJzRbFvAGxV'),
(22818, 22, 'ciJzRbFvAGxV'),
(22819, 81, 'ciJzRbFvAGxV'),
(22820, 51, 'SdWRIYvAFetQ'),
(22821, 52, 'SdWRIYvAFetQ'),
(22822, 5, 'SdWRIYvAFetQ'),
(22823, 11, 'SdWRIYvAFetQ'),
(22824, 62, 'SdWRIYvAFetQ'),
(22825, 4, 'SdWRIYvAFetQ'),
(22826, 113, 'SdWRIYvAFetQ'),
(22827, 77, 'SdWRIYvAFetQ'),
(22828, 64, 'SdWRIYvAFetQ'),
(22829, 53, 'SdWRIYvAFetQ'),
(22830, 87, 'SdWRIYvAFetQ'),
(22831, 61, 'SdWRIYvAFetQ'),
(22832, 84, 'SdWRIYvAFetQ'),
(22833, 38, 'SdWRIYvAFetQ'),
(22834, 108, 'SdWRIYvAFetQ'),
(22835, 25, 'DcpbZHHSKWtk'),
(22836, 2, 'DcpbZHHSKWtk'),
(22837, 54, 'DcpbZHHSKWtk'),
(22838, 40, 'DcpbZHHSKWtk'),
(22839, 46, 'DcpbZHHSKWtk'),
(22840, 83, 'DcpbZHHSKWtk'),
(22841, 36, 'DcpbZHHSKWtk'),
(22842, 24, 'DcpbZHHSKWtk'),
(22843, 90, 'DcpbZHHSKWtk'),
(22844, 30, 'DcpbZHHSKWtk'),
(22845, 41, 'DcpbZHHSKWtk'),
(22846, 21, 'DcpbZHHSKWtk'),
(22847, 112, 'DcpbZHHSKWtk'),
(22848, 82, 'DcpbZHHSKWtk'),
(22849, 39, 'DcpbZHHSKWtk');

-- --------------------------------------------------------

--
-- Структура таблицы `lesson`
--

CREATE TABLE `lesson` (
  `lesson_id` int(11) NOT NULL,
  `lesson_name` varchar(100) NOT NULL,
  `lesson_language` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `word_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(17, 2, 29),
(18, 2, 30),
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
  `user_id` int(11) NOT NULL,
  `user_login` text NOT NULL,
  `user_email` text NOT NULL,
  `user_password` text NOT NULL,
  `user_pfp` text,
  `user_role` enum('user','admin') NOT NULL DEFAULT 'user',
  `user_weekly_xp` int(11) NOT NULL DEFAULT '0',
  `user_league` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_email`, `user_password`, `user_pfp`, `user_role`, `user_weekly_xp`, `user_league`) VALUES
(2, 'Under-The-Bridge', 'ramazanikbaev6@gmail.com', 'Under-The-Bridge', 'naClBRCcYgVJOVcB.jpg', 'user', 0, 3),
(3, 'admin', 'admin@admin.admin', 'admin', '', 'admin', 0, 1),
(4, 'qweqwe', 'qweqwe@qweqwe.qweqwe', 'qweqwe', '', 'user', 0, 3),
(5, 'alex_smith', 'alex.smith@example.com', '123456', '', 'user', 0, 3),
(6, 'maria_johnson', 'maria.johnson@example.com', '123456', '', 'user', 0, 1),
(7, 'dmitry_volkov', 'dmitry.volkov@example.com', '123456', '', 'user', 0, 3),
(8, 'elena_petrova', 'elena.petrova@example.com', '123456', '', 'user', 0, 1),
(9, 'maxim_ivanov', 'maxim.ivanov@example.com', '123456', 'ZYgDMUwvxFQIudpF.jpg', 'user', 0, 1),
(10, 'anna_kozlov', 'anna.kozlov@example.com', '123456', '', 'user', 0, 2),
(11, 'sergey_nikolaev', 'sergey.nikolaev@example.com', '123456', '', 'user', 0, 3),
(12, 'olga_smirnova', 'olga.smirnova@example.com', '123456', '', 'user', 0, 2),
(13, 'ivan_morozov', 'ivan.morozov@example.com', '123456', '', 'user', 0, 2),
(14, 'natalia_fedorova', 'natalia.fedorova@example.com', '123456', '', 'user', 0, 2),
(15, 'andrey_popov', 'andrey.popov@example.com', '123456', '', 'user', 0, 3),
(16, 'tatyana_sokolova', 'tatyana.sokolova@example.com', '123456', '', 'user', 0, 1),
(17, 'pavel_lebenev', 'pavel.lebenev@example.com', '123456', '', 'user', 0, 3),
(18, 'yulia_novikova', 'yulia.novikova@example.com', '123456', '', 'user', 0, 2),
(19, 'vladimir_zaits', 'vladimir.zaits@example.com', '123456', '', 'user', 0, 3),
(20, 'ekaterina_orlova', 'ekaterina.orlova@example.com', '123456', '', 'user', 0, 3),
(21, 'konstantin_makarov', 'konstantin.makarov@example.com', '123456', '', 'user', 0, 3),
(22, 'irina_pavlova', 'irina.pavlova@example.com', '123456', '', 'user', 0, 3),
(23, 'artem_egorov', 'artem.egorov@example.com', '123456', '', 'user', 0, 1),
(24, 'svetlana_timofeeva', 'svetlana.timofeeva@example.com', '123456', '', 'user', 0, 3),
(25, 'denis_volkov', 'denis.volkov@example.com', '123456', '', 'user', 842, 3),
(26, 'ksenia_morozova', 'ksenia.morozova@example.com', '123456', '', 'user', 0, 1),
(27, 'roman_borisov', 'roman.borisov@example.com', '123456', '', 'user', 0, 2),
(28, 'vera_kuznetsova', 'vera.kuznetsova@example.com', '123456', '', 'user', 0, 2),
(29, 'nikita_sidorov', 'nikita.sidorov@example.com', '123456', '', 'user', 0, 2),
(30, 'polina_vasilyeva', 'polina.vasilyeva@example.com', '123456', '', 'user', 0, 3),
(31, 'oleg_timofeev', 'oleg.timofeev@example.com', '123456', '', 'user', 0, 2),
(32, 'bash_ars', 'bash.bash@example.com', '123456', 'mgneafswCvlfKcvN.jpg', 'user', 0, 2),
(33, 'user_001', 'user001@example.com', '123456', '', 'user', 0, 2),
(34, 'user_002', 'user002@example.com', '123456', '', 'user', 0, 2),
(35, 'user_003', 'user003@example.com', '123456', '', 'user', 0, 2),
(36, 'user_004', 'user004@example.com', '123456', '', 'user', 0, 3),
(37, 'user_005', 'user005@example.com', '123456', '', 'user', 0, 1),
(38, 'user_006', 'user006@example.com', '123456', '', 'user', 0, 3),
(39, 'user_007', 'user007@example.com', '123456', '', 'user', 0, 3),
(40, 'user_008', 'user008@example.com', '123456', '', 'user', 0, 3),
(41, 'user_009', 'user009@example.com', '123456', '', 'user', 0, 3),
(42, 'user_010', 'user010@example.com', '123456', '', 'user', 0, 3),
(43, 'user_011', 'user011@example.com', '123456', '', 'user', 0, 2),
(44, 'user_012', 'user012@example.com', '123456', '', 'user', 0, 3),
(45, 'user_013', 'user013@example.com', '123456', '', 'user', 0, 1),
(46, 'user_014', 'user014@example.com', '123456', '', 'user', 0, 3),
(47, 'user_015', 'user015@example.com', '123456', '', 'user', 0, 2),
(48, 'user_016', 'user016@example.com', '123456', '', 'user', 0, 2),
(49, 'user_017', 'user017@example.com', '123456', '', 'user', 0, 1),
(50, 'user_018', 'user018@example.com', '123456', '', 'user', 0, 2),
(51, 'user_019', 'user019@example.com', '123456', '', 'user', 0, 3),
(52, 'user_020', 'user020@example.com', '123456', '', 'user', 0, 3),
(53, 'user_021', 'user021@example.com', '123456', '', 'user', 0, 3),
(54, 'user_022', 'user022@example.com', '123456', '', 'user', 0, 3),
(55, 'user_023', 'user023@example.com', '123456', '', 'user', 0, 2),
(56, 'user_024', 'user024@example.com', '123456', '', 'user', 0, 2),
(57, 'user_025', 'user025@example.com', '123456', '', 'user', 0, 1),
(58, 'user_026', 'user026@example.com', '123456', '', 'user', 0, 1),
(59, 'user_027', 'user027@example.com', '123456', '', 'user', 0, 2),
(60, 'user_028', 'user028@example.com', '123456', '', 'user', 0, 3),
(61, 'user_029', 'user029@example.com', '123456', '', 'user', 0, 3),
(62, 'user_030', 'user030@example.com', '123456', '', 'user', 0, 3),
(63, 'user_031', 'user031@example.com', '123456', '', 'user', 0, 2),
(64, 'user_032', 'user032@example.com', '123456', '', 'user', 0, 3),
(65, 'user_033', 'user033@example.com', '123456', '', 'user', 0, 2),
(66, 'user_034', 'user034@example.com', '123456', '', 'user', 0, 2),
(67, 'user_035', 'user035@example.com', '123456', '', 'user', 0, 2),
(68, 'user_036', 'user036@example.com', '123456', '', 'user', 0, 1),
(69, 'user_037', 'user037@example.com', '123456', '', 'user', 0, 3),
(70, 'user_038', 'user038@example.com', '123456', '', 'user', 0, 1),
(71, 'user_039', 'user039@example.com', '123456', '', 'user', 0, 3),
(72, 'user_040', 'user040@example.com', '123456', '', 'user', 0, 2),
(73, 'user_041', 'user041@example.com', '123456', '', 'user', 0, 2),
(74, 'user_042', 'user042@example.com', '123456', '', 'user', 0, 2),
(75, 'user_043', 'user043@example.com', '123456', '', 'user', 0, 2),
(76, 'user_044', 'user044@example.com', '123456', '', 'user', 0, 1),
(77, 'user_045', 'user045@example.com', '123456', '', 'user', 0, 3),
(78, 'user_046', 'user046@example.com', '123456', '', 'user', 0, 1),
(79, 'user_047', 'user047@example.com', '123456', '', 'user', 0, 1),
(80, 'user_048', 'user048@example.com', '123456', '', 'user', 0, 2),
(81, 'user_049', 'user049@example.com', '123456', '', 'user', 0, 3),
(82, 'user_050', 'user050@example.com', '123456', '', 'user', 0, 3),
(83, 'user_051', 'user051@example.com', '123456', '', 'user', 0, 3),
(84, 'user_052', 'user052@example.com', '123456', '', 'user', 0, 3),
(85, 'user_053', 'user053@example.com', '123456', '', 'user', 0, 1),
(86, 'user_054', 'user054@example.com', '123456', '', 'user', 0, 1),
(87, 'user_055', 'user055@example.com', '123456', '', 'user', 0, 3),
(88, 'user_056', 'user056@example.com', '123456', '', 'user', 0, 3),
(89, 'user_057', 'user057@example.com', '123456', '', 'user', 0, 3),
(90, 'user_058', 'user058@example.com', '123456', '', 'user', 0, 3),
(91, 'user_059', 'user059@example.com', '123456', '', 'user', 0, 1),
(92, 'user_060', 'user060@example.com', '123456', '', 'user', 0, 1),
(108, 'ramz', 'ramz@ramz', 'ramz', '', 'user', 0, 3),
(110, 'qqqq', 'qqqq@qqqq', 'qqqq', '', 'user', 0, 2),
(111, 'zxczxczxc', 'zxczxczxc@zxczxczxc', 'zxczxczxc', '', 'user', 0, 1),
(112, 'ramziktvt@gmail.com', 'ramziktvt@gmail.com', 'ramziktvt@gmail.com', '', 'user', 0, 3),
(113, 'wwww', 'ww@ww', 'wwww', '', 'user', 0, 3),
(114, 'rama', 'rama@rama', 'rama', 'VjMohxedYfLYNCtB.jpg', 'user', 0, 1),
(115, 'temp1', 'temp1@gmail.com', 'temp1', NULL, 'user', 0, 3),
(116, 'vadim', 'vadim@vadim.com', 'vadim', 'QEpwKOetlQaGKdmG.jpg', 'user', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user_lang_progress`
--

CREATE TABLE `user_lang_progress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `progress` int(11) NOT NULL DEFAULT '0'
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
(56, 116, 4, 0),
(57, 116, 2, 0),
(58, 25, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user_words`
--

CREATE TABLE `user_words` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `word_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(29, 25, 22);

-- --------------------------------------------------------

--
-- Структура таблицы `weekly_league`
--

CREATE TABLE `weekly_league` (
  `id` varchar(12) NOT NULL,
  `league_id` int(11) NOT NULL,
  `time` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `weekly_league`
--

INSERT INTO `weekly_league` (`id`, `league_id`, `time`) VALUES
('ciJzRbFvAGxV', 3, '1781150422'),
('DcpbZHHSKWtk', 3, '1781150422'),
('DkSxSxtjsRyo', 2, '1781150422'),
('QXqcXByhPxTk', 1, '1781150422'),
('SdWRIYvAFetQ', 3, '1781150422'),
('UKfeaLeQslBV', 1, '1781150422'),
('xXVUSjOJqUrC', 2, '1781150422');

-- --------------------------------------------------------

--
-- Структура таблицы `words`
--

CREATE TABLE `words` (
  `word_id` int(11) NOT NULL,
  `word_name` varchar(100) NOT NULL,
  `word_transcription` varchar(100) DEFAULT NULL,
  `word_translate` varchar(100) NOT NULL,
  `lang_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(29, 'banana', '[bəˈnænə]', 'банан', 1),
(30, 'orange', '[ˈɒrɪndʒ]', 'апельсин', 1),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT для таблицы `langs`
--
ALTER TABLE `langs`
  MODIFY `lang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `leagues`
--
ALTER TABLE `leagues`
  MODIFY `league_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `league_users`
--
ALTER TABLE `league_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22850;

--
-- AUTO_INCREMENT для таблицы `lesson`
--
ALTER TABLE `lesson`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `lessons_words`
--
ALTER TABLE `lessons_words`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT для таблицы `user_lang_progress`
--
ALTER TABLE `user_lang_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT для таблицы `user_words`
--
ALTER TABLE `user_words`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `words`
--
ALTER TABLE `words`
  MODIFY `word_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

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
  ADD CONSTRAINT `user_lang_progress_ibfk_1` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`lang_id`),
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
