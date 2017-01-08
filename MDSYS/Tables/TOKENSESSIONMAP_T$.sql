CREATE TABLE mdsys.tokensessionmap_t$ (
  sessionid VARCHAR2(30 BYTE) NOT NULL,
  tokenid VARCHAR2(100 BYTE) NOT NULL,
  expirytime TIMESTAMP,
  expiryoffset NUMBER,
  PRIMARY KEY (sessionid,tokenid),
  UNIQUE (tokenid)
);