CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhgetcid ( hhc IN RAW, lv IN BINARY_INTEGER )
    RETURN NUMBER IS
begin
 return md.hhgetcid(hhc, lv);
end;
/