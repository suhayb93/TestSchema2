CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_network_user_data ("NETWORK",table_type,data_name,data_type,data_length,category_id) AS
SELECT  network, table_type, data_name, data_type,data_length, category_id
    FROM  sdo_network_user_data
    WHERE sdo_owner = sys_context('USERENV', 'CURRENT_USER');