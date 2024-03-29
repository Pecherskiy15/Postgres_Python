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
values(1, 'All Girls Are The Same', '3:10', 1);

insert into songs(id, name, time, id_of_album)
values(2, 'Lucid Dreams', '3:59', 1);

insert into songs(id, name, time, id_of_album)
values(3, 'If I Can't', '3:18', 2);

insert into songs(id, name, time, id_of_album)
values(4, 'In Da Club', '3:44', 2);

insert into songs(id, name, time, id_of_album)
values(5, 'Gin and Juice', '3:36', 3);

insert into songs(id, name, time, id_of_album)
values(6, 'Who I Am?', '4:06', 3);

insert into songs(id, name, time, id_of_album)
values(7, 'WE didn’t start the FIRE', '3:30', 4);

insert into songs(id, name, time, id_of_album)
values(8, 'Without Me', '3:50', 5);

insert into songs(id, name, time, id_of_album)
values(9, 'Graveyard', '3:01', 5);

insert into songs(id, name, time, id_of_album)
values(10, 'Биг Бой Слайм', '2:08', 6);

insert into songs(id, name, time, id_of_album)
values(11, 'ОПГ Сити', '3:37', 6);

insert into songs(id, name, time, id_of_album)
values(12, 'Sexy Bitch', '3:15', 7);

insert into songs(id, name, time, id_of_album)
values(13, 'Memories', '3:30', 7);

insert into songs(id, name, time, id_of_album)
values(14, 'Minor', '2:55', 8);

insert into songs(id, name, time, id_of_album)
values(15, 'Tantra', '4:15', 8);

insert into songs(id, name, time, id_of_album)
values(15, 'Мало нам', '3:459', 8);

-- Наполняем таблицу коллекции

insert into collections(id, name, release_date)
values(1, 'Dance', '17-11-2021');

insert into collections(id, name, release_date)
values(2, 'Old Rap', '09-07-2021');

insert into collections(id, name, release_date)
values(3, 'Hookah', '08-10-2020');

insert into collections(id, name, release_date)
values(4, 'Funny', '16-02-2018');

insert into collections(id, name, release_date)
values(5, 'Long Trip', '25-04-2017');

insert into collections(id, name, release_date)
values(6, 'Banger', '14-06-2020');

insert into collections(id, name, release_date)
values(7, 'Deep Feeling', '12-09-2021');

insert into collections(id, name, release_date)
values(8, 'Sadness', '30-10-2022');

-- Наполняем альбомы и певцы

insert into albums_and_singers(album_id, singer_id)
values(1, 1);

insert into albums_and_singers(album_id, singer_id)
values(2, 2);

insert into albums_and_singers(album_id, singer_id)
values(3, 3);

insert into albums_and_singers(album_id, singer_id)
values(4, 4);

insert into albums_and_singers(album_id, singer_id)
values(5, 5);

insert into albums_and_singers(album_id, singer_id)
values(6, 6);

insert into albums_and_singers(album_id, singer_id)
values(7, 7);

insert into albums_and_singers(album_id, singer_id)
values(8, 8);

-- Наполняем таблицу жанров и певцов

insert into genres_and_singers(genre_id, singer_id)
values(3, 1);

insert into genres_and_singers(genre_id, singer_id)
values(1, 2);

insert into genres_and_singers(genre_id, singer_id)
values(3, 3);

insert into genres_and_singers(genre_id, singer_id)
values(5, 4);

insert into genres_and_singers(genre_id, singer_id)
values(2, 5);

insert into genres_and_singers(genre_id, singer_id)
values(4, 7);

insert into genres_and_singers(genre_id, singer_id)
values(1, 8);

insert into genres_and_singers(genre_id, singer_id)
values(3, 8);

insert into genres_and_singers(genre_id, singer_id)
values(3, 2);

insert into genres_and_singers(genre_id, singer_id)
values(1, 1);

insert into genres_and_singers(genre_id, singer_id)
values(2, 7);

-- Наполняем коллекции и песни

insert into collections_and_songs(collection_id, song_id)
values(6, 1);

insert into collections_and_songs(collection_id, song_id)
values(8, 2);

insert into collections_and_songs(collection_id, song_id)
values(2, 3);

insert into collections_and_songs(collection_id, song_id)
values(6, 4);

insert into collections_and_songs(collection_id, song_id)
values(2, 5);

insert into collections_and_songs(collection_id, song_id)
values(3, 6);

insert into collections_and_songs(collection_id, song_id)
values(1, 7);

insert into collections_and_songs(collection_id, song_id)
values(8, 8);

insert into collections_and_songs(collection_id, song_id)
values(4, 9);

insert into collections_and_songs(collection_id, song_id)
values(7, 10);

insert into collections_and_songs(collection_id, song_id)
values(4, 11);

insert into collections_and_songs(collection_id, song_id)
values(1, 12);

insert into collections_and_songs(collection_id, song_id)
values(5, 13);

insert into collections_and_songs(collection_id, song_id)
values(3, 14);

insert into collections_and_songs(collection_id, song_id)
values(7, 15);

insert into collections_and_songs(collection_id, song_id)
values(8, 8);

insert into collections_and_songs(collection_id, song_id)
values(4, 15);
