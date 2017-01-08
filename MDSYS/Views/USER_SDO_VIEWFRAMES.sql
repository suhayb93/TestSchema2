CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_viewframes ("NAME",description,scene_name,definition) AS
SELECT NAME, DESCRIPTION, SCENE_NAME, DEFINITION
FROM SDO_VIEWFRAMES_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_USER');