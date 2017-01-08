CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_ExteriorRing(
  p ST_Polygon)
    RETURN ST_LineString IS
BEGIN
  RETURN p.ST_ExteriorRing();
END OGC_ExteriorRing;
/