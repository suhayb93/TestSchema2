CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_network_his_ins_trig
INSTEAD OF INSERT ON mdsys.user_sdo_network_histories
REFERENCING NEW AS n
FOR EACH ROW
DECLARE
 user_name         VARCHAR2(32);
BEGIN

  EXECUTE IMMEDIATE 'SELECT user FROM dual' INTO user_name;

  INSERT INTO sdo_network_histories(
     owner, network, node_history_table, link_history_table, node_trigger,
     link_trigger)
  VALUES(
     NLS_UPPER(user_name),:n.network,:n.node_history_table,
     :n.link_history_table,:n.node_trigger,:n.link_trigger);

EXCEPTION WHEN OTHERS THEN RAISE;
END;
/