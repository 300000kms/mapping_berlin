
/*----2nd part------------------*/
/*common sql sentences*/

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


-- but this is not the same
SELECT ROWID, 'date', 'desc', 'id', 'lat', 'lng', 'owner', 'src', 'tags', 'timestamp', 'title', 'views', 'geometry'
FROM "flickr"
ORDER BY ROWID


/*order*/
/*order the results by a sinle column or multiple columns*/
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
/*when selecting a column add a new name to it*/
SELECT ROWID, "date" as d1,"date" as d2, "date" as d3
FROM "flickr"

/*typeof*/
/*discover wich is the real type of value that you have in your column, sometimes numbers are written as text!, and the you need to do a cast
*/

select typeof(lat), lat from flickr


/*cast as real / cast as int /cast as text */

select typeof(cast(lat as real)), cast(lat as real) from flickr


select typeof(cast(lat as int)), cast(lat as int) from flickr


select typeof(cast(lat as text)), cast(lat as text) from flickr


/*limit*/
/*extract a limit number of results*/

select * from flickr limit 10


/*where*/
/*is like a filter, where we say the condition of the cells we want to select
*/

--remember that in this examples we are selecting views and this is a text field, so perhaps we need to cast it as real

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









