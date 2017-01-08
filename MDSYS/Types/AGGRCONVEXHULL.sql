CREATE OR REPLACE NONEDITIONABLE type mdsys.AggrConvexHull AUTHID current_user as Object
(
  context mdsys.SDOAggr,
  static function odciaggregateinitialize(sctx OUT AggrConvexHull) return number,
  member function odciaggregateiterate(self IN OUT AggrConvexHull,
                                       geom IN mdsys.SDOAggrType) return number,
  member function odciaggregateterminate(self IN AggrConvexHull,
                                         returnValue OUT mdsys.sdo_geometry,
                                          flags IN number)
                     return number,
  member function odciaggregatemerge(self   IN OUT AggrConvexHull,
                                     valueB IN  AggrConvexHull) return number);
/
CREATE OR REPLACE type body mdsys.AggrConvexHull wrapped
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
404 1f2
VfQ/q2HjRQnRZ3FLJ2yGeCKbaIswg/AJLUjWfC/NR+pob8gv/GhNHXXWVBWfRnLMffEml9MN
CWMrc+RBLg5rqCEc0RW/cv4Z2YxIbWl1wtbkMOQvuyAPZJoTcus+8d/hDK2h+43rrBqzcPKo
TkVILf+9Y6cUTmC8cH5Eza9X4ZqOYLu4nVIut6KmYvH2KhGwnn41o+MO3aMnSAi93bDBJFNU
jWEDWGLwndAqD2NQscaOK8+qzqSHY2uGDPHY+BdyDABMHKCJk0k2o9l5d2yx54455nga82Hk
trp+xcgjYKODlp6wYIzkd0YqLWT6jSNg94M53VcQpU9aecRBVIJwQknuQcKTrBzsX+Wn6X+i
oRA+HmEaQ+uCBUPwanDXDYn4muXsNGFBWbvM09d+7M54VPWhrLYhfnLoKeNb+GDJjGtjkdrF
ajPptZGLfrtRmJ4FI398uNBsNdxSc5pHbCkZ2NJHkpwDTtt1iA8cP6bwgfjo
/