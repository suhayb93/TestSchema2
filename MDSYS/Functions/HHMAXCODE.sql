CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhmaxcode(hhc IN RAW, maxlen IN NUMBER)
    RETURN RAW IS
begin
 return md.hhmaxcode(hhc, maxlen);
end;
/