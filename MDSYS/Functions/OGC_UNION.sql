CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_Union(
  g1 ST_Geometry,
  g2 ST_Geometry)
    RETURN ST_Geometry IS
BEGIN
  RETURN g1.ST_Union(g2);
END OGC_Union;
/