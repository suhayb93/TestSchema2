CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.SDO_GEOR_AGGR AUTHID CURRENT_USER AS

--
-- NAME:
--      mosaicSubset procedure
--
-- DESCRIPTION
--      Subset from a set of source georaster objects.
--
-- ARGUMENTS
--      inGeoRasters     - The input source georaster objects in a cursor.
--      pyramidLevel     - The pyramid level, if NULL and outResolution is
--                         specified, use the outResolution to determine the
--                         pyramidLevel, otherwise defaults to 0.
--      outSRID          - The output georaster data's SRID.
--      outModelCoordLoc - The output georaster data's model coordinate
--                         location. If NULL, defaults to CENTER.
--      referencePoint   - The reference point of the mosaic. The mosaic result
--                         will align with this reference point. If this is
--                         null, the reference point implicitly uses the
--                         upper left corner of the cropArea, or when the
--                         cropArea is null, the upper left corner of the
--                         output extent.
--                         This reference point must be in a SDO_GEOMETRY that
--                         describes a point.
--      cropArea         - The output georaster data's window. If the
--                         sdo_geometry object has srid, the source georaster
--                         objects must be georeferenced, otherwise, the source
--                         georaster object can be georeferenced or non-
--                         georeferenced.
--      polygonClip      - Whether to do polygon clipping. If NULL, defaults
--                         to FALSE.
--      boundaryClip     - Whether to use the source data boundary to clip the
--                         cropArea. If false, the outside the source
--                         data area is filled with background value. If NULL,
--                         defaults to TRUE.
--      layerNumbers     - The layer numbers from the source georasters. If
--                         NULL, empty or has value of '0', all layers are
--                         included.
--      outResolutions   - Output georaster data's resolution. If NULL, defaults
--                         to the source data's resolution at the given
--                         pyramid level.
--      resolutionUnit   - The unit of the output resolution. If NULL, defaults
--                         to the unit of the output SRID. If outResolutions is
--                         NULL, this parameter is ignored. It must be in format
--                         of "unit=val" where val is the unit name.
--      mosaicParam      - The parameter related to mosaic
--      storageParam     - The storage parameter
--      outGeoRaster     - The output georaster object.
--      bgValues         - The background values for sparse data
--      parallelParam    - The parameter related to parallel processing.
--                         Currently we only support
--                           "parallel=DEFAULT": The database computes
--                              the degree of parallelism, which can be 2 or
--                              greater.
--                           "parallel=n": where n>1 is the degree of parallel.
--                              The database optimizer uses the degree of
--                              parallelism specified by n
--                           By default when this parameter is null, there is
--                           no parallel processing.
--
-- RETURNS
--
  PROCEDURE mosaicSubset(
     inGeoRasters       IN SYS_REFCURSOR,
     pyramidLevel       IN NUMBER,
     outSRID            IN NUMBER,
     outModelCoordLoc   IN NUMBER,
     referencePoint     IN mdsys.SDO_GEOMETRY,
     cropArea           IN mdsys.SDO_GEOMETRY,
     polygonClip        IN VARCHAR2,
     boundaryClip       IN VARCHAR2,
     layerNumbers       IN VARCHAR2,
     outResolutions     IN mdsys.SDO_NUMBER_ARRAY,
     resolutionUnit     IN VARCHAR2,
     mosaicParam        IN VARCHAR2,
     storageParam       IN VARCHAR2,
     outGeoRaster       IN OUT mdsys.SDO_GEORASTER,
     bgValues           IN mdsys.SDO_NUMBER_ARRAY DEFAULT NULL,
     parallelParam      IN VARCHAR2 DEFAULT NULL
     );

