CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_index_info (sdo_index_owner,index_name,table_owner,table_name,column_name,sdo_index_type,sdo_index_table,sdo_index_status) AS
select SDO_INDEX_OWNER, SDO_INDEX_NAME index_name,  table_owner, table_name,
       REPLACE(sdo_column_name, '"')  column_name,
       SDO_INDEX_TYPE, SDO_INDEX_TABLE, SDO_INDEX_STATUS
 from all_sdo_index_metadata,
     all_indexes
 where index_name = sdo_index_name and owner=sdo_index_owner;