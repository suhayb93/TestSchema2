CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_REGION
                                                                      
AS OBJECT (
        id number,
        geometry mdsys.sdo_geometry) 
/