-- Количество исполнителей в каждом жанре.
select genre_id , count(singer_id) from genres_and_singers
group by genre_id ;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
select s.name, release_date from songs s
left join albums a on s.id_of_album  = a.id
where release_date between '2019-01-01' and '2020-12-31';

-- Средняя продолжительность треков по каждому альбому.
select a.name, avg(time) from albums a
left join songs s on a.id = s.id_of_album 
group by a.name;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
select distinct nickname from albums_and_singers aas 
left join albums a on aas.album_id=a.id 
left join singers s on aas.singer_id=s.id 
where release_date not between '2019-12-31' and '2021-01-01'

-- Названия сборников, в которых присутствует конкретный исполнитель 
select distinct c.name, s2.nickname from collections c
left join collections_and_songs cas on cas.collection_id = c.id 
left join songs s on cas.song_id = s.id 
left join albums a on s.id_of_album = a.id 
left join albums_and_singers aas on a.id = aas.album_id 
left join singers s2 on aas.singer_id = s2.id 
where s2.nickname = 'Halsey';

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра. 
select a.name from albums a 
left join albums_and_singers aas on aas.album_id = a.id 
left join singers s on aas.singer_id = s.id 
left join genres_and_singers gas on s.id = gas.singer_id 
left join genres g on gas.genre_id = g.id 
group by a.name
having count(distinct g.name)>1;

-- Наименования треков, которые не входят в сборники.
select s.name from songs s 
left join collections_and_songs cas on cas.song_id = s.id 
left join collections c on cas.song_id = c.id
where c.name is null

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько. 
select nickname, s2.time from singers s 
left join albums_and_singers aas on s.id = aas.singer_id 
left join songs s2 on aas.album_id = s2.id_of_album 
where s2.time = (select s4.time from singers s3
left join albums_and_singers aas2 on s3.id = aas2.singer_id 
left join songs s4 on aas2.album_id = s4.id_of_album 
order by s4.time
limit 1)

-- Названия альбомов, содержащих наименьшее количество треков.
select a.name, count(a.name) from albums a 
left join songs s on a.id = s.id_of_album 
group by a.name 
having count(a.name) = (select count(a2.name) from albums a2 
left join songs s2 on a2.id = s2.id_of_album 
group by a2.name 
order by count(a2.name) 
limit 1)
