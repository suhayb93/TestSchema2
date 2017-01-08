CREATE OR REPLACE NONEDITIONABLE type mdsys.AggrUnion AUTHID current_user as Object
(
  context raw(4),
  static function odciaggregateinitialize(sctx IN OUT AggrUnion) return number,
  member function odciaggregateiterate(self IN OUT AggrUnion,
               geom IN mdsys.SDOAggrType) return number,
  member function odciaggregateterminate(self IN AggrUnion,
                                 returnValue OUT mdsys.sdo_geometry,
                                 flags IN number)
                     return number,
  member function odciaggregatemerge(self IN OUT AggrUnion,
                    sctx2 IN  AggrUnion) return number,
  member function sdoaggregateiterate(self IN OUT AggrUnion,
               geom IN mdsys.sdo_geometry, dim IN mdsys.SDO_DIM_ARRAY)
  return number);
/
CREATE OR REPLACE type body mdsys.AggrUnion wrapped
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
90a 36c
xO2xgxDAOZ5HuKoXKzZL+wKmGDQwgw1cr0gFfHRVMQ810pEdArEzUw5b6ehc+2HDWpunivHZ
GMoHkWdQc7UWMS2K1Eis4uuo94UX/AizGlWSiDgmbSpLzTO0dp+dKPSgvVTGbl1p3xjaJpR9
rAwbRjWvdvJskJGN5PQmQ0hE8eTwHbsgjmsDNt0O9l/hPXcMIWc5cG/F6KJqNuH+OU1dJXwD
OXkYRbR8LajWshyVJ0YTc2QkQVC5SxLtvYssJQD7sZful0RqgoJG9RFWGq9nCk6aQf9BBn1n
z5n6WOtAJSGy0FBKoIvChpBi4yPwOCSMREzcqiaV5Xq2UShZDA7iAA7RioOLYVAcQ1r5X+IE
CkOZaYWj5QmAzkBW/cl0upbhh/URe/rglCjc6ghLoqhcyqjZ3cr+JH1a9d413oBQ5eH+RsUJ
gfO8AGG4g14/GIZmkq5354ZC9xk7X/c4e0UY368X634WhYH2RxT2JnABUvG3ck3WTaybSP5s
XAUeopRTB3oHW02gP9xF5W3RWAPCStO+AEy3kHfIAYMi+QQZGMrpSP3/s4N+VtXiGm1myybX
RjULoIhbKcWEqg+7u5uYImidw9uAHk6IJZsSZLNmiKBAF6E5m2LRITm9WhpAO38xb4IK7bna
Cqt0YpQFDpbUQ8oBlUaBeMRzyLK2iHTo0K7osZyGIlnoxNbe4NHtiAyHie4/nxayiXV81yJv
wCykZvV2SUqYigku9iHgSHevKjvNxrtqfUxXTz95biixkbXAaNw9XbYMJRcljJigGQpwia11
sKBBq2e7z+r/vBYteKPzJmrG+T92kfqwM69Kq+4k9rle/bkXN4mGcBI9DLuwMZydZyZ23Q==

/