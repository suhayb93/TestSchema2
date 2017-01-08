CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_network_locks_wm (lock_id,"NETWORK",workspace,original_node_filter,original_link_filter,original_path_filter,adjusted_node_filter,adjusted_link_filter,adjusted_path_filter) AS
SELECT  lock_id, network, workspace, original_node_filter, original_link_filter, original_path_filter, adjusted_node_filter, adjusted_link_filter, adjusted_path_filter
    FROM  sdo_network_locks_wm
    WHERE sdo_owner = sys_context('USERENV', 'CURRENT_USER');