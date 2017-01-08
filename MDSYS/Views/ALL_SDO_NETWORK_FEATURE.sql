CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_network_feature ("OWNER","NETWORK",feature_layer_name,feature_layer_id,feature_layer_type,feature_table_name,relation_table_name,hierarchy_table_name) AS
SELECT
  SDO_OWNER OWNER,
  NETWORK,
  FEATURE_LAYER_NAME,
  FEATURE_LAYER_ID,
  FEATURE_LAYER_TYPE,
  FEATURE_TABLE_NAME,
  RELATION_TABLE_NAME,
  HIERARCHY_TABLE_NAME
FROM SDO_NETWORK_FEATURE;