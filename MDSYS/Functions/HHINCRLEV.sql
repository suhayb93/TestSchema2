CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhincrlev (hhc IN RAW, lv IN BINARY_INTEGER)
    RETURN RAW IS
begin
 return md.hhincrlev(hhc, lv);
end;
/