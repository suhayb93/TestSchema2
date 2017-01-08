CREATE TABLE mdsys.sdo_animations_table (
  sdo_owner VARCHAR2(32 BYTE) DEFAULT sys_context('userenv', 'CURRENT_USER') NOT NULL,
  "NAME" VARCHAR2(32 BYTE) NOT NULL,
  description VARCHAR2(4000 BYTE),
  definition CLOB NOT NULL,
  CONSTRAINT unique_animations PRIMARY KEY (sdo_owner,"NAME")
);