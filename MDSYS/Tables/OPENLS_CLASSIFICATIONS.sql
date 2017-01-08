CREATE TABLE mdsys.openls_classifications (
  criterion VARCHAR2(32 BYTE) NOT NULL,
  classification VARCHAR2(32 BYTE) NOT NULL,
  "VERSION" VARCHAR2(32 BYTE) NOT NULL,
  characteristic_xpath VARCHAR2(1024 BYTE) NOT NULL,
  CONSTRAINT openls_cl_prim PRIMARY KEY (criterion,classification,"VERSION")
);