CREATE OR REPLACE NONEDITIONABLE TRIGGER
  mdsys.SDO_UNITS_OF_MEASURE_TRIGGER
AFTER
  INSERT OR
  UPDATE
ON
  mdsys.SDO_UNITS_OF_MEASURE
DECLARE
  c NUMBER;
BEGIN
  select
    count(*)
  into
    c
  from (
    select
      name
    from
      (
        select unit_of_meas_name name, factor_b, factor_c from mdsys.sdo_units_of_measure
        union
        select short_name        name, factor_b, factor_c from mdsys.sdo_units_of_measure where not short_name is null
      )
    group by
      name
    having
      count(*) > 1
      and
      min(factor_b/factor_c) < max(factor_b/factor_c));

  if(c > 0) then
    mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, 'This unit name/short name has already been defined with another factor or base unit.');
  end if;

  ------------------------------------------

  select
    count(*)
  into
    c
  from
    mdsys.sdo_units_of_measure uom1,
    mdsys.sdo_units_of_measure uom2
  where
    uom1.target_uom_id = uom2.uom_id and
    not(nls_lower(uom1.unit_of_meas_type) = nls_lower(uom2.unit_of_meas_type));

  if(c > 0) then
    mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, 'Unit and base unit have different types.');
  end if;

END;
/