CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_maps ("OWNER","NAME",description,definition) AS
SELECT SDO_OWNER OWNER, NAME, DESCRIPTION,DEFINITION
FROM SDO_MAPS_TABLE;