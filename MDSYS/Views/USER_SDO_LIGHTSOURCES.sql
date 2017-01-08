CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_lightsources ("NAME",description,"TYPE",definition) AS
SELECT NAME, DESCRIPTION, TYPE, DEFINITION
FROM SDO_LIGHTSOURCEs_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_USER');