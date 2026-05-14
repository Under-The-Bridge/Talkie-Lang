-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 14 2026 г., 08:27
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
(130, 2, 1, 4),
(131, 2, 2, 4),
(132, 2, 3, 4),
(133, 2, 26, 1);

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
(2, 'Японский');

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
(41262, 23, 'zIQQKLTOSZms'),
(41263, 49, 'zIQQKLTOSZms'),
(41264, 66, 'zIQQKLTOSZms'),
(41265, 60, 'zIQQKLTOSZms'),
(41266, 34, 'zIQQKLTOSZms'),
(41267, 89, 'zIQQKLTOSZms'),
(41268, 59, 'zIQQKLTOSZms'),
(41269, 75, 'zIQQKLTOSZms'),
(41270, 81, 'zIQQKLTOSZms'),
(41271, 61, 'zIQQKLTOSZms'),
(41272, 5, 'zIQQKLTOSZms'),
(41273, 36, 'zIQQKLTOSZms'),
(41274, 37, 'zIQQKLTOSZms'),
(41275, 28, 'zIQQKLTOSZms'),
(41276, 41, 'zIQQKLTOSZms'),
(41277, 64, 'gTjOJMeeFCoU'),
(41278, 52, 'gTjOJMeeFCoU'),
(41279, 14, 'gTjOJMeeFCoU'),
(41280, 63, 'gTjOJMeeFCoU'),
(41281, 48, 'gTjOJMeeFCoU'),
(41282, 45, 'gTjOJMeeFCoU'),
(41283, 38, 'gTjOJMeeFCoU'),
(41284, 19, 'gTjOJMeeFCoU'),
(41285, 54, 'gTjOJMeeFCoU'),
(41286, 78, 'gTjOJMeeFCoU'),
(41287, 74, 'gTjOJMeeFCoU'),
(41288, 25, 'gTjOJMeeFCoU'),
(41289, 51, 'gTjOJMeeFCoU'),
(41290, 18, 'gTjOJMeeFCoU'),
(41291, 24, 'gTjOJMeeFCoU'),
(41292, 7, 'UARsLpkEbRwJ'),
(41293, 58, 'UARsLpkEbRwJ'),
(41294, 50, 'UARsLpkEbRwJ'),
(41295, 55, 'UARsLpkEbRwJ'),
(41296, 88, 'UARsLpkEbRwJ'),
(41297, 87, 'UARsLpkEbRwJ'),
(41298, 26, 'UARsLpkEbRwJ'),
(41299, 91, 'UARsLpkEbRwJ'),
(41300, 21, 'UARsLpkEbRwJ'),
(41301, 65, 'UARsLpkEbRwJ'),
(41302, 85, 'UARsLpkEbRwJ'),
(41303, 20, 'UARsLpkEbRwJ'),
(41304, 4, 'UARsLpkEbRwJ'),
(41305, 44, 'UARsLpkEbRwJ'),
(41306, 16, 'UARsLpkEbRwJ'),
(41307, 71, 'DiNaTxUntiye'),
(41308, 32, 'DiNaTxUntiye'),
(41309, 80, 'DiNaTxUntiye'),
(41310, 9, 'DiNaTxUntiye'),
(41311, 62, 'DiNaTxUntiye'),
(41312, 69, 'DiNaTxUntiye'),
(41313, 70, 'DiNaTxUntiye'),
(41314, 8, 'DiNaTxUntiye'),
(41315, 92, 'DiNaTxUntiye'),
(41316, 68, 'DiNaTxUntiye'),
(41317, 33, 'DiNaTxUntiye'),
(41318, 12, 'DiNaTxUntiye'),
(41319, 47, 'DiNaTxUntiye'),
(41320, 6, 'DiNaTxUntiye'),
(41321, 40, 'DiNaTxUntiye'),
(41322, 2, 'iDKQUOBiJxNe'),
(41323, 11, 'iDKQUOBiJxNe'),
(41324, 13, 'iDKQUOBiJxNe'),
(41325, 43, 'iDKQUOBiJxNe'),
(41326, 76, 'iDKQUOBiJxNe'),
(41327, 84, 'iDKQUOBiJxNe'),
(41328, 79, 'iDKQUOBiJxNe'),
(41329, 86, 'iDKQUOBiJxNe'),
(41330, 42, 'iDKQUOBiJxNe'),
(41331, 31, 'iDKQUOBiJxNe'),
(41332, 83, 'iDKQUOBiJxNe'),
(41333, 77, 'iDKQUOBiJxNe'),
(41334, 82, 'iDKQUOBiJxNe'),
(41335, 90, 'iDKQUOBiJxNe'),
(41336, 53, 'iDKQUOBiJxNe'),
(41337, 56, 'OZUETrdQrTqm'),
(41338, 57, 'OZUETrdQrTqm'),
(41339, 27, 'OZUETrdQrTqm'),
(41340, 67, 'OZUETrdQrTqm'),
(41341, 39, 'OZUETrdQrTqm'),
(41342, 30, 'OZUETrdQrTqm'),
(41343, 29, 'OZUETrdQrTqm'),
(41344, 73, 'OZUETrdQrTqm'),
(41345, 22, 'OZUETrdQrTqm'),
(41346, 72, 'OZUETrdQrTqm'),
(41347, 46, 'OZUETrdQrTqm'),
(41348, 17, 'OZUETrdQrTqm'),
(41349, 10, 'OZUETrdQrTqm'),
(41350, 35, 'OZUETrdQrTqm'),
(41351, 15, 'OZUETrdQrTqm');

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
(6, 'Животные', 2),
(26, 'Пусто', 1);

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
(44, 6, 56),
(77, 26, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_login` text NOT NULL,
  `user_email` text NOT NULL,
  `user_password` text NOT NULL,
  `user_role` enum('user','admin') NOT NULL DEFAULT 'user',
  `user_weekly_xp` int(11) NOT NULL DEFAULT '0',
  `user_league` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_email`, `user_password`, `user_role`, `user_weekly_xp`, `user_league`) VALUES
