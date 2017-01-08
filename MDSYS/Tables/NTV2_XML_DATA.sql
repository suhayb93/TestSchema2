CREATE TABLE mdsys.ntv2_xml_data (
  ntv2_file_id NUMBER NOT NULL,
  sequence_number NUMBER NOT NULL,
  "XML" XMLTYPE NOT NULL,
  CONSTRAINT ntv2_xml_data_pk PRIMARY KEY (ntv2_file_id,sequence_number)
);