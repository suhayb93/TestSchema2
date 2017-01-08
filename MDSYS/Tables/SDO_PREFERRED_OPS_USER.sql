CREATE TABLE mdsys.sdo_preferred_ops_user (
  use_case VARCHAR2(32 BYTE) NOT NULL,
  source_srid NUMBER(10) NOT NULL,
  coord_op_id NUMBER(10) NOT NULL,
  target_srid NUMBER(10) NOT NULL,
  CONSTRAINT preferred_ops_use_prim PRIMARY KEY (use_case,source_srid,target_srid)
);