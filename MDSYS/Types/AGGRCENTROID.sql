CREATE OR REPLACE NONEDITIONABLE type mdsys.AggrCentroid AUTHID current_user as Object
(
  context mdsys.SDOAggr,
  static function odciaggregateinitialize(sctx OUT AggrCentroid) return number,
  member function odciaggregateiterate(self IN OUT AggrCentroid,
                                       geom IN mdsys.SDOAggrType) return number,
  member function odciaggregateterminate(self IN AggrCentroid,
                                         returnValue OUT mdsys.sdo_geometry,
                                          flags IN number)
                     return number,
  member function odciaggregatemerge(self   IN OUT AggrCentroid,
                                     valueB IN  AggrCentroid) return number);
/
CREATE OR REPLACE type body mdsys.AggrCentroid wrapped
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
3cb 1da
FYogryS90jXPpe1MatfugAOEX7cwg/AJLvZqfHRVrZ3mxBsvFf/V2ldKJ3QtTH5CIe3Swsyf
MQ6KtYKqGkwDoGsiFlQ8txkS87K6Rjz1HUuGCNskvD/cmk+7AvVEV+AUrX40ixTwOetS+kZL
FgRrd/EUHkMcDMbeW9S224BK7Nj3TFymVBQgKhFko6DKpI5QUch7egK3cJZktsMme3hT1DIb
yQzN+LxAdk/2VALk7nFF5V4iQOWjwaeG3VqJ/c1NUkHH9dF6jLnmVmc4ZseAjmuyTyU4nfsm
F1H8ehukN2CV7L0LnkgrglX76ScTppz8hDRmMTgAf0NfstK9v3doGh9rPenrwhqmzAkPbUVJ
ETqRhyDY/nV+WJlCNLHoFxXpxTFr5VN/3gYZTzWxIRW5bnlFZcdCsmByb2JeEZUVy93ve7Zq
M51VxCuGs09Pk0O811RSk6wEQT/7RTP8hw==
/