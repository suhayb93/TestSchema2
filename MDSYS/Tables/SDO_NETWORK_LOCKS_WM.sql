CREATE TABLE mdsys.sdo_network_locks_wm (
  sdo_owner VARCHAR2(32 BYTE) DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_USER') NOT NULL,
  lock_id NUMBER NOT NULL,
  "NETWORK" VARCHAR2(24 BYTE),
  workspace VARCHAR2(32 BYTE),
  original_node_filter VARCHAR2(200 BYTE),
  original_link_filter VARCHAR2(200 BYTE),
  original_path_filter VARCHAR2(200 BYTE),
  adjusted_node_filter VARCHAR2(200 BYTE),
  adjusted_link_filter VARCHAR2(200 BYTE),
  adjusted_path_filter VARCHAR2(200 BYTE),
  CONSTRAINT unique_ndm_locks UNIQUE (sdo_owner,lock_id)
);