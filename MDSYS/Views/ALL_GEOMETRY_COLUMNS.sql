CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_geometry_columns (f_table_schema,f_table_name,f_geometry_column,g_table_schema,g_table_name,storage_type,geometry_type,coord_dimension,max_ppr,srid) AS
select "F_TABLE_SCHEMA","F_TABLE_NAME","F_GEOMETRY_COLUMN","G_TABLE_SCHEMA","G_TABLE_NAME","STORAGE_TYPE","GEOMETRY_TYPE","COORD_DIMENSION","MAX_PPR","SRID" from OGIS_GEOMETRY_COLUMNS where
(exists (select table_name from all_tables
         where table_name=f_table_name and owner=f_table_schema)
 or
 exists (select view_name from all_views
         where view_name=f_table_name and owner=f_table_schema)
 or
 exists (select table_name from all_object_tables
         where table_name=f_table_name and owner=f_table_schema)
)
and
(exists (select table_name from all_tables
         where table_name=g_table_name and owner=g_table_schema)
 or
 exists (select view_name from all_views
         where view_name=g_table_name and owner=g_table_schema)
 or
 exists (select table_name from all_object_tables
         where table_name=g_table_name and owner=g_table_schema)
);