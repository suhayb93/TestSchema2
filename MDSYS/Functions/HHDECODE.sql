CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhdecode (
           hhc IN RAW, dim IN BINARY_INTEGER, lb IN NUMBER, ub IN NUMBER)
    RETURN NUMBER IS
begin
  return md.hhdecode(hhc,dim,lb,ub);
end;
/