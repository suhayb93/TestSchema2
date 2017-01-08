CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhbytelen (ndim IN BINARY_INTEGER, mlv IN BINARY_INTEGER)
    RETURN BINARY_INTEGER IS
begin
  return md.hhbytelen(ndim,mlv);
end;
/