drop database if exists vk_2;
create database vk_2;
use vk_2;


drop table if exists users;
create table users
(
	id SERIAL primary key, -- BIGINT UNSIGNED NOT NULL AUTO_INCREAMENT UNIQUE
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	email VARCHAR(100) unique,
	password_hash VARCHAR(100),
	phone VARCHAR(12),
	
	index users_phone_idx(phone),
	index (firstname, lastname)
);

drop table if exists table_1;
create table table_1
(
	id SERIAL primary key,
	any_key BIGINT unsigned not null,
	any_status ENUM('A', 'B', 'C', 'D'),
	any_date DATETIME default now(),
	
	index (any_key),
	foreign key (any_key) references users(id)
);


drop table if exists table_2;
create table table_2
(
	id SERIAL,
	any_key BIGINT unsigned not null,
	any_status ENUM('A', 'B', 'C', 'D'),
	any_date DATETIME default now(),
	
	primary key (id),
	foreign key (any_key) references users(id)
);


drop table if exists table_3;
create table table_3
(
	id SERIAL,
	any_key BIGINT unsigned not null,
	new_key BIGINT unsigned not null,
	
	primary key (any_key, new_key),
	foreign key (any_key) references users(id),
	foreign key (new_key) references users(id)
);
