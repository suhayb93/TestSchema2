CREATE TABLE mdsys.sdo_network_metadata_table (
  sdo_owner VARCHAR2(32 BYTE) DEFAULT sys_context('userenv','CURRENT_USER') NOT NULL,
  "NETWORK" VARCHAR2(24 BYTE) NOT NULL,
  network_id NUMBER NOT NULL,
  network_category VARCHAR2(12 BYTE) NOT NULL CHECK (NETWORK_CATEGORY IN ('SPATIAL','LOGICAL')),
  geometry_type VARCHAR2(24 BYTE) CHECK (GEOMETRY_TYPE IN (NULL,'SDO_GEOMETRY','LRS_GEOMETRY',
      'TOPO_GEOMETRY')),
  network_type VARCHAR2(24 BYTE),
  no_of_hierarchy_levels NUMBER DEFAULT 1,
  no_of_partitions NUMBER DEFAULT 1,
  lrs_table_name VARCHAR2(32 BYTE),
  lrs_geom_column VARCHAR2(32 BYTE),
  node_table_name VARCHAR2(32 BYTE) NOT NULL,
  node_geom_column VARCHAR2(32 BYTE),
  node_cost_column VARCHAR2(1024 BYTE),
  link_table_name VARCHAR2(32 BYTE) NOT NULL,
  link_geom_column VARCHAR2(32 BYTE),
  link_direction VARCHAR2(12 BYTE) NOT NULL CHECK (LINK_DIRECTION IN ('UNDIRECTED','BIDIRECTED','DIRECTED')),
  link_cost_column VARCHAR2(1024 BYTE),
  path_table_name VARCHAR2(32 BYTE),
  path_geom_column VARCHAR2(32 BYTE),
  path_link_table_name VARCHAR2(32 BYTE),
  partition_table_name VARCHAR2(32 BYTE),
  node_partition_column VARCHAR2(32 BYTE),
  link_partition_column VARCHAR2(32 BYTE),
  node_duration_column VARCHAR2(32 BYTE),
  link_duration_column VARCHAR2(32 BYTE),
  topology VARCHAR2(32 BYTE),
  user_defined_data VARCHAR2(1 BYTE),
  external_references VARCHAR2(1 BYTE),
  subpath_table_name VARCHAR2(32 BYTE),
  subpath_geom_column VARCHAR2(32 BYTE),
  partition_blob_table_name VARCHAR2(32 BYTE),
  component_table_name VARCHAR2(32 BYTE),
  node_level_table_name VARCHAR2(32 BYTE),
  child_network VARCHAR2(32 BYTE),
  hierarchy_table_name VARCHAR2(32 BYTE),
  CONSTRAINT unique_lrs_geom_layer UNIQUE (sdo_owner,"NETWORK",lrs_table_name),
  CONSTRAINT unique_network_layer UNIQUE (sdo_owner,"NETWORK"),
  CONSTRAINT unique_network_link_layer UNIQUE (sdo_owner,"NETWORK",link_table_name),
  CONSTRAINT unique_network_node_layer UNIQUE (sdo_owner,"NETWORK",node_table_name),
  CONSTRAINT unique_network_path_layer UNIQUE (sdo_owner,"NETWORK",path_table_name),
  CONSTRAINT unique_network_path_link_layer UNIQUE (sdo_owner,"NETWORK",path_link_table_name)
);