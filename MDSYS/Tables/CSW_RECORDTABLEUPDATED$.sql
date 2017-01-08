CREATE TABLE mdsys.csw_recordtableupdated$ (
  recordtypensurl VARCHAR2(2083 BYTE),
  recordtypename VARCHAR2(80 BYTE),
  rowlist mdsys.rowpointerlist,
  updatets TIMESTAMP
)
NESTED TABLE rowlist STORE AS ro_table;