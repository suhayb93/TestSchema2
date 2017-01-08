CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhlevels (lb IN NUMBER, ub IN NUMBER, pr IN BINARY_INTEGER)
    RETURN BINARY_INTEGER IS
begin
 return md.hhlevels(lb,ub,pr);
end;
/