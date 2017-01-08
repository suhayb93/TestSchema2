CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.sdo_ols_presentation AUTHID current_user AS

  FUNCTION makeOpenLS10Request(
    request XMLTYPE)
      RETURN XMLTYPE;

  FUNCTION specify_theme_for_mapviewer(
    openls_layer    XMLTYPE,
    openls_version  VARCHAR2)
      RETURN XMLTYPE;

  FUNCTION specify_poi_for_mapviewer(
    openls_poi      XMLTYPE,
    openls_version  VARCHAR2)
      RETURN XMLTYPE;

END sdo_ols_presentation;
/