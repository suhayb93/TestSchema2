CREATE TABLE mdsys.sdo_lrs_metadata_table (
  sdo_owner VARCHAR2(32 BYTE) NOT NULL,
  sdo_table_name VARCHAR2(32 BYTE) NOT NULL,
  sdo_column_name VARCHAR2(32 BYTE) NOT NULL,
  sdo_dim_pos NUMBER NOT NULL CHECK (SDO_DIM_POS = 3 OR SDO_DIM_POS = 4),
  sdo_dim_unit VARCHAR2(32 BYTE),
  CONSTRAINT unique_tables PRIMARY KEY (sdo_owner,sdo_table_name,sdo_column_name)
);