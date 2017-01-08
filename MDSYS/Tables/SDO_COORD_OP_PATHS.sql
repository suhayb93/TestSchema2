CREATE TABLE mdsys.sdo_coord_op_paths (
  concat_operation_id NUMBER(10) NOT NULL CONSTRAINT concat_op_id_must_be_pos CHECK (CONCAT_OPERATION_ID > 10),
  single_operation_id NUMBER(10),
  single_op_source_id NUMBER(10),
  single_op_target_id NUMBER(10),
  op_path_step NUMBER(5) CONSTRAINT op_path_step_must_be_pos CHECK (OP_PATH_STEP > 0),
  CONSTRAINT coord_op_path_foreign_source FOREIGN KEY (single_op_source_id) REFERENCES mdsys.sdo_coord_ref_sys (srid),
  CONSTRAINT coord_op_path_foreign_target FOREIGN KEY (single_op_target_id) REFERENCES mdsys.sdo_coord_ref_sys (srid)
);