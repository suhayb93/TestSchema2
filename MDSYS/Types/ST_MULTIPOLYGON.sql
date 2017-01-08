CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.ST_MultiPolygon
                                       UNDER ST_MULTISURFACE (
  CONSTRUCTOR FUNCTION ST_MultiPolygon(apolygonarray ST_POLYGON_ARRAY)
           RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_MultiPolygon(apolygonarray ST_POLYGON_ARRAY,
            asrid INTEGER) RETURN SELF AS RESULT,

  STATIC FUNCTION ST_BdMPolyFromText(awkt CLOB)
           RETURN ST_MultiPolygon DETERMINISTIC,
  STATIC FUNCTION ST_BdMPolyFromText(awkt CLOB, asrid INTEGER)
           RETURN ST_MultiPolygon DETERMINISTIC,
  STATIC FUNCTION ST_BdMPolyFromWKB(awkb BLOB)
           RETURN ST_MultiPolygon DETERMINISTIC,
  STATIC FUNCTION ST_BdMPolyFromWKB(awkb BLOB, asrid INTEGER)
           RETURN ST_MultiPolygon DETERMINISTIC)
/
CREATE OR REPLACE TYPE BODY mdsys.ST_MultiPolygon wrapped
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
583 1ce
naVdb7eX8A9l5G36Q4Qmx59wjUQwg1XM1/LbfC8zil5HLQIlW2l6FHmjQC63yFmT/neGZla5
6Si87bcaVgXCZpflj2Mpz5DPqmOQXsp5mNZn66UjMELAxmoF+c50BEj7q/bhOi2oHmv9LoQR
LoN2KmsDI7G6XqUcqXVJ7u1akU56bA5dpGQR0s+6Kcuij398oaf35YC3EQaxReqfqZhbfIw8
/r25VCz71wnouVBbrEWHr6N85TsyKbkYIaCfq70yYm5e6GJmh2K9nlbrI1iVQtUtQz7G47tf
xoYYKlxCSTB+rVYmhzqqd2j02EpZPhQD6KAfCkOCyMp+b5CXn+MYkMQdJoDs9lVI56t5Q0JM
2flrXBrkqTmEGnENvzrcr8ch2IXHAdhXLdzzlf/gPwUeSar4Sc3qkzPZPmH9Qp6oNfny7mV7
p+pLkkkQF/4s0qQseLvOzydU
/