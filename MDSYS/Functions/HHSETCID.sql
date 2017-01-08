CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhsetcid ( hhc IN RAW, lv IN BINARY_INTEGER, cid IN NUMBER )
    RETURN RAW IS
begin
 return md.hhsetcid(hhc, lv, cid);
end;
/