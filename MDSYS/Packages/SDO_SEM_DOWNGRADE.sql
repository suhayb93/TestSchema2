CREATE OR REPLACE NONEDITIONABLE package mdsys.sdo_sem_downgrade authid current_user as

  /**
   * This method will save all model data, rulebase data before an actual
   * database downgrade.
   */
  procedure prepare_downgrade_from_11;

END;
/