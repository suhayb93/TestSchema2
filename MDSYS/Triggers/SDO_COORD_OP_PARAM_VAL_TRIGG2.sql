CREATE OR REPLACE NONEDITIONABLE TRIGGER
  mdsys.SDO_coord_op_param_val_TRIGG2
AFTER
  INSERT OR
  UPDATE or
  delete
ON
  mdsys.SDO_coord_op_param_vals
BEGIN
  update
    sdo_cs_srs
  set
    wktext = mdsys.sdo_cs.internal_det_srid_wkt(srid),
    wktext3d = mdsys.sdo_cs.get_3d_wkt(srid)
  where
    wktext = 'Getting updated';
end;
/