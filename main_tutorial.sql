

/*select*/

SELECT ROWID, "date", "desc", "id", "lat", "lng", "owner", "src", "tags", "timestamp", "title", "views", "geometry"
FROM "flickr"
ORDER BY ROWID

--this is the same
SELECT ROWID, date, desc, id, lat, lng, owner, src, tags, timestamp, title, views, geometry
FROM "FLICKR"
ORDER BY ROWID


SELECT * FROM "flickr"


SELECT ROWID, * FROM "flickr"


SELECT rowid, * FROM "flickr"


--this is not the same
SELECT ROWID, 'date', 'desc', 'id', 'lat', 'lng', 'owner', 'src', 'tags', 'timestamp', 'title', 'views', 'geometry'
FROM "flickr"
ORDER BY ROWID


/*order*/

SELECT ROWID, "date","date", "date"
FROM "flickr"
ORDER BY date desc


SELECT ROWID, "date","date", "date"
FROM "flickr"
ORDER BY date asc


SELECT ROWID,  "views","lat","lng"
FROM "flickr"
ORDER BY views, lat, lng


/*as*/

SELECT ROWID, "date" as d1,"date" as d2, "date" as d3
FROM "flickr"

/*typeof*/

select typeof(lat), lat from flickr


/*cast as real / cast as int /cast as text */

select typeof(cast(lat as real)), cast(lat as real) from flickr


select typeof(cast(lat as int)), cast(lat as int) from flickr


select typeof(cast(lat as text)), cast(lat as text) from flickr


/*limit*/

select * from flickr limit 10


/*where*/

select * from flickr where views > 50

select * from flickr where views >= 50

select * from flickr where views > 50

select * from flickr where views <= 50

select * from flickr where views = 50


select * from flickr 
where cast(views as real) > 50 
and cast(views as real) < 50000


select title from flickr where title = 'berlin'

select title from flickr where tags like 'berlin'

select title from flickr where tags like '%berlin%'

/*group by*/

select count() from flickr

select count() , owner from flickr group by owner 

select max(cast(timestamp as real)), min(cast(timestamp as real)) from flickr

select max(cast(timestamp as real)), min(cast(timestamp as real)), owner from flickr group by owner


select max(cast(timestamp as real)) as max, min(cast(timestamp as real)) as min, max(cast(timestamp as real)) - min(cast(timestamp as real)) as diff, owner from flickr group by owner


/*create table*/

create table owners as
select max(cast(timestamp as real)) as max, min(cast(timestamp as real)) as min, max(cast(timestamp as real)) - min(cast(timestamp as real)) as diff, owner from flickr group by owner


select f.*, o.* from flickr as f, owner as o
where f.owner = o.owner















