CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_PolygonFromText(
  wkt   IN VARCHAR2,
  srid  IN INTEGER DEFAULT NULL)
    RETURN ST_POLYGON IS
BEGIN
  RETURN TREAT(ST_GEOMETRY.FROM_WKT(wkt, srid) AS ST_POLYGON);
END OGC_PolygonFromText;
/