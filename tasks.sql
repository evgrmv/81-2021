-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 18 2024 г., 09:47
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tasks`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ChangeHistory`
--

CREATE TABLE `ChangeHistory` (
  `ChangeHistoryId` int NOT NULL,
  `TaskId` int NOT NULL,
  `ChangeType` text NOT NULL,
  `ChangeTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Tags`
--

CREATE TABLE `Tags` (
  `TagId` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Tasks`
--

CREATE TABLE `Tasks` (
  `TaskId` int NOT NULL,
  `UserId` int NOT NULL,
  `Title` text NOT NULL,
  `Description` text NOT NULL,
  `Priority` text NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `CreatedAt` datetime NOT NULL,
  `CompletedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `TaskTags`
--

CREATE TABLE `TaskTags` (
  `TaskId` int NOT NULL,
  `TagId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `UsersId` int NOT NULL,
  `Username` text NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ChangeHistory`
--
ALTER TABLE `ChangeHistory`
  ADD PRIMARY KEY (`ChangeHistoryId`),
  ADD KEY `ChangeHistoryId` (`TaskId`) USING BTREE;

--
-- Индексы таблицы `Tags`
--
ALTER TABLE `Tags`
  ADD PRIMARY KEY (`TagId`),
  ADD UNIQUE KEY `Name` (`Name`(50));

--
-- Индексы таблицы `Tasks`
--
ALTER TABLE `Tasks`
  ADD PRIMARY KEY (`TaskId`),
  ADD KEY `UserId` (`UserId`);

--
-- Индексы таблицы `TaskTags`
--
ALTER TABLE `TaskTags`
  ADD PRIMARY KEY (`TaskId`),
  ADD KEY `TagId` (`TagId`),
  ADD KEY `TaskId` (`TaskId`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UsersId`),
  ADD UNIQUE KEY `Username` (`Username`(50));

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ChangeHistory`
--
ALTER TABLE `ChangeHistory`
  MODIFY `ChangeHistoryId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Tags`
--
ALTER TABLE `Tags`
  MODIFY `TagId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Tasks`
--
ALTER TABLE `Tasks`
  MODIFY `TaskId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `TaskTags`
--
ALTER TABLE `TaskTags`
  MODIFY `TaskId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `UsersId` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ChangeHistory`
--
ALTER TABLE `ChangeHistory`
  ADD CONSTRAINT `changehistory_ibfk_1` FOREIGN KEY (`TaskId`) REFERENCES `Tasks` (`TaskId`);

--
-- Ограничения внешнего ключа таблицы `Tasks`
--
ALTER TABLE `Tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `Users` (`UsersId`);

--
-- Ограничения внешнего ключа таблицы `TaskTags`
--
ALTER TABLE `TaskTags`
  ADD CONSTRAINT `tasktags_ibfk_1` FOREIGN KEY (`TagId`) REFERENCES `Tags` (`TagId`),
  ADD CONSTRAINT `tasktags_ibfk_2` FOREIGN KEY (`TaskId`) REFERENCES `Tasks` (`TaskId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
