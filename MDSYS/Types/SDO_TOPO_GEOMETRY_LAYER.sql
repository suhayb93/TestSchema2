CREATE OR REPLACE NONEDITIONABLE Type mdsys.SDO_Topo_Geometry_Layer
                                                                      
as object (
  OWNER        varchar2(64),
  Table_Name   varchar2(64),
  Column_Name  varchar2(32),
  Layer_id     number,
  Layer_Type   VARCHAR2(10),
  Layer_Level  number,
  Child_Layer_id number) 
/