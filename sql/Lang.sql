-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Апр 26 2026 г., 17:59
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
-- Структура таблицы `lesson`
--

CREATE TABLE `lesson` (
  `lesson_id` int NOT NULL,
  `lesson_name` varchar(100) NOT NULL,
  `lesson_language` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `lesson`
--

INSERT INTO `lesson` (`lesson_id`, `lesson_name`, `lesson_language`) VALUES
(1, 'Английский: базовые слова', 'Английский'),
(2, 'Еда', 'Английский'),
(3, 'Животные', 'Английский'),
(4, 'Японский: базовые слова', 'Японский'),
(5, 'Еда', 'Японский'),
(6, 'Животные', 'Японский');

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
  `user_role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_email`, `user_password`, `user_role`) VALUES
(2, 'Under-The-Bridge', 'ramazanikbaev6@gmail.com', 'Under-The-Bridge', 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `words`
--

CREATE TABLE `words` (
  `word_id` int NOT NULL,
  `word_name` varchar(100) NOT NULL,
  `word_transcription` varchar(100) DEFAULT NULL,
  `word_translate` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `words`
--

INSERT INTO `words` (`word_id`, `word_name`, `word_transcription`, `word_translate`) VALUES
(19, 'house', '[haʊs]', 'дом'),
(20, 'car', '[kɑːr]', 'машина'),
(21, 'sun', '[sʌn]', 'солнце'),
(22, 'moon', '[muːn]', 'луна'),
(23, 'tree', '[triː]', 'дерево'),
(24, 'bread', '[bred]', 'хлеб'),
(25, 'cheese', '[tʃiːz]', 'сыр'),
(26, 'egg', '[eɡ]', 'яйцо'),
(27, 'meat', '[miːt]', 'мясо'),
(28, 'juice', '[dʒuːs]', 'сок'),
(29, 'banana', '[bəˈnænə]', 'банан'),
(30, 'orange', '[ˈɒrɪndʒ]', 'апельсин'),
(31, 'lion', '[ˈlaɪən]', 'лев'),
(32, 'tiger', '[ˈtaɪɡər]', 'тигр'),
(33, 'elephant', '[ˈelɪfənt]', 'слон'),
(34, 'monkey', '[ˈmʌŋki]', 'обезьяна'),
(35, 'bear', '[beər]', 'медведь'),
(36, 'wolf', '[wʊlf]', 'волк'),
(37, 'fox', '[fɒks]', 'лиса'),
(38, 'いえ', '[ie]', 'дом'),
(39, 'くるま', '[kuruma]', 'машина'),
(40, 'たいよう', '[taiyou]', 'солнце'),
(41, 'つき', '[tsuki]', 'луна'),
(42, 'き', '[ki]', 'дерево'),
(43, 'パン', '[pan]', 'хлеб'),
(44, 'チーズ', '[chiizu]', 'сыр'),
(45, 'たまご', '[tamago]', 'яйцо'),
(46, 'にく', '[niku]', 'мясо'),
(47, 'ジュース', '[juusu]', 'сок'),
(48, 'バナナ', '[banana]', 'банан'),
(49, 'オレンジ', '[orenji]', 'апельсин'),
(50, 'ねこ', '[neko]', 'кот'),
(51, 'いぬ', '[inu]', 'собака'),
(52, 'うま', '[uma]', 'лошадь'),
(53, 'とり', '[tori]', 'птица'),
(54, 'くま', '[kuma]', 'медведь'),
(55, 'おおかみ', '[ookami]', 'волк'),
(56, 'きつね', '[kitsune]', 'лиса');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`lesson_id`);

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
-- Индексы таблицы `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`word_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `lesson`
--
ALTER TABLE `lesson`
  MODIFY `lesson_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `lessons_words`
--
ALTER TABLE `lessons_words`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `words`
--
ALTER TABLE `words`
  MODIFY `word_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `lessons_words`
--
ALTER TABLE `lessons_words`
  ADD CONSTRAINT `lessons_words_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lessons_words_ibfk_2` FOREIGN KEY (`word_id`) REFERENCES `words` (`word_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