--
-- NAME:
--      mosaicSubset procedure
--
-- DESCRIPTION
--      Subset from a set of source georaster objects.
--
-- ARGUMENTS
--      georasterTableNames - The table names of the input georaster objects
--      georasterColumnNames - The column names of the input georaster objects
--      pyramidLevel     - The pyramid level, if NULL and outResolution is
--                         specified, use the outResolution to determine the
--                         pyramidLevel, otherwise defaults to 0.
--      outSRID          - The output georaster data's SRID.
--      outModelCoordLoc - The output georaster data's model coordinate
--                         location. If NULL, defaults to CENTER.
--      referencePoint   - The reference point of the mosaic. The mosaic result
--                         will align with this reference point. If this is
--                         null, the reference point implicitly uses the
--                         upper left corner of the cropArea, or when the
--                         cropArea is null, the upper left corner of the
--                         output extent.
--                         This reference point must be in a SDO_GEOMETRY that
--                         describes a point.
--      cropArea         - The output georaster data's window. If the
--                         sdo_geometry object has srid, the source georaster
--                         objects must be georeferenced, otherwise, the source
--                         georaster object can be georeferenced or non-
--                         georeferenced.
--      polygonClip      - Whether to do polygon clipping. If NULL, defaults
--                         to FALSE.
--      boundaryClip     - Whether to use the source data boundary to clip the
--                         cropArea. If false, the outside the source
--                         data area is filled with background value. If NULL,
--                         defaults to TRUE.
--      layerNumbers     - The layer numbers from the source georasters. If
--                         NULL, empty or has value of '0', all layers are
--                         included.
--      outResolutions   - Output georaster data's resolution. If NULL, defaults
--                         to the source data's resolution at the given
--                         pyramid level.
--      resolutionUnit   - The unit of the output resolution. If NULL, defaults
--                         to the unit of the output SRID. If outResolutions is
--                         NULL, this parameter is ignored.It must be in format
--                         of "unit=val" where val is the unit name.
--      mosaicParam      - The parameter related to mosaic
--      storageParam     - The storage parameter
--      outGeoRaster     - The output georaster object.
--      bgValues         - The background values for sparse data
--      parallelParam    - The parameter related to parallel processing.
--                         Currently we only support
--                           "parallel=DEFAULT": The database computes
--                              the degree of parallelism, which can be 2 or
--                              greater.
--                           "parallel=n": where n>1 is the degree of parallel.
--                              The database optimizer uses the degree of
--                              parallelism specified by n
--                           By default when this parameter is null, there is
--                           no parallel processing.
--
-- RETURNS
--
  PROCEDURE mosaicSubset(
     georasterTableNames IN VARCHAR2,
     georasterColumnNames IN VARCHAR2,
     pyramidLevel       IN NUMBER,
     outSRID            IN NUMBER,
     outModelCoordLoc   IN NUMBER,
     referencePoint     IN mdsys.SDO_GEOMETRY,
     cropArea           IN mdsys.SDO_GEOMETRY,
     polygonClip        IN VARCHAR2,
     boundaryClip       IN VARCHAR2,
     layerNumbers       IN VARCHAR2,
     outResolutions     IN mdsys.SDO_NUMBER_ARRAY,
     resolutionUnit     IN VARCHAR2,
     mosaicParam        IN VARCHAR2,
     storageParam       IN VARCHAR2,
     outGeoRaster       IN OUT mdsys.SDO_GEORASTER,
     bgValues           IN mdsys.SDO_NUMBER_ARRAY DEFAULT NULL,
     parallelParam      IN VARCHAR2 DEFAULT NULL
     );

