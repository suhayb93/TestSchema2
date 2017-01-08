CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhlength (hhc IN RAW, dim IN BINARY_INTEGER := NULL)
    RETURN BINARY_INTEGER IS
begin
 if dim is NULL then
   return md.hhlength(hhc);
 end if;
 return md.hhlength(hhc,dim);
end;
/