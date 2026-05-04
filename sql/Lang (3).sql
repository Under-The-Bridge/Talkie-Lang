-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 04 2026 г., 13:27
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
(4, 3, 1, 0),
(5, 3, 2, 0),
(7, 4, 1, 0),
(10, 2, 1, 0);

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
(7, 'темп', 1);

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
  `user_moneys` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_email`, `user_password`, `user_role`, `user_moneys`) VALUES
(2, 'Under-The-Bridge', 'ramazanikbaev6@gmail.com', 'Under-The-Bridge', 'user', 0),
(3, 'admin', 'admin@admin.admin', 'admin', 'admin', 0),
(4, 'qweqwe', 'qweqwe@qweqwe.qweqwe', 'qweqwe', 'user', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user_lang_progress`
--

CREATE TABLE `user_lang_progress` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `lang_id` int NOT NULL,
  `progress` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_lang_progress`
--

INSERT INTO `user_lang_progress` (`id`, `user_id`, `lang_id`, `progress`) VALUES
(1, 2, 1, 2),
(4, 3, 1, 0),
(5, 4, 1, 1);

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
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `user_lang_progress`
--
ALTER TABLE `user_lang_progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang_id` (`lang_id`),
  ADD KEY `user_id` (`user_id`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `langs`
--
ALTER TABLE `langs`
  MODIFY `lang_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `lesson`
--
ALTER TABLE `lesson`
  MODIFY `lesson_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `lessons_words`
--
ALTER TABLE `lessons_words`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `user_lang_progress`
--
ALTER TABLE `user_lang_progress`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `words`
--
ALTER TABLE `words`
  MODIFY `word_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
