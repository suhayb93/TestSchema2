CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.mdprvt_srid AS

  PROCEDURE sdo_invalidate_srid_metadata(srid IN NUMBER,
                                         srid_type IN VARCHAR2 DEFAULT NULL);
  PRAGMA restrict_references(sdo_invalidate_srid_metadata, wnds, rnps, wnps, trust);

  FUNCTION get_unit(srid IN NUMBER,
                    srid_type IN VARCHAR2 DEFAULT NULL,
                    unit_id OUT NUMBER,
                    unit_factor OUT NUMBER,
                    unit_name OUT VARCHAR2) -- MUST BE VARCHAR2(80)
    RETURN NUMBER DETERMINISTIC PARALLEL_ENABLE;
  FUNCTION get_unit(srid IN NUMBER,
                    srid_type IN VARCHAR2 DEFAULT NULL,
                    x_unit_id OUT NUMBER,
                    x_unit_factor OUT NUMBER,
                    x_unit_name OUT VARCHAR2, -- MUST BE VARCHAR2(80)
                    y_unit_id OUT NUMBER,
                    y_unit_factor OUT NUMBER,
                    y_unit_name OUT VARCHAR2) -- MUST BE VARCHAR2(80)
    RETURN NUMBER DETERMINISTIC PARALLEL_ENABLE;
  FUNCTION get_unit(srid IN NUMBER,
                    srid_type IN VARCHAR2 DEFAULT NULL,
                    x_unit_id OUT NUMBER,
                    x_unit_factor OUT NUMBER,
                    x_unit_name OUT VARCHAR2, -- MUST BE VARCHAR2(80)
                    y_unit_id OUT NUMBER,
                    y_unit_factor OUT NUMBER,
                    y_unit_name OUT VARCHAR2, -- MUST BE VARCHAR2(80)
                    z_unit_id OUT NUMBER,
                    z_unit_factor OUT NUMBER,
                    z_unit_name OUT VARCHAR2) -- MUST BE VARCHAR2(80)
    RETURN NUMBER DETERMINISTIC PARALLEL_ENABLE;

  FUNCTION is_geodetic(srid IN NUMBER,
                       srid_type IN VARCHAR2 DEFAULT NULL)
    RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE;
  PRAGMA restrict_references(is_geodetic, wnds, rnps, wnps, trust);

  FUNCTION get_dims(srid IN NUMBER)
    RETURN NUMBER DETERMINISTIC PARALLEL_ENABLE;
  PRAGMA restrict_references(get_dims, wnds, rnps, wnps, trust);

  FUNCTION get_ref_kind(srid IN NUMBER)
    RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE;
  PRAGMA restrict_references(get_ref_kind, wnds, rnps, wnps, trust);

END mdprvt_srid;
/