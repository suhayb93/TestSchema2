CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_network_timestamps ("OWNER","NETWORK",table_name,last_dml_time) AS
SELECT  "OWNER","NETWORK","TABLE_NAME","LAST_DML_TIME"
    FROM  sdo_network_timestamps;