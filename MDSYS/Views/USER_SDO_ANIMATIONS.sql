CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_animations ("NAME",description,definition) AS
SELECT NAME, DESCRIPTION,DEFINITION
FROM SDO_ANIMATIONS_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_USER');