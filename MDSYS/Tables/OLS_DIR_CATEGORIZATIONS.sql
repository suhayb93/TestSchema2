CREATE TABLE mdsys.ols_dir_categorizations (
  business_id NUMBER NOT NULL,
  category_id VARCHAR2(32 BYTE) NOT NULL,
  category_type_id NUMBER NOT NULL,
  categorization_type VARCHAR2(8 BYTE) DEFAULT 'EXPLICIT' CONSTRAINT cat_type_constr CHECK (CATEGORIZATION_TYPE IN ('EXPLICIT', 'IMPLICIT')),
  user_specific_categ VARCHAR2(32 BYTE),
  "PARAMETERS" XMLTYPE,
  CONSTRAINT olspk1 PRIMARY KEY (business_id,category_id,category_type_id),
  CONSTRAINT olsfk5 FOREIGN KEY (category_id,category_type_id) REFERENCES mdsys.ols_dir_categories (category_id,category_type_id)
);