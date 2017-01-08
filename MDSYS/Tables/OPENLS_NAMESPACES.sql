CREATE TABLE mdsys.openls_namespaces (
  shortcut VARCHAR2(8 BYTE) NOT NULL,
  "VERSION" VARCHAR2(32 BYTE) NOT NULL,
  uri VARCHAR2(4000 BYTE),
  CONSTRAINT openls_na_prim PRIMARY KEY (shortcut,"VERSION")
);