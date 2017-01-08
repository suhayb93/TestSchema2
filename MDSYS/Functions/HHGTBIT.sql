CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhgtbit (hhc IN RAW, topology IN BINARY_INTEGER)
    RETURN VARCHAR2 IS
begin
 return md.hhgtbit(hhc, topology);
end;
/