CREATE TABLE mdsys.wfs_featuretableupdated$ (
  featuretypensurl VARCHAR2(2083 BYTE),
  featuretypename VARCHAR2(80 BYTE),
  rowlist mdsys.rowpointerlist,
  updatets TIMESTAMP
)
NESTED TABLE rowlist STORE AS r_table;