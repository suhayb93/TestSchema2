CREATE TABLE mdsys.sdo_network_histories (
  "OWNER" VARCHAR2(32 BYTE) DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_USER') NOT NULL,
  "NETWORK" VARCHAR2(24 BYTE) NOT NULL,
  node_history_table VARCHAR2(32 BYTE),
  link_history_table VARCHAR2(32 BYTE),
  node_trigger VARCHAR2(32 BYTE),
  link_trigger VARCHAR2(32 BYTE),
  CONSTRAINT network_histroy_constraint UNIQUE ("OWNER","NETWORK")
);