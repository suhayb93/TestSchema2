CREATE GLOBAL TEMPORARY TABLE mdsys.sdo_txn_idx_exp_upd_rgn (
  sdo_txn_idx_id VARCHAR2(32 BYTE) NOT NULL,
  rid VARCHAR2(24 BYTE) NOT NULL,
  start_1 NUMBER,
  end_1 NUMBER,
  start_2 NUMBER,
  end_2 NUMBER,
  start_3 NUMBER,
  end_3 NUMBER,
  start_4 NUMBER,
  end_4 NUMBER,
  PRIMARY KEY (sdo_txn_idx_id,rid)
)
ON COMMIT DELETE ROWS;