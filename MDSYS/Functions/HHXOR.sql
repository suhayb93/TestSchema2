CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhxor ( hh1 IN RAW, hh2 IN RAW )
    RETURN RAW IS
begin
 return md.hhxor(hh1, hh2);
end;
/