CREATE TABLE mdsys.md$relate (
  sdo_mask CHAR(9 BYTE) NOT NULL,
  sdo_relation VARCHAR2(30 BYTE),
  "DEFINER" VARCHAR2(30 BYTE),
  CONSTRAINT pk_sdo_mask PRIMARY KEY (sdo_mask)
);