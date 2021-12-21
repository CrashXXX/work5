<?php

// Параметры подключения к БД
const HOST = 'localhost';
const USER = 'root';
const PASSWORD = '';
const DATABASE = 'work5';


// Запрос к БД
function sqlQuery($query)
{
	$link = mysqli_connect(HOST, USER, PASSWORD, DATABASE);
	if (!$link) {
		return false;
	} else {
		$result = mysqli_query($link, $query);
		if ($result === true) {
			return true;
		} elseif ($result->num_rows == 0) {
			return false;
		} else {
			return mysqli_fetch_array($result, MYSQLI_ASSOC);
		}
	}
}

// Проверка на существование логина в БД
function isExistingLogin($login)
{
	if (trim($login) === '') {
		return false;
	}
	$query = "SELECT * FROM user WHERE login = '$login'";
	return sqlQuery($query);
}

// Проверка на существование почты в БД
function isExistingEmail($email)
{
	if (trim($email) === '') {
		return false;
	}
	$query = "SELECT * FROM user WHERE email = '$email'";
	return sqlQuery($query);
}

// Попытка авторизации пользователя
function authUser($login, $password)
{
	if (trim($login) === '') {
		return false;
	}
	$query = "SELECT password FROM user WHERE login = '$login'";
	$result = sqlQuery($query);
	if ($result && count($result) == 1 && password_verify($password, $result['password'])) {
		$query = "UPDATE user SET session = '" . session_id() . "', ua = '" . $_SERVER['HTTP_USER_AGENT'] . "' WHERE login = '$login'";
		if (sqlQuery($query)) {
			return true;
		} else {
			return false;
		}
	} else {
		return false;
	}
}

// Регистрация пользователя
function addUser($login, $password, $email, $fio)
{
	$session = session_id();
	$ua = $_SERVER['HTTP_USER_AGENT'];
	$encryptedPassword = password_hash($password, PASSWORD_BCRYPT);
	$query = "INSERT INTO user (login, password, email, fio, session, ua) VALUES ('$login', '$encryptedPassword', '$email', '$fio', '$session', '$ua')";
	$result = sqlQuery($query);
	if ($result) {
		return true;
	} else {
		return false;
	}
}

// Получение данных пользователя из БД
function getUser()
{
	$query = "SELECT * FROM user WHERE session = '" . session_id() . "' AND ua = '" . $_SERVER['HTTP_USER_AGENT'] . "'";
	$result = sqlQuery($query);
	if ($result) {
		return $result;
	} else {
		return false;
	}
}

// Выход пользователя и удаления информации о его сесси и браузере
function logoutUser()
{
	$query = "UPDATE user SET session = '', ua = '' WHERE session = '" . session_id() . "' AND ua = '" . $_SERVER['HTTP_USER_AGENT'] . "'";
	$result = sqlQuery($query);
	if ($result) {
		return $result;
	} else {
		return false;
	}
}

// Изменение пароля пользователя в БД
function changePassword($password)
{
	$encryptedPassword = password_hash($password, PASSWORD_BCRYPT);
	$query = "UPDATE user SET password = '$encryptedPassword' WHERE session = '" . session_id() . "' AND ua = '" . $_SERVER['HTTP_USER_AGENT'] . "'";
	$result = sqlQuery($query);
	if ($result) {
		return $result;
	} else {
		return false;
	}
}

// Изменение ФИО пользователя в БД
function changeFio($fio)
{
	$query = "UPDATE user SET fio = '$fio' WHERE session = '" . session_id() . "' AND ua = '" . $_SERVER['HTTP_USER_AGENT'] . "'";
	$result = sqlQuery($query);
	if ($result) {
		return $result;
	} else {
		return false;
	}
}

// Редирект на указанную страницу
function redirect($location)
{
	$url = ($_SERVER['SERVER_PORT'] != 443 ? 'http://' : 'https://') . $_SERVER['HTTP_HOST'] . '/index.php' . ($location ? '?path=' . $location : '');
	header('Location: ' . $url);
	exit;
}


// Стартуем сессию
if (!isset($_SESSION)) {
	session_start();
}


// Текст и тип сообщения при ошибках или наличии информации
$textMessage = false;
$textMessageColor = 'red';


// Так как по заданию надо создать 1 страницу, то будем в пределах одного файла выдавать разный HTML в записимости от GET-параметров (Авторизация, Регистрация, ЛК)
// По умолчанию показываем страницу Авторизация
if (isset($_GET['path']) && $_GET['path']) {
	$action = $_GET['path'];
} elseif (isset($_COOKIE['PHPSESSID'])) {
	if (getUser()) {
		$action = 'account';
	} else {
		$action = 'login';
	}
} else {
	$action = 'login';
}


