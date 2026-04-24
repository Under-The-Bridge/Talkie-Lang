-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Мар 17 2026 г., 20:29
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
-- База данных: `Talkie Lang test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `langs`
--

CREATE TABLE `langs` (
  `lang_id` int NOT NULL,
  `lang_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `langs`
--

INSERT INTO `langs` (`lang_id`, `lang_name`) VALUES
(1, 'english'),
(2, 'japanese');

-- --------------------------------------------------------

--
-- Структура таблицы `lessons`
--

CREATE TABLE `lessons` (
  `lesson_id` int NOT NULL,
  `lesson_name` text NOT NULL,
  `lesson_desc` text NOT NULL,
  `module_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `lessons`
--

INSERT INTO `lessons` (`lesson_id`, `lesson_name`, `lesson_desc`, `module_id`) VALUES
(1, 'Привет', 'Описание какое-то', 1),
(2, 'Пока', 'Описание какое-то', 1),
(3, 'Как дела', 'Описание какое-то', 1),
(4, 'йцу', 'Описание какое-то', 2),
(5, 'фыв', 'Описание какое-то', 2),
(6, 'ывм', 'Описание какое-то', 3),
(7, 'мсваы', 'Описание какое-то', 3),
(8, 'йиииепкупцу', 'Описание какое-то', 3),
(9, 'укппкукпкпу', 'Описание какое-то', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `modules`
--

CREATE TABLE `modules` (
  `module_id` int NOT NULL,
  `module_name` text NOT NULL,
  `lang_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `modules`
--

INSERT INTO `modules` (`module_id`, `module_name`, `lang_id`) VALUES
(1, 'Модуль 1', 1),
(2, 'Модуль 2', 1),
(3, 'Модуль 1', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `words`
--

CREATE TABLE `words` (
  `word_id` int NOT NULL,
  `word_name` text NOT NULL,
  `word_translate` text NOT NULL,
  `word_transcription` text NOT NULL,
  `lesson_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `words`
--

INSERT INTO `words` (`word_id`, `word_name`, `word_translate`, `word_transcription`, `lesson_id`) VALUES
(1, 'hello', 'привет', 'хеллоу', 1),
(2, 'bye', 'пока', 'бай', 1),
(3, 'text', 'текст', 'текст', 1),
(4, 'click', 'нажатие', 'клик', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `langs`
--
ALTER TABLE `langs`
  ADD PRIMARY KEY (`lang_id`);

--
-- Индексы таблицы `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Индексы таблицы `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`module_id`),
  ADD KEY `lang_id` (`lang_id`);

--
-- Индексы таблицы `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`word_id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `langs`
--
ALTER TABLE `langs`
  MODIFY `lang_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `lessons`
--
ALTER TABLE `lessons`
  MODIFY `lesson_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `modules`
--
ALTER TABLE `modules`
  MODIFY `module_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `words`
--
ALTER TABLE `words`
  MODIFY `word_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `modules` (`module_id`);

--
-- Ограничения внешнего ключа таблицы `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`lang_id`);

--
-- Ограничения внешнего ключа таблицы `words`
--
ALTER TABLE `words`
  ADD CONSTRAINT `words_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`lesson_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
