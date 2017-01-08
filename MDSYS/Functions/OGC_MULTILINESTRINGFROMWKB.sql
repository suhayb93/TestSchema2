CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_MultiLineStringFromWKB(
  wkb   IN BLOB,
  srid  IN INTEGER DEFAULT NULL)
    RETURN ST_MultiLineString IS
BEGIN
  RETURN TREAT(ST_GEOMETRY.FROM_WKB(wkb, srid) AS ST_MultiLineString);
END OGC_MultiLineStringFromWKB;
/