-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 12 2026 г., 10:44
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
(130, 2, 1, 2);

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
(27762, 61, 'ReXrjpGOpCLi'),
(27763, 90, 'ReXrjpGOpCLi'),
(27764, 49, 'ReXrjpGOpCLi'),
(27765, 40, 'ReXrjpGOpCLi'),
(27766, 86, 'ReXrjpGOpCLi'),
(27767, 76, 'ReXrjpGOpCLi'),
(27768, 33, 'ReXrjpGOpCLi'),
(27769, 79, 'ReXrjpGOpCLi'),
(27770, 68, 'ReXrjpGOpCLi'),
(27771, 32, 'ReXrjpGOpCLi'),
(27772, 48, 'ReXrjpGOpCLi'),
(27773, 71, 'ReXrjpGOpCLi'),
(27774, 52, 'ReXrjpGOpCLi'),
(27775, 10, 'ReXrjpGOpCLi'),
(27776, 4, 'ReXrjpGOpCLi'),
(27777, 85, 'amCSoRfRJeIc'),
(27778, 55, 'amCSoRfRJeIc'),
(27779, 37, 'amCSoRfRJeIc'),
(27780, 89, 'amCSoRfRJeIc'),
(27781, 66, 'amCSoRfRJeIc'),
(27782, 46, 'amCSoRfRJeIc'),
(27783, 17, 'amCSoRfRJeIc'),
(27784, 11, 'amCSoRfRJeIc'),
(27785, 88, 'amCSoRfRJeIc'),
(27786, 67, 'amCSoRfRJeIc'),
(27787, 23, 'amCSoRfRJeIc'),
(27788, 63, 'amCSoRfRJeIc'),
(27789, 53, 'amCSoRfRJeIc'),
(27790, 28, 'amCSoRfRJeIc'),
(27791, 9, 'amCSoRfRJeIc'),
(27792, 5, 'JXusYTkRCnvT'),
(27793, 26, 'JXusYTkRCnvT'),
(27794, 20, 'JXusYTkRCnvT'),
(27795, 13, 'JXusYTkRCnvT'),
(27796, 29, 'JXusYTkRCnvT'),
(27797, 82, 'JXusYTkRCnvT'),
(27798, 81, 'JXusYTkRCnvT'),
(27799, 58, 'JXusYTkRCnvT'),
(27800, 51, 'JXusYTkRCnvT'),
(27801, 30, 'JXusYTkRCnvT'),
(27802, 78, 'JXusYTkRCnvT'),
(27803, 44, 'JXusYTkRCnvT'),
(27804, 14, 'JXusYTkRCnvT'),
(27805, 21, 'JXusYTkRCnvT'),
(27806, 15, 'JXusYTkRCnvT'),
(27807, 54, 'ldLXKyLxwYxI'),
(27808, 22, 'ldLXKyLxwYxI'),
(27809, 43, 'ldLXKyLxwYxI'),
(27810, 47, 'ldLXKyLxwYxI'),
(27811, 60, 'ldLXKyLxwYxI'),
(27812, 7, 'ldLXKyLxwYxI'),
(27813, 18, 'ldLXKyLxwYxI'),
(27814, 27, 'ldLXKyLxwYxI'),
(27815, 2, 'ldLXKyLxwYxI'),
(27816, 16, 'ldLXKyLxwYxI'),
(27817, 74, 'ldLXKyLxwYxI'),
(27818, 91, 'ldLXKyLxwYxI'),
(27819, 39, 'ldLXKyLxwYxI'),
(27820, 80, 'ldLXKyLxwYxI'),
(27821, 36, 'ldLXKyLxwYxI'),
(27822, 8, 'ejvcwqWBaImB'),
(27823, 87, 'ejvcwqWBaImB'),
(27824, 35, 'ejvcwqWBaImB'),
(27825, 38, 'ejvcwqWBaImB'),
(27826, 84, 'ejvcwqWBaImB'),
(27827, 6, 'ejvcwqWBaImB'),
(27828, 50, 'ejvcwqWBaImB'),
(27829, 57, 'ejvcwqWBaImB'),
(27830, 62, 'ejvcwqWBaImB'),
(27831, 59, 'ejvcwqWBaImB'),
(27832, 69, 'ejvcwqWBaImB'),
(27833, 64, 'ejvcwqWBaImB'),
(27834, 73, 'ejvcwqWBaImB'),
(27835, 72, 'ejvcwqWBaImB'),
(27836, 92, 'ejvcwqWBaImB'),
(27837, 41, 'GGxPQjgxiUTd'),
(27838, 34, 'GGxPQjgxiUTd'),
(27839, 42, 'GGxPQjgxiUTd'),
(27840, 70, 'GGxPQjgxiUTd'),
(27841, 45, 'GGxPQjgxiUTd'),
(27842, 25, 'GGxPQjgxiUTd'),
(27843, 65, 'GGxPQjgxiUTd'),
(27844, 31, 'GGxPQjgxiUTd'),
(27845, 24, 'GGxPQjgxiUTd'),
(27846, 56, 'GGxPQjgxiUTd'),
(27847, 19, 'GGxPQjgxiUTd'),
(27848, 83, 'GGxPQjgxiUTd'),
(27849, 77, 'GGxPQjgxiUTd'),
(27850, 75, 'GGxPQjgxiUTd'),
(27851, 12, 'GGxPQjgxiUTd');

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
(2, 'Under-The-Bridge', 'ramazanikbaev6@gmail.com', 'Under-The-Bridge', 'user', 0, 2),
(3, 'admin', 'admin@admin.admin', 'admin', 'admin', 0, 1),
(4, 'qweqwe', 'qweqwe@qweqwe.qweqwe', 'qweqwe', 'user', 0, 1),
(5, 'alex_smith', 'alex.smith@example.com', '123456', 'user', 0, 2),
(6, 'maria_johnson', 'maria.johnson@example.com', '123456', 'user', 0, 3),
(7, 'dmitry_volkov', 'dmitry.volkov@example.com', '123456', 'user', 0, 2),
(8, 'elena_petrova', 'elena.petrova@example.com', '123456', 'user', 0, 3),
(9, 'maxim_ivanov', 'maxim.ivanov@example.com', '123456', 'user', 0, 1),
(10, 'anna_kozlov', 'anna.kozlov@example.com', '123456', 'user', 0, 1),
(11, 'sergey_nikolaev', 'sergey.nikolaev@example.com', '123456', 'user', 0, 1),
(12, 'olga_smirnova', 'olga.smirnova@example.com', '123456', 'user', 0, 3),
(13, 'ivan_morozov', 'ivan.morozov@example.com', '123456', 'user', 0, 2),
(14, 'natalia_fedorova', 'natalia.fedorova@example.com', '123456', 'user', 0, 2),
(15, 'andrey_popov', 'andrey.popov@example.com', '123456', 'user', 0, 2),
(16, 'tatyana_sokolova', 'tatyana.sokolova@example.com', '123456', 'user', 0, 2),
(17, 'pavel_lebenev', 'pavel.lebenev@example.com', '123456', 'user', 0, 1),
(18, 'yulia_novikova', 'yulia.novikova@example.com', '123456', 'user', 0, 2),
(19, 'vladimir_zaits', 'vladimir.zaits@example.com', '123456', 'user', 0, 3),
(20, 'ekaterina_orlova', 'ekaterina.orlova@example.com', '123456', 'user', 0, 2),
(21, 'konstantin_makarov', 'konstantin.makarov@example.com', '123456', 'user', 0, 2),
(22, 'irina_pavlova', 'irina.pavlova@example.com', '123456', 'user', 0, 2),
(23, 'artem_egorov', 'artem.egorov@example.com', '123456', 'user', 0, 1),
(24, 'svetlana_timofeeva', 'svetlana.timofeeva@example.com', '123456', 'user', 0, 3),
(25, 'denis_volkov', 'denis.volkov@example.com', '123456', 'user', 0, 3),
(26, 'ksenia_morozova', 'ksenia.morozova@example.com', '123456', 'user', 0, 2),
(27, 'roman_borisov', 'roman.borisov@example.com', '123456', 'user', 0, 2),
(28, 'vera_kuznetsova', 'vera.kuznetsova@example.com', '123456', 'user', 0, 1),
(29, 'nikita_sidorov', 'nikita.sidorov@example.com', '123456', 'user', 0, 2),
(30, 'polina_vasilyeva', 'polina.vasilyeva@example.com', '123456', 'user', 0, 2),
(31, 'oleg_timofeev', 'oleg.timofeev@example.com', '123456', 'user', 0, 3),
(32, 'bash_ars', 'bash.bash@example.com', '123456', 'user', 0, 1),
(33, 'user_001', 'user001@example.com', '123456', 'user', 0, 1),
(34, 'user_002', 'user002@example.com', '123456', 'user', 0, 3),
(35, 'user_003', 'user003@example.com', '123456', 'user', 0, 3),
(36, 'user_004', 'user004@example.com', '123456', 'user', 0, 2),
(37, 'user_005', 'user005@example.com', '123456', 'user', 0, 1),
(38, 'user_006', 'user006@example.com', '123456', 'user', 0, 3),
(39, 'user_007', 'user007@example.com', '123456', 'user', 0, 2),
(40, 'user_008', 'user008@example.com', '123456', 'user', 0, 1),
(41, 'user_009', 'user009@example.com', '123456', 'user', 0, 3),
(42, 'user_010', 'user010@example.com', '123456', 'user', 0, 3),
(43, 'user_011', 'user011@example.com', '123456', 'user', 0, 2),
(44, 'user_012', 'user012@example.com', '123456', 'user', 0, 2),
(45, 'user_013', 'user013@example.com', '123456', 'user', 0, 3),
(46, 'user_014', 'user014@example.com', '123456', 'user', 0, 1),
(47, 'user_015', 'user015@example.com', '123456', 'user', 0, 2),
(48, 'user_016', 'user016@example.com', '123456', 'user', 0, 1),
(49, 'user_017', 'user017@example.com', '123456', 'user', 0, 1),
(50, 'user_018', 'user018@example.com', '123456', 'user', 0, 3),
(51, 'user_019', 'user019@example.com', '123456', 'user', 0, 2),
(52, 'user_020', 'user020@example.com', '123456', 'user', 0, 1),
(53, 'user_021', 'user021@example.com', '123456', 'user', 0, 1),
(54, 'user_022', 'user022@example.com', '123456', 'user', 0, 2),
(55, 'user_023', 'user023@example.com', '123456', 'user', 0, 1),
(56, 'user_024', 'user024@example.com', '123456', 'user', 0, 3),
(57, 'user_025', 'user025@example.com', '123456', 'user', 0, 3),
(58, 'user_026', 'user026@example.com', '123456', 'user', 0, 2),
(59, 'user_027', 'user027@example.com', '123456', 'user', 0, 3),
(60, 'user_028', 'user028@example.com', '123456', 'user', 0, 2),
(61, 'user_029', 'user029@example.com', '123456', 'user', 0, 1),
(62, 'user_030', 'user030@example.com', '123456', 'user', 0, 3),
(63, 'user_031', 'user031@example.com', '123456', 'user', 0, 1),
(64, 'user_032', 'user032@example.com', '123456', 'user', 0, 3),
(65, 'user_033', 'user033@example.com', '123456', 'user', 0, 3),
(66, 'user_034', 'user034@example.com', '123456', 'user', 0, 1),
(67, 'user_035', 'user035@example.com', '123456', 'user', 0, 1),
(68, 'user_036', 'user036@example.com', '123456', 'user', 0, 1),
(69, 'user_037', 'user037@example.com', '123456', 'user', 0, 3),
(70, 'user_038', 'user038@example.com', '123456', 'user', 0, 3),
(71, 'user_039', 'user039@example.com', '123456', 'user', 0, 1),
(72, 'user_040', 'user040@example.com', '123456', 'user', 0, 3),
(73, 'user_041', 'user041@example.com', '123456', 'user', 0, 3),
(74, 'user_042', 'user042@example.com', '123456', 'user', 0, 2),
(75, 'user_043', 'user043@example.com', '123456', 'user', 0, 3),
(76, 'user_044', 'user044@example.com', '123456', 'user', 0, 1),
(77, 'user_045', 'user045@example.com', '123456', 'user', 0, 3),
(78, 'user_046', 'user046@example.com', '123456', 'user', 0, 2),
(79, 'user_047', 'user047@example.com', '123456', 'user', 0, 1),
(80, 'user_048', 'user048@example.com', '123456', 'user', 0, 2),
(81, 'user_049', 'user049@example.com', '123456', 'user', 0, 2),
(82, 'user_050', 'user050@example.com', '123456', 'user', 0, 2),
(83, 'user_051', 'user051@example.com', '123456', 'user', 0, 3),
(84, 'user_052', 'user052@example.com', '123456', 'user', 0, 3),
(85, 'user_053', 'user053@example.com', '123456', 'user', 0, 1),
(86, 'user_054', 'user054@example.com', '123456', 'user', 0, 1),
(87, 'user_055', 'user055@example.com', '123456', 'user', 0, 3),
(88, 'user_056', 'user056@example.com', '123456', 'user', 0, 1),
(89, 'user_057', 'user057@example.com', '123456', 'user', 0, 1),
(90, 'user_058', 'user058@example.com', '123456', 'user', 0, 1),
(91, 'user_059', 'user059@example.com', '123456', 'user', 0, 2),
(92, 'user_060', 'user060@example.com', '123456', 'user', 0, 3);

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
(15, 2, 1, 2);

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
(3, 2, 21);

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
('amCSoRfRJeIc', 1, '1778571871'),
('ejvcwqWBaImB', 3, '1778571871'),
('GGxPQjgxiUTd', 3, '1778571871'),
('JXusYTkRCnvT', 2, '1778571871'),
('ldLXKyLxwYxI', 2, '1778571871'),
('ReXrjpGOpCLi', 1, '1778571871');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27852;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
