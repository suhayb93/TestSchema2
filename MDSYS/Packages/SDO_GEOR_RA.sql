CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.SDO_GEOR_RA AUTHID CURRENT_USER AS

--
-- Math Operator constants
--
   OPERATOR_ADD               CONSTANT PLS_INTEGER := 0;
   OPERATOR_ADDCONST          CONSTANT PLS_INTEGER := 1;
   OPERATOR_SUBTRACT          CONSTANT PLS_INTEGER := 2;
   OPERATOR_SUBTRACTCONST     CONSTANT PLS_INTEGER := 3;
   OPERATOR_MULTIPLY          CONSTANT PLS_INTEGER := 4;
   OPERATOR_MULTIPLYCONST     CONSTANT PLS_INTEGER := 5;
   OPERATOR_DIVIDE            CONSTANT PLS_INTEGER := 6;
   OPERATOR_DIVIDECONST       CONSTANT PLS_INTEGER := 7;
   OPERATOR_ABSOLUTE          CONSTANT PLS_INTEGER := 8;
   OPERATOR_INVERT            CONSTANT PLS_INTEGER := 9;
   OPERATOR_LOG               CONSTANT PLS_INTEGER := 10;
   OPERATOR_EXP               CONSTANT PLS_INTEGER := 11;



--
-- NAME:
--      findCells procedure
--
-- DESCRIPTION
--       generate a new georaster object based on the "condition" parameter.
--       The "condition" parameter is a boolean expression, for each pixel
--       in the inGeoRaster, the value of corresponding pixel of outGeoraster
--       is same, if "condition" is true, otherwise bgValues is used to set
--       the pixel's value of outGeoraster.
--
--
-- ARGUMENTS
--      inGeoRaster    - The SDO_GEORASTER object to be applied with condition
--      condition      - A boolean expression used to filter out pixels, the
--                       syntax details are explained in GeoRaster Manual
--      storageParam   - A string specifying storage parameters for the target
--                       georaster object. The details are explained in GeoRaster
--                       Manual
--      outGeoRaster   - The new GeoRaster Object
--      bgValues       - background values for filling pixels which make
--                       conditon return false, if it is null, then 0 will
--                       be used as background color.
--      nodata         - if 'true', then keep original value for all nodata pixel
--                       if 'false',then treat nodata as regular data.
--      parallelParam     - specify if executing operations in parallel if
--                       possible, but note if parameter parallelParam is 'true',
--                       then some execution units of this procedure will run
--                       as autonomous transactions, that means some changes
--                       are submitted and you can't rollback.
--                       You can fully rollback all of your changes if
--                       parameter parallelParam is 'false'.
--
-- RETURNS
--
PROCEDURE findCells
(
   inGeoRaster  IN      mdsys.SDO_GEORASTER,
   condition    IN      VARCHAR2,
   storageParam IN      VARCHAR2,
   outGeoraster IN OUT  mdsys.SDO_GEORASTER,
   bgValues     IN      SDO_NUMBER_ARRAY DEFAULT NULL,
   nodata       IN      VARCHAR2 DEFAULT 'false',
   parallelParam IN     VARCHAR2 DEFAULT NULL
);


