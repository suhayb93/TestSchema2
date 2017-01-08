CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhsbit (hhc IN RAW, bit_number IN BINARY_INTEGER)
    RETURN RAW IS
begin
 return md.hhsbit(hhc, bit_number);
end;
/