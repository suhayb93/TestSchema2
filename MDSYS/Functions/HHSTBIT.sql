CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhstbit (hhc IN RAW, topology IN BINARY_INTEGER, type IN VARCHAR2)
    RETURN RAW IS
begin
 return md.hhstbit(hhc, topology,type);
end;
/