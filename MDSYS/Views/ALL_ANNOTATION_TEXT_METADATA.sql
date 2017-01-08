CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_annotation_text_metadata ("OWNER",table_name,column_name,map_base_scale,text_expression,text_attributes) AS
SELECT F_TABLE_SCHEMA OWNER, F_TABLE_NAME TABLE_NAME,
               F_TEXT_COLUMN COLUMN_NAME,
               MAP_BASE_SCALE,
               TEXT_DEFAULT_EXPRESSION TEXT_EXPRESSION,
               TEXT_DEFAULT_ATTRIBUTES TEXT_ATTRIBUTES
FROM SDO_ANNOTATION_TEXT_METADATA, ALL_OBJECTS a
       where a.object_name = F_TABLE_NAME and a.owner = F_TABLE_SCHEMA
             and a.object_type in ('TABLE', 'SYNONYM', 'VIEW');