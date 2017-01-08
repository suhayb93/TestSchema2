CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_GEORASTER
                                                                                  
      AS OBJECT
      (
        rasterType        NUMBER,
        spatialExtent     mdsys.SDO_GEOMETRY,
        rasterDataTable   VARCHAR2(32),
        rasterID          NUMBER,
        metadata          SYS.XMLType
      )
/