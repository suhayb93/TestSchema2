CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_SMPL_GEOMETRY
                                                                      
AS OBJECT (
        orig_area number,
        cur_area number,
        orig_len number,
        cur_len number,
        geometry mdsys.sdo_geometry) 
/