CREATE TABLE mdsys.sdo_coord_axes (
  coord_sys_id NUMBER(10) NOT NULL,
  coord_axis_name_id NUMBER(10),
  coord_axis_orientation VARCHAR2(24 BYTE),
  coord_axis_abbreviation VARCHAR2(24 BYTE),
  uom_id NUMBER(10),
  "ORDER" NUMBER(5) NOT NULL,
  CONSTRAINT coord_axis_prim PRIMARY KEY (coord_sys_id,"ORDER"),
  CONSTRAINT coord_axis_foreign_axis FOREIGN KEY (coord_axis_name_id) REFERENCES mdsys.sdo_coord_axis_names (coord_axis_name_id),
  CONSTRAINT coord_axis_foreign_cs FOREIGN KEY (coord_sys_id) REFERENCES mdsys.sdo_coord_sys (coord_sys_id),
  CONSTRAINT coord_axis_foreign_uom FOREIGN KEY (uom_id) REFERENCES mdsys.sdo_units_of_measure (uom_id)
);