CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_IsRing(
  c ST_Curve)
    RETURN Integer DETERMINISTIC IS
BEGIN
  RETURN c.ST_IsRing();
END OGC_IsRing;
/