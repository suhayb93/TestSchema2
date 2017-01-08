CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhgbit (hhc IN RAW, bit_number IN BINARY_INTEGER)
    RETURN BINARY_INTEGER IS
begin
 return md.hhgbit(hhc, bit_number);
end;
/