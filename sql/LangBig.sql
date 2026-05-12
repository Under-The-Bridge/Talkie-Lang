-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Май 11 2026 г., 22:52
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
(129, 2, 1, 3);

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
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `weekly_league_id` varchar(12)  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `league_users`
--

INSERT INTO `league_users` (`id`, `user_id`, `weekly_league_id`) VALUES
(12462, 62, 'CVZHZsKDaDym'),
(12463, 52, 'CVZHZsKDaDym'),
(12464, 66, 'CVZHZsKDaDym'),
(12465, 27, 'CVZHZsKDaDym'),
(12466, 86, 'CVZHZsKDaDym'),
(12467, 53, 'CVZHZsKDaDym'),
(12468, 50, 'CVZHZsKDaDym'),
(12469, 89, 'CVZHZsKDaDym'),
(12470, 41, 'CVZHZsKDaDym'),
(12471, 19, 'CVZHZsKDaDym'),
(12472, 20, 'CVZHZsKDaDym'),
(12473, 17, 'CVZHZsKDaDym'),
(12474, 84, 'CVZHZsKDaDym'),
(12475, 90, 'CVZHZsKDaDym'),
(12476, 33, 'CVZHZsKDaDym'),
(12477, 74, 'JWmvFAhoenfr'),
(12478, 64, 'JWmvFAhoenfr'),
(12479, 61, 'JWmvFAhoenfr'),
(12480, 9, 'JWmvFAhoenfr'),
(12481, 75, 'JWmvFAhoenfr'),
(12482, 13, 'JWmvFAhoenfr'),
(12483, 67, 'JWmvFAhoenfr'),
(12484, 22, 'JWmvFAhoenfr'),
(12485, 60, 'JWmvFAhoenfr'),
(12486, 25, 'JWmvFAhoenfr'),
(12487, 28, 'JWmvFAhoenfr'),
(12488, 51, 'JWmvFAhoenfr'),
(12489, 34, 'JWmvFAhoenfr'),
(12490, 71, 'JWmvFAhoenfr'),
(12491, 92, 'JWmvFAhoenfr'),
(12492, 68, 'OpkWxPQzfART'),
(12493, 69, 'OpkWxPQzfART'),
(12494, 63, 'OpkWxPQzfART'),
(12495, 78, 'OpkWxPQzfART'),
(12496, 14, 'OpkWxPQzfART'),
(12497, 30, 'OpkWxPQzfART'),
(12498, 49, 'OpkWxPQzfART'),
(12499, 5, 'OpkWxPQzfART'),
(12500, 35, 'OpkWxPQzfART'),
(12501, 58, 'OpkWxPQzfART'),
(12502, 38, 'OpkWxPQzfART'),
(12503, 85, 'OpkWxPQzfART'),
(12504, 42, 'OpkWxPQzfART'),
(12505, 26, 'OpkWxPQzfART'),
(12506, 31, 'OpkWxPQzfART'),
(12507, 21, 'DYRIpXuUmldX'),
(12508, 8, 'DYRIpXuUmldX'),
(12509, 56, 'DYRIpXuUmldX'),
(12510, 36, 'DYRIpXuUmldX'),
(12511, 24, 'DYRIpXuUmldX'),
(12512, 83, 'DYRIpXuUmldX'),
(12513, 11, 'DYRIpXuUmldX'),
(12514, 65, 'DYRIpXuUmldX'),
(12515, 55, 'DYRIpXuUmldX'),
(12516, 54, 'DYRIpXuUmldX'),
(12517, 10, 'DYRIpXuUmldX'),
(12518, 7, 'DYRIpXuUmldX'),
(12519, 91, 'DYRIpXuUmldX'),
(12520, 4, 'DYRIpXuUmldX'),
(12521, 48, 'DYRIpXuUmldX'),
(12522, 79, 'NitHoVjzDILX'),
(12523, 6, 'NitHoVjzDILX'),
(12524, 46, 'NitHoVjzDILX'),
(12525, 47, 'NitHoVjzDILX'),
(12526, 29, 'NitHoVjzDILX'),
(12527, 23, 'NitHoVjzDILX'),
(12528, 45, 'NitHoVjzDILX'),
(12529, 16, 'NitHoVjzDILX'),
(12530, 81, 'NitHoVjzDILX'),
(12531, 88, 'NitHoVjzDILX'),
(12532, 37, 'NitHoVjzDILX'),
(12533, 59, 'NitHoVjzDILX'),
(12534, 44, 'NitHoVjzDILX'),
(12535, 43, 'NitHoVjzDILX'),
(12536, 76, 'NitHoVjzDILX'),
(12537, 57, 'iSTOgVJdBYre'),
(12538, 2, 'iSTOgVJdBYre'),
(12539, 40, 'iSTOgVJdBYre'),
(12540, 12, 'iSTOgVJdBYre'),
(12541, 82, 'iSTOgVJdBYre'),
(12542, 73, 'iSTOgVJdBYre'),
(12543, 70, 'iSTOgVJdBYre'),
(12544, 15, 'iSTOgVJdBYre'),
(12545, 72, 'iSTOgVJdBYre'),
(12546, 39, 'iSTOgVJdBYre'),
(12547, 80, 'iSTOgVJdBYre'),
(12548, 32, 'iSTOgVJdBYre'),
(12549, 77, 'iSTOgVJdBYre'),
(12550, 87, 'iSTOgVJdBYre'),
(12551, 18, 'iSTOgVJdBYre');

