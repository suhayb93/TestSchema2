CREATE TABLE mdsys.sdo_annotation_text_metadata (
  f_table_catalog VARCHAR2(1000 BYTE),
  f_table_schema VARCHAR2(32 BYTE) NOT NULL,
  f_table_name VARCHAR2(32 BYTE) NOT NULL,
  f_text_column VARCHAR2(1024 BYTE) NOT NULL,
  map_base_scale NUMBER,
  text_default_expression VARCHAR2(4000 BYTE),
  text_default_attributes VARCHAR2(4000 BYTE),
  CONSTRAINT unique_text_layers PRIMARY KEY (f_table_schema,f_table_name,f_text_column)
);