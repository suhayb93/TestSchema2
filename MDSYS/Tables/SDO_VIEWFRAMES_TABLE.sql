CREATE TABLE mdsys.sdo_viewframes_table (
  sdo_owner VARCHAR2(32 BYTE) DEFAULT sys_context('userenv', 'CURRENT_USER') NOT NULL,
  "NAME" VARCHAR2(32 BYTE) NOT NULL,
  description VARCHAR2(4000 BYTE),
  scene_name VARCHAR2(32 BYTE) NOT NULL,
  definition CLOB NOT NULL,
  CONSTRAINT unique_viewframes PRIMARY KEY (sdo_owner,"NAME")
);