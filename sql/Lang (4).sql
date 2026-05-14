-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Май 14 2026 г., 21:02
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
(129, 2, 1, 4),
(130, 2, 2, 2),
(131, 2, 1, 0),
(132, 2, 4, 0),
(133, 2, 4, 0),
(134, 2, 4, 0),
(135, 2, 4, 0),
(136, 2, 4, 0),
(137, 2, 4, 0),
(149, 110, 1, 0),
(150, 110, 4, 0),
(156, 111, 4, 0),
(157, 111, 1, 0),
(158, 112, 1, 1),
(159, 112, 4, 1),
(160, 2, 4, 0);

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
(17960, 71, 'MZsgiLVhCiDc'),
(17961, 46, 'MZsgiLVhCiDc'),
(17962, 40, 'MZsgiLVhCiDc'),
(17963, 52, 'MZsgiLVhCiDc'),
(17964, 26, 'MZsgiLVhCiDc'),
(17965, 43, 'MZsgiLVhCiDc'),
(17966, 76, 'MZsgiLVhCiDc'),
(17967, 89, 'MZsgiLVhCiDc'),
(17968, 111, 'MZsgiLVhCiDc'),
(17969, 5, 'MZsgiLVhCiDc'),
(17970, 75, 'MZsgiLVhCiDc'),
(17971, 80, 'MZsgiLVhCiDc'),
(17972, 16, 'MZsgiLVhCiDc'),
(17973, 47, 'MZsgiLVhCiDc'),
(17974, 27, 'MZsgiLVhCiDc'),
(17975, 78, 'PDYdNViGceGm'),
(17976, 86, 'PDYdNViGceGm'),
(17977, 72, 'PDYdNViGceGm'),
(17978, 70, 'PDYdNViGceGm'),
(17979, 87, 'PDYdNViGceGm'),
(17980, 60, 'PDYdNViGceGm'),
(17981, 34, 'PDYdNViGceGm'),
(17982, 54, 'PDYdNViGceGm'),
(17983, 35, 'PDYdNViGceGm'),
(17984, 50, 'PDYdNViGceGm'),
(17985, 4, 'PDYdNViGceGm'),
(17986, 45, 'PDYdNViGceGm'),
(17987, 63, 'PDYdNViGceGm'),
(17988, 24, 'PDYdNViGceGm'),
(17989, 92, 'PDYdNViGceGm'),
(17990, 15, 'jODdJuDxXSHx'),
(17991, 36, 'jODdJuDxXSHx'),
(17992, 108, 'jODdJuDxXSHx'),
(17993, 62, 'jODdJuDxXSHx'),
(17994, 61, 'jODdJuDxXSHx'),
(17995, 28, 'jODdJuDxXSHx'),
(17996, 32, 'jODdJuDxXSHx'),
(17997, 18, 'jODdJuDxXSHx'),
(17998, 65, 'jODdJuDxXSHx'),
(17999, 57, 'jODdJuDxXSHx'),
(18000, 31, 'jODdJuDxXSHx'),
(18001, 39, 'jODdJuDxXSHx'),
(18002, 59, 'jODdJuDxXSHx'),
(18003, 68, 'jODdJuDxXSHx'),
(18004, 10, 'jODdJuDxXSHx'),
(18005, 21, 'UgyqwIwhwsSJ'),
(18006, 51, 'UgyqwIwhwsSJ'),
(18007, 56, 'UgyqwIwhwsSJ'),
(18008, 37, 'UgyqwIwhwsSJ'),
(18009, 69, 'UgyqwIwhwsSJ'),
(18010, 53, 'UgyqwIwhwsSJ'),
(18011, 66, 'UgyqwIwhwsSJ'),
(18012, 6, 'UgyqwIwhwsSJ'),
(18013, 11, 'UgyqwIwhwsSJ'),
(18014, 73, 'UgyqwIwhwsSJ'),
(18015, 44, 'UgyqwIwhwsSJ'),
(18016, 64, 'UgyqwIwhwsSJ'),
(18017, 7, 'UgyqwIwhwsSJ'),
(18018, 81, 'UgyqwIwhwsSJ'),
(18019, 83, 'UgyqwIwhwsSJ'),
(18020, 38, 'VsXZnqMhrERx'),
(18021, 88, 'VsXZnqMhrERx'),
(18022, 58, 'VsXZnqMhrERx'),
(18023, 48, 'VsXZnqMhrERx'),
(18024, 33, 'VsXZnqMhrERx'),
(18025, 55, 'VsXZnqMhrERx'),
(18026, 112, 'VsXZnqMhrERx'),
(18027, 30, 'VsXZnqMhrERx'),
(18028, 110, 'VsXZnqMhrERx'),
(18029, 19, 'VsXZnqMhrERx'),
(18030, 2, 'VsXZnqMhrERx'),
(18031, 12, 'VsXZnqMhrERx'),
(18032, 14, 'VsXZnqMhrERx'),
(18033, 84, 'VsXZnqMhrERx'),
(18034, 74, 'VsXZnqMhrERx'),
(18035, 42, 'qorUmzmUDbxM'),
(18036, 82, 'qorUmzmUDbxM'),
(18037, 8, 'qorUmzmUDbxM'),
(18038, 79, 'qorUmzmUDbxM'),
(18039, 85, 'qorUmzmUDbxM'),
(18040, 23, 'qorUmzmUDbxM'),
(18041, 29, 'qorUmzmUDbxM'),
(18042, 41, 'qorUmzmUDbxM'),
(18043, 77, 'qorUmzmUDbxM'),
(18044, 67, 'qorUmzmUDbxM'),
(18045, 91, 'qorUmzmUDbxM'),
(18046, 49, 'qorUmzmUDbxM'),
(18047, 13, 'qorUmzmUDbxM'),
(18048, 20, 'qorUmzmUDbxM'),
(18049, 17, 'qorUmzmUDbxM'),
(18050, 9, 'rNnVpOFoawuM'),
(18051, 22, 'rNnVpOFoawuM'),
(18052, 25, 'rNnVpOFoawuM'),
(18053, 90, 'rNnVpOFoawuM');

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
(6, 'Животные', 2),
(26, 'Пусто', 1);

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
(44, 6, 56),
(77, 26, 20);

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
(2, 'Under-The-Bridge', 'ramazanikbaev6@gmail.com', 'Under-The-Bridge', 'user', 0, 3),
(3, 'admin', 'admin@admin.admin', 'admin', 'admin', 0, 1),
(4, 'qweqwe', 'qweqwe@qweqwe.qweqwe', 'qweqwe', 'user', 0, 1),
(5, 'alex_smith', 'alex.smith@example.com', '123456', 'user', 0, 1),
(6, 'maria_johnson', 'maria.johnson@example.com', '123456', 'user', 0, 2),
(7, 'dmitry_volkov', 'dmitry.volkov@example.com', '123456', 'user', 0, 2),
(8, 'elena_petrova', 'elena.petrova@example.com', '123456', 'user', 0, 3),
(9, 'maxim_ivanov', 'maxim.ivanov@example.com', '123456', 'user', 0, 3),
(10, 'anna_kozlov', 'anna.kozlov@example.com', '123456', 'user', 0, 2),
(11, 'sergey_nikolaev', 'sergey.nikolaev@example.com', '123456', 'user', 0, 2),
(12, 'olga_smirnova', 'olga.smirnova@example.com', '123456', 'user', 0, 3),
(13, 'ivan_morozov', 'ivan.morozov@example.com', '123456', 'user', 0, 3),
(14, 'natalia_fedorova', 'natalia.fedorova@example.com', '123456', 'user', 0, 3),
(15, 'andrey_popov', 'andrey.popov@example.com', '123456', 'user', 0, 2),
(16, 'tatyana_sokolova', 'tatyana.sokolova@example.com', '123456', 'user', 0, 1),
(17, 'pavel_lebenev', 'pavel.lebenev@example.com', '123456', 'user', 0, 3),
(18, 'yulia_novikova', 'yulia.novikova@example.com', '123456', 'user', 0, 2),
(19, 'vladimir_zaits', 'vladimir.zaits@example.com', '123456', 'user', 0, 3),
(20, 'ekaterina_orlova', 'ekaterina.orlova@example.com', '123456', 'user', 0, 3),
(21, 'konstantin_makarov', 'konstantin.makarov@example.com', '123456', 'user', 0, 2),
(22, 'irina_pavlova', 'irina.pavlova@example.com', '123456', 'user', 0, 3),
(23, 'artem_egorov', 'artem.egorov@example.com', '123456', 'user', 0, 3),
(24, 'svetlana_timofeeva', 'svetlana.timofeeva@example.com', '123456', 'user', 0, 1),
(25, 'denis_volkov', 'denis.volkov@example.com', '123456', 'user', 0, 3),
(26, 'ksenia_morozova', 'ksenia.morozova@example.com', '123456', 'user', 0, 1),
(27, 'roman_borisov', 'roman.borisov@example.com', '123456', 'user', 0, 1),
(28, 'vera_kuznetsova', 'vera.kuznetsova@example.com', '123456', 'user', 0, 2),
(29, 'nikita_sidorov', 'nikita.sidorov@example.com', '123456', 'user', 0, 3),
(30, 'polina_vasilyeva', 'polina.vasilyeva@example.com', '123456', 'user', 0, 3),
(31, 'oleg_timofeev', 'oleg.timofeev@example.com', '123456', 'user', 0, 2),
(32, 'bash_ars', 'bash.bash@example.com', '123456', 'user', 0, 2),
(33, 'user_001', 'user001@example.com', '123456', 'user', 0, 3),
(34, 'user_002', 'user002@example.com', '123456', 'user', 0, 1),
(35, 'user_003', 'user003@example.com', '123456', 'user', 0, 1),
(36, 'user_004', 'user004@example.com', '123456', 'user', 0, 2),
(37, 'user_005', 'user005@example.com', '123456', 'user', 0, 2),
(38, 'user_006', 'user006@example.com', '123456', 'user', 0, 3),
(39, 'user_007', 'user007@example.com', '123456', 'user', 0, 2),
(40, 'user_008', 'user008@example.com', '123456', 'user', 0, 1),
(41, 'user_009', 'user009@example.com', '123456', 'user', 0, 3),
(42, 'user_010', 'user010@example.com', '123456', 'user', 0, 3),
(43, 'user_011', 'user011@example.com', '123456', 'user', 0, 1),
(44, 'user_012', 'user012@example.com', '123456', 'user', 0, 2),
(45, 'user_013', 'user013@example.com', '123456', 'user', 0, 1),
(46, 'user_014', 'user014@example.com', '123456', 'user', 0, 1),
(47, 'user_015', 'user015@example.com', '123456', 'user', 0, 1),
(48, 'user_016', 'user016@example.com', '123456', 'user', 0, 3),
(49, 'user_017', 'user017@example.com', '123456', 'user', 0, 3),
(50, 'user_018', 'user018@example.com', '123456', 'user', 0, 1),
(51, 'user_019', 'user019@example.com', '123456', 'user', 0, 2),
(52, 'user_020', 'user020@example.com', '123456', 'user', 0, 1),
(53, 'user_021', 'user021@example.com', '123456', 'user', 0, 2),
(54, 'user_022', 'user022@example.com', '123456', 'user', 0, 1),
(55, 'user_023', 'user023@example.com', '123456', 'user', 0, 3),
(56, 'user_024', 'user024@example.com', '123456', 'user', 0, 2),
(57, 'user_025', 'user025@example.com', '123456', 'user', 0, 2),
(58, 'user_026', 'user026@example.com', '123456', 'user', 0, 3),
(59, 'user_027', 'user027@example.com', '123456', 'user', 0, 2),
(60, 'user_028', 'user028@example.com', '123456', 'user', 0, 1),
(61, 'user_029', 'user029@example.com', '123456', 'user', 0, 2),
(62, 'user_030', 'user030@example.com', '123456', 'user', 0, 2),
(63, 'user_031', 'user031@example.com', '123456', 'user', 0, 1),
(64, 'user_032', 'user032@example.com', '123456', 'user', 0, 2),
(65, 'user_033', 'user033@example.com', '123456', 'user', 0, 2),
(66, 'user_034', 'user034@example.com', '123456', 'user', 0, 2),
(67, 'user_035', 'user035@example.com', '123456', 'user', 0, 3),
(68, 'user_036', 'user036@example.com', '123456', 'user', 0, 2),
(69, 'user_037', 'user037@example.com', '123456', 'user', 0, 2),
(70, 'user_038', 'user038@example.com', '123456', 'user', 0, 1),
(71, 'user_039', 'user039@example.com', '123456', 'user', 0, 1),
(72, 'user_040', 'user040@example.com', '123456', 'user', 0, 1),
(73, 'user_041', 'user041@example.com', '123456', 'user', 0, 2),
(74, 'user_042', 'user042@example.com', '123456', 'user', 0, 3),
(75, 'user_043', 'user043@example.com', '123456', 'user', 0, 1),
(76, 'user_044', 'user044@example.com', '123456', 'user', 0, 1),
(77, 'user_045', 'user045@example.com', '123456', 'user', 0, 3),
(78, 'user_046', 'user046@example.com', '123456', 'user', 0, 1),
(79, 'user_047', 'user047@example.com', '123456', 'user', 0, 3),
(80, 'user_048', 'user048@example.com', '123456', 'user', 0, 1),
(81, 'user_049', 'user049@example.com', '123456', 'user', 0, 2),
(82, 'user_050', 'user050@example.com', '123456', 'user', 0, 3),
(83, 'user_051', 'user051@example.com', '123456', 'user', 0, 2),
(84, 'user_052', 'user052@example.com', '123456', 'user', 0, 3),
(85, 'user_053', 'user053@example.com', '123456', 'user', 0, 3),
(86, 'user_054', 'user054@example.com', '123456', 'user', 0, 1),
(87, 'user_055', 'user055@example.com', '123456', 'user', 0, 1),
(88, 'user_056', 'user056@example.com', '123456', 'user', 0, 3),
(89, 'user_057', 'user057@example.com', '123456', 'user', 0, 1),
(90, 'user_058', 'user058@example.com', '123456', 'user', 0, 3),
(91, 'user_059', 'user059@example.com', '123456', 'user', 0, 3),
(92, 'user_060', 'user060@example.com', '123456', 'user', 0, 1),
(108, 'ramz', 'ramz@ramz', 'ramz', 'user', 0, 2),
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
(14, 2, 1, 1),
(15, 2, 1, 0),
(16, 2, 1, 0),
(17, 2, 1, 0),
(18, 2, 1, 0),
(19, 2, 1, 0),
(20, 2, 1, 0),
(21, 2, 1, 0),
(33, 110, 1, 0),
(34, 110, 1, 0),
(40, 111, 2, 0),
(41, 111, 1, 0),
(42, 112, 1, 0),
(43, 112, 2, 0),
(44, 2, 2, 0);

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
(10, 112, 42);

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
('jODdJuDxXSHx', 2, '1778784910'),
('MZsgiLVhCiDc', 1, '1778784910'),
('PDYdNViGceGm', 1, '1778784910'),
('qorUmzmUDbxM', 3, '1778784910'),
('rNnVpOFoawuM', 3, '1778784910'),
('UgyqwIwhwsSJ', 2, '1778784910'),
('VsXZnqMhrERx', 3, '1778784910');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18054;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `user_words`
--
ALTER TABLE `user_words`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
