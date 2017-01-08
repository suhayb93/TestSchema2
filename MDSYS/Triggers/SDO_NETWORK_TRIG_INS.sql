CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_NETWORK_TRIG_INS
INSTEAD OF INSERT ON mdsys.USER_SDO_NETWORK_METADATA
REFERENCING NEW AS n
FOR EACH ROW
declare
 user_name varchar2(32);
 net_id number;
 no_of_partitions number := 0;
 no_of_hierarchy_levels number := 1;
 direction    VARCHAR2(12);
BEGIN

  EXECUTE IMMEDIATE 'SELECT user FROM dual' into user_name;
  -- find out the network ID from network ID sequence
  EXECUTE IMMEDIATE 'SELECT sdo_ndm_network_id_seq.nextval FROM DUAL' INTO net_id;

  -- insert network metadata and network ID into SDO_NETWORK_METADATA_TABLE

  IF ( :n.no_of_partitions is NOT null ) THEN
        no_of_partitions :=  :n.no_of_partitions;
  END IF;

  IF ( :n.no_of_hierarchy_levels is NOT null ) THEN
        no_of_hierarchy_levels :=  :n.no_of_hierarchy_levels;
  END IF;

  -- change bidirected to undirected
  direction := :n.link_direction ;

  IF ( NLS_UPPER(direction) = 'BIDIRECTED' ) THEN
    direction := 'UNDIRECTED';
  END IF ;

  insert into SDO_NETWORK_METADATA_TABLE
        (
         SDO_OWNER,
         NETWORK,
         NETWORK_ID,
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
        )
        values
        (
         NLS_UPPER(user_name),
         NLS_UPPER(:n.network),
         net_id,
         NLS_UPPER(:n.network_category),
         NLS_UPPER(:n.geometry_type),
         NLS_UPPER(:n.network_type),
         no_of_hierarchy_levels,
         no_of_partitions,
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
        );
   -- register NDM feature usage when inserting a NDM network metadata in 12c and beyond
         IF ( to_number(substr(sdo_version,1, instr(sdo_version,'.')-1)) >= 12 ) then
           execute immediate 'BEGIN mdsys.mdprvt_feature.sdo_register_feature(''NDM''); END;';
         END IF;

END;
/