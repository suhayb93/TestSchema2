CREATE GLOBAL TEMPORARY TABLE mdsys.sdo_topo_data$ (
  topology VARCHAR2(20 BYTE),
  tg_layer_id NUMBER,
  tg_id NUMBER,
  topo_id NUMBER,
  topo_type NUMBER
)
ON COMMIT DELETE ROWS;