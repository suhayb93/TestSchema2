CREATE TABLE mdsys.sdo_network_timestamps (
  "OWNER" VARCHAR2(32 BYTE) DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_USER') NOT NULL,
  "NETWORK" VARCHAR2(24 BYTE) NOT NULL,
  table_name VARCHAR2(32 BYTE) NOT NULL,
  last_dml_time TIMESTAMP NOT NULL,
  CONSTRAINT network_timestamp_constraint UNIQUE ("OWNER","NETWORK",table_name)
);