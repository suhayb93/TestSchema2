CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhand ( hh1 IN RAW, hh2 IN RAW )
    RETURN RAW IS
begin
 return md.hhand(hh1, hh2);
end;
/