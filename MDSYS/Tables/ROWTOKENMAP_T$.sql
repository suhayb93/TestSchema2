CREATE TABLE mdsys.rowtokenmap_t$ (
  tokenid VARCHAR2(100 BYTE),
  tablename VARCHAR2(61 BYTE),
  rpointer ROWID,
  markeddeleted VARCHAR2(1 BYTE),
  CONSTRAINT unique_rowtokenmap_cond UNIQUE (tablename,rpointer),
  FOREIGN KEY (tokenid) REFERENCES mdsys.tokensessionmap_t$ (tokenid) ON DELETE CASCADE
);