--
-- NAME:
--      getMosaicSubset procedure
--
-- DESCRIPTION
--      Subset from a set of source georaster objects.
--
-- ARGUMENTS
--      inGeoRasters     - The input source georaster objects in a cursor.
--      pyramidLevel     - The pyramid level, if NULL and outResolution is
--                         specified, use the outResolution to determine the
--                         pyramidLevel, otherwise defaults to 0.
--      outSRID          - The output georaster data's SRID.
--      outModelCoordLoc - The output georaster data's model coordinate
--                         location. If NULL, defaults to CENTER.
--      referencePoint   - The reference point of the mosaic. The mosaic result
--                         will align with this reference point. If this is
--                         null, the reference point implicitly uses the
--                         left upper corner of the cropArea, or when the
--                         cropArea is null, the upper corner of the outArea.
--                         This reference point must be in a SDO_GEOMETRY that
--                         describes a point.
--      cropArea         - The output georaster data's window. If the
--                         sdo_geometry object has srid, the source georaster
--                         objects must be georeferenced, otherwise, the source
--                         georaster object can be georeferenced or non-
--                         georeferenced.
--      polygonClip      - Whether to do polygon clipping. If NULL, defaults
--                         to FALSE.
--      boundaryClip     - Whether to use the source data boundary to clip the
--                         cropArea. If false, the outside the source
--                         data area is filled with background value. If NULL,
--                         defaults to TRUE.
--      layerNumbers     - The layer numbers from the source georasters. If
--                         NULL, empty or has value of '0', all layers are
--                         included.
--      outResolutions   - Output georaster data's resolution. If NULL, defaults
--                         to the source data's resolution at the given
--                         pyramid level.
--      resolutionUnit   - The unit of the output resolution. If NULL, defaults
--                         to the unit of output SRID. If outResolutions is
--                         NULL, this parameter is ignored.It must be in format
--                         of "unit=val" where val is the unit name.
--      mosaicParam      - The parameter related to mosaic
--      rasterBlob       - The output Lob
--      outArea          - The output area in model space
--      outWindow        - The output window in cell space
--      storageParam     - The storage parameter
--      bgValues         - The background values for sparse data
--
-- RETURNS
--
  PROCEDURE getMosaicSubset(
     inGeoRasters       IN SYS_REFCURSOR,
     pyramidLevel       IN NUMBER,
     outSRID            IN NUMBER,
     outModelCoordLoc   IN NUMBER,
     referencePoint     IN mdsys.SDO_GEOMETRY,
     cropArea           IN mdsys.SDO_GEOMETRY,
     polygonClip        IN VARCHAR2,
     boundaryClip       IN VARCHAR2,
     layerNumbers       IN VARCHAR2,
     outResolutions     IN mdsys.SDO_NUMBER_ARRAY,
     resolutionUnit     IN VARCHAR2,
     mosaicParam        IN VARCHAR2,
     rasterBlob         IN OUT NOCOPY BLOB,
     outArea            OUT mdsys.SDO_GEOMETRY,
     outWindow          OUT mdsys.SDO_NUMBER_ARRAY,
     storageParam       IN VARCHAR2 DEFAULT NULL,
     bgValues           IN mdsys.SDO_NUMBER_ARRAY DEFAULT NULL
     );

--
-- NAME:
--      getMosaicSubset procedure
--
-- DESCRIPTION
--      Subset from a set of source georaster objects.
--
-- ARGUMENTS
--      georasterTableNames - The table names of the input georaster objects
--      georasterColumnNames - The column names of the input georaster objects
--      pyramidLevel     - The pyramid level, if NULL and outResolution is
--                         specified, use the outResolution to determine the
--                         pyramidLevel, otherwise defaults to 0.
--      outSRID          - The output georaster data's SRID.
--      outModelCoordLoc - The output georaster data's model coordinate
--                         location. If NULL, defaults to CENTER.
--      referencePoint   - The reference point of the mosaic. The mosaic result
--                         will align with this reference point. If this is
--                         null, the reference point implicitly uses the
--                         left upper corner of the cropArea, or when the
--                         cropArea is null, the upper corner of the outArea.
--                         This reference point must be in a SDO_GEOMETRY that
--                         describes a point.
--      cropArea         - The output georaster data's window. If the
--                         sdo_geometry object has srid, the source georaster
--                         objects must be georeferenced, otherwise, the source
--                         georaster object can be georeferenced or non-
--                         georeferenced.
--      polygonClip      - Whether to do polygon clipping. If NULL, defaults
--                         to FALSE.
--      boundaryClip     - Whether to use the source data boundary to clip the
--                         cropArea. If false, the outside the source
--                         data area is filled with background value. If NULL,
--                         defaults to TRUE.
--      layerNumbers     - The layer numbers from the source georasters. If
--                         NULL, empty or has value of '0', all layers are
--                         included.
--      outResolutions   - Output georaster data's resolution. If NULL, defaults
--                         to the source data's resolution at the given
--                         pyramid level.
--      resolutionUnit   - The unit of the output resolution. If NULL, defaults
--                         to the unit of output SRID. If outResolutions is
--                         NULL, this parameter is ignored.It must be in format
--                         of "unit=val" where val is the unit name.
--      mosaicParam      - The parameter related to mosaic
--      rasterBlob       - The output Lob
--      outArea          - The output area in model space
--      outWindow        - The output window in cell space
--      storageParam     - The storage parameter
--      bgValues         - The background values for sparse data
--
-- RETURNS
--
  PROCEDURE getMosaicSubset(
     georasterTableNames IN VARCHAR2,
     georasterColumnNames IN VARCHAR2,
     pyramidLevel       IN NUMBER,
     outSRID            IN NUMBER,
     outModelCoordLoc   IN NUMBER,
     referencePoint     IN mdsys.SDO_GEOMETRY,
     cropArea           IN mdsys.SDO_GEOMETRY,
     polygonClip        IN VARCHAR2,
     boundaryClip       IN VARCHAR2,
     layerNumbers       IN VARCHAR2,
     outResolutions     IN mdsys.SDO_NUMBER_ARRAY,
     resolutionUnit     IN VARCHAR2,
     mosaicParam        IN VARCHAR2,
     rasterBlob         IN OUT NOCOPY BLOB,
     outArea            OUT mdsys.SDO_GEOMETRY,
     outWindow          OUT mdsys.SDO_NUMBER_ARRAY,
     storageParam       IN VARCHAR2 DEFAULT NULL,
     bgValues           IN mdsys.SDO_NUMBER_ARRAY DEFAULT NULL
     );

