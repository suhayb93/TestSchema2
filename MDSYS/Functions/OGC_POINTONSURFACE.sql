CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_PointOnSurface(
  s ST_Geometry)
    RETURN ST_Point DETERMINISTIC IS
BEGIN
  IF(nls_upper(OGC_GeometryType(s)) IN ('POLYGON')) THEN
    RETURN TREAT(s AS ST_Surface).ST_PointOnSurface();
  END IF;
  IF(nls_upper(OGC_GeometryType(s)) IN ('MULTIPOLYGON')) THEN
    RETURN TREAT(s AS ST_MultiSurface).ST_PointOnSurface();
  END IF;
  RETURN NULL;
END OGC_PointOnSurface;
/