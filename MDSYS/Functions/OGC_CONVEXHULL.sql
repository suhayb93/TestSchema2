CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_ConvexHull(
  g ST_Geometry)
    RETURN ST_Geometry IS
BEGIN
  RETURN g.ST_ConvexHull();
END OGC_ConvexHull;
/