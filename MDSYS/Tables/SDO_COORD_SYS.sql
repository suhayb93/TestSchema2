CREATE TABLE mdsys.sdo_coord_sys (
  coord_sys_id NUMBER(10) NOT NULL CONSTRAINT coord_sys_id_must_be_pos CHECK (COORD_SYS_ID > 0),
  coord_sys_name VARCHAR2(254 BYTE) NOT NULL,
  coord_sys_type VARCHAR2(24 BYTE),
  "DIMENSION" NUMBER(5),
  information_source VARCHAR2(254 BYTE),
  data_source VARCHAR2(50 BYTE),
  CONSTRAINT coordinate_system_prim PRIMARY KEY (coord_sys_id),
  UNIQUE (coord_sys_name)
);