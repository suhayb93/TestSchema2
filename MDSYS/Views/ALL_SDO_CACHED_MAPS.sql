CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_cached_maps ("OWNER","NAME",description,tiles_table,is_online,is_internal,definition,base_map,map_adapter) AS
SELECT SDO_OWNER OWNER, NAME, DESCRIPTION, tiles_table, is_online, is_internal, DEFINITION, base_map, map_adapter
FROM mdsys.SDO_CACHED_MAPS_TABLE ;