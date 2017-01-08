CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_network_locks_upd_trig
INSTEAD OF UPDATE ON mdsys.user_sdo_network_locks_wm
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
DECLARE
  user_name    VARCHAR2(256);
BEGIN

  EXECUTE IMMEDIATE 'SELECT USER FROM DUAL' INTO user_name;

  UPDATE sdo_network_locks_wm
    SET  (lock_id, network, workspace,
          original_node_filter, original_link_filter, original_path_filter,
          adjusted_node_filter, adjusted_link_filter, adjusted_path_filter)
      = (SELECT :n.lock_id, :n.network, :n.workspace,
          :n.original_node_filter, :n.original_link_filter,
          :n.original_path_filter,
          :n.adjusted_node_filter, :n.adjusted_link_filter,
          :n.adjusted_path_filter
       FROM DUAL)
    WHERE  NLS_UPPER(sdo_owner)  = NLS_UPPER(user_name)
      AND  lock_id = :o.lock_id;
END;
/