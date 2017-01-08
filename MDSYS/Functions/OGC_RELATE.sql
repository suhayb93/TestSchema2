CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_Relate(
  g1            ST_Geometry,
  g2            ST_Geometry,
  PatternMatrix VARCHAR2)
    RETURN Integer DETERMINISTIC IS
BEGIN
  RETURN g1.ST_Relate(g2, PatternMatrix);
END OGC_Relate;
/