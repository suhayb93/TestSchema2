CREATE TABLE mdsys.sdo_coord_op_param_use (
  coord_op_method_id NUMBER(10) NOT NULL,
  parameter_id NUMBER(10),
  legacy_param_name VARCHAR2(80 BYTE),
  sort_order NUMBER(5) NOT NULL,
  param_sign_reversal VARCHAR2(3 BYTE),
  CONSTRAINT coord_op_para_use_prim PRIMARY KEY (coord_op_method_id,sort_order),
  CONSTRAINT coord_op_para_use_foreign_meth FOREIGN KEY (coord_op_method_id) REFERENCES mdsys.sdo_coord_op_methods (coord_op_method_id),
  CONSTRAINT coord_op_para_use_foreign_para FOREIGN KEY (parameter_id) REFERENCES mdsys.sdo_coord_op_params (parameter_id)
);