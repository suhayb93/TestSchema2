CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_Boundary(
  g ST_Geometry)
    RETURN ST_Geometry IS
BEGIN
  RETURN g.ST_Boundary();
END OGC_Boundary;
/