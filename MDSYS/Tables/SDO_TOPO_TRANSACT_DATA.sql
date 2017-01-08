CREATE GLOBAL TEMPORARY TABLE mdsys.sdo_topo_transact_data (
  topo_sequence NUMBER,
  topology_id VARCHAR2(20 BYTE),
  topo_id NUMBER,
  topo_type NUMBER,
  topo_op VARCHAR2(3 BYTE),
  parent_id NUMBER
)
ON COMMIT DELETE ROWS;