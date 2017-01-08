CREATE OR REPLACE NONEDITIONABLE type mdsys.AggrMBR AUTHID current_user as Object
(
  context mdsys.SDOAggr,
  static function odciaggregateinitialize(sctx OUT AggrMBR) return number,
  member function odciaggregateiterate(self IN OUT AggrMBR,
               geom IN mdsys.sdo_geometry) return number,
  member function odciaggregateterminate(self IN AggrMBR,
                                        returnValue OUT mdsys.sdo_geometry,
                                          flags IN number)
                     return number,
  member function odciaggregatemerge(self IN OUT AggrMBR,
                    valueB IN  AggrMBR) return number);
/
CREATE OR REPLACE type body mdsys.AggrMBR wrapped
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
3bf 1ca
yVYXyId88P0xsTF59mTHtScoHccwg/AJmEhqfHSKimSPb/3nX/+ye4Vl7+dLGmcaGEUM1Ipz
tWuJQxTLBqvuZ/vPGZCFhr1rmXPn/MA6MkzYVlxn2LQnVxtkMTkoa7EriLazFmAeYroqtCzY
oU54RtvItyVow6bzrekoIr7L71SsnnshPAzyfvzOzjTfd+Kw96P8hMt3IrJqHBiqmmrcBhcm
g9ctiuyLaRvXEmUhpHpSDKH2FPEhkofPRMtJdLVQcF+bd0Zq89gPJbScsreIdNGwIGdyrax2
xov05aAt2i6kckMHW6Ti7eGQCBMFXBEoBkvkw5AHVQEWesTelxYXc/F9nvp51Wmdd8i4CSlY
BR4DpkrWZYlSjjHsJwGx1hq/PadnXUDig2KOGbxtk0su7XZgAz+OpZ76vXHEyELN8oft1qxj
X37BGAWdF/4zW+jDQy4=
/