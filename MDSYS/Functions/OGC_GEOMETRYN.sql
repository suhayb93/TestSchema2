CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_GeometryN(
  g ST_GeomCollection,
  n Integer)
    RETURN ST_Geometry IS
  arr ST_GEOMETRY_ARRAY;
BEGIN
  arr := g.ST_Geometries();
  RETURN arr(n);
END OGC_GeometryN;
/