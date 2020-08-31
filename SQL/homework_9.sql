-- Практическое задание по теме “Транзакции, переменные, представления”

-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. 
-- Используйте транзакции.
 
START TRANSACTION; 
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;

-- Создайте представление, которое выводит название name товарной позиции из таблицы products 
-- и соответствующее название каталога name из таблицы catalogs.

CREATE VIEW zero_wing AS 
SELECT a.name, b.name FROM products AS a LEFT JOIN catalogs AS b ON products.name = catalogs.name;	

-- Практическое задание по теме “Хранимые процедуры и функции, триггеры"

-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
-- в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи"

DROP FUNCTION IF EXISTS hello();
CREATE FUNCTION hello()
RETURNS VARCHAR(255) NOT DETERMINISTIC
BEGIN
	IF(current_time <= '06:00:00') THEN
	SELECT 'Доброй ночи';
  ELSEIF (current_time >= '18:00:00') THEN
	SELECT 'Добрый вечер';
  ELSE
	SELECT 'Добрый день';
  END IF;
END

-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
-- Допустимо присутствие обоих полей или одно из них. Ситуация, 
-- когда оба поля принимают неопределенное значение NULL неприемлема. 
-- Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.

CREATE TRIGGER check_not_null BEFORE UPDATE ON products FOR EACH ROW
BEGIN
  DECLARE cat_id INT;
  SELECT name INTO cat_id FROM products ORDER BY id LIMIT 1;
  SET NEW.name = COALESCE(NEW.name, OLD.name, cat_id);
END//

UPDATE products SET name = NULL //
SELECT id, name, price, catalog_id FROM products//









