CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_GEOR_SRS
                                                                      
AS OBJECT
(
   isReferenced        VARCHAR2(5),
   isRectified         VARCHAR2(5),
   isOrthoRectified    VARCHAR2(5),
   srid                NUMBER,
   spatialResolution   SDO_NUMBER_ARRAY,
   spatialTolerance    NUMBER,
   coordLocation       NUMBER,
   rowOff              NUMBER,
   columnOff           NUMBER,
   xOff                NUMBER,
   yOff                NUMBER,
   zOff                NUMBER,
   rowScale            NUMBER,
   columnScale         NUMBER,
   xScale              NUMBER,
   yScale              NUMBER,
   zScale              NUMBER,
   rowRMS              NUMBER,
   columnRMS           NUMBER,
   totalRMS            NUMBER,
   rowNumerator        SDO_NUMBER_ARRAY,
   rowDenominator      SDO_NUMBER_ARRAY,
   columnNumerator     SDO_NUMBER_ARRAY,
   columnDenominator   SDO_NUMBER_ARRAY)
 ALTER TYPE SDO_GEOR_SRS ADD
    CONSTRUCTOR FUNCTION SDO_GEOR_SRS(SELF IN OUT NOCOPY SDO_GEOR_SRS)
    RETURN SELF AS RESULT
 ALTER TYPE SDO_GEOR_SRS ADD attribute (
   xRMS                NUMBER,
   yRMS                NUMBER,
   zRMS                NUMBER,
   modelTotalRMS       NUMBER,
   GCPgeoreferenceModel SDO_GEOR_GCPGEOREFTYPE)
 ALTER TYPE SDO_GEOR_SRS ADD
     CONSTRUCTOR FUNCTION SDO_GEOR_SRS(
   isReferenced        VARCHAR2,
   isRectified         VARCHAR2,
   isOrthoRectified    VARCHAR2,
   srid                NUMBER,
   spatialResolution   SDO_NUMBER_ARRAY,
   spatialTolerance    NUMBER,
   coordLocation       NUMBER,
   rowOff              NUMBER,
   columnOff           NUMBER,
   xOff                NUMBER,
   yOff                NUMBER,
   zOff                NUMBER,
   rowScale            NUMBER,
   columnScale         NUMBER,
   xScale              NUMBER,
   yScale              NUMBER,
   zScale              NUMBER,
   rowRMS              NUMBER,
   columnRMS           NUMBER,
   totalRMS            NUMBER,
   rowNumerator        SDO_NUMBER_ARRAY,
   rowDenominator      SDO_NUMBER_ARRAY,
   columnNumerator     SDO_NUMBER_ARRAY,
   columnDenominator   SDO_NUMBER_ARRAY)
   RETURN SELF AS RESULT
/
CREATE OR REPLACE TYPE BODY mdsys.SDO_GEOR_SRS AS
 CONSTRUCTOR FUNCTION SDO_GEOR_SRS(SELF IN OUT NOCOPY SDO_GEOR_SRS)
   RETURN SELF AS RESULT IS
   BEGIN
     SELF.isReferenced := 'FALSE';
     RETURN;
   END;
 CONSTRUCTOR FUNCTION SDO_GEOR_SRS(
   isReferenced        VARCHAR2,
   isRectified         VARCHAR2,
   isOrthoRectified    VARCHAR2,
   srid                NUMBER,
   spatialResolution   SDO_NUMBER_ARRAY,
   spatialTolerance    NUMBER,
   coordLocation       NUMBER,
   rowOff              NUMBER,
   columnOff           NUMBER,
   xOff                NUMBER,
   yOff                NUMBER,
   zOff                NUMBER,
   rowScale            NUMBER,
   columnScale         NUMBER,
   xScale              NUMBER,
   yScale              NUMBER,
   zScale              NUMBER,
   rowRMS              NUMBER,
   columnRMS           NUMBER,
   totalRMS            NUMBER,
   rowNumerator        SDO_NUMBER_ARRAY,
   rowDenominator      SDO_NUMBER_ARRAY,
   columnNumerator     SDO_NUMBER_ARRAY,
   columnDenominator   SDO_NUMBER_ARRAY)
   RETURN SELF AS RESULT IS
   BEGIN
     SELF.isReferenced      :=isReferenced;
     SELF.isRectified       :=isRectified;
     SELF.isOrthoRectified  :=isOrthoRectified;
     SELF.srid              :=srid;
     SELF.spatialResolution :=spatialResolution;
     SELF.spatialTolerance  :=spatialTolerance;
     SELF.coordLocation     :=coordLocation;
     SELF.rowOff            :=rowOff;
     SELF.columnOff         :=columnOff;
     SELF.xOff              :=xOff;
     SELF.yOff              :=yOff;
     SELF.zOff              :=zOff;
     SELF.rowScale          :=rowScale;
     SELF.columnScale       :=columnScale;
     SELF.xScale            :=xScale;
     SELF.yScale            :=yScale;
     SELF.zScale            :=zScale;
     SELF.rowRMS            :=rowRMS;
     SELF.columnRMS         :=columnRMS;
     SELF.totalRMS          :=totalRMS;
     SELF.rowNumerator      :=rowNumerator;
     SELF.rowDenominator    :=rowDenominator;
     SELF.columnNumerator   :=columnNumerator;
     SELF.columnDenominator :=columnDenominator;
     RETURN;
   END;
END;
/