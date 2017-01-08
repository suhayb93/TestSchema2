CREATE TABLE mdsys.sdo_3dtxfms_table (
  sdo_owner VARCHAR2(32 BYTE) DEFAULT sys_context('userenv', 'CURRENT_USER') NOT NULL,
  "NAME" VARCHAR2(32 BYTE) NOT NULL,
  description VARCHAR2(4000 BYTE),
  "TYPE" VARCHAR2(32 BYTE),
  affine_parameters mdsys.sdo_number_array,
  coord_txfm_src_srid NUMBER,
  coord_txfm_tgt_srid NUMBER,
  txfm_series_ids mdsys.sdo_number_array,
  CONSTRAINT unique_3dtxfms PRIMARY KEY (sdo_owner,"NAME")
);