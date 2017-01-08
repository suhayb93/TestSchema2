CREATE TABLE mdsys.sdo_index_aggregates_table (
  sdo_index_owner VARCHAR2(32 BYTE) NOT NULL,
  sdo_index_name VARCHAR2(32 BYTE) NOT NULL,
  sdo_index_oid VARCHAR2(32 BYTE),
  sdo_numtiles NUMBER,
  sdo_rtree_num_nodes NUMBER,
  sdo_num_rows NUMBER,
  sdo_num_blks NUMBER,
  CONSTRAINT unique_aggregate PRIMARY KEY (sdo_index_owner,sdo_index_name)
);