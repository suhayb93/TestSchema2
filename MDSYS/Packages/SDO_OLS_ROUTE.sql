CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.sdo_ols_route AUTHID current_user AS

  FUNCTION maneuverOracleToOpenLS(
    oracle          XMLTYPE,
    openls_version  VARCHAR2)
      RETURN XMLTYPE;

  FUNCTION makeOpenLS10Request(
    request XMLTYPE)
      RETURN XMLTYPE;

END sdo_ols_route;
/