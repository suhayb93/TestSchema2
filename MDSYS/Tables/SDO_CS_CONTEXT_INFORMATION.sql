CREATE GLOBAL TEMPORARY TABLE mdsys.sdo_cs_context_information (
  from_srid NUMBER,
  to_srid NUMBER,
  "CONTEXT" RAW(4)
)
ON COMMIT PRESERVE ROWS;