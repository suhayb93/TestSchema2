CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_network_time_upd_trig
INSTEAD OF UPDATE ON mdsys.user_sdo_network_timestamps
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  UPDATE sdo_network_timestamps
   SET(network,table_name,last_dml_time)
      =
   (SELECT
      :n.network,:n.table_name,:n.last_dml_time
    FROM DUAL)
    WHERE  owner = NLS_UPPER(user_name)
      AND  NLS_UPPER(network) = NLS_UPPER(:o.network)
      AND  NLS_UPPER(table_name) = NLS_UPPER(:o.table_name);
END;
/