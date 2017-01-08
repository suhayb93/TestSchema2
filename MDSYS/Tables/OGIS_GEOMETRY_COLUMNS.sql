CREATE TABLE mdsys.ogis_geometry_columns (
  f_table_schema VARCHAR2(64 BYTE),
  f_table_name VARCHAR2(64 BYTE),
  f_geometry_column VARCHAR2(64 BYTE),
  g_table_schema VARCHAR2(64 BYTE),
  g_table_name VARCHAR2(64 BYTE),
  storage_type NUMBER,
  geometry_type NUMBER,
  coord_dimension NUMBER,
  max_ppr NUMBER,
  srid NUMBER,
  CONSTRAINT fk_srid FOREIGN KEY (srid) REFERENCES mdsys.ogis_spatial_reference_systems (srid)
);