CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_TIN
                                                                              
    AS OBJECT (
       base_table            VARCHAR2(70),
       base_table_col        VARCHAR2(1024),
       tin_id                NUMBER,
       blk_table             VARCHAR2(70),
       ptn_params            VARCHAR2(1024),
       tin_extent            sdo_geometry,
       tin_tol               NUMBER,
       tin_tot_dimensions    NUMBER,
       tin_domain            sdo_orgscl_type,
       tin_break_lines       SDO_GEOMETRY,
       tin_stop_lines        SDO_GEOMETRY,
       tin_void_rgns         SDO_GEOMETRY,
       tin_val_attr_tables   SDO_STRING_ARRAY,
       tin_other_attrs       SYS.XMLTYPE)
/