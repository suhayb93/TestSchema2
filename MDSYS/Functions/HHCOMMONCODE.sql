CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhcommoncode (hh1 IN RAW, hh2 IN RAW)
    RETURN RAW IS
begin
 return md.hhcommoncode(hh1,hh2);
end;
/