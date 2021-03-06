CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.ST_POLYGON
                                      
UNDER ST_CURVEPOLYGON (
  CONSTRUCTOR FUNCTION ST_POLYGON(alinestring ST_LineString)
       RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_POLYGON(alinestring ST_LineString,
      alinestringarray ST_LineString_Array) RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_POLYGON(alinestring ST_LineString, asrid INTEGER)
    RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_POLYGON(alinestring ST_LineString,
   alinestringarray ST_LineString_Array, asrid INTEGER) RETURN SELF AS RESULT,

  OVERRIDING MEMBER FUNCTION ST_ExteriorRing RETURN ST_LineString DETERMINISTIC,
  OVERRIDING MEMBER FUNCTION ST_ExteriorRing(acurve ST_Curve)
             RETURN ST_Polygon DETERMINISTIC,
  MEMBER FUNCTION ST_InteriorRingsP RETURN ST_LineString_Array DETERMINISTIC,
  MEMBER FUNCTION ST_InteriorRingsP(acurvearray ST_Curve_Array)
     RETURN ST_Polygon DETERMINISTIC,
  OVERRIDING MEMBER FUNCTION ST_InteriorRingN(aposition INTEGER)
             RETURN ST_LineString DETERMINISTIC,
  STATIC FUNCTION ST_BdPolyFromText(awkt CLOB) RETURN ST_Polygon DETERMINISTIC,
  STATIC FUNCTION ST_BdPolyFromText(awkt CLOB, asrid INTEGER)
        RETURN ST_Polygon DETERMINISTIC,
  STATIC FUNCTION ST_BdPolyFromWKB(awkb BLOB) RETURN ST_Polygon DETERMINISTIC,
  STATIC FUNCTION ST_BdPolyFromWKB(awkb BLOB, asrid INTEGER)
        RETURN ST_Polygon DETERMINISTIC)
/
CREATE OR REPLACE TYPE BODY mdsys.ST_POLYGON wrapped
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
1046 46b
VkuOphget4FPLQeU75ovf/ndTwUwg0Mr2cAFfHSKMQ83jCFSKlIjCrBYs9bgrfdasqFsgaG1
tR9ELPFaoUrNYVIoCK8L7DZL3eA1/F6ADi89vYkce7NuTY/dd8sOjnHeMZyjWk0ShydA2k5r
NtCmXbKGNtB/3NcZNPJSutNVDKCoLrK+FWP8/c1uH0ZlSAB1VV/TsxX+LA7Ff3Waotlem9LO
znkoNCDsCAWr2CLU4yEapARklcgMWE/xahzLPOTIucQ74V3fz8lo55N/QfZRJYwNwIh1mkbq
xlUP6gGdaGERhoLR1pmBjMwmSszpKVT6hwMb2ZjLLUniqftQpqInmY9e4n9/OV9q+8J+RCrV
6XIqIeb1vNgTs32+aUqkp2CosxUj9dUnWA6DIRtF30y4Rs0r3oiNhSvolWkzCdPieZFoWBGr
xTySQTCDulvnX9M76YSR/wzxP1Y98sKeCia9bJsnLnErAoEeAQj0w1ISzLtriY1aJxuNGYmu
twr4Ckm0S41qtXm90LWEXAaNWl957A5seTUGQKidIfdZWrd5Z360vWnzeutl/4nJQzuGLx2F
NHf6iSoYr32oRtonfF/sWRx6lnXFSBt3ASMSn4e2VO7q4DOK0CGXrUVKwUanyu/3OzeYL+IL
M+6I7w7z8PzxuMdW/3eCzPH9WJW8/3zBe8ltJJG9jCY7hkoEQIz/Nkxp9vB07faYFA1Us6BB
vmpv6SRvXWj7PnoLHan5odRRo53oXF+rloiqkEVJBL3/aiFbaMA+PyznRO2XqL5QS4ruyNzM
hr1wK9jL+DECvvSvS9qw3n7qHsH6aE0TR4d/PAsrnDnBOlVXAMJvZ78gpz1Qy8tHTnvOx/o8
I3Rkk5mKUrXkibxgFbNL59u+3VINJ5osLqhzhhBVvZWK+dRcEt5mxwWANyea/bP5uFewxJWL
BzWy9HhCQcxgnkqez0MWmmJPrhfSB5sTDE6p/K7rDZtoDQsZ0z/tXFc0AOZAif8uc+ajGJdw
2GMRKuEINDTtERb9zHFiFUNV82Fu7VOkPlj0gg7+20bng/6u+4cw4nMSR/k4z9XSxJzg5odn
CDdjYnRH4PQoj59Gv9g7HRDoYYse2SAPcsvU
/