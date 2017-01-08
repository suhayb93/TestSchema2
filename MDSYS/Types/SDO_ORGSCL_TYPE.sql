CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_ORGSCL_TYPE
                                                                              
    AS OBJECT (
       extent           SDO_MBR,
       scale            SDO_VPOINT_TYPE,
       ord_cmp_type     SDO_VPOINT_TYPE)
/