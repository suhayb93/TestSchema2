CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_network_java_del_trig
INSTEAD OF DELETE ON mdsys.user_sdo_network_java_objects
REFERENCING OLD AS o
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  DELETE
    FROM  sdo_network_constraints
    WHERE NLS_UPPER(SDO_OWNER) = NLS_UPPER(user_name)
      AND constraint = :o.name;

END;
/