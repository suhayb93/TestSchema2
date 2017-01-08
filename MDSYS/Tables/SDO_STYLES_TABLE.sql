CREATE TABLE mdsys.sdo_styles_table (
  sdo_owner VARCHAR2(32 BYTE) DEFAULT sys_context('userenv', 'CURRENT_SCHEMA') NOT NULL,
  "NAME" VARCHAR2(32 BYTE) NOT NULL,
  "TYPE" VARCHAR2(32 BYTE) NOT NULL,
  description VARCHAR2(4000 BYTE),
  definition CLOB NOT NULL,
  image BLOB,
  geometry mdsys.sdo_geometry,
  CONSTRAINT unique_styles PRIMARY KEY (sdo_owner,"NAME")
);