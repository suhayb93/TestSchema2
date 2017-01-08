CREATE TABLE mdsys.sdo_geor_plugin_registry (
  plugin_name VARCHAR2(32 BYTE) NOT NULL,
  plugin_type VARCHAR2(32 BYTE),
  plugin VARCHAR2(32 BYTE),
  company_name VARCHAR2(1024 BYTE),
  description VARCHAR2(1024 BYTE),
  PRIMARY KEY (plugin_name)
);