-- NAME:
--      classify procedure
--
-- DESCRIPTION
--      Generate a new GeoRaster object after applying classification operation on the source GeoRaster object.
--
-- ARGUMENTS
--      inGeoRasters   - GeoRaster cursor.
--      expression     - A math expression used to classify cell values, the
--                       syntax details are explained in GeoRaster Manual
--      rangeArray     - A number array, which defines ranges to classify cell
--                       values, it must have at least one element.
--      valueArray     - A number array, which defines target cell value for
--                       each range. it's length must be "length of rangeArray"+1
--      storageParam   - A string specifying storage parameters for the copy
--                       The details are explained in GeoRaster Manual
--      outGeoRaster   - The new GeoRaster Object
--      nodata         - if 'true', then assign nodataValue to all nodata pixels in the target georaster
--                       if 'false',then treat all nodata as regular data.
--      nodataValue    - nodata value in the target georaster object,if nodataValue is null then 0 is used for nodataValue
--      parallelParam     - specify if executing operations in parallel if
--                       possible, but note if parameter parallelParam is 'true',
--                       then some execution units of this procedure will run
--                       as autonomous transactions, that means some changes
--                       are submitted and can't be rollback.
--                       You can fully rollback all of your changes if
--                       parameter parallelParam is 'false'.
--
-- RETURNS
--
PROCEDURE classify
(
   inGeoRasters IN      SYS_REFCURSOR,
   expression   IN      VARCHAR2,
   rangeArray   IN      SDO_NUMBER_ARRAY,
   valueArray   IN      SDO_NUMBER_ARRAY,
   storageParam IN      VARCHAR2,
   outGeoraster IN OUT  mdsys.SDO_GEORASTER,
   nodata       IN      VARCHAR2 DEFAULT 'false',
   nodataValue  IN      NUMBER default 0,
   parallelParam   IN      VARCHAR2 DEFAULT NULL
);

-- NAME:
--      classify procedure
--
-- DESCRIPTION
--      Generate a new GeoRaster object after applying classification operation on the source GeoRaster object.
--
-- ARGUMENTS
--      inGeoRaster    - GeoRaster object.
--      expression     - A math expression used to classify cell values, the
--                       syntax details are explained in GeoRaster Manual
--      rangeArray     - A number array, which defines ranges to classify cell
--                       values, it must have at least one element.
--      valueArray     - A number array, which defines target cell value for
--                       each range. it's length must be "length of rangeArray"+1
--      storageParam   - A string specifying storage parameters for the copy
--                       The details are explained in GeoRaster Manual
--      outGeoRaster   - The new GeoRaster Object
--      nodata         - if 'true', then assign nodataValue to all nodata pixels in the target georaster
--                       if 'false',then treat all nodata as regular data.
--      nodataValue    - nodata value in the target georaster object,if nodataValue is null then 0 is used for nodataValue
--      parallelParam     - specify if executing operations in parallel if
--                       possible, but note if parameter parallelParam is 'true',
--                       then some execution units of this procedure will run
--                       as autonomous transactions, that means some changes
--                       are submitted and can't be rollback.
--                       You can fully rollback all of your changes if
--                       parameter parallelParam is 'false'.
--
-- RETURNS
--
PROCEDURE classify
(
   inGeoRaster  IN      mdsys.SDO_GEORASTER,
   expression   IN      VARCHAR2,
   rangeArray   IN      SDO_NUMBER_ARRAY,
   valueArray   IN      SDO_NUMBER_ARRAY,
   storageParam IN      VARCHAR2,
   outGeoraster IN OUT  mdsys.SDO_GEORASTER,
   nodata       IN      VARCHAR2 DEFAULT 'false',
   nodataValue  IN      NUMBER default 0,
   parallelParam   IN      VARCHAR2 DEFAULT NULL
);

-- NAME:
--      classify procedure
--
-- DESCRIPTION
--      Generate a new GeoRaster object after applying classification operation on the source GeoRaster objects.
--
-- ARGUMENTS
--      georArray      - An array of GeoRaster objects.
--      expression     - A math expression used to classify cell values, the
--                       syntax details are explained in GeoRaster Manual
--      rangeArray     - A number array, which defines ranges to classify cell
--                       values, it must have at least one element.
--      valueArray     - A number array, which defines target cell value for
--                       each range. it's length must be "length of rangeArray"+1
--      storageParam   - A string specifying storage parameters for the copy
--                       The details are explained in GeoRaster Manual
--      outGeoRaster   - The new GeoRaster Object
--      nodata         - if 'true', then assign nodataValue to all nodata pixels in the target georaster
--                       if 'false',then treat all nodata as regular data.
--      nodataValue    - nodata value in the target georaster object,if nodataValue is null then 0 is used for nodataValue
--      parallelParam     - specify if executing operations in parallel if
--                       possible, but note if parameter parallelParam is 'true',
--                       then some execution units of this procedure will run
--                       as autonomous transactions, that means some changes
--                       are submitted and can't be rollback.
--                       You can fully rollback all of your changes if
--                       parameter parallelParam is 'false'.
--
-- RETURNS
--
PROCEDURE classify
(
   georArray    IN      SDO_GEORASTER_ARRAY,
   expression   IN      VARCHAR2,
   rangeArray   IN      SDO_NUMBER_ARRAY,
   valueArray   IN      SDO_NUMBER_ARRAY,
   storageParam IN      VARCHAR2,
   outGeoraster IN OUT  mdsys.SDO_GEORASTER,
   nodata       IN      VARCHAR2 DEFAULT 'false',
   nodataValue  IN      NUMBER default 0,
   parallelParam IN      VARCHAR2 DEFAULT NULL
);

