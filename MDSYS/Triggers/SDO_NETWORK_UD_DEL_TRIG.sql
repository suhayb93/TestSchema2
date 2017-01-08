CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_network_ud_del_trig
INSTEAD OF DELETE ON mdsys.user_sdo_network_user_data
REFERENCING OLD AS o
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  DELETE
    FROM  sdo_network_user_data
    WHERE NLS_UPPER(SDO_OWNER) = NLS_UPPER(user_name)
      AND network    = NLS_UPPER(:o.network)
      AND table_type = NLS_UPPER(:o.table_type)
      AND data_name  = NLS_UPPER(:o.data_name);

END;
/