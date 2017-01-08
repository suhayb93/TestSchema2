CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_network_histories ("OWNER","NETWORK",node_history_table,link_history_table,node_trigger,link_trigger) AS
SELECT  "OWNER","NETWORK","NODE_HISTORY_TABLE","LINK_HISTORY_TABLE","NODE_TRIGGER","LINK_TRIGGER"
    FROM  sdo_network_histories;