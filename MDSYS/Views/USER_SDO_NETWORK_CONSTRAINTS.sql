CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_network_constraints ("CONSTRAINT",description,class_name,"CLASS") AS
SELECT  constraint, description, class_name, class
    FROM  sdo_network_constraints
    WHERE sdo_owner = sys_context('USERENV', 'CURRENT_USER');