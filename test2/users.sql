-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 22 2021 г., 01:17
-- Версия сервера: 5.7.33
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `work5`
--

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `login`) VALUES
(1, 'bunin.eugen@foo.bar', 'Евгений Михайлович Байрон'),
(2, 'lermontov.alex@yandex.ru', 'Виктор Романович Бунин'),
(3, 'saltykov.pavel@bot.ban', 'Сергей Евгеньевич Лермонтов'),
(4, 'gogol.eugen@yahoo.com', 'Александр Михайлович Достоевский'),
(5, 'gogol.semen@yahoo.com', 'Евгений Викторович Тургенев'),
(6, 'lermontov.michael@bot.ban', 'Иван Иванович Пушкин'),
(7, 'gogol.roman@raider.io', 'Сергей Иванович Салтыков-Щедрин'),
(8, 'gogol.ivan@yahoo.com', 'Александр Евгеньевич Гоголь'),
(9, 'gogol.ivan@raider.io', 'Семен Михайлович Тургенев'),
(10, 'saltykov.ivan@yahoo.com', 'Сергей Викторович Бунин'),
(11, 'turgenev.eugen@foo.bar', 'Александр Петрович Маяковский'),
(12, 'lermontov.ivan@foo.bar', 'Павел Романович Пушкин'),
(13, 'pushkin.alex@yahoo.com', 'Александр Романович Толстой'),
(14, 'pushkin.michael@yandex.ru', 'Иван Семенович Бунин'),
(15, 'pushkin.eugen@yandex.ru', 'Виктор Павлович Байрон'),
(16, 'bayron.ivan@git.hub', 'Иван Викторович Тургенев'),
(17, 'saltykov.ivan@yandex.ru', 'Михаил Викторович Достоевский'),
(18, 'turgenev.eugen@php.sh', 'Сергей Евгеньевич Салтыков-Щедрин'),
(19, 'tolstoy.victor@yandex.ru', 'Виктор Сергеевич Достоевский'),
(20, 'bayron.michael@mail.ru', 'Виктор Иванович Байрон'),
(21, 'mayakovskiy.pavel@bot.ban', 'Виктор Романович Пушкин'),
(22, 'gogol.michael@raider.io', 'Павел Викторович Гоголь'),
(23, 'saltykov.roman@raider.io', 'Петр Михайлович Маяковский'),
(24, 'dostoevskiy.semen@yahoo.com', 'Сергей Михайлович Лермонтов'),
(25, 'lermontov.roman@raider.io', 'Виктор Романович Салтыков-Щедрин'),
(26, 'tolstoy.roman@php.sh', 'Сергей Романович Пушкин'),
(27, 'mayakovskiy.michael@git.hub', 'Виктор Петрович Байрон'),
(28, 'pushkin.alex@foo.bar', 'Роман Павлович Гоголь'),
(29, 'pushkin.ivan@yahoo.com', 'Петр Викторович Достоевский'),
(30, 'mayakovskiy.roman@yandex.ru', 'Виктор Евгеньевич Пушкин'),
(31, 'bayron.petr@foo.bar', 'Сергей Павлович Достоевский'),
(32, 'bunin.pavel@yahoo.com', 'Павел Сергеевич Тургенев'),
(33, 'mayakovskiy.sergey@yandex.ru', 'Сергей Викторович Байрон'),
(34, 'gogol.ivan@bot.ban', 'Михаил Семенович Салтыков-Щедрин'),
(35, 'turgenev.alex@yahoo.com', 'Виктор Викторович Байрон'),
(36, 'lermontov.eugen@rambler.ru', 'Александр Александрович Бунин'),
(37, 'lermontov.semen@yandex.ru', 'Семен Петрович Маяковский'),
(38, 'tolstoy.pavel@gmail.com', 'Роман Петрович Гоголь'),
(39, 'bayron.pavel@yahoo.com', 'Виктор Евгеньевич Толстой'),
(40, 'lermontov.alex@yandex.ru', 'Иван Иванович Толстой'),
(41, 'mayakovskiy.pavel@gmail.com', 'Александр Михайлович Салтыков-Щедрин'),
(42, 'mayakovskiy.ivan@bot.ban', 'Семен Александрович Толстой'),
(43, 'gogol.roman@mail.ru', 'Михаил Михайлович Пушкин'),
(44, 'bayron.ivan@rambler.ru', 'Семен Романович Бунин'),
(45, 'lermontov.ivan@php.sh', 'Павел Петрович Маяковский'),
(46, 'tolstoy.roman@php.sh', 'Виктор Семенович Гоголь'),
(47, 'mayakovskiy.ivan@bot.ban', 'Сергей Михайлович Гоголь'),
(48, 'dostoevskiy.eugen@gmail.com', 'Иван Михайлович Лермонтов'),
(49, 'bayron.pavel@yahoo.com', 'Евгений Викторович Бунин'),
(50, 'tolstoy.sergey@bot.ban', 'Евгений Михайлович Салтыков-Щедрин'),
(51, 'lermontov.pavel@yahoo.com', 'Сергей Викторович Салтыков-Щедрин'),
(52, 'bunin.petr@mail.ru', 'Михаил Романович Достоевский'),
(53, 'lermontov.roman@rambler.ru', 'Семен Викторович Гоголь'),
(54, 'tolstoy.victor@bot.ban', 'Михаил Михайлович Достоевский'),
(55, 'bayron.ivan@foo.bar', 'Евгений Романович Гоголь'),
(56, 'tolstoy.pavel@yandex.ru', 'Павел Евгеньевич Толстой'),
(57, 'bunin.ivan@raider.io', 'Семен Михайлович Толстой'),
(58, 'pushkin.sergey@gmail.com', 'Иван Александрович Достоевский'),
(59, 'bunin.eugen@mail.ru', 'Роман Семенович Пушкин'),
(60, 'gogol.pavel@raider.io', 'Александр Петрович Лермонтов'),
(61, 'gogol.petr@mail.ru', 'Сергей Михайлович Достоевский'),
(62, 'bunin.michael@raider.io', 'Виктор Романович Тургенев'),
(63, 'mayakovskiy.roman@yahoo.com', 'Михаил Александрович Толстой'),
(64, 'lermontov.ivan@mail.ru', 'Александр Михайлович Достоевский'),
(65, 'turgenev.pavel@mail.ru', 'Роман Петрович Толстой'),
(66, 'turgenev.alex@git.hub', 'Михаил Павлович Байрон'),
(67, 'gogol.sergey@bot.ban', 'Семен Павлович Тургенев'),
(68, 'lermontov.michael@yandex.ru', 'Петр Романович Маяковский'),
(69, 'pushkin.pavel@rambler.ru', 'Евгений Романович Достоевский'),
(70, 'bayron.petr@bot.ban', 'Семен Романович Толстой'),
(71, 'dostoevskiy.petr@yahoo.com', 'Семен Романович Маяковский'),
(72, 'gogol.semen@yahoo.com', 'Павел Михайлович Гоголь'),
(73, 'saltykov.victor@mail.ru', 'Петр Романович Лермонтов'),
(74, 'lermontov.sergey@yahoo.com', 'Павел Михайлович Тургенев'),
(75, 'dostoevskiy.semen@mail.ru', 'Семен Павлович Тургенев'),
(76, 'dostoevskiy.semen@git.hub', 'Роман Сергеевич Маяковский'),
(77, 'pushkin.eugen@yahoo.com', 'Петр Сергеевич Пушкин'),
(78, 'mayakovskiy.michael@yahoo.com', 'Михаил Викторович Тургенев'),
(79, 'turgenev.semen@bot.ban', 'Виктор Иванович Бунин'),
(80, 'bunin.michael@bot.ban', 'Павел Александрович Лермонтов'),
(81, 'dostoevskiy.michael@mail.ru', 'Александр Петрович Тургенев'),
(82, 'turgenev.sergey@foo.bar', 'Сергей Михайлович Достоевский'),
(83, 'saltykov.michael@mail.ru', 'Виктор Михайлович Лермонтов'),
(84, 'bunin.pavel@rambler.ru', 'Александр Петрович Маяковский'),
(85, 'tolstoy.victor@yandex.ru', 'Виктор Сергеевич Гоголь'),
(86, 'tolstoy.sergey@gmail.com', 'Евгений Викторович Маяковский'),
(87, 'lermontov.roman@raider.io', 'Иван Викторович Салтыков-Щедрин'),
(88, 'bunin.roman@mail.ru', 'Виктор Викторович Пушкин'),
(89, 'bayron.sergey@git.hub', 'Михаил Михайлович Лермонтов'),
(90, 'bayron.semen@git.hub', 'Александр Павлович Салтыков-Щедрин'),
(91, 'dostoevskiy.roman@mail.ru', 'Семен Романович Салтыков-Щедрин'),
(92, 'tolstoy.alex@mail.ru', 'Иван Викторович Тургенев'),
(93, 'lermontov.pavel@php.sh', 'Роман Михайлович Пушкин'),
(94, 'dostoevskiy.semen@gmail.com', 'Иван Романович Байрон'),
(95, 'dostoevskiy.roman@php.sh', 'Михаил Семенович Байрон'),
(96, 'bunin.ivan@rambler.ru', 'Александр Сергеевич Достоевский'),
(97, 'mayakovskiy.roman@mail.ru', 'Сергей Михайлович Толстой'),
(98, 'mayakovskiy.ivan@bot.ban', 'Петр Сергеевич Достоевский'),
(99, 'pushkin.semen@yandex.ru', 'Роман Романович Достоевский'),
(100, 'bunin.petr@bot.ban', 'Роман Павлович Толстой'),
(101, 'saltykov.pavel@foo.bar', 'Иван Иванович Салтыков-Щедрин'),
(102, 'dostoevskiy.michael@yahoo.com', 'Петр Петрович Байрон'),
(103, 'saltykov.eugen@yahoo.com', 'Александр Викторович Пушкин'),
(104, 'pushkin.petr@yandex.ru', 'Иван Михайлович Бунин'),
(105, 'pushkin.ivan@rambler.ru', 'Сергей Евгеньевич Гоголь'),
(106, 'bayron.pavel@yandex.ru', 'Павел Викторович Гоголь'),
(107, 'gogol.alex@php.sh', 'Александр Иванович Тургенев'),
(108, 'lermontov.sergey@rambler.ru', 'Роман Евгеньевич Байрон'),
(109, 'bunin.ivan@yandex.ru', 'Сергей Евгеньевич Толстой'),
(110, 'tolstoy.sergey@yahoo.com', 'Роман Михайлович Гоголь'),
(111, 'bayron.semen@git.hub', 'Сергей Евгеньевич Маяковский'),
(112, 'bunin.ivan@mail.ru', 'Петр Иванович Маяковский'),
(113, 'dostoevskiy.victor@git.hub', 'Александр Евгеньевич Толстой'),
(114, 'mayakovskiy.sergey@yandex.ru', 'Александр Сергеевич Толстой'),
(115, 'saltykov.michael@mail.ru', 'Павел Михайлович Толстой'),
(116, 'pushkin.petr@gmail.com', 'Михаил Семенович Салтыков-Щедрин'),
(117, 'mayakovskiy.michael@gmail.com', 'Роман Евгеньевич Гоголь'),
(118, 'bunin.sergey@bot.ban', 'Роман Александрович Пушкин'),
(119, 'saltykov.eugen@yandex.ru', 'Павел Александрович Достоевский'),
(120, 'bunin.semen@raider.io', 'Евгений Павлович Гоголь'),
(121, 'tolstoy.petr@gmail.com', 'Виктор Семенович Салтыков-Щедрин'),
(122, 'bayron.petr@mail.ru', 'Михаил Михайлович Бунин'),
(123, 'mayakovskiy.sergey@yahoo.com', 'Роман Романович Лермонтов'),
(124, 'bunin.ivan@yahoo.com', 'Виктор Романович Толстой'),
(125, 'tolstoy.ivan@gmail.com', 'Иван Петрович Байрон'),
(126, 'mayakovskiy.victor@git.hub', 'Евгений Михайлович Толстой'),
(127, 'dostoevskiy.roman@mail.ru', 'Евгений Александрович Байрон'),
(128, 'bayron.semen@bot.ban', 'Роман Евгеньевич Пушкин'),
(129, 'saltykov.alex@rambler.ru', 'Петр Павлович Байрон'),
(130, 'lermontov.pavel@yandex.ru', 'Иван Иванович Бунин'),
(131, 'tolstoy.petr@bot.ban', 'Роман Александрович Гоголь'),
(132, 'saltykov.eugen@foo.bar', 'Евгений Павлович Байрон'),
(133, 'lermontov.eugen@yandex.ru', 'Иван Романович Салтыков-Щедрин'),
(134, 'dostoevskiy.semen@yahoo.com', 'Павел Павлович Салтыков-Щедрин'),
(135, 'pushkin.victor@gmail.com', 'Роман Павлович Тургенев'),
(136, 'bayron.roman@bot.ban', 'Павел Михайлович Бунин'),
(137, 'gogol.victor@rambler.ru', 'Александр Викторович Салтыков-Щедрин'),
(138, 'mayakovskiy.roman@raider.io', 'Михаил Евгеньевич Достоевский'),
(139, 'tolstoy.ivan@php.sh', 'Иван Евгеньевич Достоевский'),
(140, 'gogol.ivan@yahoo.com', 'Семен Михайлович Пушкин'),
(141, 'bayron.ivan@bot.ban', 'Евгений Иванович Тургенев'),
(142, 'turgenev.pavel@raider.io', 'Михаил Романович Толстой'),
(143, 'lermontov.victor@rambler.ru', 'Роман Александрович Гоголь'),
(144, 'mayakovskiy.michael@gmail.com', 'Павел Романович Бунин'),
(145, 'gogol.petr@bot.ban', 'Сергей Евгеньевич Бунин'),
(146, 'bayron.petr@yandex.ru', 'Евгений Романович Бунин'),
(147, 'bayron.roman@rambler.ru', 'Павел Петрович Салтыков-Щедрин'),
(148, 'mayakovskiy.alex@foo.bar', 'Петр Евгеньевич Толстой'),
(149, 'gogol.sergey@git.hub', 'Александр Павлович Салтыков-Щедрин'),
(150, 'mayakovskiy.semen@raider.io', 'Роман Евгеньевич Тургенев'),
(151, 'lermontov.ivan@mail.ru', 'Виктор Евгеньевич Достоевский'),
(152, 'pushkin.semen@yandex.ru', 'Михаил Романович Салтыков-Щедрин'),
(153, 'turgenev.alex@php.sh', 'Павел Иванович Тургенев'),
(154, 'bayron.sergey@php.sh', 'Иван Евгеньевич Лермонтов'),
(155, 'lermontov.ivan@foo.bar', 'Михаил Сергеевич Байрон'),
(156, 'gogol.roman@mail.ru', 'Сергей Павлович Бунин'),
(157, 'bayron.pavel@yandex.ru', 'Сергей Михайлович Толстой'),
(158, 'mayakovskiy.alex@foo.bar', 'Михаил Александрович Байрон'),
(159, 'bunin.sergey@rambler.ru', 'Павел Михайлович Бунин'),
(160, 'bunin.victor@bot.ban', 'Семен Александрович Толстой'),
(161, 'turgenev.eugen@mail.ru', 'Роман Викторович Маяковский'),
(162, 'bayron.ivan@php.sh', 'Евгений Семенович Маяковский'),
(163, 'saltykov.sergey@mail.ru', 'Петр Семенович Толстой'),
(164, 'bunin.petr@raider.io', 'Евгений Семенович Лермонтов'),
(165, 'lermontov.semen@foo.bar', 'Евгений Сергеевич Байрон'),
(166, 'pushkin.semen@rambler.ru', 'Михаил Михайлович Лермонтов'),
(167, 'saltykov.michael@rambler.ru', 'Павел Сергеевич Лермонтов'),
(168, 'bayron.pavel@git.hub', 'Михаил Евгеньевич Байрон'),
(169, 'saltykov.roman@foo.bar', 'Виктор Иванович Лермонтов'),
(170, 'gogol.pavel@php.sh', 'Петр Евгеньевич Пушкин'),
(171, 'bunin.sergey@git.hub', 'Евгений Семенович Тургенев'),
(172, 'turgenev.sergey@yahoo.com', 'Виктор Семенович Маяковский'),
(173, 'lermontov.eugen@mail.ru', 'Роман Романович Толстой'),
(174, 'dostoevskiy.petr@git.hub', 'Виктор Иванович Бунин'),
(175, 'bayron.alex@foo.bar', 'Евгений Иванович Салтыков-Щедрин'),
(176, 'dostoevskiy.eugen@yandex.ru', 'Михаил Петрович Маяковский'),
(177, 'saltykov.eugen@yahoo.com', 'Семен Евгеньевич Маяковский'),
(178, 'saltykov.victor@mail.ru', 'Александр Сергеевич Гоголь'),
(179, 'dostoevskiy.michael@raider.io', 'Петр Романович Маяковский'),
(180, 'saltykov.pavel@yahoo.com', 'Виктор Михайлович Тургенев'),
(181, 'saltykov.roman@git.hub', 'Александр Павлович Пушкин'),
(182, 'mayakovskiy.sergey@bot.ban', 'Семен Петрович Толстой'),
(183, 'saltykov.roman@yahoo.com', 'Александр Сергеевич Маяковский'),
(184, 'turgenev.eugen@git.hub', 'Михаил Александрович Достоевский'),
(185, 'pushkin.semen@gmail.com', 'Виктор Евгеньевич Бунин'),
(186, 'bunin.eugen@git.hub', 'Александр Семенович Бунин'),
(187, 'mayakovskiy.eugen@rambler.ru', 'Петр Евгеньевич Достоевский'),
(188, 'bayron.semen@yandex.ru', 'Виктор Викторович Бунин'),
(189, 'mayakovskiy.victor@mail.ru', 'Александр Романович Лермонтов'),
(190, 'bayron.pavel@yandex.ru', 'Виктор Михайлович Лермонтов'),
(191, 'bayron.petr@mail.ru', 'Виктор Викторович Салтыков-Щедрин'),
(192, 'lermontov.eugen@gmail.com', 'Виктор Иванович Гоголь'),
(193, 'pushkin.petr@gmail.com', 'Павел Михайлович Байрон'),
(194, 'dostoevskiy.roman@bot.ban', 'Виктор Михайлович Маяковский'),
(195, 'bunin.ivan@php.sh', 'Роман Петрович Достоевский'),
(196, 'saltykov.michael@mail.ru', 'Александр Павлович Тургенев'),
(197, 'mayakovskiy.eugen@rambler.ru', 'Евгений Романович Толстой'),
(198, 'tolstoy.alex@git.hub', 'Виктор Евгеньевич Достоевский'),
(199, 'pushkin.eugen@rambler.ru', 'Сергей Сергеевич Лермонтов'),
(200, 'saltykov.victor@bot.ban', 'Евгений Петрович Тургенев');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
