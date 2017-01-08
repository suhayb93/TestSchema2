CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.OGC_NumGeometries(
  g ST_GeomCollection)
    RETURN Integer IS
BEGIN
  RETURN g.ST_Geometries().LAST;
END OGC_NumGeometries;
/