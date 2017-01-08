CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_Disjoint(
  g1 ST_Geometry,
  g2 ST_Geometry)
    RETURN Integer IS
BEGIN
  RETURN g1.ST_Disjoint(g2);
END OGC_Disjoint;
/