--
-- NAME:
--      rasterMathOp procedure
--
-- DESCRIPTION
--      generate a new georaster object from input georaster objects
--      and math operations, the target georaster object is stored
--      based on the parameter storageParam.
--
-- ARGUMENTS
--      inGeoRaster     - The source SDO_GEORASTER object
--      operation       - An array of varying length Oracle STRING,each STRING
--                        is a valid expression, which is mapping to a target
--                        band in the target georaster object, and specifies
--                        how to calculate cell value based on source georaster
--                        objects.
--      storageParam    - A string specifying storage parameters for the copy
--                        The details are explained in GeoRaster Manual
--      outGeoRaster    - The new GeoRaster Object
--      nodata         - if 'true', then assign nodataValue to all nodata pixels in the target georaster
--                       if 'false',then treat all nodata as regular data.
--      nodataValue    - nodata value in the target georaster object,if nodataValue is null then 0 is used for nodataValue
--      parallelParam     - specify if executing operations in parallel if
--                       possible, but note if parameter parallelParam is 'true',
--                       then some execution units of this procedure will run
--                       as autonomous transactions, that means some changes
--                       are submitted and can't be rollback.
--                       You can fully rollback all of your changes if
--                       parameter parallelParam is 'false'.
--
--
PROCEDURE rasterMathOp
(
   inGeoRaster   IN      mdsys.SDO_GEORASTER,
   operation     IN      SDO_STRING2_ARRAY,
   storageParam  IN      VARCHAR2,
   outGeoraster  IN OUT  mdsys.SDO_GEORASTER,
   nodata        IN      VARCHAR2 DEFAULT 'false',
   nodataValue   IN      NUMBER default 0,
   parallelParam IN      VARCHAR2 DEFAULT NULL
);

--
-- NAME:
--      rasterMathOp procedure
--
-- DESCRIPTION
--      generate a new georaster object from input georaster objects
--      and math operations, the target georaster object is stored
--      based on the parameter storageParam.
--
-- ARGUMENTS
--      inGeoRasters    - GeoRaster cursor.
--      operation       - An array of varying length Oracle STRING,each STRING
--                        is a valid expression, which is mapping to a target
--                        band in the target georaster object, and specifies
--                        how to calculate cell value based on source georaster
--                        objects.
--      storageParam    - A string specifying storage parameters for the copy
--                        The details are explained in GeoRaster Manual
--      outGeoRaster    - The new GeoRaster Object
--      nodata         - if 'true', then assign nodataValue to all nodata pixels in the target georaster
--                       if 'false',then treat all nodata as regular data.
--      nodataValue    - nodata value in the target georaster object,if nodataValue is null then 0 is used for nodataValue
--      parallelParam     - specify if executing operations in parallel if
--                       possible, but note if parameter parallelParam is 'true',
--                       then some execution units of this procedure will run
--                       as autonomous transactions, that means some changes
--                       are submitted and can't be rollback.
--                       You can fully rollback all of your changes if
--                       parameter parallelParam is 'false'.
--
--
PROCEDURE rasterMathOp
(
   inGeoRasters  IN      SYS_REFCURSOR,
   operation     IN      SDO_STRING2_ARRAY,
   storageParam  IN      VARCHAR2,
   outGeoraster  IN OUT  mdsys.SDO_GEORASTER,
   nodata        IN      VARCHAR2 DEFAULT 'false',
   nodataValue   IN      NUMBER default 0,
   parallelParam IN      VARCHAR2 DEFAULT NULL
);

