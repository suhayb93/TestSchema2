CREATE TABLE mdsys.sdo_network_feature (
  sdo_owner VARCHAR2(32 BYTE) DEFAULT sys_context('userenv','CURRENT_USER') NOT NULL,
  "NETWORK" VARCHAR2(24 BYTE) NOT NULL,
  feature_layer_name VARCHAR2(20 BYTE),
  feature_layer_id NUMBER NOT NULL,
  feature_layer_type NUMBER NOT NULL,
  feature_table_name VARCHAR2(20 BYTE),
  relation_table_name VARCHAR2(20 BYTE),
  hierarchy_table_name VARCHAR2(20 BYTE)
);