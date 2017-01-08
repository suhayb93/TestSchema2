CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhmatch (hh1 IN RAW, hh2 IN RAW)
    RETURN BINARY_INTEGER IS
begin
  return md.hhmatch(hh1,hh2);
end;
/