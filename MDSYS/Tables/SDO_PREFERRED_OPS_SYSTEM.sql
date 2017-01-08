CREATE TABLE mdsys.sdo_preferred_ops_system (
  source_srid NUMBER(10) NOT NULL,
  coord_op_id NUMBER(10) NOT NULL,
  target_srid NUMBER(10) NOT NULL,
  CONSTRAINT preferred_ops_sys_prim PRIMARY KEY (source_srid,target_srid)
);