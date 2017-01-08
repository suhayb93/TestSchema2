CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_network_java_ins_trig
INSTEAD OF INSERT ON mdsys.user_sdo_network_java_objects
REFERENCING NEW AS n
FOR EACH ROW
DECLARE
 user_name         VARCHAR2(32);
 dir_name          VARCHAR2(200);
 file_name         VARCHAR2(32);
 class_file_name   VARCHAR2(32);
BEGIN

  EXECUTE IMMEDIATE 'SELECT user FROM dual' INTO user_name;

  INSERT INTO
    sdo_network_constraints
          (sdo_owner,
     constraint,
     description,
     class_name,
     class,
     java_interface)
  VALUES
          (
           NLS_UPPER(user_name),
           :n.name,
     :n.description,
     :n.class_name,
     :n.class,
     :n.java_interface
          );
END;
/