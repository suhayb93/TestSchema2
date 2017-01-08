CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_Cross(
  g1 ST_Geometry,
  g2 ST_Geometry)
    RETURN Integer DETERMINISTIC IS
BEGIN
  RETURN g1.ST_Cross(g2);
END OGC_Cross;
/