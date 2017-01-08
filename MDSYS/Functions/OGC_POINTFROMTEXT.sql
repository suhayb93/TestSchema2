CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_PointFromText(
  wkt   IN VARCHAR2,
  srid  IN INTEGER DEFAULT NULL)
    RETURN ST_Point IS
BEGIN
  RETURN TREAT(ST_GEOMETRY.FROM_WKT(wkt, srid) AS ST_Point);
END OGC_PointFromText;
/