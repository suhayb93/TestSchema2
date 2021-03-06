CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_IsClosed(
  g ST_Geometry)
    RETURN Integer DETERMINISTIC IS
BEGIN
  IF(nls_upper(OGC_GeometryType(g)) IN ('LINESTRING', 'ST_LINESTRING', 'ST_CIRCULARSTRING', 'ST_COMPOUNDCURVE')) THEN
    RETURN TREAT(g AS ST_Curve).ST_IsClosed();
  END IF;
  IF(nls_upper(OGC_GeometryType(g)) IN ('MULTILINESTRING', 'ST_MULTILINESTRING', 'ST_MULTICURVE')) THEN
    RETURN TREAT(g AS ST_MultiCurve).ST_IsClosed();
  END IF;
  RETURN NULL;
END OGC_IsClosed;
/