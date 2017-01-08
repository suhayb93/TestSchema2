CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhncompare (hh1 IN RAW, hh2 IN RAW, lv IN BINARY_INTEGER)
    RETURN BINARY_INTEGER IS
begin
 return md.hhncompare(hh1,hh2,lv);
end;
/