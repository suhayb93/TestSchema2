CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_GEOR_GCP
                                                                      
AS OBJECT
(
   pointID            VARCHAR2(32),
   description        VARCHAR2(256),
  -- can not use binary_integer
   pointType          NUMBER,
   cellDimension      NUMBER,
   cellCoordinates    SDO_NUMBER_ARRAY,
   modelDimension     NUMBER,
   modelCoordinates   SDO_NUMBER_ARRAY,
   accuracy           SDO_NUMBER_ARRAY,
   status             NUMBER,

   CONSTRUCTOR FUNCTION SDO_GEOR_GCP(SELF IN OUT NOCOPY SDO_GEOR_GCP)
     RETURN SELF AS RESULT
) 
/
CREATE OR REPLACE TYPE BODY mdsys.SDO_GEOR_GCP AS
 CONSTRUCTOR FUNCTION SDO_GEOR_GCP(SELF IN OUT NOCOPY SDO_GEOR_GCP)
     RETURN SELF AS RESULT IS
   BEGIN

     RETURN;
   END;
END;
/