(2, 'Under-The-Bridge', 'ramazanikbaev6@gmail.com', 'Under-The-Bridge', 'user', 0, 3),
(3, 'admin', 'admin@admin.admin', 'admin', 'admin', 0, 1),
(4, 'qweqwe', 'qweqwe@qweqwe.qweqwe', 'qweqwe', 'user', 0, 2),
(5, 'alex_smith', 'alex.smith@example.com', '123456', 'user', 0, 1),
(6, 'maria_johnson', 'maria.johnson@example.com', '123456', 'user', 0, 2),
(7, 'dmitry_volkov', 'dmitry.volkov@example.com', '123456', 'user', 0, 2),
(8, 'elena_petrova', 'elena.petrova@example.com', '123456', 'user', 0, 2),
(9, 'maxim_ivanov', 'maxim.ivanov@example.com', '123456', 'user', 0, 2),
(10, 'anna_kozlov', 'anna.kozlov@example.com', '123456', 'user', 0, 3),
(11, 'sergey_nikolaev', 'sergey.nikolaev@example.com', '123456', 'user', 0, 3),
(12, 'olga_smirnova', 'olga.smirnova@example.com', '123456', 'user', 0, 2),
(13, 'ivan_morozov', 'ivan.morozov@example.com', '123456', 'user', 0, 3),
(14, 'natalia_fedorova', 'natalia.fedorova@example.com', '123456', 'user', 0, 1),
(15, 'andrey_popov', 'andrey.popov@example.com', '123456', 'user', 0, 3),
(16, 'tatyana_sokolova', 'tatyana.sokolova@example.com', '123456', 'user', 0, 2),
(17, 'pavel_lebenev', 'pavel.lebenev@example.com', '123456', 'user', 0, 3),
(18, 'yulia_novikova', 'yulia.novikova@example.com', '123456', 'user', 0, 1),
(19, 'vladimir_zaits', 'vladimir.zaits@example.com', '123456', 'user', 0, 1),
(20, 'ekaterina_orlova', 'ekaterina.orlova@example.com', '123456', 'user', 0, 2),
(21, 'konstantin_makarov', 'konstantin.makarov@example.com', '123456', 'user', 0, 2),
(22, 'irina_pavlova', 'irina.pavlova@example.com', '123456', 'user', 0, 3),
(23, 'artem_egorov', 'artem.egorov@example.com', '123456', 'user', 0, 1),
(24, 'svetlana_timofeeva', 'svetlana.timofeeva@example.com', '123456', 'user', 0, 1),
(25, 'denis_volkov', 'denis.volkov@example.com', '123456', 'user', 0, 1),
(26, 'ksenia_morozova', 'ksenia.morozova@example.com', '123456', 'user', 0, 2),
(27, 'roman_borisov', 'roman.borisov@example.com', '123456', 'user', 0, 3),
(28, 'vera_kuznetsova', 'vera.kuznetsova@example.com', '123456', 'user', 0, 1),
(29, 'nikita_sidorov', 'nikita.sidorov@example.com', '123456', 'user', 0, 3),
(30, 'polina_vasilyeva', 'polina.vasilyeva@example.com', '123456', 'user', 0, 3),
(31, 'oleg_timofeev', 'oleg.timofeev@example.com', '123456', 'user', 0, 3),
(32, 'bash_ars', 'bash.bash@example.com', '123456', 'user', 0, 2),
(33, 'user_001', 'user001@example.com', '123456', 'user', 0, 2),
(34, 'user_002', 'user002@example.com', '123456', 'user', 0, 1),
(35, 'user_003', 'user003@example.com', '123456', 'user', 0, 3),
(36, 'user_004', 'user004@example.com', '123456', 'user', 0, 1),
(37, 'user_005', 'user005@example.com', '123456', 'user', 0, 1),
(38, 'user_006', 'user006@example.com', '123456', 'user', 0, 1),
(39, 'user_007', 'user007@example.com', '123456', 'user', 0, 3),
(40, 'user_008', 'user008@example.com', '123456', 'user', 0, 2),
(41, 'user_009', 'user009@example.com', '123456', 'user', 0, 1),
(42, 'user_010', 'user010@example.com', '123456', 'user', 0, 3),
(43, 'user_011', 'user011@example.com', '123456', 'user', 0, 3),
(44, 'user_012', 'user012@example.com', '123456', 'user', 0, 2),
(45, 'user_013', 'user013@example.com', '123456', 'user', 0, 1),
(46, 'user_014', 'user014@example.com', '123456', 'user', 0, 3),
(47, 'user_015', 'user015@example.com', '123456', 'user', 0, 2),
(48, 'user_016', 'user016@example.com', '123456', 'user', 0, 1),
(49, 'user_017', 'user017@example.com', '123456', 'user', 0, 1),
(50, 'user_018', 'user018@example.com', '123456', 'user', 0, 2),
(51, 'user_019', 'user019@example.com', '123456', 'user', 0, 1),
(52, 'user_020', 'user020@example.com', '123456', 'user', 0, 1),
(53, 'user_021', 'user021@example.com', '123456', 'user', 0, 3),
(54, 'user_022', 'user022@example.com', '123456', 'user', 0, 1),
(55, 'user_023', 'user023@example.com', '123456', 'user', 0, 2),
(56, 'user_024', 'user024@example.com', '123456', 'user', 0, 3),
(57, 'user_025', 'user025@example.com', '123456', 'user', 0, 3),
(58, 'user_026', 'user026@example.com', '123456', 'user', 0, 2),
(59, 'user_027', 'user027@example.com', '123456', 'user', 0, 1),
(60, 'user_028', 'user028@example.com', '123456', 'user', 0, 1),
(61, 'user_029', 'user029@example.com', '123456', 'user', 0, 1),
(62, 'user_030', 'user030@example.com', '123456', 'user', 0, 2),
(63, 'user_031', 'user031@example.com', '123456', 'user', 0, 1),
(64, 'user_032', 'user032@example.com', '123456', 'user', 0, 1),
(65, 'user_033', 'user033@example.com', '123456', 'user', 0, 2),
(66, 'user_034', 'user034@example.com', '123456', 'user', 0, 1),
(67, 'user_035', 'user035@example.com', '123456', 'user', 0, 3),
(68, 'user_036', 'user036@example.com', '123456', 'user', 0, 2),
(69, 'user_037', 'user037@example.com', '123456', 'user', 0, 2),
(70, 'user_038', 'user038@example.com', '123456', 'user', 0, 2),
(71, 'user_039', 'user039@example.com', '123456', 'user', 0, 2),
(72, 'user_040', 'user040@example.com', '123456', 'user', 0, 3),
(73, 'user_041', 'user041@example.com', '123456', 'user', 0, 3),
(74, 'user_042', 'user042@example.com', '123456', 'user', 0, 1),
(75, 'user_043', 'user043@example.com', '123456', 'user', 0, 1),
(76, 'user_044', 'user044@example.com', '123456', 'user', 0, 3),
(77, 'user_045', 'user045@example.com', '123456', 'user', 0, 3),
(78, 'user_046', 'user046@example.com', '123456', 'user', 0, 1),
(79, 'user_047', 'user047@example.com', '123456', 'user', 0, 3),
(80, 'user_048', 'user048@example.com', '123456', 'user', 0, 2),
(81, 'user_049', 'user049@example.com', '123456', 'user', 0, 1),
(82, 'user_050', 'user050@example.com', '123456', 'user', 0, 3),
(83, 'user_051', 'user051@example.com', '123456', 'user', 0, 3),
(84, 'user_052', 'user052@example.com', '123456', 'user', 0, 3),
(85, 'user_053', 'user053@example.com', '123456', 'user', 0, 2),
(86, 'user_054', 'user054@example.com', '123456', 'user', 0, 3),
(87, 'user_055', 'user055@example.com', '123456', 'user', 0, 2),
(88, 'user_056', 'user056@example.com', '123456', 'user', 0, 2),
(89, 'user_057', 'user057@example.com', '123456', 'user', 0, 1),
(90, 'user_058', 'user058@example.com', '123456', 'user', 0, 3),
(91, 'user_059', 'user059@example.com', '123456', 'user', 0, 2),
(92, 'user_060', 'user060@example.com', '123456', 'user', 0, 2);

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
(15, 2, 1, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `user_words`
--

CREATE TABLE `user_words` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `word_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_words`
--

INSERT INTO `user_words` (`id`, `user_id`, `word_id`) VALUES
(1, 2, 22),
(2, 2, 20),
(3, 2, 21),
(4, 2, 19),
(5, 2, 26),
(6, 2, 25),
(7, 2, 29),
(8, 2, 28),
(9, 2, 30),
(10, 2, 34),
(11, 2, 36),
(12, 2, 31);

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
('DiNaTxUntiye', 2, '1778737678'),
('gTjOJMeeFCoU', 1, '1778737678'),
('iDKQUOBiJxNe', 3, '1778737678'),
('OZUETrdQrTqm', 3, '1778737678'),
('UARsLpkEbRwJ', 2, '1778737678'),
('zIQQKLTOSZms', 1, '1778737678');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT для таблицы `langs`
--
ALTER TABLE `langs`
  MODIFY `lang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `leagues`
--
ALTER TABLE `leagues`
  MODIFY `league_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `league_users`
--
ALTER TABLE `league_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41352;

--
-- AUTO_INCREMENT для таблицы `lesson`
--
ALTER TABLE `lesson`
  MODIFY `lesson_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `lessons_words`
--
ALTER TABLE `lessons_words`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT для таблицы `user_lang_progress`
--
ALTER TABLE `user_lang_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `user_words`
--
ALTER TABLE `user_words`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `words`
--
ALTER TABLE `words`
  MODIFY `word_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

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
