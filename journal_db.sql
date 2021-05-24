-- --------------------------------------------------------
-- Хост:                         localhost
-- Версия сервера:               8.0.25 - MySQL Community Server - GPL
-- Операционная система:         Linux
-- HeidiSQL Версия:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных POSTS
CREATE DATABASE IF NOT EXISTS `POSTS` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `POSTS`;

-- Дамп структуры для таблица POSTS.authors
CREATE TABLE IF NOT EXISTS `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fio` varchar(150) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `additional` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица содержит информацию об авторах стаей';

-- Дамп данных таблицы POSTS.authors: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` (`id`, `fio`, `age`, `location`, `additional`) VALUES
	(1, 'Александр Аммосов', 33, 'Россия', 'Автор Игромании'),
	(2, 'Михаил Шевкун', 32, 'Россия', 'Автор Игромании');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;

-- Дамп структуры для таблица POSTS.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `tel_number` bigint DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Адреса, явки, пароли';

-- Дамп данных таблицы POSTS.contacts: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` (`id`, `city`, `tel_number`, `email`) VALUES
	(1, 'Санкт-Петербург', 88001233434, 'newnewsnew@news.ru'),
	(2, 'Москва', 88002233434, 'newnewsnew@mosnews.ru');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;

-- Дамп структуры для таблица POSTS.feedback
CREATE TABLE IF NOT EXISTS `feedback` (
  `id_feedback` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `comment` text,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_feedback`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы POSTS.feedback: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` (`id_feedback`, `user`, `comment`, `email`) VALUES
	(6, 'Иван', 'Пишите еще!', 'ivanvolokitin@gmail.com');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;

-- Дамп структуры для таблица POSTS.last_news
CREATE TABLE IF NOT EXISTS `last_news` (
  `id_news` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `id_author` int DEFAULT NULL,
  `content` longtext,
  `postcard` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_news`),
  KEY `FK_last_news_authors` (`id_author`),
  CONSTRAINT `FK_last_news_authors` FOREIGN KEY (`id_author`) REFERENCES `authors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица с последними новостями нашего сайта';

-- Дамп данных таблицы POSTS.last_news: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `last_news` DISABLE KEYS */;
INSERT INTO `last_news` (`id_news`, `title`, `id_author`, `content`, `postcard`) VALUES
	(1, 'Скандал из ничего: нет, у Days Gone на PC нет кейлогера и тому подобного', 2, 'Недавно с компьютерной версией Days Gone разгорелся скандал из-за отзыва пользователя Steam, который утверждал о масштабном сборе данных игроков — включая запись всех нажатий на устройствах ввода, а также аудио, видео, файлов и даже паролей.  ', 'images/days_gone.jpg'),
	(2, '«There Can Be Only One»: Генри Кавилл сыграет главную роль в перезапуске «Горца»', 1, 'Недавно СМИ сообщили, что Генри Кавилл ведёт переговоры о главной роли в перезапуске «Горца», а теперь информацию подтвердил и сам актёр. Сыграет ли Кавилл уже знакомого персонажа вселенной или это будет абсолютно новый герой — неизвестно, хотя источники упоминают, что это не единственная ведущая роль картины. Возможно, в центре истории у Кавилла будет дуэт с кем-то ещё.', 'images/gorec.jpg'),
	(3, 'СМИ: cпин-офф «Мандалорца» о рейнджерах Республики не в приоритете Lucasfilm', 1, 'В недавней новости о повышении Дэйва Филони издание Variety упомянуло, что один из сериалов-спин-оффов «Мандалорца» сейчас не находится в активной разработке. \r\nРечь идёт о «Рейнджерах Новой Республики» — одном из трёх проектов, связанных с основным сериалом. Двумя другими были истории про Бобу Фетта и Асоку Тано. ', 'images/mandalorec.jpg'),
	(4, 'Съёмки полнометражного «Лютера» могут стартовать в сентябре', 1, 'Идрис Эльба рассказал, что съёмки полнометражной адаптации сериала «Лютер» могут стартовать в сентябре.\r\nСлухи о проекте ходили долгое время, особенно в связи с большими временными разрывами между последними сезонами.', 'images/luter.jpg');
/*!40000 ALTER TABLE `last_news` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