--
-- NAME:
--      rasterMathOp procedure
--
-- DESCRIPTION
--      generate a new georaster object from input georaster objects
--      and math operations, the target georaster object is stored
--      based on the parameter storageParam.
--
-- ARGUMENTS
--      georArray       - An array of GeoRaster objects.
--      operation       - An array of varying length Oracle STRING,each STRING
--                        is a valid expression, which is mapping to a target
--                        band in the target georaster object, and specifies
--                        how to calculate cell value based on source georaster
--                        objects.
--      storageParam    - A string specifying storage parameters for the copy
--                        The details are explained in GeoRaster Manual
--      outGeoRaster    - The new GeoRaster Object
--      nodata         - if 'true', then assign nodataValue to all nodata pixels in the target georaster
--                       if 'false',then treat all nodata as regular data.
--      nodataValue    - nodata value in the target georaster object,if nodataValue is null then 0 is used for nodataValue
--      parallelParam     - specify if executing operations in parallel if
--                       possible, but note if parameter parallelParam is 'true',
--                       then some execution units of this procedure will run
--                       as autonomous transactions, that means some changes
--                       are submitted and can't be rollback.
--                       You can fully rollback all of your changes if
--                       parameter parallelParam is 'false'.
--
--
PROCEDURE rasterMathOp
(
   georArray     IN      SDO_GEORASTER_ARRAY,
   operation     IN      SDO_STRING2_ARRAY,
   storageParam  IN      VARCHAR2,
   outGeoraster  IN OUT  mdsys.SDO_GEORASTER,
   nodata        IN      VARCHAR2 DEFAULT 'false',
   nodataValue   IN      NUMBER default 0,
   parallelParam IN      VARCHAR2 DEFAULT NULL
);




--
-- NAME:
--      rasterMathOp procedure
--
-- DESCRIPTION
--      apply mathematical operation on two or one georatser objects
--
-- ARGUMENTS
--      geoRaster0     - The left operand
--      geoRaster1     - The right operand
--      constant       - constant value for some operators like addConst,divideConst.
--      operator       - operator which should be one of math operators defined in the package
--      storageParam   - A string specifying storage parameters for the target georaster object
--                       The details are explained in GeoRaster Manual
--      outGeoRaster   - The new GeoRaster Object
--      bgValues       - background values for sparse data
--      nodata         - if 'true', then assign nodataValue to all nodata pixels in the target georaster
--                       if 'false',then treat all nodata as regular data.
--      nodataValue    - nodata value in the target georaster object,if nodataValue is null then 0 is used for nodataValue
--      parallelParam     - specify if executing operations in parallel if
--                       possible, but note if parameter parallelParam is 'true',
--                       then some execution units of this procedure will run
--                       as autonomous transactions, that means some changes
--                       are submitted and you can't rollback.
--                       You can fully rollback all of your changes if
--                       parameter parallelParam is 'false'.
--
-- RETURNS
--

PROCEDURE rasterMathOp
(
   georaster0   IN      mdsys.SDO_GEORASTER,
   georaster1   IN      mdsys.SDO_GEORASTER,
   constant     IN      NUMBER,
   operator     IN      PLS_INTEGER,
   storageParam IN      VARCHAR2,
   outGeoraster IN OUT  mdsys.SDO_GEORASTER,
   bgValues     IN      SDO_NUMBER_ARRAY DEFAULT NULL,
   nodata       IN      VARCHAR2 DEFAULT 'false',
   nodataValue  IN      NUMBER default 0,
   parallelParam IN      VARCHAR2 DEFAULT NULL
);



