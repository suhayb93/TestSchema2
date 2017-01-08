CREATE TABLE mdsys.sdo_geor_xmlschema_table (
  "ID" NUMBER NOT NULL,
  georasterformat VARCHAR2(1024 BYTE),
  "XMLSCHEMA" CLOB,
  PRIMARY KEY ("ID"),
  UNIQUE (georasterformat)
);