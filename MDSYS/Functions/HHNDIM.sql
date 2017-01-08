CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhndim (hhc IN RAW) RETURN BINARY_INTEGER IS
begin
  return md.hhndim(hhc);
end;
/