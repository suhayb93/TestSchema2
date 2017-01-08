CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_network_ud_upd_trig
INSTEAD OF UPDATE ON mdsys.user_sdo_network_user_data
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
  no           number ;
  table_name       VARCHAR2(32);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  -- check if network already exists in the networkwork metadata
  EXECUTE IMMEDIATE
        'SELECT COUNT(*) FROM sdo_network_metadata_table ' ||
        '  where sdo_owner = :owner AND NLS_UPPER(network) = :net ' into no using NLS_UPPER(user_name), NLS_UPPER(:n.network);

  IF ( no = 0 ) THEN
   mderr.raise_md_error('MD', 'SDO', -13385,
           user_name||'.'||:n.network || ' NOT IN NETWORK METADATA!');
  END IF;

  UPDATE sdo_network_user_data
    SET
      (
       network,
       table_type,
       data_name,
       data_type,
       data_length,
       category_id)
      =
      (SELECT
         NLS_UPPER(:n.network),
         NLS_UPPER(:n.table_type),
         NLS_UPPER(:n.data_name),
         NLS_UPPER(:n.data_type),
         :n.data_length,
         :n.category_id
       FROM DUAL)
    WHERE  NLS_UPPER(sdo_owner)  = NLS_UPPER(user_name)
      AND  NLS_UPPER(network)    = NLS_UPPER(:o.network)
      AND  NLS_UPPER(table_type) = NLS_UPPER(:o.table_type)
      AND  NLS_UPPER(data_name)  = NLS_UPPER(:o.data_name);
END;
/