/*-----3d part--------------*/
/*who is local and who is tourist*/

/*group by*/

select count() from flickr

select count() , owner from flickr group by owner 

select max(cast(timestamp as real)), min(cast(timestamp as real)) from flickr

select max(cast(timestamp as real)), min(cast(timestamp as real)), owner from flickr group by owner


select count() as c, total(cast(views as int)), owner from flickr group by owner order by c desc

select count() as c, total(cast(views as int)), owner from flickr group by owner order by c desc

select max(cast(timestamp as real)), min(cast(timestamp as real)), owner from flickr group by owner

select avg(cast(views as real)) from flickr

select max(cast(timestamp as real)) , min(cast(timestamp as real)), owner from flickr group by owner

select max(cast(timestamp as real)) - min(cast(timestamp as real)), owner from flickr group by owner

select (max(cast(timestamp as real)) - min(cast(timestamp as real)))/60/60/24, owner from flickr group by owner



select max(cast(timestamp as real)) as max, min(cast(timestamp as real)) as min, max(cast(timestamp as real)) - min(cast(timestamp as real)) as diff, owner from flickr group by owner


/*create table*/

create table owners as
select max(cast(timestamp as real)) as max, min(cast(timestamp as real)) as min, max(cast(timestamp as real)) - min(cast(timestamp as real)) as diff, owner from flickr group by owner


select f.*, o.* from flickr as f, owner as o
where f.owner = o.owner

select f.*, o.diff from flickr as f, owners as o
where f.owner = o.owner

create table flickro as
select f.*, o.diff from flickr as f, owners as o
where f.owner = o.owner


create table flickr_diff as
select 
f.*, o.diff/60/60/24 as diff_day
from flickr as f, owners as o
where f.owner = o.owner

select RecoverGeometryColumn	('flickr_diff', 'geometry', 25833, 'POINT')

select CreateSpatialIndex('flickr_diff', 'geometry')













