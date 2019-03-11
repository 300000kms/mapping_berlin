/*---1st part----------------------------*/
/* import from csv to spatialite*/

select initspatialmetadata(1)


select addgeometrycolumn('UMBW', 'geometry', 4326, 'POINT' )



update "UMBW"
set geometry =
makepoint(cast( replace ("X_Koordinate", ',','.') as real) ,cast( replace (Y_Koordinate, ',','.') as real) ,4326)







