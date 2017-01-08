CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_network_locks_del_trig
INSTEAD OF DELETE ON mdsys.user_sdo_network_locks_wm
REFERENCING OLD AS o
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  DELETE
    FROM  sdo_network_locks_wm
    WHERE NLS_UPPER(SDO_OWNER) = NLS_UPPER(user_name)
      AND lock_id = :o.lock_id;

END;
/