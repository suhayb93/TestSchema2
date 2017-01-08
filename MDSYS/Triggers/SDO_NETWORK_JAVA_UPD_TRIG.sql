CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_network_java_upd_trig
INSTEAD OF UPDATE ON mdsys.user_sdo_network_java_objects
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  UPDATE sdo_network_constraints
    SET
            (constraint,
       description,
       class_name,
       class,
       java_interface)
      =
            (SELECT
               :n.name,
         :n.description,
         :n.class_name,
         :n.class,
         :n.java_interface
       FROM DUAL)
    WHERE  NLS_UPPER(sdo_owner)  = NLS_UPPER(user_name)
      AND  constraint = :o.name;
END;
/