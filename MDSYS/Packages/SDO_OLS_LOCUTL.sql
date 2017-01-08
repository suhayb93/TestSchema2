CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.sdo_ols_locutl AUTHID current_user AS

  FUNCTION geocodeSingleAdr(
    addressInRequest  XMLTYPE,
    openLsVersion     VARCHAR2)
      RETURN XMLTYPE;

  FUNCTION makeOpenLS10Request(
    request XMLTYPE)
      RETURN XMLTYPE;

END sdo_ols_locutl;
/