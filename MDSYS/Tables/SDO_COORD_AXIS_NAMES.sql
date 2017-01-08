CREATE TABLE mdsys.sdo_coord_axis_names (
  coord_axis_name_id NUMBER(10) NOT NULL,
  coord_axis_name VARCHAR2(80 BYTE) NOT NULL,
  CONSTRAINT coord_axis_name_prim PRIMARY KEY (coord_axis_name_id),
  UNIQUE (coord_axis_name)
);