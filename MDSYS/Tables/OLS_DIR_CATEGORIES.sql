CREATE TABLE mdsys.ols_dir_categories (
  category_id VARCHAR2(32 BYTE) NOT NULL,
  category_type_id NUMBER NOT NULL,
  category_name VARCHAR2(128 BYTE) NOT NULL,
  parent_id VARCHAR2(32 BYTE),
  "PARAMETERS" XMLTYPE,
  PRIMARY KEY (category_id,category_type_id),
  CONSTRAINT olsfk1 FOREIGN KEY (parent_id,category_type_id) REFERENCES mdsys.ols_dir_categories (category_id,category_type_id),
  CONSTRAINT olsfk2 FOREIGN KEY (category_type_id) REFERENCES mdsys.ols_dir_category_types (category_type_id)
);