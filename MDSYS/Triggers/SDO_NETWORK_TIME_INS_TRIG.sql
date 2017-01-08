CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_network_time_ins_trig
INSTEAD OF INSERT ON mdsys.user_sdo_network_timestamps
REFERENCING NEW AS n
FOR EACH ROW
DECLARE
 user_name         VARCHAR2(32);
BEGIN

  EXECUTE IMMEDIATE 'SELECT user FROM dual' INTO user_name;

  INSERT INTO sdo_network_timestamps(
     owner, network, table_name, last_dml_time)
  VALUES(NLS_UPPER(user_name),:n.network,:n.table_name, :n.last_dml_time);

EXCEPTION WHEN OTHERS THEN RAISE;
END;
/