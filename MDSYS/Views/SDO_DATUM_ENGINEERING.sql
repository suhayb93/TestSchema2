CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.sdo_datum_engineering (datum_id,datum_name,ellipsoid_id,prime_meridian_id,information_source,data_source,shift_x,shift_y,shift_z,rotate_x,rotate_y,rotate_z,scale_adjust) AS
SELECT
          DATUM_ID,
          DATUM_NAME,
          ELLIPSOID_ID,
          PRIME_MERIDIAN_ID,
          INFORMATION_SOURCE,
          DATA_SOURCE,
          SHIFT_X,
          SHIFT_Y,
          SHIFT_Z,
          ROTATE_X,
          ROTATE_Y,
          ROTATE_Z,
          SCALE_ADJUST
        FROM
          mdsys.SDO_DATUMS
        WHERE
          DATUM_TYPE = 'ENGINEERING';