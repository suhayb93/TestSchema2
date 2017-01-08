CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.sdo_dist_units (sdo_unit,unit_name,conversion_factor) AS
SELECT
    SHORT_NAME "SDO_UNIT",
    UNIT_OF_MEAS_NAME "UNIT_NAME",
    (FACTOR_B/FACTOR_C) "CONVERSION_FACTOR"
  FROM
    mdsys.SDO_UNITS_OF_MEASURE
  WHERE
    nls_lower(UNIT_OF_MEAS_TYPE)='length';