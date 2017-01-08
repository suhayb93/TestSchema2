CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_cached_maps ("NAME",description,tiles_table,is_online,is_internal,definition,base_map,map_adapter) AS
SELECT NAME, DESCRIPTION, tiles_table, is_online, is_internal, DEFINITION, base_map, map_adapter
FROM mdsys.SDO_CACHED_MAPS_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_SCHEMA');