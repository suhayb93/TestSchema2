CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_EndPoint(
  c ST_Curve)
    RETURN ST_Point IS
BEGIN
  RETURN c.ST_EndPoint();
END OGC_EndPoint;
/