CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhdistance (type IN VARCHAR2, hh1 IN RAW, hh2 IN RAW,
           l01 IN NUMBER,       u01 IN NUMBER)
    RETURN NUMBER IS
begin
  return md.hhdistance(type,hh1,hh2,l01,u01);
end;
/