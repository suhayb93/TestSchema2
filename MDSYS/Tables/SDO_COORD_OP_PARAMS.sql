CREATE TABLE mdsys.sdo_coord_op_params (
  parameter_id NUMBER(10) NOT NULL CONSTRAINT parameter_id_must_be_pos CHECK (PARAMETER_ID > 0),
  parameter_name VARCHAR2(80 BYTE),
  information_source VARCHAR2(254 BYTE),
  data_source VARCHAR2(40 BYTE),
  unit_of_meas_type VARCHAR2(50 BYTE),
  CONSTRAINT coord_op_para_prim PRIMARY KEY (parameter_id)
);