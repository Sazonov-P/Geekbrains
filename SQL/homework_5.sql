-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”	

use vk;

-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
-- Заполните их текущими датой и временем.

UPDATE users 
SET 
	created_at = now(),
	updated_at = now();

-- Таблица users была неудачно спроектирована. 
-- Записи created_at и updated_at были заданы типом VARCHAR 
-- и в них долгое время помещались значения в формате "20.10.2017 8:10". 
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

UPDATE users 
SET 
	created_at = (cast(created_at as DATETIME)),
	updated_at = (cast(updated_at as DATETIME));

-- Задача 3

UPDATE users 
SET 
	value = round((rand()*(10-0+1)+0), 0);

select value
from users
order by case when value = 0 then '65535' end, value

-- Задача 4
	
select *
from users
where birthday in ('may', 'august');

-- Задача 5

select * from catalogs where id in (5, 1, 2)
order by field(id, 5, 1, 2)


-- Практическое задание теме “Агрегация данных”	

-- Подсчитайте средний возраст пользователей в таблице users

select avg(floor((TO_DAYS(NOW()) - TO_DAYS(birthday ))/365.25)) AS avg_age
from profiles

-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

select date_format(birthday, '%W') as day_birth, count(birthday)
from profiles
group by day_birth

-- Подсчитайте произведение чисел в столбце таблицы
	
select exp(sum(ln(value))) 
from users
