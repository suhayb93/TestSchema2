CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.SDO_WFS_LOCK authid current_user AS

cleanup number := 1;
ROWCNT_THRESHOLD number := 100;

procedure registerFeatureTable(userName IN varchar2, tableName IN varchar2) ;
procedure unRegisterFeatureTable(userName IN varchar2, tableName IN varchar2) ;
function lockRowsById(userName IN VARCHAR2,
                  tableName IN varchar2,
                  tableAlias varchar2,
                  expiryTime IN number,
                  rowsLocked OUT mdsys.RowPointerList,
                  rowsNotLocked OUT mdsys.RowPointerList,
                  lockAll varchar2,
                  pkeyCols mdsys.StringList,
                  autoCommit varchar2,
                  rowsToBeLocked IN  mdsys.RowPointerList,
                  orderClause varchar2,
                  indexClause varchar2,
                  maxcnt number) return number;
procedure lockRowsById(pTokenId IN varchar2,
                userName IN VARCHAR2,
                tableName IN varchar2,
                tableAlias varchar2,
                expiryTime IN number,
                rowsLocked OUT mdsys.RowPointerList,
                rowsNotLocked OUT mdsys.RowPointerList,
                lockAll varchar2,
                pkeyCols mdsys.StringList,
                autoCommit varchar2,
                rowsToBeLocked IN  mdsys.RowPointerList,
                orderClause varchar2,
                indexClause varchar2,
                maxcnt number) ;
procedure unlockRowsById(pTokenId IN varchar2,
                userName IN VARCHAR2,
                tableName IN varchar2,
                tableAlias IN varchar2,
                pkeyCols IN mdsys.StringList,
                autoCommit IN varchar2,
                rowsToBeUnLocked IN  mdsys.RowPointerList);
procedure transferTokenById (pTokenId IN varchar2) ;

procedure updateTokenSessionMap(tId varchar2, sId varchar2) ;

procedure deleteTokenSessionMap(tId varchar2) ;

function queryTokenSessionMap (tId varchar2) return varchar2 ;

procedure resetTokenExpiry(tId varchar2) ;

function generateTokenId return varchar2;

procedure enableDBTxns;
end;
/