/*---1st part----------------------------*/
/* import from csv to spatialite*/
/*
-open spatialite gui
-create a new databes (remember deatach a previsous database connection)
-save as with name
- import the csv UMBW.csv  (take care with the delimitators and with de encoding, perhaps you need to explore before your file with a notepad)
and then continue the tutorial
 
*/

select initspatialmetadata(1)


select addgeometrycolumn('UMBW', 'geometry', 4326, 'POINT' )



update "UMBW"
set geometry =
makepoint(cast( replace ("X_Koordinate", ',','.') as real) ,cast( replace (Y_Koordinate, ',','.') as real) ,4326)







