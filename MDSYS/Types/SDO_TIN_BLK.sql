CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_TIN_BLK
                                                                              
    AS OBJECT (
       obj_id           NUMBER ,
       blk_id           NUMBER,
       blk_extent       sdo_geometry,
       blk_domain       sdo_orgscl_type,
       pcblk_min_res    NUMBER,
       pcblk_max_res    NUMBER,
       num_points       NUMBER,
       num_unsorted_points NUMBER,
       pt_sort_dim      NUMBER,
       points           BLOB,
       tr_lvl           NUMBER,
       tr_res           NUMBER,
       num_triangles    NUMBER,
       tr_sort_dim      NUMBER,
       triangles        BLOB)
/