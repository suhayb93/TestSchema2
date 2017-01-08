CREATE OR REPLACE NONEDITIONABLE Type mdsys.SDO_Topo_Geometry
                                                                      
AUTHID current_user as Object
  (TG_Type  NUMBER,
   TG_ID NUMBER,
   TG_Layer_ID NUMBER,
   Topology_ID   NUMBER,
   Constructor Function SDO_Topo_Geometry(TG_Type number,
                                    TG_id NUMBER,
                                    TG_layer_id NUMBER,
                                    Topology_ID NUMBER)
     return SELF as RESULT DETERMINISTIC,
   Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,
   Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,
   Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    add_Topo_ids SDO_TGL_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,
   Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    add_Topo_ids SDO_TGL_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,

   Member Function Get_Geometry
     return SDO_GEOMETRY DETERMINISTIC )
  alter type sdo_topo_geometry add
   Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,
   add Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    add_Topo_ids SDO_TOPO_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,
   add Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,
   add Constructor Function SDO_Topo_Geometry(topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    add_Topo_ids SDO_TOPO_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC,
 add   Member Function Get_Topo_Elements
     return SDO_TOPO_OBJECT_ARRAY DETERMINISTIC  CASCADE
  alter type SDO_Topo_Geometry add member function Get_TGL_Objects  return SDO_TGL_OBJECT_ARRAY DETERMINISTIC CASCADE
  alter type sdo_topo_geometry add   Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type sdo_topo_geometry add  Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    add_Topo_ids SDO_TOPO_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type sdo_topo_geometry add  Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type sdo_topo_geometry add  Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    add_Topo_ids SDO_TOPO_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TOPO_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type sdo_topo_geometry add  Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type sdo_topo_geometry add  Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type sdo_topo_geometry add  Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    TG_Type number,
                                    TG_layer_id NUMBER,
                                    add_Topo_ids SDO_TGL_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type sdo_topo_geometry add  Constructor Function SDO_Topo_Geometry(tg_id number, topology varchar2,
                                    Table_Name  varchar2,
                                    Column_Name varchar2,
                                    TG_Type number,
                                    add_Topo_ids SDO_TGL_OBJECT_ARRAY,
                                    delete_Topo_ids SDO_TGL_OBJECT_ARRAY)
     return SELF as RESULT DETERMINISTIC CASCADE
  alter type sdo_topo_geometry add  MAP MEMBER FUNCTION to_string RETURN VARCHAR2 CASCADE 
/
CREATE OR REPLACE type body mdsys.SDO_Topo_Geometry wrapped
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
b0fc 1710
7Y2JYU4pp/aYeb06AnlkUh7IF8Ewg81MuiAF1NMicpKU+Mgd8r2Mo5veKKNJRBH0n/XL6UUU
PdSuRn4KSvvpnpG+Nankzrlz3OyJFpOfPjZ/6bkByb+fvFgx7sXtNKWv3iE0Nvp8lyVDnAGf
Iro/QTvqmt0W3g2mptYWWSUwZVqMBG4uFTV7GOYJe0Xjwsckq/jezzHccgOOKm/c1LA/ilHs
0D9wkLNLJ/DdmNKGl4HKOzX1Pz78MlrttK5Jf13GKP+pnN1k+hRa8x6mFClXAYGq/gavW5a5
xPiAgJC2zqV3JCwCoB6ziBHW3zjJial88jgsNVD7h1fb/q36l17y+1okzthsJcGWuzcdQD+P
sCJXbYx/BCi32RrZxnozHSjX5t/SCShXmp0ehI+pJCLOLSg8xDHPknlhl7lI3RKlmZIY0bBt
/dLjaHGRziX7SdiUtYwkdd3igIYtJHZCpZ5eKqFg7r56+9FYJCtyB0dK/4V4IW5MQkeoDCXq
vi+U/cOpceUo3lXHjG8sXpt1EGwChdhR9lo9vdOGwglZ9F22h9w0TRErh6YF4yG29lSW826i
sLVOW96LlS2/9DbYZ7zXKjc5VoXhtb8kyLnIk8osOkgOK1Zx0XVhUP34BrNSLCT0+edzVJjZ
sR80UJEs3LcH27weqlkLKMDyU2DwpfrHCOqc/qGjw7HYVBG4EY/jNyp3EE5DzXhTb3EtuIsD
ncnHNFFfXIumpcEnOohZwU6K+clYazllTa2weOuBdwk3YpdDsZV+Aiscvt1t9zPwHz6YYb+h
seJ5k9rPbIMfSxF+juj3enPRTzLChfrO9KHH15Q52ojOHxGUs8mox6jjDtFttumM+yECP3a/
CyCJzjEwda+WzGif1ITGMo80e7kFGVJkv2it9+XjRFanfJytBRiAe3V/CNVX/BYh4yMg8BjC
g+bwhQrhJvbY5WPUm1j7Rv2ptCn+rdqe1TUGxJGK1hR/s9SD0VnkV0Oeh1ohAa9D1bw0Si/l
+pVoyLXaxf6ujA3WegJMlfwvJ7YhgwV3GTg8fbtgqniSmEhz1zw9QSpXudKtTaWc9vUSajgr
2EXZxOk0NH6unzToCM3dae/Ld8sdBampXCzq5qlJB6mDL3ByL6Xn4abVNqbpeSSoNlryLA3i
VqpsDoxKMUClaUSUjlxdwMh82M+yFKYRzfdgWfBKD0rB9VcqEcMy6VR8S9qwo4yVFD999X7M
ZNRYJ2lCEsP/x7SrcUi4vq9DzVJCC8Y7OZHf7cRxERkoWIHWTrkpP1KlWfnNGZM5Jr+rzjYb
ooGe4YLjrPpXw1Lo8v797EQFRPJcXYmvTnWssCcwFg7ZlHZ8pVSpvkP3VpNg1sASYGJ7AMVr
WUPzfMS4FZ4aJ70M+7M0O6bEmSegdMUN22x3Lt4LwDZ1/W934loBmOEuZtRIGjYcgmV2wgO5
RDXUvf0CF/ctkIdwuhrseTcgoyMn1vUjKk8B7tJOdKcCArDquNELgd9FBVukwywRsg6fW9k6
asFEls/tbrpalcPuqFk5LOQtgBZqNtr158es2ejuUYrSXszqRdkNERokmp3ak8jmXafDBwxj
oMBpMILZC6o4o/jfBV4V8Kx4YpWgfr3rZV+4G6Gfby4Va2w+lUh1oYbgtBEktdjdGE4yDXFo
rCrTv0tn0zRxN/ZWUF0eVRWie1RwUp2HAHFknNUn0Hr32gWPi6iP6PwfeIUxyhfWbpjp/xBI
Uot+uN+Pk5YwYauAxw81XaNRhVRqBN321PpjWmVLRhNDCZ4V7BOvJ/rFf0Orf9Iv83erjxmr
LgyPKfuGEft+IqfXoPt+PEaQcHI6rv1sZ1yAiqRAMVIKg/Z0Ew2XB6E2u9nGuQqT73cEMfo/
e8TxowlH+coGgT0VgdpJvubY+ciEgS6Ka39jlxMJZgmzBF7wf2P9XvCtPXVeWzjcXLK7dxdp
kyXK2G89N11nwwMmM2fSmQPlxe3JvFg+De4FKf2d9tHYjoXE4BqpPO9kkAW2W1ssYK98mTMT
nZ23/lNHqlzxW2QkVdcgokqHvL1pdXpUKji4gCB59KEAiv5hy5LtVDp6rOyHSo3Ji8qHwpet
VWeh7miwCyNXg6AiAUUHoB5gkN/80og06KMT5o1H5BewzP5w8YPhEjtVQNLfCWhsRzEVemYS
jy6t5L2aS95DdkRBH2EFEsjwJoMdXwNcngPeZ4+j3I3AXVRxtsmCZ4DMkNqZoM0A/zNxhnD4
vxTFI9M71npJeZ0/222p3fDzyDHJsjnfBM6u3d054f50N66P5FyB+cvzRA88n0ZY42v7VL7J
2D4E/TDWujWHOxfKS3BxO0sNu1C618bKiqXjRcEvkBK5gOehg5gN3kqMJtge2iJNdBBj/sFc
5v4yp2k+b/J+UB+yA3td8IzO4AibUlNoJYB+pgP7R6ovcEjBpcNGR+AosP/WEMso37+V221b
/8kPCGySYzNp2KQQ0HjpmmIdDZuoEHKSjalFhqATkFRwKklpofZHYcqREt3zBcGrS3k0ztRt
IF/3yZj+iFQb2tCmIeihC+w0Z+saLS7sqaG2fDqAtBYLu+FfEEZxFeahjHTsYlodoDbPZWmo
3T6khYBPDH5n11AC8iv8TGj3ZL3qwNJgsF1orr5YFLOsG1gs1GNzblZbnRnzRHHSVh6Ueh4F
TzU/0cyWZbQth3/ITuEzwa8W0pkeTuGtgYQJ2mT56TaBEjVzbVEH2Ck01HIt0t4gHtuKlBwF
f7JrIUAkgdqbhE69cVQLrNRREj/QVCBTdQIY7hF09ZfuAMz0sTXUaBTcUXVWY/PCc/99YsOl
xPQsD8kd52AnNeRvXnWrINX0jCpjeBNRaygCRRe+sZy7vbbcZecsLVuAatAJmcEAcFnTXZO+
Pjnu9Y7LW4cGHvV/ulholEO3dACNnvjU8HBuFtiACMhf8fUeilYIXi5n4SQzFTdoiRoADuXG
QK3p3pMD65VKSBPGSWHYuqO0xcC+s0AoDcqLcKnLDbhEKtH3yQWW8yv4KeZbz3MhutddVSF+
Dq8kfrsY/Rql+XGKupSIecLN6ZwfJBcVjxXhcNup6+7URBneJTz3rI9vSF1xanZ8SkCmxaKf
FEZp9EtfdXVuBeb7J2NYGQbEupc+A+fU7hUcQUq3RwwvQL+3s87hiN2dRFNa2nTxfsBSqDo+
uEZ7pJXqAw1OBduZYBfvqhbsFe/XZ6EnX8oJbT+m/91snWBIZ2IwsKSsryFEGo/jcwTnxLxp
/ZEOmtYLXahLlrWNneSAoAfaAS68sUVRfTkSZq07/gM6iiPwlfP0Zm8B9IKRDWTJTimSSL4w
ROJ+JLjRkaOL87uY4CkNsd0V0T86zxBtb2fckwmOzFP5M0TaDMbISYvXuD1EQvz3s4Yzv4hI
BUJV5QJMZ8tFWP7fpBr4gfUNOQ+7PE9hHD4Fi3jFEu1xVi/X6prdnD1VwJWtEGR+GLeOFxK2
GkFlaBogxkcRbwOE1IukJVRdwl5WxbiOjcKPRjoEm/UzPZVQJ95YvfVAPzBzOXpocsKVNABE
6qRN0wf5xjN3AceJf7VOBrUvUIev+Ye1yNqDcIPtkGJr4Q81enWfCBoBbUPXdNndoNq6aEtk
3RhbWU3YXhSZb2b9t55+oDkXaVcivJeIgGjcP0N1XGBfUcP1psCDqXRVaIt/jJsaoXrl/p7I
//p71r/30sF4hIscy/+g2k9zvv/5body4/WHMlgarOFAKVv6SX7gMr/4+oNgsOM5FOKj/rs/
KqPZsO6fDc/OrG91IfVP6KpVYkju/BJU2AVk2mmd/mvITL6t9VRg98vwEdMtauKkuSngmUpF
O+XzsW+5FGU0V/GmSDD6xHXegBPxO5hh/OpOQ+eNCrlagB8/FpOVFy9KpYMaPDZ+MPFKrNF5
pEX0hXGNXoraSMw+Melv843t0roi1yJkpBidICNEEPRlYWmmIZlRfeYvwIuw1ijTBbSl79xP
DM1SnOzuCbTZtVfyocrwseS/BGPORn4a9TGwAb7mJUBmoNJT6Z/EsAzK8uAemIlvinCogreV
p6OtjOg6IM1BBb8xETX3pAJQ2wFmPlubTVYM7S0lob+mMfKUow3hRhPffoRI06Evm0EOXoMd
VdG55qTPAybf2FD67zYkevdUgLZto3rMgMTwBwRe8AV7uwiVSSs+70WWt1lPDZOIaNQFHEhs
swLdowQfAZtmzPI9W/n4QKPDRWZr6iDyR6z/OsrjDt/uFTBROQQtLdnG23pi3J/FVgnOtz4C
OuZ17wc6ZhElDjlmtKKknWDWSdenoxnIYGXsCUL8H8fWKx8l7xQaTdDEAC7cxxbWFK/lIOMw
yDyulyv8v0Y+K+jkUoDvbswZhhoLs0k2MaLGj8Ugpsz97XhGLMI/m6sbbBKbnsJWoX+50vzX
CxoYl2DHZvE3yMQS2yIkm9MWIekCdYAag4r9qyskWQX/gMZEgLn32QXVZ0mMm2PMk3Q3vMi4
dnYCaajCzlJ9RCWngtUeCZQGZgaV8YXaMdwzTPjCmJK3178Q20I9THvra8f6lfXth1VMANgX
aEh5lFhwFTIDuYFcm3mkarrZLtDfNIMirp9gMuP8hugs8HosNgVjOhnjCL9fUuvEH5j2E5fh
EdphoAgG5W+xnbRNlnaDZfem9kiYYstw1cQBLw7g58qWpnDQprTktdz7nYMn3TisLh/bmRP4
hEHkJccP4PyaoV4gKC8mSLfzHODubuSFRxvpN+PT3hWn/Y7mKPLpaUeSFO42P6IOXe12N0vD
WEYRDHeZrGbRUEqVapJIGUyvMVRVcsI6VeCfKK2TaGGI1qTqF0tlqqlltKqJr8RDiEYJLXFV
RytaPCqe2v+hbfiOI6WG90vUHFGZAbaon2/mQgbn8gA1th+pPEpbckSYFx2JvflpiBvcxAa6
Q4AC8oA3Gh+ajyVnEFSsEGf/Z484KL4obGCwjYtqj0xxypycJJHLmLlY9DdNHGdLx8q3apjE
WwRS3ASWD4nyGt/Zvl0cd7TQcnN0jag+ZfQRxHULkmJyWPz6+evQM/Ddp7wdM1945CPClhp0
RntsOc6ZWsS6qyuP5vjaxbhDqAM2TKu4LQBmgJNAOrrO4BP91e7C+32rqOaHHVsASvgFv3zw
B82Ogvot5Ux/1T7TySzs4CvyHhhYJPXehDonl3RCMVwDGmqRMitikjLDRpW+OGTv07kGhISM
VJsAEKYWFvryRVMWLH9xp8mo9D4OOhjKlg/zuwUJFbaBsjYFKNU3VWx8SHUTnE/lOTqpGrol
tQFA5ZFyk8J3YUey1UeZHb5YON2ntDKmQnBE3nBw+KBkLgNjaeGs65VC56PUjj1+YECJQcqB
MEDD+kZJGMnsFGE9jyhle3uOs0fMCj0r4VxfY5e9rly+YpCeldWr7n8TSj+XWSY0wmBu2Ne3
gBlq9vPFHnajYY5dXqI1bcJjfit2VhMV3hyurPVG31ODGN45dpAvW+3hF1tRy0I4J+cfACrX
meHV6fJtFTbMYPwmB4oQRNGPuqAL0Fp3fWqZHuPVY99r9LnJhD13+xxWbLWro4Caj6enpT8r
uOJvRVhMhIaYEKq/mGkrNiNV+jJu3TcrKyir/tx9Z6+taaTIQ9R3bJRLVIeqmEFyVuVwIzIP
1t9NTctnPgKpF6aFvrcOSmydrxVkwny6us4tPR5IaQz/lyVWsjiatqeFo/5SG5TPSCq7OgzU
9DNg8fmSCAPEiio/xQQzmCEGxy4wE0SqVxvkAy3urXfebzCOwYOBxY8p68UC1Zs7k9H2rhdF
2SrAfq4yEvKo8RisFBUyq/ZFJ39cn94QTPJ/JG8ugpQXbaLpDoOiqrWBeJttAck=
/