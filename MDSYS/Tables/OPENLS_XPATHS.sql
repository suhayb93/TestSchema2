CREATE TABLE mdsys.openls_xpaths (
  "NAME" VARCHAR2(32 BYTE) NOT NULL,
  "VERSION" VARCHAR2(32 BYTE) NOT NULL,
  xpath VARCHAR2(1024 BYTE) NOT NULL,
  CONSTRAINT openls_paths_prim PRIMARY KEY ("NAME","VERSION")
);