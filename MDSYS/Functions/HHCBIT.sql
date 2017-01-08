CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhcbit (hhc IN RAW, bit_number IN BINARY_INTEGER)
    RETURN RAW IS
begin
 return md.hhcbit(hhc,bit_number);
end;
/