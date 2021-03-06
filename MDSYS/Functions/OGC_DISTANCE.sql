CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_Distance(
  g1 ST_Geometry,
  g2 ST_Geometry)
    RETURN NUMBER DETERMINISTIC IS
BEGIN
  RETURN g1.ST_Distance(g2);
END OGC_Distance;
/