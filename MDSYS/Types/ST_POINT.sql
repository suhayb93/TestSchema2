CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.ST_Point
                                        UNDER ST_GEOMETRY (
  CONSTRUCTOR FUNCTION ST_Point(xcoord DOUBLE PRECISION,
           ycoord DOUBLE PRECISION) RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ST_Point(xcoord DOUBLE PRECISION,
            ycoord DOUBLE PRECISION, asrid INTEGER) RETURN SELF AS RESULT,
  OVERRIDING MEMBER FUNCTION ST_Dimension RETURN Integer DETERMINISTIC,
  MEMBER FUNCTION ST_X RETURN DOUBLE PRECISION DETERMINISTIC,
  MEMBER FUNCTION ST_X(xcoord DOUBLE PRECISION) RETURN ST_Point,
  MEMBER FUNCTION ST_Y RETURN DOUBLE PRECISION DETERMINISTIC,
  MEMBER FUNCTION ST_Y(ycoord DOUBLE PRECISION) RETURN ST_Point,
  MEMBER FUNCTION ST_ExplicitPoint
            RETURN ST_DOUBLE_PRECISION_ARRAY DETERMINISTIC)
/
CREATE OR REPLACE TYPE BODY mdsys.ST_Point wrapped
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
732 24c
TICQj0tvsnTW8ROCwf7EfedB4lcwg9de2iDWfC+5bg9S7/clFvq0TR2PmQC9ioXflEF1mKAM
tZ0n/QscY8OIUZ81zrnP/gD/g3HzZa90FlWHJBkZJDd3Ocofcd6TwaNaU3d6sRRTlvPbMuCZ
puxx5/qp9HvV8+LTxwlhJ8G3ya2+DaH0RadhiKcfWo0A5UV3VXd0mQb5vNm5mY6UegD4qbJ/
s0XnJ97xLx1XpMvGTHoIRVYHt5ju+8SDJXa50rS/jOM6b1LtYSQNM/oDJJ/PaCTAnxlorjTR
WMWhdH7vVmkZuq4kirtElGQWYi8GRMNUAVeNjcwCaL2O7EQ1rKLdaYzY47cliXIyawwGXKg9
qKZzrDS7pTB62udhEXR0y/uDkWHGvqbiiHbs+Dr9ZVpR9vhN5I7elpoRW0Aj1SQIw4zySjWT
VpRIK0jOvfgbjoCL7bIM0iuxQjRBewZPUIolc/LcGYUlh0I0YUdH5vesurTNlg7XqqVd9bdJ
izmuFfbf/psa/g6IenwM31Vdvd+x8cAlPzw24IAO8DaDw5d32P0qF0toC40JaKD7vvh6z/uW
jTvv
/