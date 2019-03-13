/*-------------------------------*/
/*working with google places*/

/*get all the places that have some activity monday at 0:00*/
SELECT ROWID, "address_formated", "id", "lat", "lon", "name",
cast("ln00" as real)+ cast("mt00" as real)+cast("mc00" as real)+ cast("jv00" as real)+ cast("vi00" as real)+
cast("sb00" as real)+ cast("dm00" as real)
FROM "schedule"
where "ln0" != '00'



/*create  a new table with the sumatory of the values of the 0:00 hour of every day of the week*/

create table test as 

SELECT ROWID, "address_formated", "id", "lat", "lon", "name",geometry,
coalesce(cast("ln00" as real), 0)+ coalesce(cast("mt00" as real),0)+coalesce(cast("mc00" as real),0)+ coalesce(cast("jv00" as real),0)
+ coalesce(cast("vi00" as real),0)+
coalesce(cast("sb00" as real),0)+ coalesce(cast("dm00" as real),0) as activity
FROM "schedule"



/*-------------------------------*/
/*-get the centroid of a geometry*/
/*- and get the area-*/
/*- and transform the projection-*/

create table test as
SELECT ROWID, "ogc_fid", 
"osm_id", "lastchange", "geomtype",
 "aggtype", "type", "name", "name_en", 
"name_fr", "name_es", "name_de", "int_name",
 "label", "tags", "website", "wikipedia", "phone",
 "opening_hours", "cuisine", "access", "brand",
 "tower_type", 
st_centroid("GEOMETRY") as geometry,
st_area(st_transform(geometry, 25833)) as area
FROM "poi_a"
ORDER BY ROWID


/*-------------------------------*/
/*--GRIDS----------*/

/*- a grid without aggregate the data -*/
create table grid1 as
select st_snaptogrid(geometry,400) as geom from flickro

/*- a grid aggregationg the data -*/
create table grid2 as
select 
count() as c,
total(cast(views as real)) as views,
st_snaptogrid(geometry,400) as geom 
from flickro
group by geom


