CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_NETWORK_TRIG_UPD
INSTEAD OF UPDATE ON mdsys.user_sdo_network_metadata
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
  direction    VARCHAR2(12);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;
  direction := :n.link_direction ;
  IF ( nls_upper(direction) = 'BIDIRECTED' ) THEN
    direction := 'UNDIRECTED';
  END IF;


  UPDATE sdo_network_metadata_table
    SET (NETWORK,
         NETWORK_CATEGORY,
         GEOMETRY_TYPE,
         NETWORK_TYPE,
         NO_OF_HIERARCHY_LEVELS,
         NO_OF_PARTITIONS,
         LRS_TABLE_NAME,
         LRS_GEOM_COLUMN,
         NODE_TABLE_NAME,
         NODE_GEOM_COLUMN,
         NODE_COST_COLUMN,
         NODE_PARTITION_COLUMN,
         NODE_DURATION_COLUMN,
         LINK_TABLE_NAME,
         LINK_GEOM_COLUMN,
         LINK_DIRECTION,
         LINK_COST_COLUMN,
         LINK_PARTITION_COLUMN,
         LINK_DURATION_COLUMN,
         PATH_TABLE_NAME,
         PATH_GEOM_COLUMN,
         PATH_LINK_TABLE_NAME,
         SUBPATH_TABLE_NAME,
         SUBPATH_GEOM_COLUMN,
         PARTITION_TABLE_NAME,
         PARTITION_BLOB_TABLE_NAME,
         COMPONENT_TABLE_NAME,
         NODE_LEVEL_TABLE_NAME,
         TOPOLOGY,
         USER_DEFINED_DATA,
         EXTERNAL_REFERENCES,
         CHILD_NETWORK,
         HIERARCHY_TABLE_NAME
        ) =
        ( SELECT
         NLS_UPPER(:n.network),
         NLS_UPPER(:n.network_category),
         NLS_UPPER(:n.geometry_type),
         NLS_UPPER(:n.network_type),
         :n.no_of_hierarchy_levels,
         :n.no_of_partitions,
         NLS_UPPER(:n.lrs_table_name),
         NLS_UPPER(:n.lrs_geom_column),
         NLS_UPPER(:n.node_table_name),
         NLS_UPPER(:n.node_geom_column),
         NLS_UPPER(:n.node_cost_column),
         NLS_UPPER(:n.node_partition_column),
         NLS_UPPER(:n.node_duration_column),
         NLS_UPPER(:n.link_table_name),
         NLS_UPPER(:n.link_geom_column),
         NLS_UPPER(direction),
         NLS_UPPER(:n.link_cost_column),
         NLS_UPPER(:n.link_partition_column),
         NLS_UPPER(:n.link_duration_column),
         NLS_UPPER(:n.path_table_name),
         NLS_UPPER(:n.path_geom_column),
         NLS_UPPER(:n.path_link_table_name),
         NLS_UPPER(:n.subpath_table_name),
         NLS_UPPER(:n.subpath_geom_column),
         NLS_UPPER(:n.partition_table_name),
         NLS_UPPER(:n.partition_blob_table_name),
         NLS_UPPER(:n.component_table_name),
         NLS_UPPER(:n.node_level_table_name),
         NLS_UPPER(:n.topology),
         NLS_UPPER(:n.user_defined_data),
         NLS_UPPER(:n.external_references),
         NLS_UPPER(:n.child_network),
         NLS_UPPER(:n.hierarchy_table_name)
         FROM DUAL )
  WHERE  NLS_UPPER(SDO_OWNER)  = NLS_UPPER(user_name)
     AND NLS_UPPER(NETWORK)    = NLS_UPPER(:o.network);

END;
/