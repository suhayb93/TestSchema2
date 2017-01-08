CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhorder (hhc IN RAW)
    RETURN RAW IS
begin
 return md.hhorder(hhc);
end;
/