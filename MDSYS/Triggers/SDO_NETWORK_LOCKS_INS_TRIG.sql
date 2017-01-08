CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_network_locks_ins_trig
INSTEAD OF INSERT ON mdsys.user_sdo_network_locks_wm
REFERENCING NEW AS n
FOR EACH ROW
DECLARE
 user_name         VARCHAR2(32);
BEGIN

  EXECUTE IMMEDIATE 'SELECT user FROM dual' INTO user_name;

  INSERT INTO
    sdo_network_locks_wm(sdo_owner, lock_id, network, workspace,
     original_node_filter, original_link_filter, original_path_filter,
     adjusted_node_filter, adjusted_link_filter, adjusted_path_filter)
  VALUES (NLS_UPPER(user_name), :n.lock_id, :n.network, :n.workspace,
     :n.original_node_filter,:n.original_link_filter,:n.original_path_filter,
     :n.adjusted_node_filter,:n.adjusted_link_filter,:n.adjusted_path_filter);
END;
/