CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_Overlap(
  g1 ST_Geometry,
  g2 ST_Geometry)
    RETURN Integer IS
BEGIN
  RETURN g1.ST_Overlap(g2);
END OGC_Overlap;
/