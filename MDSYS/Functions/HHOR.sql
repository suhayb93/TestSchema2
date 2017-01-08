CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhor ( hh1 IN RAW, hh2 IN RAW )
    RETURN RAW IS
begin
 return md.hhor(hh1, hh2);
end;
/