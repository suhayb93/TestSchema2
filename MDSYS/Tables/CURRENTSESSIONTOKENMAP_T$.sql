CREATE TABLE mdsys.currentsessiontokenmap_t$ (
  sessionid VARCHAR2(30 BYTE) NOT NULL,
  tokenid VARCHAR2(100 BYTE) NOT NULL,
  PRIMARY KEY (sessionid,tokenid)
);