--
-- NAME:
--      validateForMosaicSubset procedure
--
-- DESCRIPTION
--      Check if the mosaic request is valid. The validation result is stored
--  in a user created result table with the following columns:
--   (time timestamp, type varchar2, description varchar2,
--    table_name varchar2, column_name varchar2, rdt_table_name varchar2,
--    raster_id number)
--
-- ARGUMENTS
--      inGeoRasters     - The input source georaster objects in a cursor.
--      outSRID          - The output georaster data's SRID.
--      outResolutions   - Output georaster data's resolution. If NULL, defaults
--                         to the source data's resolution at the given
--                         pyramid level.
--      resolutionUnit   - The unit of the output resolution. If NULL, defaults
--                         to the unit of the output SRID. If outResolutions is
--                         NULL, this parameter is ignored.It must be in format
--                         of "unit=val" where val is the unit name.
--      resultTableName  - The name of the result table.
--
-- RETURNS
--
  PROCEDURE validateForMosaicSubset(
     inGeoRasters       IN SYS_REFCURSOR,
     outSRID            IN NUMBER,
     outResolutions     IN mdsys.SDO_NUMBER_ARRAY,
     resolutionUnit     IN VARCHAR2,
     resultTableName    IN VARCHAR2
     );

--
-- NAME:
--      validateForMosaicSubset procedure
--
-- DESCRIPTION
--      Check if the mosaic request is valid. The validation result is stored
--  in a user created result table with the following columns:
--   (time timestamp, type varchar2, description varchar2,
--    table_name varchar2, column_name varchar2, rdt_table_name varchar2,
--    raster_id number)
--
-- ARGUMENTS
--      georasterTableNames - The table names of the input georaster objects
--      georasterColumnNames - The column names of the input georaster objects
--      outSRID          - The output georaster data's SRID.
--      outResolutions   - Output georaster data's resolution. If NULL, defaults
--                         to the source data's resolution at the given
--                         pyramid level.
--      resolutionUnit   - The unit of the output resolution. If NULL, defaults
--                         to the unit of the output SRID. If outResolutions is
--                         NULL, this parameter is ignored.It must be in format
--                         of "unit=val" where val is the unit name.
--      resultTableName  - The name of the result table.
--
-- RETURNS
--
  PROCEDURE validateForMosaicSubset(
     georasterTableNames IN VARCHAR2,
     georasterColumnNames IN VARCHAR2,
     outSRID            IN NUMBER,
     outResolutions     IN mdsys.SDO_NUMBER_ARRAY,
     resolutionUnit     IN VARCHAR2,
     resultTableName    IN VARCHAR2
     );

--
-- NAME:
--      getMosaicExtent Function.
--
-- DESCRIPTION
--  Calculate the extent of the total mosaic set.
--
-- ARGUMENTS
--      inGeoRasters     - The input source georaster objects in a cursor.
--      outSRID          - The SRID of the output extent. If null, the
--                         SRID of the output extent will use 4326 (WGS84)
--
-- RETURNS: A MDSYS.GEOMETRY object that describes the MBR of the total mosaic.
--
FUNCTION getMosaicExtent(
     inGeoRasters       IN SYS_REFCURSOR,
     outSRID            IN NUMBER  DEFAULT NULL
) RETURN mdsys.SDO_GEOMETRY DETERMINISTIC;

