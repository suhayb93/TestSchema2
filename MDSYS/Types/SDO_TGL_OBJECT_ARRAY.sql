CREATE OR REPLACE NONEDITIONABLE type mdsys.SDO_TGL_OBJECT_ARRAY
                                      
 as VARRAY (1000000) of SDO_TGL_OBJECT
  alter type SDO_TGL_OBJECT_ARRAY modify limit 10000000 cascade
/