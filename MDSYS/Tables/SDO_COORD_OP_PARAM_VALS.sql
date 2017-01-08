CREATE TABLE mdsys.sdo_coord_op_param_vals (
  coord_op_id NUMBER(10) NOT NULL,
  coord_op_method_id NUMBER(10),
  parameter_id NUMBER(10) NOT NULL,
  parameter_value FLOAT(49),
  param_value_file_ref VARCHAR2(254 BYTE),
  param_value_file CLOB,
  param_value_xml XMLTYPE,
  uom_id NUMBER(10),
  CONSTRAINT coord_op_para_val_prim PRIMARY KEY (coord_op_id,parameter_id),
  CONSTRAINT coord_op_para_val_foreign_meth FOREIGN KEY (coord_op_method_id) REFERENCES mdsys.sdo_coord_op_methods (coord_op_method_id),
  CONSTRAINT coord_op_para_val_foreign_op FOREIGN KEY (coord_op_id) REFERENCES mdsys.sdo_coord_ops (coord_op_id),
  CONSTRAINT coord_op_para_val_foreign_para FOREIGN KEY (parameter_id) REFERENCES mdsys.sdo_coord_op_params (parameter_id),
  CONSTRAINT coord_op_para_val_foreign_uom FOREIGN KEY (uom_id) REFERENCES mdsys.sdo_units_of_measure (uom_id)
);