CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_PointN(
  c ST_Curve,
  n Integer)
    RETURN ST_Point IS
BEGIN
  RETURN c.ST_PointN(n);
END OGC_PointN;
/