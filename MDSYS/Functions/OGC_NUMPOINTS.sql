CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_NumPoints(
  c ST_Curve)
    RETURN Integer IS
BEGIN
  RETURN c.ST_NumPoints();
END OGC_NumPoints;
/