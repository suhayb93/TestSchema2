CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_scenes ("NAME",description,definition) AS
SELECT NAME, DESCRIPTION,DEFINITION
FROM SDO_SCENES_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_USER');