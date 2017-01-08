CREATE TABLE mdsys.sdo_ws_conference_participants (
  conference_id VARCHAR2(128 BYTE) NOT NULL,
  participant VARCHAR2(128 BYTE) NOT NULL,
  has_approved NUMBER NOT NULL,
  CONSTRAINT sdo_ws_conf_part_pk PRIMARY KEY (conference_id,participant),
  CONSTRAINT sdo_ws_conf_part_fk FOREIGN KEY (conference_id) REFERENCES mdsys.sdo_ws_conference (conference_id)
);