CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhstype (hhc IN RAW, type_id IN BINARY_INTEGER)
    RETURN RAW IS
begin
 return md.hhstype(hhc, type_id);
end;
/