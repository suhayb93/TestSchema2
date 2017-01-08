CREATE OR REPLACE NONEDITIONABLE type mdsys.AggrLRSConcat3D AUTHID current_user as Object
(
  context mdsys.SDOAggr,
  static function odciaggregateinitialize(sctx OUT AggrLRSConcat3D) return number,
  member function odciaggregateiterate(self IN OUT AggrLRSConcat3D,
                                       geom IN mdsys.SDOAggrType) return number,
  member function odciaggregateterminate(self IN AggrLRSConcat3D,
                                           returnValue OUT mdsys.sdo_geometry,
                                          flags IN number)
                     return number,
  member function odciaggregatemerge(self   IN OUT AggrLRSConcat3D,
                                     valueB IN  AggrLRSConcat3D) return number);
/
CREATE OR REPLACE type body mdsys.AggrLRSConcat3D wrapped
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
403 1e6
lJLgbd7KlKzcGTFKymWDpLDvJX8wg5AJLSdqfC/NimRTYt8EXoU8UDWn0eZw+jV7jVNtPqTC
DWmStdKRSSa3ey6jshfYmL8juwhNBcp3O/xnip8s8Cibc82BQ8cmZbZl5xSFWlSASfqgy6Ns
8FCDjG9G1IhlUX9ydVuhuhHvNSfobDu3rKflhaZ6CdLLcaAqI3z7ZU3M/cZiIh2b7gh2dbqU
RWlEPehgueDriXw8+NNvz5pO9SRK/gwNFgfJxektq+q7LNxuQtFplFGJBOHEsz7iiFR2WkxQ
gH06t1t+PHBobrzAzyn8s7SDoAailC2BRLdXeOO/8VV0yIbPTz/3z8R7UrupASJGuuXJOkkR
Ui8Q6YKE2FJePbXDejj+FOzj1hIkQ+QBVUXzexTyjF7HMQYKIL/oZMcVyxwubuQAFHiIybMe
7ZO4PhS4t4U3EQALOs9gSC6vWrhxh81JSt5aQ7mZysnSRg==
/