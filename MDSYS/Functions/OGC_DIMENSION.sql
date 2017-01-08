CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_Dimension(
  g ST_Geometry)
    RETURN Integer IS
BEGIN
  RETURN g.ST_CoordDim();
END OGC_Dimension;
/