<?php

// Параметры подключения к БД
const HOST = 'localhost';
const USER = 'root';
const PASSWORD = '';
const DATABASE = 'work5';


// Запрос к БД, $col - колонка, по которой требуются значения, в задании она всегда одна
function sqlQuery($query, $col)
{
	$link = mysqli_connect(HOST, USER, PASSWORD, DATABASE);
	if ($link) {
		$result = mysqli_query($link, $query);
		if ($col) {
			$rows = [];
			if ($result->num_rows > 0) {
				while ($row = mysqli_fetch_array($result)) {
					$rows[] = $row[$col];
				}
				return $rows;
			}
		}
	}
	return false;
}


// Запрос на получение списка email, которые есть в БД минимум 2 раза
function getMoreThanOneEmail($col)
{
	$query = "SELECT email FROM users GROUP BY email HAVING COUNT(email) > 1";
	return sqlQuery($query, $col);
}


// Запрос на получение списка логинов, которые не сделали ни одного заказа, сортируем по id для удобства проверки
function getLoginsNoOrders($col)
{
	$query = "SELECT users.login FROM users WHERE users.id NOT IN (SELECT user_id FROM orders) ORDER BY users.id";
	return sqlQuery($query, $col);
}


// Запрос на получение списка логинов, которые не сделали болшье 2-х заказов, сортируем по кол-ву заказов для удобства проверки
function getLoginsMinTwoOrders($col)
{
	$query = "SELECT users.login, COUNT(orders.user_id) AS oc 
		FROM users, orders 
		WHERE users.id = orders.user_id 
		AND orders.user_id IN 
		(SELECT user_id FROM orders GROUP BY user_id HAVING COUNT(user_id) > 2) 
		GROUP BY users.login 
		ORDER BY oc DESC";
	return sqlQuery($query, $col);
}


// Запрос, генерирующий список из 200 пользователей в БД
/*$firstName = ['Иван', 'Петр', 'Семен', 'Михаил', 'Александр', 'Евгений', 'Сергей', 'Павел', 'Роман', 'Виктор'];
$midName = ['Иванович', 'Петрович', 'Семенович', 'Михайлович', 'Александрович', 'Евгеньевич', 'Сергеевич', 'Павлович', 'Романович', 'Викторович'];
$lastName = ['Достоевский', 'Гоголь', 'Маяковский', 'Бунин', 'Толстой', 'Пушкин', 'Лермонтов', 'Байрон', 'Тургенев', 'Салтыков-Щедрин'];

$firstEmail = ['pushkin', 'dostoevskiy', 'gogol', 'mayakovskiy', 'bunin', 'tolstoy', 'lermontov', 'bayron', 'turgenev', 'saltykov'];
$midEmail = ['ivan', 'petr', 'semen', 'michael', 'alex', 'eugen', 'sergey', 'pavel', 'roman', 'victor'];
$lastEmail = ['gmail.com', 'mail.ru', 'yandex.ru', 'rambler.ru', 'yahoo.com', 'foo.bar', 'git.hub', 'php.sh', 'bot.ban', 'raider.io'];

$query = "TRUNCATE TABLE users";
sqlQuery($query, false);

for ($i = 0; $i < 200; $i++) {
	$name = $firstName[rand(0, 9)] . ' ' . $midName[rand(0, 9)] . ' ' . $lastName[rand(0, 9)];
	$email = $firstEmail[rand(0, 9)] . '.' . $midEmail[rand(0, 9)] . '@' . $lastEmail[rand(0, 9)];
	$query = "INSERT INTO users (login, email) VALUES ('{$name}', '{$email}')";
	sqlQuery($query, false);
}*/


// Запрос, генерирующий список из 500 заказов в БД от 200 пользователей из указанного выше запроса
/*$query = "TRUNCATE TABLE orders";
sqlQuery($query, false);

for ($i = 0; $i < 500; $i++) {
	$user_id = rand(1, 200);
	$price = rand(100, 999);
	$query = "INSERT INTO orders (user_id, price) VALUES ('{$user_id}', '{$price}')";
	sqlQuery($query, false);
}*/


echo '<p><b>Пользователи, сделавшие больше 1 заказа:</b></p>';
$results = getMoreThanOneEmail('email');
if ($results) {
	foreach ($results as $result) {
		echo $result . '<br>';
	}
}


echo '<p><b>Пользователи, которые не сделали ни одного заказа:</b></p>';
$results = getLoginsNoOrders('login');
if ($results) {
	foreach ($results as $result) {
		echo $result . '<br>';
	}
}


echo '<p><b>Пользователи, которые сделали больше 2-х заказов:</b></p>';
$results = getLoginsMinTwoOrders('login');
if ($results) {
	foreach ($results as $result) {
		echo $result . '<br>';
	}
}