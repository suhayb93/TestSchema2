CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_lightsources ("OWNER","NAME",description,"TYPE",definition) AS
SELECT SDO_OWNER OWNER, NAME, DESCRIPTION, TYPE, DEFINITION
FROM SDO_LIGHTSOURCEs_TABLE;