--
-- NAME:
--      getMosaicExtent Function.
--
-- DESCRIPTION
--  Calculate the extent of the total mosaic set.
--
-- ARGUMENTS
--      georasterTableNames - The table names of the input georaster objects
--      georasterColumnNames - The column names of the input georaster objects
--      outSRID          - The SRID of the output extent. If null, the
--                         SRID of the output extent will use 4326 (WGS84)
--
-- RETURNS: A MDSYS.GEOMETRY object that describes the MBR of the total mosaic.
--
FUNCTION getMosaicExtent(
     georasterTableNames IN VARCHAR2,
     georasterColumnNames IN VARCHAR2,
     outSRID            IN NUMBER  DEFAULT NULL
) RETURN mdsys.SDO_GEOMETRY DETERMINISTIC;

--
-- NAME:
--      getMosaicResolutions Function.
--
-- DESCRIPTION
--  Get the resolution range of the total mosaic set in a given coordinate
--  system.
--
-- ARGUMENTS
--      inGeoRasters     - The input source georaster objects in a cursor.
--      resolutionUnit   - The unit of the output resolution range. If NULL,
--                         defaults to 'unit=METER'. It must be in format
--                         of "unit=val" where val is the unit name.
-- RETURN:               - The output x and y resolution range in
--                         MDSYS.SDO_RANGE_ARRAY. The resolution unit will
--                         be the unit defined by the targetSRID.
--
--
FUNCTION  getMosaicResolutions(
     inGeoRasters       IN SYS_REFCURSOR,
     resolutionUnit     IN VARCHAR2 DEFAULT NULL
) return mdsys.SDO_RANGE_ARRAY DETERMINISTIC;

--
-- NAME:
--      getMosaicResolutions Function.
--
-- DESCRIPTION
--  Get the resolution range of the total mosaic set in a given coordinate
--  system.
--
-- ARGUMENTS
--      georasterTableNames - The table names of the input georaster objects
--      georasterColumnNames - The column names of the input georaster objects
--      resolutionUnit   - The unit of the output resolution range. If NULL,
--                         defaults to 'unit=METER'. It must be in format
--                         of "unit=val" where val is the unit name.
--      targetSRID       - The target SRID for the resolution. If null, the
--                         target SRID will default to 4326 (WGS84)
-- RETURN:               - The output x and y resolution range in
--                         MDSYS.SDO_RANGE_ARRAY. The resolution unit will
--                         be the unit defined by the targetSRID.
--
FUNCTION getMosaicResolutions(
     georasterTableNames  IN VARCHAR2,
     georasterColumnNames IN VARCHAR2,
     resolutionUnit       IN VARCHAR2 DEFAULT NULL
) RETURN mdsys.SDO_RANGE_ARRAY DETERMINISTIC;

--
-- NAME:
--      Append procedure
--
-- DESCRIPTION
--      Append one GeoRaster object to another GeoRaster object.
--
-- The source and target GeoRaster objects must have the same number of bands.
--
-- There is no change on metadata of target GeoRaster object except the
-- extent, the number of blocks and statistics removed.
--
-- The mask of the target GeoRaster object is expanded according to the
-- raster data expansion.
--
-- The sourceGeoRaster object will be appended to the targetGeoRaster pyramid
-- level 0. The pyramids of the target GeoRaster object are updated too.
--
-- The overlapping area of the source and targe GeoRaster objects are resolved
-- according to the commonPointRule defined in the appendParam.
--
-- ARGUMENTS
--      targetGeoRaster - The GeoRaster object to be appended. Cannot be the
--                        same GeoRaster. (Be sure to make a copy of this
--                        object before calling this procedure as this object
--                        will be modified).
--      sourceGeoRaster - The GeoRaster object to be appended to targeGeoRaster
--      sourcePyramidLevel - The source GeoRaster object pyramid level to be
--                         appended at the target GeoRaster object pyramid level
--                         0. If NULL, pyramid level 0 is used.
--      appendParam      - The parameter related to append.
--      bgValues         - The background values for sparse data
--
--
  PROCEDURE Append(
     targetGeoRaster    IN OUT NOCOPY mdsys.SDO_GEORASTER,
     sourceGeoRaster    IN mdsys.SDO_GEORASTER,
     sourcePyramidLevel IN NUMBEr,
     appendParam        IN VARCHAR2,
     bgValues           IN mdsys.SDO_NUMBER_ARRAY DEFAULT NULL
     );

END SDO_GEOR_AGGR;
/