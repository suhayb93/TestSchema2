CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_network_timestamps ("NETWORK",table_name,last_dml_time) AS
SELECT  network, table_name, last_dml_time
    FROM  sdo_network_timestamps
    WHERE owner = sys_context('USERENV', 'CURRENT_USER');