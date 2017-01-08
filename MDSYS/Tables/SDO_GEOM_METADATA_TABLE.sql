CREATE TABLE mdsys.sdo_geom_metadata_table (
  sdo_owner VARCHAR2(32 BYTE) NOT NULL,
  sdo_table_name VARCHAR2(32 BYTE) NOT NULL,
  sdo_column_name VARCHAR2(1024 BYTE) NOT NULL,
  sdo_diminfo mdsys.sdo_dim_array,
  sdo_srid NUMBER,
  CONSTRAINT unique_layers PRIMARY KEY (sdo_owner,sdo_table_name,sdo_column_name)
);