// На странице Авторизация проверяем наличие и совпадение логина и пароля в БД
if ($action === 'login') {
	if (isset($_POST['login']) && isset($_POST['password'])) {
		if (authUser($_POST['login'], $_POST['password'])) {
			redirect('account');
		} else {
			$userName = htmlspecialchars($_POST['login']);
			$textMessage = 'Неверный логин или пароль';
			$pageTitle = 'Страница авторизации';
		}
	} else {
		$userName = '';
		$pageTitle = 'Страница авторизации';
	}


// На странице Регистрации проверяем существование логина и пароля в БД, дубли не разрешаем
// Если удалось создать запись о пользователе в БД, то перекидываем в ЛК
} elseif ($action === 'register') {
	$pageTitle = 'Страница регистрации';
	if ($_POST['login'] && $_POST['email'] && $_POST['password'] && $_POST['fio']) {
		if (isExistingLogin($_POST['login'])) {
			$textMessage = 'Логин уже существует';
		} elseif (isExistingEmail($_POST['email'])) {
			$textMessage = 'Email уже существует';
		} else {
			$result = addUser($_POST['login'], $_POST['password'], $_POST['email'], $_POST['fio']);
			if ($result) {
				redirect('account');
			} else {
				$textMessage = 'Ошибка регистрации';
			}
		}
		$userLogin = htmlspecialchars($_POST['login']);
		$userEmail = htmlspecialchars($_POST['email']);
		$userFio = htmlspecialchars($_POST['fio']);
	} else {
		$userLogin = $userEmail = $userFio = '';
	}

// На странице ЛК даем возможност редактировать ФИО и почту
} elseif ($action === 'account') {
	if ($user = getUser()) {
		if ($_POST && $_POST['change'] === 'change') {
			if ($_POST['password']) {
				if (changePassword($_POST['password'])) {
					$textMessage = 'Данные изменены!';
					$textMessageColor = 'blue';
				} else {
					$textMessage = 'Ошибка сохранения данных';
					$textMessageColor = 'red';
				}
			}
			if ($_POST['fio'] && $_POST['fio'] !== $user['fio']) {
				if (changeFio($_POST['fio'])) {
					$user['fio'] = $_POST['fio'];
					$textMessage = 'Данные изменены!';
					$textMessageColor = 'blue';
				} else {
					$textMessage = 'Ошибка сохранения данных';
					$textMessageColor = 'red';
				}
			}
		}
		$userLogin = htmlspecialchars($user['login']);
		$userEmail = htmlspecialchars($user['email']);
		$userFio = htmlspecialchars($user['fio']);
		$pageTitle = 'Личный кабинет';
	} else {
		redirect('');
	}


// Запрос на выход, без страницы, просто трем куки и уничтожаем сессию, перенаправляем на главную
} elseif ($action === 'logout') {
	if (logoutUser()) {
		session_destroy();
		setcookie('PHPSESSID', '', 1);
		redirect('');
		exit;
	}
}

?>

<html dir="ltr" lang="ru">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="style.css">
	<title><?= $pageTitle ?></title>
</head>
<body>

<?php if ($action === 'login') { ?>
	<div class="register-form">
		<span class="register-form-caption">Авторизация</span>
	  <?php if ($textMessage) echo('<span class="text-message ' . $textMessageColor . '">' . $textMessage . '</span>'); ?>
		<form method="post" action="" name="register">
			<div class="register-form-div">
				<label for="login">Логин</label>
				<input id="login" type="text" name="login" pattern="[A-Za-zА-Яа-яЁё0-9\s]+" value="<?= $userName ?>" required>
			</div>
			<div class="register-form-div">
				<label for="password">Пароль</label>
				<input id="password" type="password" name="password" required>
			</div>
			<p><a href="index.php?path=register">Зарегистрироваться</a></p>
			<button type="submit" name="auth" value="auth">Войти</button>
		</form>
	</div>

<?php } else if ($action === 'register') { ?>

	<div class="register-form">
		<span class="register-form-caption">Регистрация</span>
	  <?php if ($textMessage) echo('<span class="text-message ' . $textMessageColor . '">' . $textMessage . '</span>'); ?>
		<form method="post" action="" name="register">
			<div class="register-form-div">
				<label for="login">Логин</label>
				<input id="login" type="text" name="login" pattern="[A-Za-zА-Яа-яЁё0-9\s]+" value="<?= $userLogin ?>" required>
			</div>
			<div class="register-form-div">
				<label for="email">Email</label>
				<input id="email" type="email" name="email" value="<?= $userEmail ?>" required>
			</div>
			<div class="register-form-div">
				<label for="password">Пароль</label>
				<input id="password" type="password" name="password" required>
			</div>
			<div class="register-form-div">
				<label for="fio">ФИО</label>
				<input id="fio" type="text" name="fio" pattern="[A-Za-zА-Яа-яЁё\s]+" value="<?= $userFio ?>" required>
			</div>
			<p>Есть пароль? <a href="index.php?path=login">Войти</a></p>
			<button type="submit" name="register" value="register">Зарегистрироваться</button>
		</form>
	</div>

<?php } else if ($action === 'account') { ?>

	<div class="register-form">
		<span class="register-form-caption">Личный кабинет</span>
	  <?php if ($textMessage) echo('<span class="text-message ' . $textMessageColor . '">' . $textMessage . '</span>'); ?>
		<form method="post" action="" name="register">
			<div class="register-form-div">
				<label for="login">Логин</label>
				<input id="login" type="text" name="login" value="<?= $userLogin ?>" disabled>
			</div>
			<div class="register-form-div">
				<label for="email">Email</label>
				<input id="email" type="email" value="<?= $userEmail ?>" disabled>
			</div>
			<div class="register-form-div">
				<label for="fio">ФИО</label>
				<input id="fio" type="text" name="fio" pattern="[A-Za-zА-Яа-яЁё\s]+" value="<?= $userFio ?>"
							 placeholder="введите новые ФИО" required>
			</div>
			<div class="register-form-div">
				<label for="password">Пароль</label>
				<input id="password" type="password" name="password" placeholder="введите новый пароль">
			</div>
			<p><a href="index.php?path=logout">Выйти из системы</a></p>
			<button type="submit" name="change" value="change">Изменить данные</button>
		</form>
	</div>

<?php } ?>

</body>
</html>

