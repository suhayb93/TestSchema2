CREATE TABLE mdsys.sdo_maps_table (
  sdo_owner VARCHAR2(32 BYTE) DEFAULT sys_context('userenv', 'CURRENT_SCHEMA') NOT NULL,
  "NAME" VARCHAR2(32 BYTE) NOT NULL,
  description VARCHAR2(4000 BYTE),
  definition CLOB NOT NULL,
  CONSTRAINT unique_maps PRIMARY KEY (sdo_owner,"NAME")
);