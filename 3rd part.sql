/*-----3d part--------------*/
/*who is local and who is tourist*/

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

select f.*, o.diff from flickr as f, owners as o
where f.owner = o.owner

create table flickro as
select f.*, o.diff from flickr as f, owners as o
where f.owner = o.owner














