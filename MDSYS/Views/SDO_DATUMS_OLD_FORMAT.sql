CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.sdo_datums_old_format ("NAME",shift_x,shift_y,shift_z,rotate_x,rotate_y,rotate_z,scale_adjust) AS
SELECT
    DATUM_NAME "NAME",
    SHIFT_X,
    SHIFT_Y,
    SHIFT_Z,
    ROTATE_X,
    ROTATE_Y,
    ROTATE_Z,
    SCALE_ADJUST
  FROM
    mdsys.SDO_DATUMS;