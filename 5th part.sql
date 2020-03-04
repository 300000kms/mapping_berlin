
--ad a new column (type integer)
alter table taxi add column hour integer;

-- update de content of the column with the hour from the timestamp
update taxi set hour =  cast(strftime('%H', datetime(timestamp, 'unixepoch')) as int) 

-- build a new table as a grid aggregated
create table taxi_grid400 as
select count(), st_snaptogrid(geometry, 400) as geom  from taxi group by geom

-- recover geometry
select recovergeometrycolumn('taxi_grid400', 'geom', 25833, 'POINT')

-- index geometry
select createspatialindex('taxi_grid400', 'geom')

-- build a new table as a grid aggregated by hour
create table taxi_hour_grid400 as
select count() as count, hour, st_snaptogrid(geometry, 400) as geom  from taxi group by geom, hour

-- recover geometry
select recovergeometrycolumn('taxi_hour_grid400', 'geom', 25833, 'POINT')

-- index geometry
select createspatialindex('taxi_hour_grid400', 'geom')
                                      
-- do it in flickr
                                      
select count(), 
total(cast(views as int)) as total, 
avg(cast(views as int)) as avg, 
 st_snaptogrid(geometry, 400) as geom 
from flickr 
where title like '%berlin%'
group by geom
         
         
