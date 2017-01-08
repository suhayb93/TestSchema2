CREATE TABLE mdsys.sdo_cached_maps_table (
  sdo_owner VARCHAR2(32 BYTE) DEFAULT sys_context('userenv', 'CURRENT_SCHEMA') NOT NULL,
  "NAME" VARCHAR2(32 BYTE) NOT NULL,
  description VARCHAR2(4000 BYTE),
  tiles_table VARCHAR2(32 BYTE),
  is_online VARCHAR2(3 BYTE) NOT NULL,
  is_internal VARCHAR2(4 BYTE) NOT NULL,
  definition CLOB NOT NULL,
  base_map VARCHAR2(32 BYTE),
  map_adapter BLOB,
  CONSTRAINT unique_cached_maps PRIMARY KEY (sdo_owner,"NAME")
);