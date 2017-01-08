CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_index_metadata (sdo_index_owner,sdo_index_type,sdo_level,sdo_numtiles,sdo_maxlevel,sdo_commit_interval,sdo_index_table,sdo_index_name,sdo_index_primary,sdo_tsname,sdo_column_name,sdo_rtree_height,sdo_rtree_num_nodes,sdo_rtree_dimensionality,sdo_rtree_fanout,sdo_rtree_root,sdo_rtree_seq_name,sdo_fixed_meta,sdo_tablespace,sdo_initial_extent,sdo_next_extent,sdo_pctincrease,sdo_min_extents,sdo_max_extents,sdo_index_dims,sdo_layer_gtype,sdo_rtree_pctfree,sdo_index_partition,sdo_partitioned,sdo_rtree_quality,sdo_index_version,sdo_index_geodetic,sdo_index_status,sdo_nl_index_table,sdo_dml_batch_size,sdo_rtree_ent_xpnd,sdo_num_rows,sdo_num_blks,sdo_optimized_nodes,sdo_root_mbr) AS
select SDO_INDEX_OWNER, SDO_INDEX_TYPE,
        SDO_LEVEL, SDO_NUMTILES, SDO_MAXLEVEL, SDO_COMMIT_INTERVAL,
        SDO_INDEX_TABLE, SDO_INDEX_NAME, SDO_INDEX_PRIMARY, SDO_TSNAME,
        SDO_COLUMN_NAME, SDO_RTREE_HEIGHT, SDO_RTREE_NUM_NODES,
        SDO_RTREE_DIMENSIONALITY, SDO_RTREE_FANOUT, SDO_RTREE_ROOT,
        SDO_RTREE_SEQ_NAME, SDO_FIXED_META, SDO_TABLESPACE,
        SDO_INITIAL_EXTENT, SDO_NEXT_EXTENT, SDO_PCTINCREASE,
        SDO_MIN_EXTENTS, SDO_MAX_EXTENTS, SDO_INDEX_DIMS, SDO_LAYER_GTYPE,
        SDO_RTREE_PCTFREE, SDO_INDEX_PARTITION, SDO_PARTITIONED,
        SDO_RTREE_QUALITY, SDO_INDEX_VERSION, SDO_INDEX_GEODETIC,
        SDO_INDEX_STATUS,
        SDO_NL_INDEX_TABLE,
        SDO_DML_BATCH_SIZE, SDO_RTREE_ENT_XPND,
        SDO_NUM_ROWS,                                           --- bug9743250
        SDO_NUM_BLKS,
        SDO_OPTIMIZED_NODES,
        SDO_ROOT_MBR                                            --- bug2719909
 from SDO_INDEX_METADATA_TABLE
 where
 (exists
   (select index_name from all_indexes
    where index_name=sdo_index_name and
          owner = sdo_index_owner));