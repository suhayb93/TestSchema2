CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_SymmetricDifference(
  g1 ST_Geometry,
  g2 ST_Geometry)
    RETURN ST_Geometry DETERMINISTIC IS
BEGIN
  RETURN g1.ST_SymmetricDifference(g2);
END OGC_SymmetricDifference;
/