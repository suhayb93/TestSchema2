CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_Envelope(
  g ST_Geometry)
    RETURN ST_Geometry IS
BEGIN
  RETURN g.ST_Envelope();
END OGC_Envelope;
/