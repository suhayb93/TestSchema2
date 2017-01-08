CREATE TABLE mdsys.sdo_tin_pc_sysdata_table (
  sdo_owner VARCHAR2(32 BYTE) NOT NULL,
  table_name VARCHAR2(32 BYTE) NOT NULL,
  column_name VARCHAR2(1024 BYTE) NOT NULL,
  dep_table_schema VARCHAR2(32 BYTE) NOT NULL,
  dep_table_name VARCHAR2(32 BYTE) NOT NULL,
  CONSTRAINT sdo_pk_tin_pc PRIMARY KEY (dep_table_schema,dep_table_name),
  CONSTRAINT sdo_unq_pcattr_tin_pc UNIQUE (sdo_owner,table_name,column_name,dep_table_schema,dep_table_name)
);