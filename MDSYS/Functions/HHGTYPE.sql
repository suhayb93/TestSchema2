CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhgtype (hhc IN RAW)
    RETURN BINARY_INTEGER IS
begin
 return md.hhgtype(hhc);
end;
/