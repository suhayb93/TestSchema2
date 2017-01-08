CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhcldate (jd IN NUMBER, fmt IN VARCHAR2)
    RETURN VARCHAR2 IS
begin
  return md.hhcldate(jd,fmt);
end;
/