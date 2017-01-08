CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhprecision (lb IN NUMBER, ub IN NUMBER, lv IN BINARY_INTEGER)
    RETURN BINARY_INTEGER IS
begin
  return md.hhprecision(lb,ub,lv);
end;
/