CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_network_user_data ("OWNER","NETWORK",table_type,data_name,data_type,data_length,category_id) AS
SELECT  sdo_owner owner, network, table_type, data_name, data_type,data_length, category_id
    FROM  sdo_network_user_data;