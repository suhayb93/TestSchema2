CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.mdprvt_feature AS

  PROCEDURE sdo_invalidate_feature(feature IN VARCHAR2);
  PRAGMA restrict_references(sdo_invalidate_feature, wnds, rnps, wnps, trust);

  PROCEDURE sdo_register_feature(feature IN VARCHAR2);
  PRAGMA restrict_references(sdo_register_feature, wnds, rnps, wnps, trust);

END mdprvt_feature;
/