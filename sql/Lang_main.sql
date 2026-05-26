-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Май 26 2026 г., 21:10
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
(168, 2, 1, 2),
(169, 12, 1, 4),
(170, 12, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `langs`
--

CREATE TABLE `langs` (
  `lang_id` int NOT NULL,
  `lang_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
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
  `league_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `weekly_league_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `league_users`
--

INSERT INTO `league_users` (`id`, `user_id`, `weekly_league_id`) VALUES
(20141, 53, 'XDKBcSsICccg'),
(20142, 49, 'XDKBcSsICccg'),
(20143, 47, 'XDKBcSsICccg'),
(20144, 38, 'XDKBcSsICccg'),
(20145, 48, 'XDKBcSsICccg'),
(20146, 37, 'XDKBcSsICccg'),
(20147, 84, 'XDKBcSsICccg'),
(20148, 45, 'XDKBcSsICccg'),
(20149, 42, 'XDKBcSsICccg'),
(20150, 11, 'XDKBcSsICccg'),
(20151, 65, 'XDKBcSsICccg'),
(20152, 28, 'XDKBcSsICccg'),
(20153, 71, 'XDKBcSsICccg'),
(20154, 72, 'XDKBcSsICccg'),
(20155, 79, 'XDKBcSsICccg'),
(20156, 8, 'wYrVVapNaBov'),
(20157, 23, 'wYrVVapNaBov'),
(20158, 69, 'wYrVVapNaBov'),
(20159, 6, 'wYrVVapNaBov'),
(20160, 36, 'wYrVVapNaBov'),
(20161, 78, 'wYrVVapNaBov'),
(20162, 12, 'wYrVVapNaBov'),
(20163, 64, 'wYrVVapNaBov'),
(20164, 22, 'wYrVVapNaBov'),
(20165, 41, 'wYrVVapNaBov'),
(20166, 4, 'wYrVVapNaBov'),
(20167, 77, 'wYrVVapNaBov'),
(20168, 61, 'wYrVVapNaBov'),
(20169, 20, 'wYrVVapNaBov'),
(20170, 112, 'wYrVVapNaBov'),
(20171, 18, 'VCChkQSjCOin'),
(20172, 62, 'VCChkQSjCOin'),
(20173, 21, 'VCChkQSjCOin'),
(20174, 83, 'VCChkQSjCOin'),
(20175, 39, 'VCChkQSjCOin'),
(20176, 26, 'VCChkQSjCOin'),
(20177, 17, 'VCChkQSjCOin'),
(20178, 75, 'VCChkQSjCOin'),
(20179, 50, 'VCChkQSjCOin'),
(20180, 82, 'VCChkQSjCOin'),
(20181, 91, 'VCChkQSjCOin'),
(20182, 16, 'VCChkQSjCOin'),
(20183, 34, 'VCChkQSjCOin'),
(20184, 25, 'VCChkQSjCOin'),
(20185, 63, 'VCChkQSjCOin'),
(20186, 87, 'YiEKbTQJhtCj'),
(20187, 29, 'YiEKbTQJhtCj'),
(20188, 66, 'YiEKbTQJhtCj'),
(20189, 56, 'YiEKbTQJhtCj'),
(20190, 43, 'YiEKbTQJhtCj'),
(20191, 113, 'YiEKbTQJhtCj'),
(20192, 73, 'YiEKbTQJhtCj'),
(20193, 51, 'YiEKbTQJhtCj'),
(20194, 68, 'YiEKbTQJhtCj'),
(20195, 35, 'YiEKbTQJhtCj'),
(20196, 89, 'YiEKbTQJhtCj'),
(20197, 86, 'YiEKbTQJhtCj'),
(20198, 15, 'YiEKbTQJhtCj'),
(20199, 54, 'YiEKbTQJhtCj'),
(20200, 108, 'YiEKbTQJhtCj'),
(20201, 7, 'ppkIyyijDipI'),
(20202, 13, 'ppkIyyijDipI'),
(20203, 80, 'ppkIyyijDipI'),
(20204, 111, 'ppkIyyijDipI'),
(20205, 90, 'ppkIyyijDipI'),
(20206, 81, 'ppkIyyijDipI'),
(20207, 57, 'ppkIyyijDipI'),
(20208, 110, 'ppkIyyijDipI'),
(20209, 92, 'ppkIyyijDipI'),
(20210, 40, 'ppkIyyijDipI'),
(20211, 55, 'ppkIyyijDipI'),
(20212, 59, 'ppkIyyijDipI'),
(20213, 32, 'ppkIyyijDipI'),
(20214, 52, 'ppkIyyijDipI'),
(20215, 88, 'ppkIyyijDipI'),
(20216, 74, 'KTuINqvTdjld'),
(20217, 2, 'KTuINqvTdjld'),
(20218, 70, 'KTuINqvTdjld'),
(20219, 5, 'KTuINqvTdjld'),
(20220, 76, 'KTuINqvTdjld'),
(20221, 31, 'KTuINqvTdjld'),
(20222, 58, 'KTuINqvTdjld'),
(20223, 30, 'KTuINqvTdjld'),
(20224, 19, 'KTuINqvTdjld'),
(20225, 9, 'KTuINqvTdjld'),
(20226, 27, 'KTuINqvTdjld'),
(20227, 67, 'KTuINqvTdjld'),
(20228, 10, 'KTuINqvTdjld'),
(20229, 60, 'KTuINqvTdjld'),
(20230, 14, 'KTuINqvTdjld'),
(20231, 24, 'vEQUPydmkKvU'),
(20232, 85, 'vEQUPydmkKvU'),
(20233, 46, 'vEQUPydmkKvU'),
(20234, 33, 'vEQUPydmkKvU'),
(20235, 44, 'vEQUPydmkKvU');

-- --------------------------------------------------------

--
-- Структура таблицы `lesson`
--

CREATE TABLE `lesson` (
  `lesson_id` int NOT NULL,
  `lesson_name` varchar(100) NOT NULL,
  `lesson_language` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `user_id` int NOT NULL,
  `user_login` text NOT NULL,
  `user_email` text NOT NULL,
  `user_password` text NOT NULL,
  `user_pfp` text NOT NULL,
  `user_role` enum('user','admin') NOT NULL DEFAULT 'user',
  `user_weekly_xp` int NOT NULL DEFAULT '0',
  `user_league` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_email`, `user_password`, `user_pfp`, `user_role`, `user_weekly_xp`, `user_league`) VALUES
(2, 'Under-The-Bridge', 'ramazanikbaev6@gmail.com', 'Under-The-Bridge', 'tzEXQykmqGVFiAWd.jpg', 'user', 0, 3),
(3, 'admin', 'admin@admin.admin', 'admin', '', 'admin', 0, 1),
(4, 'qweqwe', 'qweqwe@qweqwe.qweqwe', 'qweqwe', '', 'user', 0, 1),
(5, 'alex_smith', 'alex.smith@example.com', '123456', '', 'user', 0, 3),
(6, 'maria_johnson', 'maria.johnson@example.com', '123456', '', 'user', 0, 1),
(7, 'dmitry_volkov', 'dmitry.volkov@example.com', '123456', '', 'user', 0, 3),
(8, 'elena_petrova', 'elena.petrova@example.com', '123456', '', 'user', 0, 1),
(9, 'maxim_ivanov', 'maxim.ivanov@example.com', '123456', 'ZYgDMUwvxFQIudpF.jpg', 'user', 0, 3),
(10, 'anna_kozlov', 'anna.kozlov@example.com', '123456', '', 'user', 0, 3),
(11, 'sergey_nikolaev', 'sergey.nikolaev@example.com', '123456', '', 'user', 0, 1),
(12, 'olga_smirnova', 'olga.smirnova@example.com', '123456', '', 'user', 0, 1),
(13, 'ivan_morozov', 'ivan.morozov@example.com', '123456', '', 'user', 0, 3),
(14, 'natalia_fedorova', 'natalia.fedorova@example.com', '123456', '', 'user', 0, 3),
(15, 'andrey_popov', 'andrey.popov@example.com', '123456', '', 'user', 0, 2),
(16, 'tatyana_sokolova', 'tatyana.sokolova@example.com', '123456', '', 'user', 0, 2),
(17, 'pavel_lebenev', 'pavel.lebenev@example.com', '123456', '', 'user', 0, 2),
(18, 'yulia_novikova', 'yulia.novikova@example.com', '123456', '', 'user', 0, 2),
(19, 'vladimir_zaits', 'vladimir.zaits@example.com', '123456', '', 'user', 0, 3),
(20, 'ekaterina_orlova', 'ekaterina.orlova@example.com', '123456', '', 'user', 0, 1),
(21, 'konstantin_makarov', 'konstantin.makarov@example.com', '123456', '', 'user', 0, 2),
(22, 'irina_pavlova', 'irina.pavlova@example.com', '123456', '', 'user', 0, 1),
(23, 'artem_egorov', 'artem.egorov@example.com', '123456', '', 'user', 0, 1),
(24, 'svetlana_timofeeva', 'svetlana.timofeeva@example.com', '123456', '', 'user', 0, 3),
(25, 'denis_volkov', 'denis.volkov@example.com', '123456', '', 'user', 0, 2),
(26, 'ksenia_morozova', 'ksenia.morozova@example.com', '123456', '', 'user', 0, 2),
(27, 'roman_borisov', 'roman.borisov@example.com', '123456', '', 'user', 0, 3),
(28, 'vera_kuznetsova', 'vera.kuznetsova@example.com', '123456', '', 'user', 0, 1),
(29, 'nikita_sidorov', 'nikita.sidorov@example.com', '123456', '', 'user', 0, 2),
(30, 'polina_vasilyeva', 'polina.vasilyeva@example.com', '123456', '', 'user', 0, 3),
(31, 'oleg_timofeev', 'oleg.timofeev@example.com', '123456', '', 'user', 0, 3),
(32, 'bash_ars', 'bash.bash@example.com', '123456', '', 'user', 0, 3),
(33, 'user_001', 'user001@example.com', '123456', '', 'user', 0, 3),
(34, 'user_002', 'user002@example.com', '123456', '', 'user', 0, 2),
(35, 'user_003', 'user003@example.com', '123456', '', 'user', 0, 2),
(36, 'user_004', 'user004@example.com', '123456', '', 'user', 0, 1),
(37, 'user_005', 'user005@example.com', '123456', '', 'user', 0, 1),
(38, 'user_006', 'user006@example.com', '123456', '', 'user', 0, 1),
(39, 'user_007', 'user007@example.com', '123456', '', 'user', 0, 2),
(40, 'user_008', 'user008@example.com', '123456', '', 'user', 0, 3),
(41, 'user_009', 'user009@example.com', '123456', '', 'user', 0, 1),
(42, 'user_010', 'user010@example.com', '123456', '', 'user', 0, 1),
(43, 'user_011', 'user011@example.com', '123456', '', 'user', 0, 2),
(44, 'user_012', 'user012@example.com', '123456', '', 'user', 0, 3),
(45, 'user_013', 'user013@example.com', '123456', '', 'user', 0, 1),
(46, 'user_014', 'user014@example.com', '123456', '', 'user', 0, 3),
(47, 'user_015', 'user015@example.com', '123456', '', 'user', 0, 1),
(48, 'user_016', 'user016@example.com', '123456', '', 'user', 0, 1),
(49, 'user_017', 'user017@example.com', '123456', '', 'user', 0, 1),
(50, 'user_018', 'user018@example.com', '123456', '', 'user', 0, 2),
(51, 'user_019', 'user019@example.com', '123456', '', 'user', 0, 2),
(52, 'user_020', 'user020@example.com', '123456', '', 'user', 0, 3),
(53, 'user_021', 'user021@example.com', '123456', '', 'user', 0, 1),
(54, 'user_022', 'user022@example.com', '123456', '', 'user', 0, 2),
(55, 'user_023', 'user023@example.com', '123456', '', 'user', 0, 3),
(56, 'user_024', 'user024@example.com', '123456', '', 'user', 0, 2),
(57, 'user_025', 'user025@example.com', '123456', '', 'user', 0, 3),
(58, 'user_026', 'user026@example.com', '123456', '', 'user', 0, 3),
(59, 'user_027', 'user027@example.com', '123456', '', 'user', 0, 3),
(60, 'user_028', 'user028@example.com', '123456', '', 'user', 0, 3),
(61, 'user_029', 'user029@example.com', '123456', '', 'user', 0, 1),
(62, 'user_030', 'user030@example.com', '123456', '', 'user', 0, 2),
(63, 'user_031', 'user031@example.com', '123456', '', 'user', 0, 2),
(64, 'user_032', 'user032@example.com', '123456', '', 'user', 0, 1),
(65, 'user_033', 'user033@example.com', '123456', '', 'user', 0, 1),
(66, 'user_034', 'user034@example.com', '123456', '', 'user', 0, 2),
(67, 'user_035', 'user035@example.com', '123456', '', 'user', 0, 3),
(68, 'user_036', 'user036@example.com', '123456', '', 'user', 0, 2),
(69, 'user_037', 'user037@example.com', '123456', '', 'user', 0, 1),
(70, 'user_038', 'user038@example.com', '123456', '', 'user', 0, 3),
(71, 'user_039', 'user039@example.com', '123456', '', 'user', 0, 1),
(72, 'user_040', 'user040@example.com', '123456', '', 'user', 0, 1),
(73, 'user_041', 'user041@example.com', '123456', '', 'user', 0, 2),
(74, 'user_042', 'user042@example.com', '123456', '', 'user', 0, 3),
(75, 'user_043', 'user043@example.com', '123456', '', 'user', 0, 2),
(76, 'user_044', 'user044@example.com', '123456', '', 'user', 0, 3),
(77, 'user_045', 'user045@example.com', '123456', '', 'user', 0, 1),
(78, 'user_046', 'user046@example.com', '123456', '', 'user', 0, 1),
(79, 'user_047', 'user047@example.com', '123456', '', 'user', 0, 1),
(80, 'user_048', 'user048@example.com', '123456', '', 'user', 0, 3),
(81, 'user_049', 'user049@example.com', '123456', '', 'user', 0, 3),
(82, 'user_050', 'user050@example.com', '123456', '', 'user', 0, 2),
(83, 'user_051', 'user051@example.com', '123456', '', 'user', 0, 2),
(84, 'user_052', 'user052@example.com', '123456', '', 'user', 0, 1),
(85, 'user_053', 'user053@example.com', '123456', '', 'user', 0, 3),
(86, 'user_054', 'user054@example.com', '123456', '', 'user', 0, 2),
(87, 'user_055', 'user055@example.com', '123456', '', 'user', 0, 2),
(88, 'user_056', 'user056@example.com', '123456', '', 'user', 0, 3),
(89, 'user_057', 'user057@example.com', '123456', '', 'user', 0, 2),
(90, 'user_058', 'user058@example.com', '123456', '', 'user', 0, 3),
(91, 'user_059', 'user059@example.com', '123456', '', 'user', 0, 2),
(92, 'user_060', 'user060@example.com', '123456', '', 'user', 0, 3),
(108, 'ramz', 'ramz@ramz', 'ramz', '', 'user', 0, 2),
(110, 'qqqq', 'qqqq@qqqq', 'qqqq', '', 'user', 0, 3),
(111, 'zxczxczxc', 'zxczxczxc@zxczxczxc', 'zxczxczxc', '', 'user', 0, 3),
(112, 'ramziktvt@gmail.com', 'ramziktvt@gmail.com', 'ramziktvt@gmail.com', '', 'user', 0, 1),
(113, 'wwww', 'ww@ww', 'wwww', '', 'user', 0, 2);

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
(51, 12, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user_words`
--

CREATE TABLE `user_words` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `word_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(21, 12, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `weekly_league`
--

CREATE TABLE `weekly_league` (
  `id` varchar(12) NOT NULL,
  `league_id` int NOT NULL,
  `time` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `weekly_league`
--

INSERT INTO `weekly_league` (`id`, `league_id`, `time`) VALUES
('KTuINqvTdjld', 3, '1779905366'),
('ppkIyyijDipI', 3, '1779905366'),
('VCChkQSjCOin', 2, '1779905366'),
('vEQUPydmkKvU', 3, '1779905366'),
('wYrVVapNaBov', 1, '1779905366'),
('XDKBcSsICccg', 1, '1779905366'),
('YiEKbTQJhtCj', 2, '1779905366');

-- --------------------------------------------------------

--
-- Структура таблицы `words`
--

CREATE TABLE `words` (
  `word_id` int NOT NULL,
  `word_name` varchar(100) NOT NULL,
  `word_transcription` varchar(100) DEFAULT NULL,
  `word_translate` varchar(100) NOT NULL,
  `lang_id` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT для таблицы `langs`
--
ALTER TABLE `langs`
  MODIFY `lang_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `leagues`
--
ALTER TABLE `leagues`
  MODIFY `league_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `league_users`
--
ALTER TABLE `league_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20236;

--
-- AUTO_INCREMENT для таблицы `lesson`
--
ALTER TABLE `lesson`
  MODIFY `lesson_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `lessons_words`
--
ALTER TABLE `lessons_words`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT для таблицы `user_lang_progress`
--
ALTER TABLE `user_lang_progress`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT для таблицы `user_words`
--
ALTER TABLE `user_words`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
  ADD CONSTRAINT `league_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
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
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_league`) REFERENCES `leagues` (`league_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `user_lang_progress`
--
ALTER TABLE `user_lang_progress`
  ADD CONSTRAINT `user_lang_progress_ibfk_1` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`lang_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_lang_progress_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `user_words`
--
ALTER TABLE `user_words`
  ADD CONSTRAINT `user_words_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_words_ibfk_2` FOREIGN KEY (`word_id`) REFERENCES `words` (`word_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `words`
--
ALTER TABLE `words`
  ADD CONSTRAINT `words_ibfk_1` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`lang_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
