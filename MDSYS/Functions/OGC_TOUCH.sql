CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_Touch(
  g1 ST_Geometry,
  g2 ST_Geometry)
    RETURN Integer IS
  result VARCHAR2(128);
BEGIN
  RETURN g1.ST_Touch(g2);
END OGC_Touch;
/