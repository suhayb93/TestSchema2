CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.SDO_GEOR_UTL AUTHID CURRENT_USER AS

-- ---------------------------------------------------------------------
--      procedure to create DML triggers on a georaster table
-- ---------------------------------------------------------------------

PROCEDURE createDMLTrigger
(
    tableName      varchar2,
    columnName     varchar2
);

-- ---------------------------------------------------------------------
--      procedure to create DML triggers on a georaster table
-- ---------------------------------------------------------------------

PROCEDURE recreateDMLTriggers;

-- ---------------------------------------------------------------------
-- NAME
--   renameRDT
--
-- DESCRIPTION
--   This routine renames raster data table(s) owned by the current user.
--   It will update all related GeoRaster objects and GeoRaster system
--   data coorespondingly.
--
-- ARGUMENTS
--   oldRDTs - name(s) of existing raster data table(s) to be renamed
--   newRDTs - name(s) of new raster data table(s)
--
-- NOTES
--
--   This routine renames RDTs owned by the current user.
--
--   The RDT names in the strings are seperated with ','.
--   If an oldRDT does not appear in the GeoRaster sysdata, it is ignored.
--   If a newRDT is not unique in the GeoRaster sysdata, ORA-13403 is raised.
--   If a newRDT is NULL, a unique RDT name is automatically generated.
-- ---------------------------------------------------------------------
PROCEDURE renameRDT
(
   oldRDTs VARCHAR2,
   newRDTs VARCHAR2 DEFAULT NULL
);



-- ---------------------------------------------------------------------
-- NAME
--   makeRDTnamesUnique
--
-- DESCRIPTION
--   This routine resolves conflicting raster data table names by
--   automatically renaming some of them so that all raster data tables
--   are uniquely named afterwards.
--
-- ARGUMENTS
--   None.
--
-- NOTES
--   This routine is part of the fix for bug 3703288. In addition to applying
--   the necessary patchset that fixes this bug, an Oracle database of
--   version 10.1.0.2 or 10.1.0.3 needs to run this routine to resolve
--   potential RDT name conflicts. User may choose to run the above
--   renameRDT() to explicitly rename existing RDTs before run this
--   routine.
--
--   This routine should be run while connected as a user with the DBA role.
--
-- ---------------------------------------------------------------------
PROCEDURE makeRDTnamesUnique;


-- ---------------------------------------------------------------------
-- NAME
--   calcRasterNominalSize
--
-- DESCRIPTION
--   This routine calculates the total length of the raster blocks of
--   a GeoRaster object as if it is uncompressed and not sparse.
--
-- ARGUMENTS
--   geor       - the GeoRaster object
--   padding    - indicates whether to consider padding in the blocks
--   pyramid    - indicates whether to consider pyramids
--   bitmapMask - indicates whether to consider associated bitmap masks
--
-- NOTES
--   All the argument are case insensitive.
--   The result is in bytes.
--
-- ---------------------------------------------------------------------
FUNCTION calcRasterNominalSize
(
  geor       IN SDO_GEORASTER,
  padding    IN VARCHAR2 DEFAULT 'TRUE',
  pyramid    IN VARCHAR2 DEFAULT 'TRUE',
  bitmapMask IN VARCHAR2 DEFAULT 'TRUE'
)
RETURN NUMBER DETERMINISTIC PARALLEL_ENABLE;

-- ---------------------------------------------------------------------
-- NAME
--   calcRasterStorageSize
-- DESCRIPTION
--   This routine calculates the actual length of the raster blocks of
--   a GeoRaster object.
--
-- ARGUMENTS
--   geor - the GeoRaster object
--
-- NOTES
--   The result is in bytes.
--
-- ---------------------------------------------------------------------
FUNCTION calcRasterStorageSize
(
  geor       IN SDO_GEORASTER
)
RETURN NUMBER DETERMINISTIC PARALLEL_ENABLE;

-- ---------------------------------------------------------------------
-- NAME
--   calcOptimizedBlockSize
-- DESCRIPTION
--   This routine calculates the optimized blockSize based on dimensionSize and--   user input seed blockSize.
--
-- ARGUMENTS
--   dimensionSize - dimension size array, whose length must be 3.
--   blockSize - block size array, whose length must be 3.
--   pyramidLevel - pyramid level, default value is 0.
--
-- NOTES
--
-- ---------------------------------------------------------------------
PROCEDURE calcOptimizedBlockSize
(
  dimensionSize       IN mdsys.SDO_NUMBER_ARRAY,
  blockSize           IN OUT mdsys.SDO_NUMBER_ARRAY,
  pyramidLevel        IN number default 0
);

-- ---------------------------------------------------------------------
-- NAME
--   fillEmptyBlocks
-- DESCRIPTION
--   This routine fills in all empty blocks with background values
--   specified in the parameter
--
-- ARGUMENTS
--   geor     - the GeoRaster object
--   bgValues - background values for filling sparse data
--
-- NOTES
--
-- ---------------------------------------------------------------------
PROCEDURE fillEmptyBlocks
(
  geor IN OUT SDO_GEORASTER,
  bgValues IN SDO_NUMBER_ARRAY DEFAULT NULL
);

