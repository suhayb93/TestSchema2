CREATE OR REPLACE NONEDITIONABLE type mdsys.SDO_TOPO_OBJECT_ARRAY
                                      
 as VARRAY (1000000) of SDO_TOPO_OBJECT
  Alter type SDO_TOPO_OBJECT_ARRAY modify limit 10000000
/