CREATE TABLE mdsys.sdo_geor_sysdata_table (
  sdo_owner VARCHAR2(32 BYTE) NOT NULL,
  georaster_table_name VARCHAR2(32 BYTE) NOT NULL,
  georaster_column_name VARCHAR2(1024 BYTE) NOT NULL,
  geor_metadata_column_name VARCHAR2(1024 BYTE),
  rdt_table_name VARCHAR2(32 BYTE) NOT NULL,
  raster_id NUMBER NOT NULL,
  other_table_names mdsys.sdo_string_array,
  CONSTRAINT unique_georasters PRIMARY KEY (sdo_owner,rdt_table_name,raster_id)
);