CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.sdo_available_elem_ops (source_srid,coord_op_id,target_srid,is_implemented) AS
(
            SELECT
              OPS.SOURCE_SRID,
              OPS.COORD_OP_ID             "COORD_OP_ID",
              OPS.TARGET_SRID,
              OPS.IS_IMPLEMENTED_FORWARD  "IS_IMPLEMENTED"
            FROM
              mdsys.SDO_COORD_OPS         OPS
            WHERE
              NOT (OPS.COORD_OP_TYPE = 'CONCATENATED OPERATION')
          )
          UNION
          (
            SELECT
              OPS.TARGET_SRID "SOURCE_SRID",
              -OPS.COORD_OP_ID            "COORD_OP_ID",
              OPS.SOURCE_SRID "TARGET_SRID",
              OPS.IS_IMPLEMENTED_REVERSE  "IS_IMPLEMENTED"
            FROM
              mdsys.SDO_COORD_OPS         OPS
            WHERE
              NOT (OPS.COORD_OP_TYPE = 'CONCATENATED OPERATION')
              AND
              OPS.REVERSE_OP = 1
          )
      ;