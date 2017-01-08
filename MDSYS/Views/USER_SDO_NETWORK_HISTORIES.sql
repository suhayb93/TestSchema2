CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_network_histories ("NETWORK",node_history_table,link_history_table,node_trigger,link_trigger) AS
SELECT  network, node_history_table, link_history_table, node_trigger, link_trigger
    FROM  sdo_network_histories
    WHERE owner = sys_context('USERENV', 'CURRENT_USER');