CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.ST_CIRCULARSTRING
                                       UNDER ST_CURVE (
  CONSTRUCTOR FUNCTION ST_CIRCULARSTRING(apointarray ST_Point_Array)
           RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_CIRCULARSTRING(apointarray ST_Point_Array,
            asrid INTEGER) RETURN SELF AS RESULT,

  MEMBER FUNCTION ST_Points(apointarray ST_Point_Array)
           RETURN ST_CircularString)
/
CREATE OR REPLACE TYPE BODY mdsys.ST_CIRCULARSTRING wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
508 1ea
wHOvcqotNCHWuFS3mCdqpa+IzvEwg83DmEhqfHSKbmSPER3iLxJ+UDVh3jWpVogjjvpdtbVt
CYkToEJ0RKzcgcqpXSlKgPNKsERrv4a95nFbzQeRGiiz9gpnB6Tdj1YC3uP/aomKLw0DxLQY
yKbAUoNgKe2Re0ory/blEl/660whtoVnOFobb/MLr+i+gKoOj4wCfEU9Osy6iC0vXazFRAJI
1H2tPYwlpw30Bs1zElvguPrUHR/08RjE2FxM/LZYunGmeWtEqGVYUkjuo7xipQSzSlzE7sfi
USEMNGGBjfXpcQ0OvXa73SysrkRZe1aHZjK55NmfPc3+TIROZcnaePATlprm1k7lzV3fannr
KkxVaYQTjeR2ZscXpD0cn25iII3zd8vBQQNbY+qINBzetPOUkrU9MDMnpTC1wHjJRyjSC2K0
os7XIO75u8GbGETEOkJLMOonH/4XSWb9ck4mcjmbCJu9VtNl+A==
/