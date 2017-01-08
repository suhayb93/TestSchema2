CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhgroup (hhc IN RAW)
    RETURN RAW IS
begin
 return md.hhgroup(hhc);
end;
/