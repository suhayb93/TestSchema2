CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_network_his_upd_trig
INSTEAD OF UPDATE ON mdsys.user_sdo_network_histories
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  UPDATE sdo_network_histories
   SET(network,node_history_table,link_history_table,node_trigger,link_trigger)
      =
   (SELECT
      :n.network,:n.node_history_table,:n.link_history_table,:n.node_trigger,
      :n.link_trigger
    FROM DUAL)
    WHERE  NLS_UPPER(owner)  = NLS_UPPER(user_name)
      AND  network = :o.network;
END;
/