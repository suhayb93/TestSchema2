CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_GEOR_METADATA
                                                                      
AS OBJECT
(
   metaType     VARCHAR2(1024),
   metadata     SYS.XMLType) 
/