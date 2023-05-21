--Наполнение данными базу Singers

insert into Singers(name, nick_name)
values('Jared Higgins', 'JuiceWRLD');

insert into Singers(name, nick_name)
values('Oshea Jackson', 'Ice Cube');

insert into Singers(name, nick_name)
values('Curtise Jackson', '50 Cent');

insert into Singers(name, nick_name)
values('Marschall Matthers', 'Eminem');

insert into Singers(name, nick_name)
values('Andre Young', 'Dr.Dre');

insert into Singers(name, nick_name)
values('Calvin Brodus Jr', 'Snoop Dogg');

insert into Singers(name, nick_name)
values('Tupac Shakur', '2Pac');

insert into Singers(name, nick_name)
values('Dwyane Carter', 'Lil Wayne');

insert into Singers(name, nick_name)
values('Shawn Carter', 'Jay-Z');

insert into Singers(name, nick_name)
values('Jack Webster', 'Travis Scott')


--Наполнение данными базу Musical_genres

insert into Musical_genres(genre_name)
values('Rap');

insert into Musical_genres(genre_name)
values('Rock');

insert into Musical_genres(genre_name)
values('RnB');

insert into Musical_genres(genre_name)
values('Soul');

insert into Musical_genres(genre_name)
values('Electro');

--Наполнение данными базу Albums

insert into Albums(album_name, year)
values('Tha Carter IV', 2008);

insert into Albums(album_name, year)
values('Doggystyle', 2002);

insert into Albums(album_name, year)
values('2001', 2001);

insert into Albums(album_name, year)
values('Goodbye & Good Riddance', 2016);

insert into Albums(album_name, year)
values('Amerikaaz Most Wanted', 1993);

insert into Albums(album_name, year)
values('Encore', 2004);

insert into Albums(album_name, year)
values('Massacre', 2007);

insert into Albums(album_name, year)
values('All Eyes On Me', 1994);

insert into Albums(album_name, year)
values('Astroworld', 2018);


--Наполнение данными базу Songs

insert into Songs(song_name, duration, album_name)
values('Sicko Mode', 245, 'Astroworld');

insert into Songs(song)name, duration, album_name)
values('All Girls Are The Same', 224, 'Goodbye & Good Riddance');

insert into Songs(song_name, duration, album_name)
values('Just A Lil bit', 200, 'Massacre');

insert into Songs(song_name, duration, album_name)
values('Gin n Juice', 251, 'Doggystyle');

insert into Songs(song_name, duration, album_name)
values('Who Am I (What’s My Name)?', 400, 'Doggystyle');

insert into Songs(song_name, duration, album_name)
values('A Milli', 199, 'Tha Carter IV');

insert into Songs(song_name, duration, album_name)
values('Still D.R.E.', 187, '2001');

insert into Songs(song_name, duration, album_name)
values('Cleanin Out My Closet', 201, 'Encore');

insert into Songs(song_name, duration, album_name)
values('Lucid Dreams', 209, 'Goodbye & Good Riddance');

insert into Songs(song_name, duration, album_name)
values('All Eyes On Me', 321, 'All Eyes On Me');

insert into Songs(song_name, duration, album_name)
values('She Will', 222, 'Tha Carter IV');

insert into Songs(song_name, duration, album_name)
values('Whats the Difference', 235, '2001');

insert into Songs(song_name, duration, album_name)
values('The Next Episode', 205, '2001');

insert into Songs(song_name, duration, album_name)
values('Black & White', 211, 'Goodbye & Good Riddance');

insert into Songs(song_name, duration, album_name)
values('Stan', 321, 'Encore');


--Название и год выхода альбомов, вышедших в 2018 году.

select album_name, year from Albums
where year = 2018;

--Название и продолжительность самого длительного трека.

select song_name, duration from Songs
where max(duration);

--Название треков, продолжительность которых не менее 3,5 минут.

select song_name from Songs
where duration >= 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.

select collection_name from Collection
where year between 2018 and 2020;

--Исполнители, чьё имя состоит из одного слова.

select nick_name from Singers
where nick_name not like '% %';

--Название треков, которые содержат слово «мой» или «my».

select song_name from Songs
where song_name like '%my%' or '%мой%';

