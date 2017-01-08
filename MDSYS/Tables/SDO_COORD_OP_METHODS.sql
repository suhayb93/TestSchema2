CREATE TABLE mdsys.sdo_coord_op_methods (
  coord_op_method_id NUMBER(10) NOT NULL CONSTRAINT coord_op_method_id_must_be_pos CHECK (COORD_OP_METHOD_ID > 0),
  coord_op_method_name VARCHAR2(50 BYTE),
  legacy_name VARCHAR2(50 BYTE),
  reverse_op NUMBER(1) NOT NULL CONSTRAINT reverse_op_1_or_0 CHECK (REVERSE_OP IN (0, 1)),
  information_source VARCHAR2(254 BYTE),
  data_source VARCHAR2(40 BYTE),
  is_implemented_forward NUMBER(1) NOT NULL CONSTRAINT is_impl_fw_1_or_0 CHECK (IS_IMPLEMENTED_FORWARD IN (0, 1)),
  is_implemented_reverse NUMBER(1) NOT NULL CONSTRAINT is_impl_rv_1_or_0 CHECK (IS_IMPLEMENTED_REVERSE IN (0, 1)),
  CONSTRAINT coord_op_method_prim PRIMARY KEY (coord_op_method_id)
);