CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_NumInteriorRings(
  p ST_Polygon)
    RETURN Integer IS
BEGIN
  RETURN p.ST_InteriorRingsP().LAST;
END OGC_NumInteriorRings;
/