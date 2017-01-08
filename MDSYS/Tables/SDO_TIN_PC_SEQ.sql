CREATE TABLE mdsys.sdo_tin_pc_seq (
  sdo_owner VARCHAR2(32 BYTE) NOT NULL,
  table_name VARCHAR2(32 BYTE) NOT NULL,
  cur_obj_id NUMBER,
  CONSTRAINT sdo_pk_seq_tin_pc PRIMARY KEY (sdo_owner,table_name)
);