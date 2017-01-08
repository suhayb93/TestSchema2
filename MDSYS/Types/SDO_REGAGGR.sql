CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_REGAGGR
AS OBJECT (
        region_id varchar2(24),
        geometry mdsys.sdo_geometry,
        aggregate_value number) 
/