-- --------------------------------------------------------

--
-- Структура таблицы `lesson`
--

CREATE TABLE `lesson` (
  `lesson_id` int NOT NULL,
  `lesson_name` varchar(100) NOT NULL,
  `lesson_language` int DEFAULT NULL
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
  `id` int NOT NULL,
  `lesson_id` int NOT NULL,
  `word_id` int NOT NULL
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
  `user_id` int NOT NULL,
  `user_login` text NOT NULL,
  `user_email` text NOT NULL,
  `user_password` text NOT NULL,
  `user_role` enum('user','admin') NOT NULL DEFAULT 'user',
  `user_weekly_xp` int NOT NULL DEFAULT '0',
  `user_league` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_email`, `user_password`, `user_role`, `user_weekly_xp`, `user_league`) VALUES
(2, 'Under-The-Bridge', 'ramazanikbaev6@gmail.com', 'Under-The-Bridge', 'user', 1693, 3),
(3, 'admin', 'admin@admin.admin', 'admin', 'admin', 0, 1),
(4, 'qweqwe', 'qweqwe@qweqwe.qweqwe', 'qweqwe', 'user', 0, 2),
(5, 'alex_smith', 'alex.smith@example.com', '123456', 'user', 0, 2),
(6, 'maria_johnson', 'maria.johnson@example.com', '123456', 'user', 0, 3),
(7, 'dmitry_volkov', 'dmitry.volkov@example.com', '123456', 'user', 0, 2),
(8, 'elena_petrova', 'elena.petrova@example.com', '123456', 'user', 0, 2),
(9, 'maxim_ivanov', 'maxim.ivanov@example.com', '123456', 'user', 0, 1),
(10, 'anna_kozlov', 'anna.kozlov@example.com', '123456', 'user', 0, 2),
(11, 'sergey_nikolaev', 'sergey.nikolaev@example.com', '123456', 'user', 0, 2),
(12, 'olga_smirnova', 'olga.smirnova@example.com', '123456', 'user', 0, 3),
(13, 'ivan_morozov', 'ivan.morozov@example.com', '123456', 'user', 0, 1),
(14, 'natalia_fedorova', 'natalia.fedorova@example.com', '123456', 'user', 0, 2),
(15, 'andrey_popov', 'andrey.popov@example.com', '123456', 'user', 0, 3),
(16, 'tatyana_sokolova', 'tatyana.sokolova@example.com', '123456', 'user', 0, 3),
(17, 'pavel_lebenev', 'pavel.lebenev@example.com', '123456', 'user', 0, 1),
(18, 'yulia_novikova', 'yulia.novikova@example.com', '123456', 'user', 0, 3),
(19, 'vladimir_zaits', 'vladimir.zaits@example.com', '123456', 'user', 0, 1),
(20, 'ekaterina_orlova', 'ekaterina.orlova@example.com', '123456', 'user', 0, 1),
(21, 'konstantin_makarov', 'konstantin.makarov@example.com', '123456', 'user', 0, 2),
(22, 'irina_pavlova', 'irina.pavlova@example.com', '123456', 'user', 0, 1),
(23, 'artem_egorov', 'artem.egorov@example.com', '123456', 'user', 0, 3),
(24, 'svetlana_timofeeva', 'svetlana.timofeeva@example.com', '123456', 'user', 0, 2),
(25, 'denis_volkov', 'denis.volkov@example.com', '123456', 'user', 0, 1),
(26, 'ksenia_morozova', 'ksenia.morozova@example.com', '123456', 'user', 0, 2),
(27, 'roman_borisov', 'roman.borisov@example.com', '123456', 'user', 0, 1),
(28, 'vera_kuznetsova', 'vera.kuznetsova@example.com', '123456', 'user', 0, 1),
(29, 'nikita_sidorov', 'nikita.sidorov@example.com', '123456', 'user', 0, 3),
(30, 'polina_vasilyeva', 'polina.vasilyeva@example.com', '123456', 'user', 0, 2),
(31, 'oleg_timofeev', 'oleg.timofeev@example.com', '123456', 'user', 0, 2),
(32, 'bash_ars', 'bash.bash@example.com', '123456', 'user', 0, 3),
(33, 'user_001', 'user001@example.com', '123456', 'user', 0, 1),
(34, 'user_002', 'user002@example.com', '123456', 'user', 0, 1),
(35, 'user_003', 'user003@example.com', '123456', 'user', 0, 2),
(36, 'user_004', 'user004@example.com', '123456', 'user', 0, 2),
(37, 'user_005', 'user005@example.com', '123456', 'user', 0, 3),
(38, 'user_006', 'user006@example.com', '123456', 'user', 0, 2),
(39, 'user_007', 'user007@example.com', '123456', 'user', 0, 3),
(40, 'user_008', 'user008@example.com', '123456', 'user', 0, 3),
(41, 'user_009', 'user009@example.com', '123456', 'user', 0, 1),
(42, 'user_010', 'user010@example.com', '123456', 'user', 0, 2),
(43, 'user_011', 'user011@example.com', '123456', 'user', 0, 3),
(44, 'user_012', 'user012@example.com', '123456', 'user', 0, 3),
(45, 'user_013', 'user013@example.com', '123456', 'user', 0, 3),
(46, 'user_014', 'user014@example.com', '123456', 'user', 0, 3),
(47, 'user_015', 'user015@example.com', '123456', 'user', 0, 3),
(48, 'user_016', 'user016@example.com', '123456', 'user', 0, 2),
(49, 'user_017', 'user017@example.com', '123456', 'user', 0, 2),
(50, 'user_018', 'user018@example.com', '123456', 'user', 0, 1),
(51, 'user_019', 'user019@example.com', '123456', 'user', 0, 1),
(52, 'user_020', 'user020@example.com', '123456', 'user', 0, 1),
(53, 'user_021', 'user021@example.com', '123456', 'user', 0, 1),
(54, 'user_022', 'user022@example.com', '123456', 'user', 0, 2),
(55, 'user_023', 'user023@example.com', '123456', 'user', 0, 2),
(56, 'user_024', 'user024@example.com', '123456', 'user', 0, 2),
(57, 'user_025', 'user025@example.com', '123456', 'user', 0, 3),
(58, 'user_026', 'user026@example.com', '123456', 'user', 0, 2),
(59, 'user_027', 'user027@example.com', '123456', 'user', 0, 3),
(60, 'user_028', 'user028@example.com', '123456', 'user', 0, 1),
(61, 'user_029', 'user029@example.com', '123456', 'user', 0, 1),
(62, 'user_030', 'user030@example.com', '123456', 'user', 0, 1),
(63, 'user_031', 'user031@example.com', '123456', 'user', 0, 2),
(64, 'user_032', 'user032@example.com', '123456', 'user', 0, 1),
(65, 'user_033', 'user033@example.com', '123456', 'user', 0, 2),
(66, 'user_034', 'user034@example.com', '123456', 'user', 0, 1),
(67, 'user_035', 'user035@example.com', '123456', 'user', 0, 1),
(68, 'user_036', 'user036@example.com', '123456', 'user', 0, 2),
(69, 'user_037', 'user037@example.com', '123456', 'user', 0, 2),
(70, 'user_038', 'user038@example.com', '123456', 'user', 0, 3),
(71, 'user_039', 'user039@example.com', '123456', 'user', 0, 1),
(72, 'user_040', 'user040@example.com', '123456', 'user', 0, 3),
(73, 'user_041', 'user041@example.com', '123456', 'user', 0, 3),
(74, 'user_042', 'user042@example.com', '123456', 'user', 0, 1),
(75, 'user_043', 'user043@example.com', '123456', 'user', 0, 1),
(76, 'user_044', 'user044@example.com', '123456', 'user', 0, 3),
(77, 'user_045', 'user045@example.com', '123456', 'user', 0, 3),
(78, 'user_046', 'user046@example.com', '123456', 'user', 0, 2),
(79, 'user_047', 'user047@example.com', '123456', 'user', 0, 3),
(80, 'user_048', 'user048@example.com', '123456', 'user', 0, 3),
(81, 'user_049', 'user049@example.com', '123456', 'user', 0, 3),
(82, 'user_050', 'user050@example.com', '123456', 'user', 0, 3),
(83, 'user_051', 'user051@example.com', '123456', 'user', 0, 2),
(84, 'user_052', 'user052@example.com', '123456', 'user', 0, 1),
(85, 'user_053', 'user053@example.com', '123456', 'user', 0, 2),
(86, 'user_054', 'user054@example.com', '123456', 'user', 0, 1),
(87, 'user_055', 'user055@example.com', '123456', 'user', 0, 3),
(88, 'user_056', 'user056@example.com', '123456', 'user', 0, 3),
(89, 'user_057', 'user057@example.com', '123456', 'user', 0, 1),
(90, 'user_058', 'user058@example.com', '123456', 'user', 0, 1),
(91, 'user_059', 'user059@example.com', '123456', 'user', 0, 2),
(92, 'user_060', 'user060@example.com', '123456', 'user', 0, 1);

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
(14, 2, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `weekly_league`
--

CREATE TABLE `weekly_league` (
  `id` varchar(12) NOT NULL,
  `league_id` int NOT NULL,
  `time` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `weekly_league`
--

INSERT INTO `weekly_league` (`id`, `league_id`, `time`) VALUES
('CVZHZsKDaDym', 1, '1778532160'),
('DYRIpXuUmldX', 2, '1778532160'),
('iSTOgVJdBYre', 3, '1778532160'),
('JWmvFAhoenfr', 1, '1778532160'),
('NitHoVjzDILX', 3, '1778532160'),
('OpkWxPQzfART', 2, '1778532160');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12552;

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
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT для таблицы `user_lang_progress`
--
ALTER TABLE `user_lang_progress`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
-- Ограничения внешнего ключа таблицы `words`
--
ALTER TABLE `words`
  ADD CONSTRAINT `words_ibfk_1` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`lang_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
