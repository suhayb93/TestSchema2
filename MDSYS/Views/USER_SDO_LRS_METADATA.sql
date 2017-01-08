CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_lrs_metadata (table_name,column_name,dim_pos,dim_unit) AS
SELECT  SDO_TABLE_NAME  TABLE_NAME,
        SDO_COLUMN_NAME COLUMN_NAME,
        SDO_DIM_POS     DIM_POS,
        SDO_DIM_UNIT    DIM_UNIT
FROM SDO_LRS_METADATA_TABLE,
     (select sys_context('userenv', 'CURRENT_USER') username from dual)
WHERE  sdo_owner = username;