CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_Centroid(
  g ST_Geometry)
    RETURN ST_Geometry IS
BEGIN
  RETURN g.ST_Centroid();
END OGC_Centroid;
/