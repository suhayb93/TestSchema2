CREATE OR REPLACE NONEDITIONABLE type mdsys.AggrConcat AUTHID current_user as Object
(
  context raw(4),
  static function odciaggregateinitialize(sctx IN OUT AggrConcat)
              return PLS_INTEGER,
  member function odciaggregateiterate(self IN OUT AggrConcat,
               geom IN mdsys.SDO_GEOMETRY) return PLS_INTEGER,
  member function odciaggregateterminate(self IN AggrConcat,
                                 returnValue OUT mdsys.sdo_geometry,
                                 flags IN number)
                     return PLS_INTEGER,
  member function odciaggregatemerge(self IN OUT AggrConcat,
                    sctx2 IN  AggrConcat) return PLS_INTEGER);
/
CREATE OR REPLACE type body mdsys.AggrConcat wrapped
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
5af 22b
U8p5OKMxi422nx7Wdn3ZfKCdwZ8wgw1eLUgVfC/NbmRXf/Mm/FCN+rQH9j5h982gGgzDzEYE
DtMGtT0Day/m4ZQn7RQ/vzPtEnIf5T4VtBietMC+Qw8TOsbRXiIdLFRpdhtj7jWTHSu4lRr1
FpNnAcNp2Gm7V9J6R2fMNHQvhmir/+ZB+1d0Y4J8Ys87WWf0SmdwHJ7JkfoU4dCmjieKdQrd
e2vp15Euqa7zaiEVcHOtSaMK1yd4Wn0TnpZnAeH/5uHoR8zgZ8E4daajB86GciIlegUvF2vj
JjJ35dU6PoHdE1eEIqxWHfAjX+KunuUMT2vG4MAmavkJ9CvGdW+8m66HtHtmBHHpe0yXNilQ
VebNbwUUwwywy42jZpVv7LXt0+kz17UZ27eJOn2nyNtZ1euJwmKGPQ2WgZcY07dbnKO1BvGh
rxrQYy6IWIuTjPQ82rwFLMIXVUNyD6t3L4wd/ACngyQFbgnaYu25TWBJElsdSJgtLHfBTrDI
hLWFaM36Iy1M+U5HdgWtySwjmCqtvco7s+Ozaniz1FyM
/