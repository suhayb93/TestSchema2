CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.ST_COMPOUNDCURVE
                                       UNDER ST_CURVE (
  CONSTRUCTOR FUNCTION ST_COMPOUNDCURVE(acurve ST_CURVE) RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_COMPOUNDCURVE(acurvearray ST_CURVE_ARRAY)
           RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_COMPOUNDCURVE(acurve ST_CURVE, asrid INTEGER)
           RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_COMPOUNDCURVE(acurvearray ST_CURVE_ARRAY,
            asrid INTEGER) RETURN SELF AS RESULT,

  MEMBER FUNCTION ST_Curves RETURN ST_Curve_Array DETERMINISTIC,
  MEMBER FUNCTION ST_Curves(acurvearray ST_Curve_Array) RETURN ST_CompoundCurve,
  MEMBER FUNCTION ST_NumCurves RETURN INTEGER DETERMINISTIC,
  MEMBER FUNCTION ST_CurveN(aposition INTEGER) RETURN ST_Curve DETERMINISTIC)
/
CREATE OR REPLACE TYPE BODY mdsys.ST_COMPOUNDCURVE wrapped
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
6e9 22f
zzgS+x7EIr9jJiXI3pFsVJVBF/Iwg9fD2UjWfC+KWGS076cv/L7MKDZvkfq0hYfq1/S1tW2S
NaS4EfKMHMA1MACYgtqHE9G2FZMyH3whxCduiY1M9oFb4XhEZwoaqHm6Casj1boG8hlnDFs2
EeDsmtIkR0Qq8T3L0FEH1FNjLazg7oLLcW/phdL4gaknRsS/yCvjXufGfrXQwtqU0E3eoEjR
oSV2pwdGVfc92sDLceI+/EH2hGmxEw4RcVkWKgI02A4pd370bUVYG7EPKYY9e+1dVqmTGjJ1
aR6aNKFhw38RIbtxukYd/LAANIANIvhC6AkNZLaDxyqETyQ6rQYw1EfyrskrP3401su9gYVs
eNsFfcupSSqIm6AIYmbPbf1pviHTYfbkFJoywDhn8Z+iNwtYIwtWx3roG2SGZb+topBChzXx
uGzA20XeKZcJ+xe/uVnYv4WFnTQUmGTBPWrn+EETVWtyU+WONJCyM23Pwc8intkBMRM3cWxo
JNvvPPqVRaGIHN+fufzhAOh9hS1JYZ6HMfLotbzP+6nexD0=
/