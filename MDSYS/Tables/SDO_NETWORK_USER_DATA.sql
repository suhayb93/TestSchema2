CREATE TABLE mdsys.sdo_network_user_data (
  sdo_owner VARCHAR2(32 BYTE) DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_USER') NOT NULL,
  "NETWORK" VARCHAR2(32 BYTE) NOT NULL,
  table_type VARCHAR2(12 BYTE) NOT NULL,
  data_name VARCHAR2(32 BYTE) NOT NULL,
  data_type VARCHAR2(12 BYTE) NOT NULL CONSTRAINT ud_data_type_con CHECK ( NLS_UPPER(data_type) IN ('VARCHAR2','INTEGER','NUMBER','SDO_GEOMETRY','DATE','TIMESTAMP','OBJECT')),
  data_length NUMBER(*,0),
  category_id NUMBER(*,0),
  CONSTRAINT unique_ndm_user_data UNIQUE (sdo_owner,"NETWORK",table_type,data_name)
);