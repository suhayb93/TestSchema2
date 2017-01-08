CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_3dtxfms ("NAME",description,"TYPE",affine_parameters,coord_txfm_src_srid,coord_txfm_tgt_srid,txfm_series_ids) AS
SELECT NAME, DESCRIPTION,
TYPE, AFFINE_PARAMETERS, COORD_TXFM_SRC_SRID,
COORD_TXFM_TGT_SRID, TXFM_SERIES_IDS
FROM SDO_3DTXFMS_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_USER');