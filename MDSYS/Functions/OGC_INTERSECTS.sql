CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_Intersects(
  g1 ST_Geometry,
  g2 ST_Geometry)
    RETURN Integer DETERMINISTIC IS
BEGIN
  RETURN g1.ST_Intersects(g2);
END OGC_Intersects;
/