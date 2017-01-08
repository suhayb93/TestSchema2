CREATE OR REPLACE NONEDITIONABLE type mdsys.SDOAggr AUTHID current_user as Object
(
  Geometry mdsys.sdo_geometry,
  Diminfo mdsys.sdo_dim_array,
  call_count  number,
  call_method varchar2(128),
  call_type   number,
  call_value  number,
  static function odciaggregateinitialize(sctx OUT SDOAggr) return number,
  member function odciaggregateiterate(self IN OUT SDOAggr,
               geom IN mdsys.SDOAggrType) return number,
  member function odciaggregateterminate(self IN SDOAggr,
                                         returnValue OUT mdsys.sdo_geometry,
                                          flags IN number)
                     return number,
  member function odciaggregatemerge(self IN OUT SDOAggr,
                    valueB IN  SDOAggr) return number) 
/
CREATE OR REPLACE type body mdsys.SDOAggr wrapped
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
1980 562
l37OMnCRINOK5OQ4o3D/Wzj6ULYwg1VUDNATfC+5WA/uumfwUfBR5QVgEsp8OPfdhzEbVdIV
UrtztQdK1+85dFc3XGOjo98EEosTINTQiEIQHcDgCI3jdQIsLKo0wzAc82WJ3qL/RPCRlxY4
UolAoRWovWwaIY3edWOdrx/3z0nYyCPfPyh65leFrF7mbeQ2bhqsMF02ofLM2Ccjl3KcyUCu
bVYF03OKtcPQj1QuCmPFyvOM5rmi8+nKNj85q4br760R8O8ObLjkwZmF/xRjG315YzXENlTi
IsEtUxhMAGdmoa/d0W5sTngAa6RM5erI5OVp62XcjXy9vbhV+51LSWMXyUfdQWVdesNexUEh
yCdnHJ0IbVZyL1FIUIazbsMOfy6wnd55jhNAOxZHwmXgRI0YJ4bN1TH24sMMcg2+5sfcXdVQ
pxi9vFyE/1L5Le8RsQRkbGXe9yd8aQJnJgJOZvF4ZuRKfORrnb0kfKQqMaCm+mX1rfAOqERl
++9ajiW8ATku7GeiTpfgm+bfnr81f9vfTB6rZqPLOTPqO739w2h/gbT9F+F+7qvWezmBNniv
U/avkvDsee+0WHLRRzs3G3zudX9r3TFY2a7PgnCV961l/iKKr0Qo9346afyY+29NbJejuf92
LFLzyaQgdE25xxBawkx5kDX16szqUf26iB8n8KJrz24hsTATsldbHC+74hWZjrXF/0QUrWk+
Vqhabgu40cUf56u9fVtuwxwGtd2uEZXXXPYwJ1wX15j2/w8RzkQZD7Mo0Nr2GVte2puyN5oF
ujtAPd2r3hvRE7puHSb9mu/3hqC7gXSjU4WYbl++Eom20FdFOIpwcfOlqWf9wUgFWUb2twMh
+Rc1uh67AorD25KMH2rduSYnb/qTrgwymCt4CM35KT5n8jMUBEym15RU8OrJitC21tE4K3eM
fsJW+UW2KcQ998uUBmJJlo395IS45I7Vy0YIszLufLXaiDJCT0bWtr2QtHStRv+6KcXPeu8s
mX3O7tzGTnP1cVQrXXAPTfkiUAtfNilKU2SYmJiDjAdAvmtWgzfGMw+/rWKGBf07PAUCOEy7
vLNIxxHJeVLvcGHPf0zt3c8s138eH6eDlVkKysPuUeUsalGVAMTCx28b5vsm/Kg3F7M9Jo1o
J/0byCOWmEzc6PzLlF63okPdthL3xj4vIU23r7tzASyMQIJWpMObv8nBDqyPo37Od0adOSO3
ab9H6HOM31TrP8YhRQeL+81e3tIGdp81ZevBQpOHIbsUv0HYWIqsIcCyYStJfkTU6MD6xsJs
IKhs1bQh7BF6wIkS1aPHsEu+hBBahduIIg+Uu81g1rPdrYbX92QcD/nhWPaRdw==
/