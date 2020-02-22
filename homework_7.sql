USE vk;

-- Составьте список пользователей users, 
-- которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT `id`, name
FROM users
WHERE id IN (SELECT id FROM orders)

-- Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT a.goods, b.sections
FROM products AS a
LEFT JOIN catalogs AS b ON products.id_client = catalogs.id_client;

-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.

SELECT a.id, a.name AS `from`, b.name AS `to`
FROM (SELECT id, `from`, name FROM flights LEFT JOIN cities ON flights.`from` = cities.label ) AS a
LEFT JOIN (SELECT id, `to`, name FROM flights LEFT JOIN cities ON flights.`from` = cities.label ) AS b
ON a.id = b.id;