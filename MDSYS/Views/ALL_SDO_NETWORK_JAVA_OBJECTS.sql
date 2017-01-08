CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_network_java_objects ("OWNER","NAME",description,class_name,"CLASS",java_interface) AS
SELECT  sdo_owner owner, constraint name, description, class_name, class,java_interface     FROM  sdo_network_constraints     WHERE EXISTS       (SELECT  NULL         FROM  all_java_classes          WHERE owner = sdo_owner            AND name = class_name );