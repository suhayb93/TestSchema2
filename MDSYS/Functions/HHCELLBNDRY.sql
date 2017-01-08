CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhcellbndry (hhc IN RAW, dim IN BINARY_INTEGER,
           lb IN NUMBER, ub IN NUMBER,lv IN BINARY_INTEGER, mm IN VARCHAR2)
    RETURN NUMBER IS
begin
 return md.hhcellbndry(hhc,dim,lb,ub,lv,mm);
end;
/