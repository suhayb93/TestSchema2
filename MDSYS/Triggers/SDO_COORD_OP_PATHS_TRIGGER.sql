CREATE OR REPLACE NONEDITIONABLE TRIGGER
  mdsys.SDO_COORD_OP_PATHS_TRIGGER
BEFORE
  INSERT OR
  UPDATE
ON
  mdsys.SDO_COORD_OP_PATHS
FOR EACH ROW
DECLARE
  c NUMBER;
  is_impl_single NUMBER;
  is_impl_concat NUMBER;
BEGIN

  mdsys.sdo_cs.sdo_cs_context_invalidate;

  SELECT COUNT(COORD_OP_ID) INTO c FROM mdsys.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = :new.CONCAT_OPERATION_ID;
  IF(c < 1) THEN
    SELECT COUNT(COORD_OP_ID) INTO c FROM mdsys.SDO_AVAILABLE_ELEM_OPS WHERE COORD_OP_ID = :new.CONCAT_OPERATION_ID;
    IF(c < 1) THEN
      IF(:new.CONCAT_OPERATION_ID > 0) THEN
        mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.CONCAT_OPERATION_ID || ' does not exist.'));
      ELSE
        SELECT COUNT(COORD_OP_ID) INTO c FROM mdsys.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = -:new.CONCAT_OPERATION_ID;
        IF(c < 1) THEN
          mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.CONCAT_OPERATION_ID || ' does not exist, neither does its forward version ' || -:new.CONCAT_OPERATION_ID || '.'));
        ELSE
          dbms_output.put_line('Concatenated operation ' || -:new.CONCAT_OPERATION_ID || ' is not reversible, because of its following elementary component(s):');

          <<FIND_CULPRITS>>
          DECLARE
            CURSOR CULPRITS IS
              SELECT
                -PATHS.SINGLE_OPERATION_ID "COORD_OP_ID"
              FROM
                mdsys.SDO_COORD_OP_PATHS PATHS
              WHERE
                PATHS.CONCAT_OPERATION_ID = -:new.CONCAT_OPERATION_ID
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

          mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Concatenated operation ' || -:new.CONCAT_OPERATION_ID || ' is not reversible'));
        END IF;
      END IF;
    ELSE
      mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.CONCAT_OPERATION_ID || ' is an elementary operation, not a concatenated one.'));
    END IF;
  END IF;

  SELECT COUNT(COORD_OP_ID) INTO c FROM mdsys.SDO_AVAILABLE_ELEM_OPS WHERE COORD_OP_ID = :new.SINGLE_OPERATION_ID;
  IF(c < 1) THEN
    SELECT COUNT(COORD_OP_ID) INTO c FROM mdsys.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = :new.SINGLE_OPERATION_ID;
    IF(c < 1) THEN
      IF(:new.SINGLE_OPERATION_ID > 0) THEN
        mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.SINGLE_OPERATION_ID || ' does not exist.'));
      ELSE
        SELECT COUNT(COORD_OP_ID) INTO c FROM mdsys.SDO_AVAILABLE_ELEM_OPS WHERE COORD_OP_ID = -:new.SINGLE_OPERATION_ID;
        IF(c < 1) THEN
          mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.SINGLE_OPERATION_ID || ' does not exist, neither does its forward version ' || -:new.SINGLE_OPERATION_ID || '.'));
        ELSE
          mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || -:new.SINGLE_OPERATION_ID || ' is not reversible.'));
        END IF;
      END IF;
    ELSE
      mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, ('Operation ' || :new.SINGLE_OPERATION_ID || ' is a concatenated operation, not an elementary one.'));
    END IF;
  END IF;

  SELECT IS_IMPLEMENTED INTO is_impl_single FROM mdsys.SDO_AVAILABLE_ELEM_OPS WHERE COORD_OP_ID = :new.SINGLE_OPERATION_ID;
  IF(is_impl_single = 0) THEN
    SELECT IS_IMPLEMENTED INTO is_impl_concat FROM mdsys.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = :new.CONCAT_OPERATION_ID;
    IF(is_impl_concat = 1) THEN
      mdsys.MDERR.RAISE_MD_ERROR('MD', 'SDO', -13199, (
        'Single operation ' || :new.SINGLE_OPERATION_ID ||
        ' is not implemented. Then concatenated operation ' || :new.CONCAT_OPERATION_ID ||
        ' cannot be, neither.'));
    END IF;
  END IF;
END;
/