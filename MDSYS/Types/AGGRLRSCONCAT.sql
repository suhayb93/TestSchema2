CREATE OR REPLACE NONEDITIONABLE type mdsys.AggrLRSConcat AUTHID current_user as Object
(
  context mdsys.SDOAggr,
  static function odciaggregateinitialize(sctx OUT AggrLRSConcat) return number,
  member function odciaggregateiterate(self IN OUT AggrLRSConcat,
                                       geom IN mdsys.SDOAggrType) return number,
  member function odciaggregateterminate(self IN AggrLRSConcat,
                                        returnValue OUT mdsys.sdo_geometry,
                                          flags IN number)
                     return number,
  member function odciaggregatemerge(self   IN OUT AggrLRSConcat,
                                     valueB IN  AggrLRSConcat) return number);
/
CREATE OR REPLACE type body mdsys.AggrLRSConcat wrapped
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
3ef 1de
nGn+y0ohRwLd86q5VaONrulGf/0wg5AJLvZqfHRVrZ3mxBsvFf/V2ldKJ3T5FmFl7EyXtGvE
stT5JLeG6PaxfrJONa+nQdIZbRG0ZqC8/Wd2yywbojr5M5Kbk31UZxQ1oxXov/Ggv4/aJgIJ
+43Kd9y3b2AkC4hszd3+Nj5YozBJRFxEZ2f81h2xBW8dfedEoE2gho5P8/6lML3VeR8HtNv/
sMElgdR3yIYQstU/msfNIh9k/H+35lw7x7GGR6KnbWYqLZzTC10hRUoL+2+AIp3n73TkPu/s
shG/Ytj/x0gcAhnoOR+s43PidRWuF1NJMc3nrT2765Q+dB6ZBRtWA6hozILZIjUKoZuylXQt
g5D2+ZwZ9LS3fABKYUzVkxmZcAtGGPQu395IT84pBXVOKTRctwAXG/ntpG00wgR3s0l1mstU
FFIaMYdCAJ2rDKo/G5y6eMYY69MauP5Erbqlsg==
/