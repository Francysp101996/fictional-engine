DROP DATABASE laravel_master;

CREATE DATABASE IF NOT EXISTS laravel_master;
USE laravel_master;

CREATE TABLE IF NOT EXISTS users(
id              INT(255) auto_increment NOT NULL,
role            VARCHAR(20),
name            VARCHAR(100),
surname         VARCHAR(200),
nick            VARCHAR(100),
email           VARCHAR(255),
password        VARCHAR(255),
image           VARCHAR(255),
created_at      DATETIME,
updated_at       DATETIME,
remember_token  VARCHAR(255),
CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS images(
id              INT(255) auto_increment not null,
user_id         INT(255),
image_path      VARCHAR(255),
description     text,
created_at       DATETIME,
updated_at       DATETIME,
CONSTRAINT pk_images PRIMARY KEY(id),
CONSTRAINT fk_images_users FOREIGN KEY(user_id) REFERENCES users(id)         
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS comments(
id              INT(255) auto_increment not null,
user_id         INT(255),
image_id        INT(255),
content         text,
created_at       DATETIME,
updated_at       DATETIME,
CONSTRAINT pk_comments PRIMARY KEY(id),
CONSTRAINT fk_comments_users FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_comments_images FOREIGN KEY(image_id) REFERENCES images(id)         
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS likes(
id              INT(255) auto_increment not null,
user_id         INT(255),
image_id        INT(255),
created_at       DATETIME,
updated_at       DATETIME,
CONSTRAINT pk_likes PRIMARY KEY(id),
CONSTRAINT fk_likes_users FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_likes_images FOREIGN KEY(image_id) REFERENCES images(id)         
)ENGINE=InnoDb;

# insert 

insert into users values(null, 'user', 'Luffy', 'Monkey D', 'Muwigara', 'luffy@gmail.com', 'luffy', null, CURTIME(), CURTIME(), null);
insert into users values(null, 'user', 'Zoro', 'Roronoa', 'Marino', 'zoro@gmail.com', 'zoro', null, CURTIME(), CURTIME(), null);
insert into users values(null, 'user', 'Nami', '', 'Navegante', 'nami@gmail.com', 'nami', null, CURTIME(), CURTIME(), null);

insert into images values(null, 1, 'test.jpg', 'Descripcion de prueba 1', CURTIME(), CURTIME()); 
insert into images values(null, 1, 'laftel.jpg', 'Descripcion de prueba 2', CURTIME(), CURTIME()); 
insert into images values(null, 1, 'wano.jpg', 'Descripcion de prueba 3', CURTIME(), CURTIME()); 
insert into images values(null, 3, 'raftel.jpg', 'Descripcion de prueba 4', CURTIME(), CURTIME()); 


insert into comments values(null, 1, 4, 'Buena foto', CURTIME(), CURTIME());
insert into comments values(null, 2, 1, 'Ahi voy', CURTIME(), CURTIME());
insert into comments values(null, 2, 4, 'Increible', CURTIME(), CURTIME());


insert into likes values(null, 1, 4, CURTIME(), CURTIME());
insert into likes values(null, 2, 4, CURTIME(), CURTIME());
insert into likes values(null, 3, 1, CURTIME(), CURTIME());
insert into likes values(null, 2, 1, CURTIME(), CURTIME());