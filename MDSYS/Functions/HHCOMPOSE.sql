CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhcompose( hhc IN RAW,
           d01 IN BINARY_INTEGER)
    RETURN RAW IS
begin
 return md.hhcompose(hhc,d01);
end;
/