CREATE OR REPLACE NONEDITIONABLE type mdsys.SDO_geo_addr
                                      
as object ( id                  NUMBER,
            addresslines        SDO_KEYWORDARRAY,
            placeName           VARCHAR2(200),
            streetName          VARCHAR2(200),
            intersectStreet     VARCHAR2(200),
            secUnit             VARCHAR2(200),
            settlement          VARCHAR2(200),
            municipality        VARCHAR2(200),
            region              VARCHAR2(200),
            country             VARCHAR2(100),
            postalCode          VARCHAR2(20),
            postalAddonCode     VARCHAR2(20),
            fullPostalCode      VARCHAR2(40),
            poBox               VARCHAR2(100),
            houseNumber         VARCHAR2(100),
            baseName            VARCHAR2(200),
            streetType          VARCHAR2(20),
            streetTypeBefore    VARCHAR2(1),
            streetTypeAttached  VARCHAR2(1),
            streetPrefix        VARCHAR2(20),
            streetSuffix        VARCHAR2(20),
            side                VARCHAR2(1),
            percent             NUMBER,
            edgeId              NUMBER,
            errorMessage        VARCHAR2(20),
            matchcode           NUMBER,
            matchmode           VARCHAR2(30),
            longitude           NUMBER,
            latitude            NUMBER,
  CONSTRUCTOR FUNCTION SDO_GEO_ADDR RETURN SELF AS RESULT DETERMINISTIC,
  CONSTRUCTOR FUNCTION SDO_GEO_ADDR(country VARCHAR2, lines SDO_KEYWORDARRAY,
   matchmode VARCHAR2) RETURN SELF AS RESULT DETERMINISTIC,
  CONSTRUCTOR FUNCTION SDO_GEO_ADDR(country VARCHAR2, matchmode VARCHAR2,
    street VARCHAR2, settlement VARCHAR2, municipality VARCHAR2,
   region VARCHAR2, postalcode VARCHAR2) RETURN SELF AS RESULT DETERMINISTIC)
 alter type sdo_geo_addr add attribute(matchVector VARCHAR2(20)) cascade
 alter type sdo_geo_addr add attribute(srid NUMBER) cascade
  alter type sdo_geo_addr add Constructor
  FUNCTION SDO_GEO_ADDR( id                  NUMBER,
 addresslines        SDO_KEYWORDARRAY, placeName           VARCHAR2,
 streetName          VARCHAR2, intersectStreet     VARCHAR2,
 secUnit             VARCHAR2, settlement          VARCHAR2,
 municipality        VARCHAR2, region              VARCHAR2,
 country             VARCHAR2, postalCode          VARCHAR2,
 postalAddonCode     VARCHAR2, fullPostalCode      VARCHAR2,
 poBox               VARCHAR2, houseNumber         VARCHAR2,
 baseName            VARCHAR2, streetType          VARCHAR2,
 streetTypeBefore    VARCHAR2,
 streetTypeAttached  VARCHAR2, streetPrefix        VARCHAR2,
 streetSuffix        VARCHAR2, side                VARCHAR2,
 percent             NUMBER, edgeId              NUMBER,
 errorMessage        VARCHAR2, matchcode           NUMBER,
 matchmode VARCHAR2, longitude  NUMBER, latitude   NUMBER)
  RETURN SELF as RESULT DETERMINISTIC CASCADE
  alter type sdo_geo_addr add Constructor
  FUNCTION SDO_GEO_ADDR( id                  NUMBER,
 addresslines        SDO_KEYWORDARRAY, placeName           VARCHAR2,
 streetName          VARCHAR2, intersectStreet     VARCHAR2,
 secUnit             VARCHAR2, settlement          VARCHAR2,
 municipality        VARCHAR2, region              VARCHAR2,
 country             VARCHAR2, postalCode          VARCHAR2,
 postalAddonCode     VARCHAR2, fullPostalCode      VARCHAR2,
 poBox               VARCHAR2, houseNumber         VARCHAR2,
 baseName            VARCHAR2, streetType          VARCHAR2,
 streetTypeBefore    VARCHAR2,
 streetTypeAttached  VARCHAR2, streetPrefix        VARCHAR2,
 streetSuffix        VARCHAR2, side                VARCHAR2,
 percent             NUMBER, edgeId              NUMBER,
 errorMessage        VARCHAR2, matchcode           NUMBER,
 matchmode VARCHAR2, longitude  NUMBER, latitude   NUMBER,
 matchVector VARCHAR2)
  RETURN SELF as RESULT DETERMINISTIC CASCADE
