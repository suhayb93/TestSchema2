CREATE GLOBAL TEMPORARY TABLE mdsys.sdo_topo_relation_data (
  tg_layer_id NUMBER,
  tg_id NUMBER,
  topo_id NUMBER,
  topo_type NUMBER,
  topo_attribute VARCHAR2(100 BYTE)
)
ON COMMIT DELETE ROWS;