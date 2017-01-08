CREATE TABLE mdsys.sdo_themes_table (
  sdo_owner VARCHAR2(32 BYTE) DEFAULT sys_context('userenv', 'CURRENT_SCHEMA') NOT NULL,
  "NAME" VARCHAR2(32 BYTE) NOT NULL,
  description VARCHAR2(4000 BYTE),
  base_table VARCHAR2(64 BYTE) NOT NULL,
  geometry_column VARCHAR2(2048 BYTE) NOT NULL,
  styling_rules CLOB NOT NULL,
  CONSTRAINT unique_themes PRIMARY KEY (sdo_owner,"NAME")
);