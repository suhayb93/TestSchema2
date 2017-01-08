CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhcompare (hh1 IN RAW, hh2 IN RAW)
    RETURN BINARY_INTEGER IS
begin
 return md.hhcompare(hh1,hh2);
end;
/