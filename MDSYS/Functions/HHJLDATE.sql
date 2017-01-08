CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhjldate (ds IN VARCHAR2, fmt IN VARCHAR2)
    RETURN NUMBER IS
begin
 return md.hhjldate(ds,fmt);
end;
/