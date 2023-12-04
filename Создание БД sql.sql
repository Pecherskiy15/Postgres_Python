-- Создаем таблицу жанры
create table if not exists genres(
id serial primary key,
name varchar(30) not null);

-- Создаем таблицу певцы
create table if not exists singers(
id serial primary key,
nickname varchar(30) not null);

-- Создаем таблицу альбомы
create table if not exists albums(
id serial primary key,
name varchar(30),
release_date date not null);

-- Создаем таблицу песни
create table if not exists songs(
id serial primary key,
name varchar(80) not null,
time time not null, 
id_of_album integer not null references albums(id));

-- Создаем таблицу коллекции
create table if not exists collections(
id serial primary key,
name varchar(30) not null,
release_date date not null);

create table if not exists genres_and_singers(
genre_id integer not null references genres(id),
singer_id integer not null references singers(id),
CONSTRAINT pk_for_gen_sin primary key (genre_id, singer_id)
);

create table if not exists albums_and_singers(
album_id integer not null references albums(id),
singer_id integer not null references singers(id),
CONSTRAINT pk_for_alb_sin primary key (album_id, singer_id)
);

create table if not exists collections_and_songs(
song_id integer not null references songs(id),
collection_id integer not null references collections(id),
CONSTRAINT pk_for_coll_son primary key (song_id, collection_id)
);
