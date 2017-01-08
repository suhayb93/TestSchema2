CREATE TABLE mdsys.sdo_ws_conference_results (
  conference_id VARCHAR2(128 BYTE) NOT NULL,
  result XMLTYPE NOT NULL,
  CONSTRAINT sdo_ws_conf_res__pk PRIMARY KEY (conference_id)
);