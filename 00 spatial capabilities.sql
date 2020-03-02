select initspatialmetadata(1)

create table test as select * from flickr;

select RecoverGeometryColumn	('test', 'geometry', 25833, 'POINT')

select CreateSpatialIndex	('test', 'geometry')
