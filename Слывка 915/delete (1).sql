-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Май 17 2021 г., 06:10
-- Версия сервера: 5.7.24
-- Версия PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `delete`
--

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

CREATE TABLE `city` (
  `id` int(20) NOT NULL,
  `city_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `city_name`) VALUES
(1, 'Сочи'),
(2, 'Краснодар'),
(3, 'Крым'),
(4, 'Владивосток'),
(5, 'Токио'),
(6, 'Лондон'),
(7, 'Киев'),
(8, 'Нью-Йорк');

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id`, `name`, `surname`, `phone`, `email`, `gender`) VALUES
(1, 'Ермолай', 'Фадеев', 74955030376, 'jivellella-3927@yandex.ru', 'м'),
(2, 'Елисей', 'Фролов', 74951226318, 'nattillyhe-7864@yopmail.com', 'м'),
(3, 'Владислава', 'Данилова', 75122632353, 'iciriqaw-1118@mail.ru', 'ж'),
(4, 'Елисей', 'Елисей', 73559449395, 'nay-kero@mail.ru', 'м');

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

CREATE TABLE `country` (
  `id` int(20) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `city_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `country`
--

INSERT INTO `country` (`id`, `country_name`, `city_id`) VALUES
(1, 'Россия', 1),
(2, 'Россия', 2),
(3, 'Россия', 3),
(4, 'Россия', 4),
(5, 'Украина', 7),
(6, 'США', 8),
(7, 'Япония', 5),
(8, 'Франция', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `salary` int(20) NOT NULL,
  `position` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`id`, `name`, `surname`, `salary`, `position`, `phone`) VALUES
(1, 'Харитон', 'Воронцов', 30000, 'экскурсовод', '74469013338'),
(2, 'Гавриил', 'Никонов', 50000, 'экскурсовод', '74464035062'),
(3, 'Эльдар', 'Логинов', 30000, 'экскурсовод', '74461202590'),
(4, 'Джулия', 'Виноградова', 40000, 'экскурсовод', '74468372332');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(20) NOT NULL,
  `client_id` int(20) NOT NULL,
  `tours_id` int(20) NOT NULL,
  `emlpoyee_id` int(20) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `client_id`, `tours_id`, `emlpoyee_id`, `date`) VALUES
(1, 3, 2, 2, '2021-05-27'),
(2, 1, 2, 2, '2021-05-27'),
(3, 2, 4, 3, '2021-05-11'),
(4, 4, 3, 4, '2021-05-27');

-- --------------------------------------------------------

--
-- Структура таблицы `service`
--

CREATE TABLE `service` (
  `id` int(20) NOT NULL,
  `country_id` int(20) NOT NULL,
  `visa_service` varchar(10) NOT NULL,
  `accommodation` varchar(255) NOT NULL,
  `food` varchar(255) NOT NULL,
  `excursions` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `service`
--

INSERT INTO `service` (`id`, `country_id`, `visa_service`, `accommodation`, `food`, `excursions`) VALUES
(1, 1, 'да', 'трехместное', 'bed & breakfast', 'нет'),
(2, 2, 'да', 'двуместное', 'full board', 'да'),
(3, 3, 'нет', 'одноместное', 'bed & breakfest', 'да'),
(4, 4, 'нет', 'двуместное', 'bed & breakfest', 'нет');

-- --------------------------------------------------------

--
-- Структура таблицы `tours`
--

CREATE TABLE `tours` (
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(20) NOT NULL,
  `service_id` int(20) NOT NULL,
  `transport_id` int(20) NOT NULL,
  `departure_date` date DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `number_of_persons` int(20) NOT NULL,
  `length_of_stay` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tours`
--

INSERT INTO `tours` (`id`, `name`, `description`, `price`, `service_id`, `transport_id`, `departure_date`, `arrival_date`, `number_of_persons`, `length_of_stay`) VALUES
(1, 'Становление военно-промышленного комплекса тульского региона', 'Экскурсия позволяет проследить зарождение развития стрелкового и холодного оружия', 450, 2, 1, '2021-05-01', '2021-05-04', 4, 7),
(2, 'Эволюция оружия с XVI в. по настоящее время', 'Экскурсия позволяет проследить зарождение, развитие и современное состояние военно-промышленного комплекса тульского региона', 500, 1, 2, '2021-05-17', '2021-05-26', 2, 10),
(3, 'Страницы воинской славы России', 'Экскурсия знакомит с военной историей России на примере Куликовской битвы, Отечественной войны 1812 г., Первой мировой и Великой Отечественной войн', 600, 2, 3, '2021-05-23', '2021-05-26', 7, 11),
(4, 'Оружие наших побед', 'Экскурсия рассказывает о героическом прошлом России, знакомя с оружием разных исторических эпох', 500, 3, 4, '2021-05-07', '2021-05-10', 10, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `transport`
--

CREATE TABLE `transport` (
  `id` int(20) NOT NULL,
  `transport_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `transport`
--

INSERT INTO `transport` (`id`, `transport_name`) VALUES
(1, 'Машина'),
(2, 'Самолет'),
(3, 'Поезд'),
(4, 'Морское судно');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `tours_id` (`tours_id`) USING BTREE,
  ADD KEY `employee_id` (`emlpoyee_id`) USING BTREE;

--
-- Индексы таблицы `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- Индексы таблицы `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_id` (`transport_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Индексы таблицы `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `city`
--
ALTER TABLE `city`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `country`
--
ALTER TABLE `country`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `tours`
--
ALTER TABLE `tours`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `transport`
--
ALTER TABLE `transport`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `country`
--
ALTER TABLE `country`
  ADD CONSTRAINT `country_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`emlpoyee_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`tours_id`) REFERENCES `tours` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `tours`
--
ALTER TABLE `tours`
  ADD CONSTRAINT `tours_ibfk_1` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tours_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
