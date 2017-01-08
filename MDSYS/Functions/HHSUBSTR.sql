CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhsubstr (hhc IN RAW, slv IN BINARY_INTEGER, elv IN BINARY_INTEGER)
    RETURN RAW IS
begin
  return md.hhsubstr(hhc, slv, elv);
end;
/