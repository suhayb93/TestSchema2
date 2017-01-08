CREATE TABLE mdsys.sdo_3dthemes_table (
  sdo_owner VARCHAR2(32 BYTE) DEFAULT sys_context('userenv', 'CURRENT_USER') NOT NULL,
  "NAME" VARCHAR2(32 BYTE) NOT NULL,
  description VARCHAR2(4000 BYTE),
  base_table VARCHAR2(64 BYTE) NOT NULL,
  theme_column VARCHAR2(2048 BYTE) NOT NULL,
  style_column VARCHAR2(32 BYTE) NOT NULL,
  theme_type VARCHAR2(32 BYTE),
  definition CLOB NOT NULL,
  CONSTRAINT unique_3dthemes PRIMARY KEY (sdo_owner,"NAME")
);