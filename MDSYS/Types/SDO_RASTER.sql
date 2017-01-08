CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_RASTER
                                                                      
AS OBJECT
(
   rasterID          NUMBER,
   pyramidLevel      NUMBER,
   bandBlockNumber   NUMBER,
   rowBlockNumber    NUMBER,
   columnBlockNumber NUMBER,
   blockMBR          mdsys.SDO_GEOMETRY,
   rasterBlock       BLOB) 
/