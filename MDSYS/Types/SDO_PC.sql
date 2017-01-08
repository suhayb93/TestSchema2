CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_PC
                                                                              
    AS OBJECT (
       base_table           VARCHAR2(70),
       base_table_col       VARCHAR2(1024),
       pc_id                NUMBER,
       blk_table            VARCHAR2(70),
       ptn_params           VARCHAR2(1024),
       pc_extent            sdo_geometry,
       pc_tol               NUMBER,
       pc_tot_dimensions    NUMBER,
       pc_domain            sdo_orgscl_type,
       pc_val_attr_tables   SDO_STRING_ARRAY,
       pc_other_attrs       SYS.XMLTYPE)
/