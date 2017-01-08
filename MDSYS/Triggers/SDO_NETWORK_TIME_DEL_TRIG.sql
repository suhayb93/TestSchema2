CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_network_time_del_trig
INSTEAD OF DELETE ON mdsys.user_sdo_network_timestamps
REFERENCING OLD AS o
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  DELETE
    FROM  sdo_network_timestamps
    WHERE owner = NLS_UPPER(user_name)
      AND network = :o.network
      AND table_name = :o.table_name;
END;
/