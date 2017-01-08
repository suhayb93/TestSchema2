CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_network_java_objects ("NAME",description,class_name,"CLASS",java_interface) AS
SELECT  constraint name, description, class_name, class,java_interface
    FROM  sdo_network_constraints
    WHERE sdo_owner = sys_context('USERENV', 'CURRENT_USER');