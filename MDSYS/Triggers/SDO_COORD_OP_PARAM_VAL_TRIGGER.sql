CREATE OR REPLACE NONEDITIONABLE TRIGGER
  mdsys.SDO_coord_op_param_val_TRIGGER
AFTER
  INSERT OR
  UPDATE or
  delete
ON
  mdsys.SDO_coord_op_param_vals
for each row
BEGIN
  mdsys.sdo_cs.sdo_cs_context_invalidate;

  update
    sdo_cs_srs
  set
    wktext = 'Getting updated'
  where
    srid in (
      select
        crs.srid
      from
        sdo_coord_ref_sys crs
      where
        crs.projection_conv_id = :new.coord_op_id);
end;
/