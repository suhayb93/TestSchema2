CREATE TABLE mdsys.ols_dir_category_types (
  category_type_id NUMBER NOT NULL,
  category_type_name VARCHAR2(128 BYTE) NOT NULL,
  "PARAMETERS" XMLTYPE,
  PRIMARY KEY (category_type_id)
);