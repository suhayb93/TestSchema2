CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_PATH_I
  AUTHID current_user
  UNDER SDO_PATH_T(

  STATIC FUNCTION get_cost_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathCost(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_cost(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_no_of_links_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathNoOfLinks(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_no_of_links(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_type_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathType(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION get_type(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION get_name_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathName(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION get_name(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION get_start_node_id_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathStartNodeId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_start_node_id(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_end_node_id_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathEndNodeId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_end_node_id(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_geometry_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN SDO_GEOMETRY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathGeometry(
    java.lang.String, oracle.sql.NUMBER)
    return     oracle.spatial.type.SdoGeometry',

  OVERRIDING MEMBER FUNCTION get_geometry(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN SDO_GEOMETRY DETERMINISTIC,

  STATIC FUNCTION get_node_ids_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathNodeIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_node_ids(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_link_ids_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getPathLinkIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_link_ids(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC PROCEDURE set_type_s(net_mem VARCHAR2, path_id NUMBER, type VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setPathType(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_type(
    net_mem VARCHAR2, path_id NUMBER, type VARCHAR2),


  STATIC PROCEDURE set_name_s(net_mem VARCHAR2, path_id NUMBER,
   path_name VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setPathName(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_name(
    net_mem VARCHAR2, path_id NUMBER, path_name VARCHAR2),


  STATIC PROCEDURE set_path_id_s(net_mem VARCHAR2, path_id NUMBER,
   new_path_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setPathPathId(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_path_id(
    net_mem VARCHAR2, path_id NUMBER, new_path_id NUMBER),


  STATIC PROCEDURE set_geometry_s(
   net_mem VARCHAR2, path_id NUMBER, geom SDO_GEOMETRY)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setPathGeometry(
    java.lang.String, oracle.sql.NUMBER,     oracle.spatial.type.SdoGeometry)',

  OVERRIDING MEMBER PROCEDURE set_geometry(
    net_mem VARCHAR2, path_id NUMBER,    geom SDO_GEOMETRY),


  STATIC FUNCTION is_closed_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.pathIsClosed(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_closed(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_connected_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.pathIsConnected(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_connected(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_simple_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.pathIsSimple(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_simple(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_temporary_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.pathIsTemporary(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_temporary(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_logical_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.pathIsLogical(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_logical(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_active_s(net_mem VARCHAR2, path_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.pathIsActive(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_active(
    net_mem VARCHAR2, path_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC PROCEDURE compute_geometry_s(
   net_mem VARCHAR2, path_id NUMBER, tolerance NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.computeGeometry(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE compute_geometry(
    net_mem VARCHAR2, path_id NUMBER,    tolerance NUMBER)
)
  ALTER TYPE SDO_PATH_I INSTANTIABLE CASCADE
/
CREATE OR REPLACE TYPE BODY mdsys.SDO_PATH_I wrapped
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
eae 26c
KSM+rXZDb5XVELz5HOFA43Grp94wg5WN2UgVfC/pmIvVyaEUd+nE2F8ANgotpPCkxSv5tZ1N
Lhwq5/LTDBuZicZHaMe2x83RYhWv45lUOM/ZaPrZsgMTsqmt7/eOCbEOaaTIj7TeuRqzaYxO
aFTEsgGme3ECnleCBklgD9p9wedQTIoK4lxG4u8AaOE3y6GhYju3enqcb8tUDJCn+fMQSqwZ
SFsNoRqDBxx34CTWk/0gSrz3kgVv6a71gqRTpe0rDtDp9o+MkbkSF+UhMolHGmFKzOSf4YQL
s4HAjG4pZontlYRREykOYIxQswFEP5GrBbF1BBIDx8GSHIryW3N5cuO0AUzk0ptY0eA/7bOV
Fp1o6QxAjH3nr9EYUKTbgylSRP4OvWsQQYlzdelfTh3HU0qyTjVPRgtl9vPNUCIfVIbQnbrV
a7tEm1ClyHuIU+MSk0uKyjyaovKB4ZJPzn2w13P4oR5CC1YYrJh9Gljz/VJAs6u+1Uoil4uz
uiaDOdlR/uxCaMtc9uM7gyGCUEkxepLUd/ED6Fb4yuyA/xUxvqUjKSrHYelIwwWtcXbj7rjo
NeDsC+D8kxQZ2XpflfXJ4Mr5P+ThYFfUsA==
/