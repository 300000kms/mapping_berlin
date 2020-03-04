create table streets_a as 
select 
st_length(geometry) length ,
ST_NPoints(simplify(geometry, 10)) npoints, 
degrees(st_azimuth(startpoint(geometry),
endpoint(geometry) ) ) angle, 
(case when degrees(st_azimuth(startpoint(geometry), endpoint(geometry) ) ) >180
 then degrees(st_azimuth(startpoint(geometry), endpoint(geometry) ) ) -180 
else degrees(st_azimuth(startpoint(geometry), endpoint(geometry) ) ) end) angle_s,
geometry from streets
