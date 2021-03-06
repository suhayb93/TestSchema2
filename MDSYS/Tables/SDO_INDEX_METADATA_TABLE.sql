CREATE TABLE mdsys.sdo_index_metadata_table (
  sdo_index_owner VARCHAR2(32 BYTE),
  sdo_index_type VARCHAR2(32 BYTE),
  sdo_level NUMBER,
  sdo_numtiles NUMBER,
  sdo_maxlevel NUMBER,
  sdo_commit_interval NUMBER,
  sdo_index_table VARCHAR2(32 BYTE),
  sdo_index_name VARCHAR2(32 BYTE),
  sdo_index_primary NUMBER,
  sdo_tsname VARCHAR2(32 BYTE),
  sdo_column_name VARCHAR2(2048 BYTE),
  sdo_rtree_height NUMBER,
  sdo_rtree_num_nodes NUMBER,
  sdo_rtree_dimensionality NUMBER,
  sdo_rtree_fanout NUMBER,
  sdo_rtree_root VARCHAR2(32 BYTE),
  sdo_rtree_seq_name VARCHAR2(32 BYTE),
  sdo_fixed_meta RAW(255),
  sdo_tablespace VARCHAR2(32 BYTE),
  sdo_initial_extent VARCHAR2(32 BYTE),
  sdo_next_extent VARCHAR2(32 BYTE),
  sdo_pctincrease NUMBER,
  sdo_min_extents NUMBER,
  sdo_max_extents NUMBER,
  sdo_index_dims NUMBER,
  sdo_layer_gtype VARCHAR2(32 BYTE),
  sdo_rtree_pctfree NUMBER,
  sdo_index_partition VARCHAR2(32 BYTE),
  sdo_partitioned NUMBER,
  sdo_rtree_quality NUMBER,
  sdo_index_version NUMBER,
  sdo_index_geodetic VARCHAR2(8 BYTE),
  sdo_index_status VARCHAR2(32 BYTE),
  sdo_nl_index_table VARCHAR2(33 BYTE),
  sdo_dml_batch_size NUMBER,
  sdo_rtree_ent_xpnd NUMBER,
  sdo_root_mbr mdsys.sdo_geometry,
  sdo_num_rows NUMBER DEFAULT null,
  sdo_num_blks NUMBER DEFAULT null,
  sdo_optimized_nodes NUMBER DEFAULT null
);