/
CREATE OR REPLACE type body mdsys.sdo_geo_addr as
  CONSTRUCTOR FUNCTION SDO_GEO_ADDR
    RETURN SELF AS RESULT
  AS
  BEGIN
    return ;
  END ;
  CONSTRUCTOR FUNCTION SDO_GEO_ADDR(
    country VARCHAR2, lines SDO_KEYWORDARRAY, matchmode VARCHAR2)
    RETURN SELF AS RESULT
  AS
  BEGIN
    SELF.id := 1 ;
    SELF.country := country ;
    SELF.addresslines := lines ;
    SELF.matchmode := matchmode ;
    return ;
  END ;
  CONSTRUCTOR FUNCTION SDO_GEO_ADDR(
    country VARCHAR2, matchmode VARCHAR2, street VARCHAR2, settlement VARCHAR2,
    municipality VARCHAR2, region VARCHAR2, postalcode VARCHAR2)
    RETURN SELF AS RESULT
  AS
  BEGIN
    SELF.id := 1;
    SELF.country := country ;
    SELF.matchmode := matchmode ;
    SELF.streetname := street ;
    SELF.settlement := settlement ;
    SELF.municipality := municipality ;
    SELF.region := region ;
    SELF.postalcode := postalcode ;
    RETURN ;
  END;

  CONSTRUCTOR FUNCTION SDO_GEO_ADDR( id                  NUMBER,
     addresslines        SDO_KEYWORDARRAY, placeName           VARCHAR2,
     streetName          VARCHAR2, intersectStreet     VARCHAR2,
     secUnit             VARCHAR2, settlement          VARCHAR2,
     municipality        VARCHAR2, region              VARCHAR2,
     country             VARCHAR2, postalCode          VARCHAR2,
     postalAddonCode     VARCHAR2, fullPostalCode      VARCHAR2,
     poBox               VARCHAR2, houseNumber         VARCHAR2,
     baseName            VARCHAR2, streetType          VARCHAR2,
     streetTypeBefore    VARCHAR2,
     streetTypeAttached  VARCHAR2, streetPrefix        VARCHAR2,
     streetSuffix        VARCHAR2, side                VARCHAR2,
     percent             NUMBER, edgeId              NUMBER,
     errorMessage        VARCHAR2, matchcode           NUMBER,
     matchmode VARCHAR2, longitude  NUMBER, latitude   NUMBER)
  RETURN SELF AS RESULT AS
  BEGIN
   self.id := id;
   self.addresslines := addresslines;
   self.placeName := placeName;
   self.streetName := streetName;
   self.intersectStreet := intersectStreet;
   self.secUnit := secUnit;
   self.settlement := settlement;
   self.municipality := municipality;
   self.region := region;
   self.country := country;
   self.postalCode := postalCode;
   self.postalAddonCode := postalAddonCode;
   self.fullPostalCode := fullPostalCode;
   self.poBox := poBox;
   self.houseNumber := houseNumber;
   self.baseName := baseName;
   self.streetType := streetType;
   self.streetTypeBefore := streetTypeBefore;
   self.streetTypeAttached := streetTypeAttached;
   self.streetPrefix := streetPrefix;
   self.streetSuffix := streetSuffix;
   self.side := side;
   self.percent := percent;
   self.edgeId := edgeId;
   self.errorMessage := errorMessage;
   self.matchcode := matchcode;
   self.matchmode := matchmode;
   self.longitude := longitude;
   self.latitude := latitude;

   RETURN;
  END;

  CONSTRUCTOR FUNCTION SDO_GEO_ADDR( id                  NUMBER,
     addresslines        SDO_KEYWORDARRAY, placeName           VARCHAR2,
     streetName          VARCHAR2, intersectStreet     VARCHAR2,
     secUnit             VARCHAR2, settlement          VARCHAR2,
     municipality        VARCHAR2, region              VARCHAR2,
     country             VARCHAR2, postalCode          VARCHAR2,
     postalAddonCode     VARCHAR2, fullPostalCode      VARCHAR2,
     poBox               VARCHAR2, houseNumber         VARCHAR2,
     baseName            VARCHAR2, streetType          VARCHAR2,
     streetTypeBefore    VARCHAR2,
     streetTypeAttached  VARCHAR2, streetPrefix        VARCHAR2,
     streetSuffix        VARCHAR2, side                VARCHAR2,
     percent             NUMBER, edgeId              NUMBER,
     errorMessage        VARCHAR2, matchcode           NUMBER,
     matchmode VARCHAR2, longitude  NUMBER, latitude   NUMBER,
     matchVector VARCHAR2)
  RETURN SELF AS RESULT AS
  BEGIN
   self.id := id;
   self.addresslines := addresslines;
   self.placeName := placeName;
   self.streetName := streetName;
   self.intersectStreet := intersectStreet;
   self.secUnit := secUnit;
   self.settlement := settlement;
   self.municipality := municipality;
   self.region := region;
   self.country := country;
   self.postalCode := postalCode;
   self.postalAddonCode := postalAddonCode;
   self.fullPostalCode := fullPostalCode;
   self.poBox := poBox;
   self.houseNumber := houseNumber;
   self.baseName := baseName;
   self.streetType := streetType;
   self.streetTypeBefore := streetTypeBefore;
   self.streetTypeAttached := streetTypeAttached;
   self.streetPrefix := streetPrefix;
   self.streetSuffix := streetSuffix;
   self.side := side;
   self.percent := percent;
   self.edgeId := edgeId;
   self.errorMessage := errorMessage;
   self.matchcode := matchcode;
   self.matchmode := matchmode;
   self.longitude := longitude;
   self.latitude := latitude;
   self.matchVector := matchVector;

   RETURN;
  END;

end;
/