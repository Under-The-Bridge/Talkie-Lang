-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Май 24 2026 г., 14:56
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
(161, 2, 4, 4);

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
(18054, 31, 'QtUoPyEgrylq'),
(18055, 111, 'QtUoPyEgrylq'),
(18056, 50, 'QtUoPyEgrylq'),
(18057, 27, 'QtUoPyEgrylq'),
(18058, 92, 'QtUoPyEgrylq'),
(18059, 24, 'QtUoPyEgrylq'),
(18060, 34, 'QtUoPyEgrylq'),
(18061, 47, 'QtUoPyEgrylq'),
(18062, 4, 'QtUoPyEgrylq'),
(18063, 54, 'QtUoPyEgrylq'),
(18064, 76, 'QtUoPyEgrylq'),
(18065, 89, 'QtUoPyEgrylq'),
(18066, 43, 'QtUoPyEgrylq'),
(18067, 81, 'QtUoPyEgrylq'),
(18068, 68, 'QtUoPyEgrylq'),
(18069, 75, 'dOcIsqBXZkie'),
(18070, 59, 'dOcIsqBXZkie'),
(18071, 45, 'dOcIsqBXZkie'),
(18072, 44, 'dOcIsqBXZkie'),
(18073, 60, 'dOcIsqBXZkie'),
(18074, 7, 'dOcIsqBXZkie'),
(18075, 63, 'dOcIsqBXZkie'),
(18076, 16, 'dOcIsqBXZkie'),
(18077, 80, 'dOcIsqBXZkie'),
(18078, 10, 'dOcIsqBXZkie'),
(18079, 64, 'dOcIsqBXZkie'),
(18080, 35, 'dOcIsqBXZkie'),
(18081, 39, 'dOcIsqBXZkie'),
(18082, 5, 'dOcIsqBXZkie'),
(18083, 83, 'dOcIsqBXZkie'),
(18084, 11, 'hVFywDWMQciG'),
(18085, 65, 'hVFywDWMQciG'),
(18086, 87, 'hVFywDWMQciG'),
(18087, 71, 'hVFywDWMQciG'),
(18088, 66, 'hVFywDWMQciG'),
(18089, 32, 'hVFywDWMQciG'),
(18090, 57, 'hVFywDWMQciG'),
(18091, 74, 'hVFywDWMQciG'),
(18092, 28, 'hVFywDWMQciG'),
(18093, 13, 'hVFywDWMQciG'),
(18094, 46, 'hVFywDWMQciG'),
(18095, 17, 'hVFywDWMQciG'),
(18096, 40, 'hVFywDWMQciG'),
(18097, 12, 'hVFywDWMQciG'),
(18098, 73, 'hVFywDWMQciG'),
(18099, 18, 'ufqlOKwECTpW'),
(18100, 84, 'ufqlOKwECTpW'),
(18101, 78, 'ufqlOKwECTpW'),
(18102, 53, 'ufqlOKwECTpW'),
(18103, 49, 'ufqlOKwECTpW'),
(18104, 70, 'ufqlOKwECTpW'),
(18105, 72, 'ufqlOKwECTpW'),
(18106, 6, 'ufqlOKwECTpW'),
(18107, 52, 'ufqlOKwECTpW'),
(18108, 86, 'ufqlOKwECTpW'),
(18109, 14, 'ufqlOKwECTpW'),
(18110, 20, 'ufqlOKwECTpW'),
(18111, 2, 'ufqlOKwECTpW'),
(18112, 91, 'ufqlOKwECTpW'),
(18113, 26, 'ufqlOKwECTpW'),
(18114, 58, 'ZNzHfJJIpQKV'),
(18115, 77, 'ZNzHfJJIpQKV'),
(18116, 69, 'ZNzHfJJIpQKV'),
(18117, 25, 'ZNzHfJJIpQKV'),
(18118, 33, 'ZNzHfJJIpQKV'),
(18119, 8, 'ZNzHfJJIpQKV'),
(18120, 41, 'ZNzHfJJIpQKV'),
(18121, 37, 'ZNzHfJJIpQKV'),
(18122, 55, 'ZNzHfJJIpQKV'),
(18123, 29, 'ZNzHfJJIpQKV'),
(18124, 48, 'ZNzHfJJIpQKV'),
(18125, 9, 'ZNzHfJJIpQKV'),
(18126, 88, 'ZNzHfJJIpQKV'),
(18127, 108, 'ZNzHfJJIpQKV'),
(18128, 62, 'ZNzHfJJIpQKV'),
(18129, 30, 'lvPEIzugpHcP'),
(18130, 110, 'lvPEIzugpHcP'),
(18131, 61, 'lvPEIzugpHcP'),
(18132, 42, 'lvPEIzugpHcP'),
(18133, 15, 'lvPEIzugpHcP'),
(18134, 21, 'lvPEIzugpHcP'),
(18135, 90, 'lvPEIzugpHcP'),
(18136, 19, 'lvPEIzugpHcP'),
(18137, 82, 'lvPEIzugpHcP'),
(18138, 38, 'lvPEIzugpHcP'),
(18139, 51, 'lvPEIzugpHcP'),
(18140, 85, 'lvPEIzugpHcP'),
(18141, 56, 'lvPEIzugpHcP'),
(18142, 22, 'lvPEIzugpHcP'),
(18143, 23, 'lvPEIzugpHcP'),
(18144, 36, 'UIdryYBMmtuU'),
(18145, 67, 'UIdryYBMmtuU'),
(18146, 112, 'UIdryYBMmtuU'),
(18147, 79, 'UIdryYBMmtuU');

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
  `user_role` enum('user','admin') NOT NULL DEFAULT 'user',
  `user_weekly_xp` int NOT NULL DEFAULT '0',
  `user_league` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_email`, `user_password`, `user_role`, `user_weekly_xp`, `user_league`) VALUES
(2, 'Under-The-Bridge', 'ramazanikbaev6@gmail.com', 'Under-The-Bridge', 'user', 3987, 2),
(3, 'admin', 'admin@admin.admin', 'admin', 'admin', 0, 1),
(4, 'qweqwe', 'qweqwe@qweqwe.qweqwe', 'qweqwe', 'user', 0, 1),
(5, 'alex_smith', 'alex.smith@example.com', '123456', 'user', 0, 1),
(6, 'maria_johnson', 'maria.johnson@example.com', '123456', 'user', 0, 2),
(7, 'dmitry_volkov', 'dmitry.volkov@example.com', '123456', 'user', 0, 1),
(8, 'elena_petrova', 'elena.petrova@example.com', '123456', 'user', 0, 3),
(9, 'maxim_ivanov', 'maxim.ivanov@example.com', '123456', 'user', 0, 3),
(10, 'anna_kozlov', 'anna.kozlov@example.com', '123456', 'user', 0, 1),
(11, 'sergey_nikolaev', 'sergey.nikolaev@example.com', '123456', 'user', 0, 2),
(12, 'olga_smirnova', 'olga.smirnova@example.com', '123456', 'user', 0, 2),
(13, 'ivan_morozov', 'ivan.morozov@example.com', '123456', 'user', 0, 2),
(14, 'natalia_fedorova', 'natalia.fedorova@example.com', '123456', 'user', 0, 2),
(15, 'andrey_popov', 'andrey.popov@example.com', '123456', 'user', 0, 3),
(16, 'tatyana_sokolova', 'tatyana.sokolova@example.com', '123456', 'user', 0, 1),
(17, 'pavel_lebenev', 'pavel.lebenev@example.com', '123456', 'user', 0, 2),
(18, 'yulia_novikova', 'yulia.novikova@example.com', '123456', 'user', 0, 2),
(19, 'vladimir_zaits', 'vladimir.zaits@example.com', '123456', 'user', 0, 3),
(20, 'ekaterina_orlova', 'ekaterina.orlova@example.com', '123456', 'user', 0, 2),
(21, 'konstantin_makarov', 'konstantin.makarov@example.com', '123456', 'user', 0, 3),
(22, 'irina_pavlova', 'irina.pavlova@example.com', '123456', 'user', 0, 3),
(23, 'artem_egorov', 'artem.egorov@example.com', '123456', 'user', 0, 3),
(24, 'svetlana_timofeeva', 'svetlana.timofeeva@example.com', '123456', 'user', 0, 1),
(25, 'denis_volkov', 'denis.volkov@example.com', '123456', 'user', 0, 3),
(26, 'ksenia_morozova', 'ksenia.morozova@example.com', '123456', 'user', 0, 2),
(27, 'roman_borisov', 'roman.borisov@example.com', '123456', 'user', 0, 1),
(28, 'vera_kuznetsova', 'vera.kuznetsova@example.com', '123456', 'user', 0, 2),
(29, 'nikita_sidorov', 'nikita.sidorov@example.com', '123456', 'user', 0, 3),
(30, 'polina_vasilyeva', 'polina.vasilyeva@example.com', '123456', 'user', 0, 3),
(31, 'oleg_timofeev', 'oleg.timofeev@example.com', '123456', 'user', 0, 1),
(32, 'bash_ars', 'bash.bash@example.com', '123456', 'user', 0, 2),
(33, 'user_001', 'user001@example.com', '123456', 'user', 0, 3),
(34, 'user_002', 'user002@example.com', '123456', 'user', 0, 1),
(35, 'user_003', 'user003@example.com', '123456', 'user', 0, 1),
(36, 'user_004', 'user004@example.com', '123456', 'user', 0, 3),
(37, 'user_005', 'user005@example.com', '123456', 'user', 0, 3),
(38, 'user_006', 'user006@example.com', '123456', 'user', 0, 3),
(39, 'user_007', 'user007@example.com', '123456', 'user', 0, 1),
(40, 'user_008', 'user008@example.com', '123456', 'user', 0, 2),
(41, 'user_009', 'user009@example.com', '123456', 'user', 0, 3),
(42, 'user_010', 'user010@example.com', '123456', 'user', 0, 3),
(43, 'user_011', 'user011@example.com', '123456', 'user', 0, 1),
(44, 'user_012', 'user012@example.com', '123456', 'user', 0, 1),
(45, 'user_013', 'user013@example.com', '123456', 'user', 0, 1),
(46, 'user_014', 'user014@example.com', '123456', 'user', 0, 2),
(47, 'user_015', 'user015@example.com', '123456', 'user', 0, 1),
(48, 'user_016', 'user016@example.com', '123456', 'user', 0, 3),
(49, 'user_017', 'user017@example.com', '123456', 'user', 0, 2),
(50, 'user_018', 'user018@example.com', '123456', 'user', 0, 1),
(51, 'user_019', 'user019@example.com', '123456', 'user', 0, 3),
(52, 'user_020', 'user020@example.com', '123456', 'user', 0, 2),
(53, 'user_021', 'user021@example.com', '123456', 'user', 0, 2),
(54, 'user_022', 'user022@example.com', '123456', 'user', 0, 1),
(55, 'user_023', 'user023@example.com', '123456', 'user', 0, 3),
(56, 'user_024', 'user024@example.com', '123456', 'user', 0, 3),
(57, 'user_025', 'user025@example.com', '123456', 'user', 0, 2),
(58, 'user_026', 'user026@example.com', '123456', 'user', 0, 3),
(59, 'user_027', 'user027@example.com', '123456', 'user', 0, 1),
(60, 'user_028', 'user028@example.com', '123456', 'user', 0, 1),
(61, 'user_029', 'user029@example.com', '123456', 'user', 0, 3),
(62, 'user_030', 'user030@example.com', '123456', 'user', 0, 3),
(63, 'user_031', 'user031@example.com', '123456', 'user', 0, 1),
(64, 'user_032', 'user032@example.com', '123456', 'user', 0, 1),
(65, 'user_033', 'user033@example.com', '123456', 'user', 0, 2),
(66, 'user_034', 'user034@example.com', '123456', 'user', 0, 2),
(67, 'user_035', 'user035@example.com', '123456', 'user', 0, 3),
(68, 'user_036', 'user036@example.com', '123456', 'user', 0, 1),
(69, 'user_037', 'user037@example.com', '123456', 'user', 0, 3),
(70, 'user_038', 'user038@example.com', '123456', 'user', 0, 2),
(71, 'user_039', 'user039@example.com', '123456', 'user', 0, 2),
(72, 'user_040', 'user040@example.com', '123456', 'user', 0, 2),
(73, 'user_041', 'user041@example.com', '123456', 'user', 0, 2),
(74, 'user_042', 'user042@example.com', '123456', 'user', 0, 2),
(75, 'user_043', 'user043@example.com', '123456', 'user', 0, 1),
(76, 'user_044', 'user044@example.com', '123456', 'user', 0, 1),
(77, 'user_045', 'user045@example.com', '123456', 'user', 0, 3),
(78, 'user_046', 'user046@example.com', '123456', 'user', 0, 2),
(79, 'user_047', 'user047@example.com', '123456', 'user', 0, 3),
(80, 'user_048', 'user048@example.com', '123456', 'user', 0, 1),
(81, 'user_049', 'user049@example.com', '123456', 'user', 0, 1),
(82, 'user_050', 'user050@example.com', '123456', 'user', 0, 3),
(83, 'user_051', 'user051@example.com', '123456', 'user', 0, 1),
(84, 'user_052', 'user052@example.com', '123456', 'user', 0, 2),
(85, 'user_053', 'user053@example.com', '123456', 'user', 0, 3),
(86, 'user_054', 'user054@example.com', '123456', 'user', 0, 2),
(87, 'user_055', 'user055@example.com', '123456', 'user', 0, 2),
(88, 'user_056', 'user056@example.com', '123456', 'user', 0, 3),
(89, 'user_057', 'user057@example.com', '123456', 'user', 0, 1),
(90, 'user_058', 'user058@example.com', '123456', 'user', 0, 3),
(91, 'user_059', 'user059@example.com', '123456', 'user', 0, 2),
(92, 'user_060', 'user060@example.com', '123456', 'user', 0, 1),
(108, 'ramz', 'ramz@ramz', 'ramz', 'user', 0, 3),
(110, 'qqqq', 'qqqq@qqqq', 'qqqq', 'user', 0, 3),
(111, 'zxczxczxc', 'zxczxczxc@zxczxczxc', 'zxczxczxc', 'user', 0, 1),
(112, 'ramziktvt@gmail.com', 'ramziktvt@gmail.com', 'ramziktvt@gmail.com', 'user', 0, 3);

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
(45, 2, 2, 0);

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
(13, 2, 42);

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
('dOcIsqBXZkie', 1, '1779624652'),
('hVFywDWMQciG', 2, '1779624652'),
('lvPEIzugpHcP', 3, '1779624652'),
('QtUoPyEgrylq', 1, '1779624652'),
('ufqlOKwECTpW', 2, '1779624652'),
('UIdryYBMmtuU', 3, '1779624652'),
('ZNzHfJJIpQKV', 3, '1779624652');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18148;

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
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT для таблицы `user_lang_progress`
--
ALTER TABLE `user_lang_progress`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `user_words`
--
ALTER TABLE `user_words`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
