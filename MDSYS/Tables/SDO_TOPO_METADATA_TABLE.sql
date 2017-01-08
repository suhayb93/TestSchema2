CREATE TABLE mdsys.sdo_topo_metadata_table (
  sdo_owner VARCHAR2(32 BYTE),
  topology VARCHAR2(20 BYTE),
  topology_id NUMBER,
  topo_geometry_layers mdsys.sdo_topo_geometry_layer_table,
  tolerance NUMBER,
  srid NUMBER,
  digits_right_of_decimal NUMBER DEFAULT 16
)
NESTED TABLE topo_geometry_layers STORE AS sdo_topo_layer_table;