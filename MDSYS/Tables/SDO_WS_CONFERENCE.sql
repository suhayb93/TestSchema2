CREATE TABLE mdsys.sdo_ws_conference (
  conference_id VARCHAR2(128 BYTE) NOT NULL,
  request XMLTYPE NOT NULL,
  CONSTRAINT sdo_ws_conf_pk PRIMARY KEY (conference_id)
);