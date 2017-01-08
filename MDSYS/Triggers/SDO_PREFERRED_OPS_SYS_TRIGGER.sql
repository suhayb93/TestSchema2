CREATE OR REPLACE NONEDITIONABLE TRIGGER
  mdsys.SDO_PREFERRED_OPS_SYS_TRIGGER
BEFORE
  INSERT OR
  UPDATE
ON
  mdsys.SDO_PREFERRED_OPS_SYSTEM
FOR EACH ROW
DECLARE
  c NUMBER;
BEGIN

  mdsys.sdo_cs.sdo_cs_context_invalidate;

  SELECT COUNT(COORD_OP_ID) INTO c FROM mdsys.SDO_AVAILABLE_OPS WHERE COORD_OP_ID = :new.COORD_OP_ID;
  IF(c < 1) THEN
    IF(:new.COORD_OP_ID > 0) THEN
      mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.COORD_OP_ID || ' does not exist.'));
    ELSE
      SELECT COUNT(COORD_OP_ID) INTO c FROM mdsys.SDO_AVAILABLE_OPS WHERE COORD_OP_ID = -:new.COORD_OP_ID;
      IF(c < 1) THEN
        mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.COORD_OP_ID || ' does not exist, neither does its forward version ' || -:new.COORD_OP_ID || '.'));
      ELSE
        SELECT COUNT(COORD_OP_ID) INTO c FROM mdsys.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = -:new.COORD_OP_ID;
        IF(c < 1) THEN
          mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Elementary operation ' || -:new.COORD_OP_ID || ' is not reversible.'));
        ELSE
          dbms_output.put_line('Concatenated operation ' || -:new.COORD_OP_ID || ' is not reversible, because of its following elementary component(s):');

          <<FIND_CULPRITS>>
          DECLARE
            CURSOR CULPRITS IS
              SELECT
                -PATHS.SINGLE_OPERATION_ID "COORD_OP_ID"
              FROM
                mdsys.SDO_COORD_OP_PATHS PATHS
              WHERE
                PATHS.CONCAT_OPERATION_ID = -:new.COORD_OP_ID
              MINUS
              SELECT
                COORD_OP_ID
              FROM
                mdsys.SDO_AVAILABLE_OPS;
            CULPRIT CULPRITS%ROWTYPE;
          BEGIN
            FOR CULPRIT IN CULPRITS LOOP
              dbms_output.put_line('Elementary operation ' || (-CULPRIT.COORD_OP_ID) || ' is not reversible.');
            END LOOP;
          END FIND_CULPRITS;

          mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Concatenated operation ' || -:new.COORD_OP_ID || ' is not reversible.'));
        END IF;
      END IF;
    END IF;
  END IF;

  SELECT IS_IMPLEMENTED INTO c FROM mdsys.SDO_AVAILABLE_OPS WHERE COORD_OP_ID = :new.COORD_OP_ID;
  IF(c = 0) THEN
    mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.COORD_OP_ID || ' is not implemented.'));
  END IF;
END;
/