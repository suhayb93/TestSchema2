CREATE TABLE mdsys.ols_dir_businesses (
  business_id NUMBER NOT NULL,
  business_name VARCHAR2(128 BYTE) NOT NULL,
  chain_id NUMBER,
  description VARCHAR2(1024 BYTE),
  phone VARCHAR2(64 BYTE),
  country VARCHAR2(64 BYTE) NOT NULL,
  country_subdivision VARCHAR2(128 BYTE),
  country_secondary_subdiv VARCHAR2(128 BYTE),
  municipality VARCHAR2(128 BYTE),
  municipality_subdivision VARCHAR2(128 BYTE),
  postal_code VARCHAR2(32 BYTE) NOT NULL,
  postal_code_ext VARCHAR2(32 BYTE),
  street VARCHAR2(128 BYTE) NOT NULL,
  intersecting_street VARCHAR2(128 BYTE),
  building VARCHAR2(64 BYTE),
  "PARAMETERS" XMLTYPE,
  geom mdsys.sdo_geometry,
  PRIMARY KEY (business_id),
  CONSTRAINT olsfk3 FOREIGN KEY (chain_id) REFERENCES mdsys.ols_dir_business_chains (chain_id)
);