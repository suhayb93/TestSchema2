CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_st_syn_create
  BEFORE CREATE ON DATABASE
 declare
 error boolean;
  st_syn_detected EXCEPTION;
   PRAGMA EXCEPTION_INIT(st_syn_detected, -995);
 BEGIN
   if((sys.dbms_standard.dictionary_obj_type!='SYNONYM')or(sys.dbms_standard.dictionary_obj_owner!='PUBLIC'))
   then
     return;
   end if;
   error :=
      CASE sys.dbms_standard.dictionary_obj_name
         WHEN 'ST_GEOMETRY' THEN TRUE
         WHEN 'ST_SURFACE' THEN TRUE
         WHEN 'ST_POLYGON' THEN TRUE
         WHEN 'ST_POINT' THEN TRUE
         WHEN 'ST_MULTISURFACE' THEN TRUE
         WHEN 'ST_MULTIPOINT' THEN TRUE
         WHEN 'ST_MULTILINESTRING' THEN TRUE
         WHEN 'ST_MULTICURVE' THEN TRUE
         WHEN 'ST_LINESTRING' THEN TRUE
         WHEN 'ST_GEOMCOLLECTION' THEN TRUE
         WHEN 'ST_CURVE' THEN TRUE
         WHEN 'ST_CURVEPOLYGON' THEN TRUE
         WHEN 'ST_COMPOUNDCURVE' THEN TRUE
         WHEN 'ST_CIRCULARSTRING' THEN TRUE
         WHEN 'ST_INTERSECTS' THEN TRUE
         WHEN 'ST_RELATE' THEN TRUE
         WHEN 'ST_TOUCH' THEN TRUE
         WHEN 'ST_CONTAINS' THEN TRUE
         WHEN 'ST_COVERS' THEN TRUE
         WHEN 'ST_COVEREDBY' THEN TRUE
         WHEN 'ST_INSIDE' THEN TRUE
         WHEN 'ST_OVERLAP' THEN TRUE
         WHEN 'ST_OVERLAPS' THEN TRUE
         WHEN 'ST_EQUAL' THEN TRUE
         WHEN 'ST_OVERLAPBDYDISJOINT' THEN TRUE
         WHEN 'ST_OVERLAPBDYINTERSECT' THEN TRUE
         WHEN 'ST_GEOMETRY_ARRAY' THEN TRUE
         WHEN 'ST_POINT_ARRAY' THEN TRUE
         WHEN 'ST_CURVE_ARRAY' THEN TRUE
         WHEN 'ST_SURFACE_ARRAY' THEN TRUE
         WHEN 'ST_LINESTRING_ARRAY' THEN TRUE
         WHEN 'ST_POLYGON_ARRAY' THEN TRUE
         ELSE FALSE
      END;

   if(error) then
     raise st_syn_detected;

   end if;
 END;
/