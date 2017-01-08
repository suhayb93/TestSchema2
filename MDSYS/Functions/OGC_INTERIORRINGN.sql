CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_InteriorRingN(
  p ST_Polygon,
  n Integer)
    RETURN ST_LineString IS
  arr ST_LineString_Array;
BEGIN
  arr := p.ST_InteriorRingsP();
  RETURN arr(n);
END OGC_InteriorRingN;
/