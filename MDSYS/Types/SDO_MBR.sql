CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_MBR
                                                                      
AS OBJECT (
        LOWER_LEFT mdsys.SDO_VPOINT_TYPE,
        UPPER_RIGHT mdsys.SDO_VPOINT_TYPE) 
/