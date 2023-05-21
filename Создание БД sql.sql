--Создаем таблицу Singers

create table if not exists Singers(
	singer_id SERIAL primary KEY, 
	nick_name VARCHAR(20) NOT NULL
);

--Создаем таблицу Albums

create table if not exists Albums(
	album_id serial primary key, 
	year VARCHAR(4) not null
);

--Создаем таблицу Musical_genres

create table if not exists Musical_genres(
	genre_id serial primary key,
	genre_name VARCHAR(30) not null
);

--Создаем таблицу Songs

create table if not exists Songs(
	song_id serial primary key,
	duration integer not null,
	album_name VARCHAR(60)
);

--Создаем таблицу Collections

create table if not exists Collections(
	collection_id serial primary key,
	year VARCHAR(4) not null
);


--Создаем промежуточную таблицу songs_collections

create table if not exists Songs_collections(
	song_id integer not null references Songs(song_id),
	collection_id integer references not null Collections(collection_id),
	constraint pk primary key (song_id, collection_id)
);

--Создаем промежуточную таблицу Singers_albums

create table if not exists Singers_albums(
	singer_id integer not null references Singers(singer_id),
	album_id integer not null references Albums(album_id),
	constraint pk primary key (singer_id, album_id)
);


--Создаем промежуточную таблицу Genres_singers

create table if not exists Genres_singers(
	singer_id integer not null references Singers(singer_id),
	genre_id integer not null references Musical_genres(genre_id),
	constraint pk primary key (singer_id, genre_id)
);
