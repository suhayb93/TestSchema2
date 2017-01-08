CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhcollapse( hhc IN RAW,
           d01 IN BINARY_INTEGER)
    RETURN RAW IS
begin
 return md.hhcollapse(hhc, d01);
end;
/