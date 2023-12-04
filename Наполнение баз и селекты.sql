-- Наполняем таблицу певцами

insert into singers(id, nickname)
values(1, 'Juice WRLD');

insert into singers(id, nickname)
values(2, '50 cent');

insert into singers(id, nickname)
values(3, 'Snoop Dogg');

insert into singers(id, nickname)
values(4, 'Fall Out Boy');

insert into singers(id, nickname)
values(5, 'Halsey');

insert into singers(id, nickname)
values(6, 'OG Buda');

insert into singers(id, nickname)
values(7, 'David Guetta');

insert into singers(id, nickname)
values(8, 'Miyagi');

-- Наполняем таблицу жанрами

insert into genres(id, name)
values(1, 'Hip-hop');

insert into genres(id, name)
values(2, 'Soul');

insert into genres(id, name)
values(3, 'Rap');

insert into genres(id, name)
values(4, 'Pop');

insert into genres(id, name)
values(5, 'Rock');

-- Наполняем таблицу альбомы

insert into albums(id, name, release_date)
values(1, 'Goodbye & Good Riddance', '23-08-2018');

insert into albums(id, name, release_date)
values(2, 'Get Rich or Die Tryin', '01-01-2003');

insert into albums(id, name, release_date)
values(3, 'Doggystyle', '18-10-1993');

insert into albums(id, name, release_date)
values(4, 'WE didn’t start the FIRE', '28-07-2023');

insert into albums(id, name, release_date)
values(5, 'Manic', '16-01-2020');

insert into albums(id, name, release_date)
values(6, 'ОПГ СИТИ', '29-11-2019');

insert into albums(id, name, release_date)
values(7, 'One More Love', '01-01-2013');

insert into albums(id, name, release_date)
values(8, 'Yamakasi', '17-07-2020');

-- Наполняем таблицу песни

insert into songs(id, name, time, id_of_album)
values(1, 'Blinding Lights', '3:20', 6);

insert into songs(id, name, time, id_of_album)
values(2, 'Cant" Feel My Face', '3:33', 6);

insert into songs(id, name, time, id_of_album)
values(3, 'Call Out My Name', '3:48', 6);

insert into songs(id, name, time, id_of_album)
values(4, 'Starboy', '3:50', 6);

insert into songs(id, name, time, id_of_album)
values(5, 'Stressed Out', '3:22', 5);

insert into songs(id, name, time, id_of_album)
values(6, 'Polarize', '3:45', 5);

insert into songs(id, name, time, id_of_album)
values(7, 'Hometown', '3:54', 5);

insert into songs(id, name, time, id_of_album)
values(8, 'Lane Boy', '4:13', 5);

insert into songs(id, name, time, id_of_album)
values(9, 'Yamakasi', '4:23', 1);

insert into songs(id, name, time, id_of_album)
values(10, 'Utopia', '3:29', 1);

insert into songs(id, name, time, id_of_album)
values(11, 'Infinite Tsukuyomi', '3:23', 7);

insert into songs(id, name, time, id_of_album)
values(12, 'LUV', '3:15', 7);

insert into songs(id, name, time, id_of_album)
values(13, 'дождь', '2:47', 2);

insert into songs(id, name, time, id_of_album)
values(14, 'в сети', '1:53', 2);

insert into songs(id, name, time, id_of_album)
values(15, 'Фитиль', '3:12', 3);

-- Наполняем таблицу коллекции

insert into collections(id, name, release_date)
values(1, 'Slowed', '17-11-2021');

insert into collections(id, name, release_date)
values(2, 'Go end', '09-07-2021');

insert into collections(id, name, release_date)
values(3, 'Lead', '08-10-2020');

insert into collections(id, name, release_date)
values(4, 'Fan pilots', '16-02-2018');

insert into collections(id, name, release_date)
values(5, 'Low dance', '25-04-2017');

insert into collections(id, name, release_date)
values(6, 'Today Weekend', '14-06-2020');

insert into collections(id, name, release_date)
values(7, 'Stone and shark', '12-09-2021');

insert into collections(id, name, release_date)
values(8, 'Soul of all songs', '30-10-2022');

-- Наполняем альбомы и певцы

insert into albums_and_singers(album_id, singer_id)
values(1, 8);

insert into albums_and_singers(album_id, singer_id)
values(2, 2);

insert into albums_and_singers(album_id, singer_id)
values(3, 5);

insert into albums_and_singers(album_id, singer_id)
values(4, 5);

insert into albums_and_singers(album_id, singer_id)
values(5, 4);

insert into albums_and_singers(album_id, singer_id)
values(6, 1);

insert into albums_and_singers(album_id, singer_id)
values(7, 3);

insert into albums_and_singers(album_id, singer_id)
values(8, 6);

insert into genres_and_singers(genre_id, singer_id)
values(1, 1);

insert into genres_and_singers(genre_id, singer_id)
values(1, 2);

insert into genres_and_singers(genre_id, singer_id)
values(1, 3);

insert into genres_and_singers(genre_id, singer_id)
values(1, 4);

insert into genres_and_singers(genre_id, singer_id)
values(1, 5);

insert into genres_and_singers(genre_id, singer_id)
values(2, 8);

insert into genres_and_singers(genre_id, singer_id)
values(3, 3);

insert into genres_and_singers(genre_id, singer_id)
values(3, 5);

insert into genres_and_singers(genre_id, singer_id)
values(4, 1);

insert into genres_and_singers(genre_id, singer_id)
values(4, 6);

insert into genres_and_singers(genre_id, singer_id)
values(4, 7);

-- Наполняем коллекции и песни

insert into collections_and_songs(collection_id, song_id)
values(6, 1);

insert into collections_and_songs(collection_id, song_id)
values(6, 2);

insert into collections_and_songs(collection_id, song_id)
values(7, 2);

insert into collections_and_songs(collection_id, song_id)
values(6, 3);

insert into collections_and_songs(collection_id, song_id)
values(8, 3);

insert into collections_and_songs(collection_id, song_id)
values(4, 1);

insert into collections_and_songs(collection_id, song_id)
values(6, 14);

insert into collections_and_songs(collection_id, song_id)
values(2, 7);

insert into collections_and_songs(collection_id, song_id)
values(3, 7);

insert into collections_and_songs(collection_id, song_id)
values(1, 11);

insert into collections_and_songs(collection_id, song_id)
values(6, 11);

insert into collections_and_songs(collection_id, song_id)
values(5, 12);

insert into collections_and_songs(collection_id, song_id)
values(5, 7);

insert into collections_and_songs(collection_id, song_id)
values(4, 4);

insert into collections_and_songs(collection_id, song_id)
values(3, 13);

insert into collections_and_songs(collection_id, song_id)
values(8, 8);

insert into collections_and_songs(collection_id, song_id)
values(3, 15);