-- NAME
--   emptyBlocks
-- DESCRIPTION
--   This routine make blocks empty, if the blocks only contains background values
--   specified in the parameter
--
-- ARGUMENTS
--   geor     - the GeoRaster object
--   bgValues - background values for filling sparse data
--
-- NOTES
--
-- ---------------------------------------------------------------------
PROCEDURE emptyBlocks
(
  geor IN OUT SDO_GEORASTER,
  bgValues IN SDO_NUMBER_ARRAY DEFAULT NULL
);

------------------------------------------------------------------------
--           Status Report Related Procedures
------------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- NAME
--   createReportTable
-- DESCRIPTION
--   Create the table for the operation status.
--
-- NOTES
--
-- ---------------------------------------------------------------------
PROCEDURE createReportTable;

-- ---------------------------------------------------------------------
-- NAME
--   dropReportTable
-- DESCRIPTION
--   Drop the table for the operation status.
--
-- NOTES
--
-- ---------------------------------------------------------------------
PROCEDURE dropReportTable;

-- ---------------------------------------------------------------------
-- NAME
--   clearReportTable
-- DESCRIPTION
--   Delete the records in the table for the operation status.
--   If the client_id is not null, only the records with the client_id
--   are deleted, otherwise, all the records are deleted.
-- ARGUMENTS
--   client_id: a unique id to identify the session.
--
-- NOTES
--   This procedure will only commit on the report table so that
--   other sessions can see the committed results.
-- ---------------------------------------------------------------------
PROCEDURE clearReportTable(client_id in number default null);

-- ---------------------------------------------------------------------
-- NAME
--   isReporting
-- DESCRIPTION
--   Check if any session has status report enabled.
-- RETURN
--   1: There are session(s) with status report enabled.
--   0: There is no session with status report enabled.
--
-- NOTES
-- ---------------------------------------------------------------------
FUNCTION isReporting RETURN NUMBER;

-- ---------------------------------------------------------------------
-- NAME
--   enableReport
-- DESCRIPTION
--   Enable the status report in this session.
--
-- NOTES
-- ---------------------------------------------------------------------
PROCEDURE enableReport;

-- ---------------------------------------------------------------------
-- NAME
--   disableReport
-- DESCRIPTION
--   Disable the status report in this session.
--
-- NOTES
-- ---------------------------------------------------------------------
PROCEDURE disableReport;

-- ---------------------------------------------------------------------
-- NAME
--   setseqid
-- DESCRIPTION
--   Set the sequence id for the operation in one session. This can be used
-- to identify the different operations in the same session. If this
-- procedure is not called, the sequence id defaults to 0 in the status
-- report.
-- ARGUMENTS
--   seq_id: an id to identify the operation in this session.
--
-- NOTES
-- ---------------------------------------------------------------------
PROCEDURE setseqid(seq_id number);

-- ---------------------------------------------------------------------
-- NAME
--   setClientID
-- DESCRIPTION
--   Set the client id for a session. This can be used
--   to identify the different sessions under the same user.
--   The client id can be the database session id or the client id in
--   the mid-tier environment. If this procedure is not called, the client
--   id in the status report defaults to the database session id.
-- ARGUMENTS
--   client_id: an id to identify the session.
--
-- NOTES
-- ---------------------------------------------------------------------
PROCEDURE setClientID(client_id number);

-- ---------------------------------------------------------------------
-- NAME
--   getProgress
-- DESCRIPTION
--   Get the lastest progress in percentage of a specific operation.
--
-- ARGUMENTS
--   client_id: a unique id to identify the session.
--   seq_id: a unique id to identify the operation in this session.
-- RETURNS
--   The percentage of the progress in a number between 0 and 1.
-- NOTES
-- ---------------------------------------------------------------------
FUNCTION getProgress(client_id number, seq_id number default 0)
  RETURN NUMBER;

-- ---------------------------------------------------------------------
-- NAME
--   getStatusReport
-- DESCRIPTION
--   Get the lastest status of a specific operation.
--
-- ARGUMENTS
--   client_id: a unique id to identify the session.
--   seq_id: a unique id to identify the operation in this session.
-- RETURNS
--   A sdo_string2_array in the format:
--     TIMESTAMP, OP_NAME, TARGET_RDT, TARGET_RID, OP_STATUS, DESCRIPTION.
-- NOTES
-- ---------------------------------------------------------------------
FUNCTION getStatusReport(client_id number, seq_id number default 0)
  RETURN mdsys.sdo_string2_array DETERMINISTIC PARALLEL_ENABLE;

-- ---------------------------------------------------------------------
-- NAME
--   getAllStatusReport
-- DESCRIPTION
--   Get the lastest status of the operations in the status table for
--   each client_id.
-- ARGUMENTS
--   None.
-- RETURNS
--   A sdo_string2_arrayset in the format:
--     TIMESTAMP, OP_NAME, TARGET_RDT, TARGET_RID, OP_STATUS, DESCRIPTION.
-- NOTES
-- ---------------------------------------------------------------------
FUNCTION getAllStatusReport
  RETURN mdsys.sdo_string2_arrayset DETERMINISTIC PARALLEL_ENABLE;

------------------------------------------------------------------------
--           End of Status Report Related Procedures
------------------------------------------------------------------------

END SDO_GEOR_UTL;
/