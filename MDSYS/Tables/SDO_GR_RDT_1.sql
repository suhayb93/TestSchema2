CREATE GLOBAL TEMPORARY TABLE mdsys.sdo_gr_rdt_1 (
  rasterdatatable VARCHAR2(100 BYTE) NOT NULL,
  rasterid NUMBER NOT NULL,
  pyramidlevel NUMBER NOT NULL,
  bandblocknumber NUMBER NOT NULL,
  rowblocknumber NUMBER NOT NULL,
  columnblocknumber NUMBER NOT NULL,
  blockmbr mdsys.sdo_geometry,
  rasterblock BLOB,
  CONSTRAINT sdo_gr_rdt_1_pk PRIMARY KEY (rasterdatatable,rasterid,pyramidlevel,bandblocknumber,rowblocknumber,columnblocknumber)
)
ON COMMIT DELETE ROWS;