--
-- NAME:
--      rasterUpdate procedure
--
-- DESCRIPTION
--       Based on conditions and expressions to update raster cellValue.
--       The "condition" parameter is a array of boolean expressions,
--       the "values" parameter is a array of arrays of math expressions,
--       for each pixel, if a "condition" is true, then it's value
--       will get updated based on calculation of corresponding array of
--       math expression.
--
--
-- ARGUMENTS
--      geoRaster      - The SDO_GEORASTER object to be updated based on conditions
--      pyramidLevel   - specifiy which pyramid level gets updated, if null, then all
--                       pyramid levels get updated
--      condition      - A array of boolean expressions to pick pixels, the
--                       syntax details are explained in GeoRaster Manual
--      values         - A array of arrays of math expressions,the outer array is
--                       corresponding to each conditions, and inner array is
--                       corresponding to each band
--      bgValues       - background values
--      nodata         - if 'true', then keep original value for all nodata
--                       if 'false',then treat nodata as regular data.
--      parallelParam     - specify if executing operations in parallel if
--                       possible, but note if parameter parallelParam is 'true',
--                       then some execution units of this procedure will run
--                       as autonomous transactions, that means some changes
--                       are submitted and you can't rollback.
--                       You can fully rollback all of your changes if
--                       parameter parallelParam is 'false'.
--
-- RETURNS
--
PROCEDURE rasterUpdate
(
   geoRaster    IN out  mdsys.SDO_GEORASTER,
   pyramidLevel IN      NUMBER,
   conditions   IN      SDO_STRING2_ARRAY,
   vals         IN      SDO_STRING2_ARRAYSET,
   bgValues     IN      SDO_NUMBER_ARRAY DEFAULT NULL,
   nodata       IN      VARCHAR2 DEFAULT 'false',
   parallelParam IN     VARCHAR2 DEFAULT NULL
);


--
-- NAME:
--      isOverlap
--
-- DESCRIPTION
--       This helper function will check if two georaster objects have .
--       same row/column dimension sizes, and if they are overlapped in
--       the model space if they are georeferenced
--
--
-- ARGUMENTS
--      geoRaster1      - The SDO_GEORASTER 1
--      geoRaster2      - The SDO_GEORASTER 2
--      tolerance       - Specifies the tolerance used to decide if two pixels in cell space are
--                        overlapped in the model spce. The value should be between 0
--                        and 1 and is in pixel unit. for example, 0.5 means half pixel.
--
-- RETURNS
--   'TRUE' if overlapped, otherwise 'FALSE'

FUNCTION isOverlap
(
  georaster1 IN mdsys.SDO_GEORASTER,
  georaster2 IN mdsys.SDO_GEORASTER,
  tolerance  IN NUMBER default 0.5
)
RETURN VARCHAR2  DETERMINISTIC PARALLEL_ENABLE;

--
-- NAME:
--      isOverlap
--
-- DESCRIPTION
--       This helper function will check if an array of georaster objects have .
--       same row/column dimension sizes, and if they are overlapped in
--       the model space if they are georeferenced
--
--
-- ARGUMENTS
--      geor_array      - The SDO_GEORASTER array
--      tolerance       - Specifies the tolerance used to decide if two pixels in cell space are
--                        overlapped in the model spce. The value should be between 0
--                        and 1 and is in pixel unit. for example, 0.5 means half pixel.
--
-- RETURNS
--   'TRUE' if overlapped, otherwise 'FALSE'

FUNCTION isOverlap
(
  georArray  IN SDO_GEORASTER_ARRAY,
  tolerance  IN NUMBER default 0.5
)
RETURN VARCHAR2  DETERMINISTIC PARALLEL_ENABLE;

--
-- NAME:
--      isOverlap
--
-- DESCRIPTION
--       This helper function will check if a cursor of georaster objects have .
--       same row/column dimension sizes, and if they are overlapped in
--       the model space if they are georeferenced
--
--
-- ARGUMENTS
--      geor_cur        - The SDO_GEORASTER cursor
--      tolerance       - Specifies the tolerance used to decide if two pixels in cell space are
--                        overlapped in the model spce. The value should be between 0
--                        and 1 and is in pixel unit. for example, 0.5 means half pixel.
--
-- RETURNS
--   'TRUE' if overlapped, otherwise 'FALSE'

FUNCTION isOverlap
(
  geor_cur   IN SYS_REFCURSOR,
  tolerance  IN NUMBER default 0.5
)
RETURN VARCHAR2  DETERMINISTIC PARALLEL_ENABLE;


END SDO_GEOR_RA;
/