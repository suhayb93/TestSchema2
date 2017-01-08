CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_LINK_I
  AUTHID current_user
  UNDER SDO_LINK_T(

  STATIC FUNCTION get_cost_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkCost(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_cost(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_level_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkLevel(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_level(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_state_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkState(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION get_state(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION get_type_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkType(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION get_type(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION get_name_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkName(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION get_name(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION get_start_node_id_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkStartNodeId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_start_node_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_end_node_id_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkEndNodeId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_end_node_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_parent_link_id_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkParentLinkId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_parent_link_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_child_links_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkChildLinkIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_child_links(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_co_link_ids_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkCoLinkIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_co_link_ids(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_sibling_link_ids_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkSiblingLinkIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_sibling_link_ids(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_geometry_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN SDO_GEOMETRY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkGeometry(
    java.lang.String, oracle.sql.NUMBER)
    return     oracle.spatial.type.SdoGeometry',

  OVERRIDING MEMBER FUNCTION get_geometry(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_GEOMETRY DETERMINISTIC,


  STATIC FUNCTION get_geom_id_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkGeomId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_geom_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_end_measure_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkEndMeasure(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_end_measure(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_start_measure_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getLinkStartMeasure(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_start_measure(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  STATIC PROCEDURE make_temporary_s(net_mem VARCHAR2, link_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.linkMakeTemporary(java.lang.String,
    oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE make_temporary(
    net_mem VARCHAR2, link_id NUMBER),

  STATIC PROCEDURE set_cost_s(net_mem VARCHAR2, link_id NUMBER, cost NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkCost(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_cost(
    net_mem VARCHAR2, link_id NUMBER, cost NUMBER),


  STATIC PROCEDURE set_level_s(net_mem VARCHAR2,link_id NUMBER,level NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkLevel(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_level(
    net_mem VARCHAR2, link_id NUMBER,    level NUMBER),


  STATIC PROCEDURE set_type_s(net_mem VARCHAR2, link_id NUMBER, type VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkType(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_type(
    net_mem VARCHAR2, link_id NUMBER, type VARCHAR2),


  STATIC PROCEDURE set_name_s(
   net_mem VARCHAR2,link_id NUMBER,link_name VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkName(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_name(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2),


  STATIC PROCEDURE set_state_s(net_mem VARCHAR2, link_id NUMBER, state VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkState(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_state(
    net_mem VARCHAR2, link_id NUMBER, state VARCHAR2),


  STATIC PROCEDURE set_start_node_s(
    net_mem VARCHAR2, link_id NUMBER, start_node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkStartNode(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_start_node(
    net_mem VARCHAR2, link_id NUMBER,    start_node_id NUMBER),


  STATIC PROCEDURE set_end_node_s(
   net_mem VARCHAR2, link_id NUMBER, end_node_id NUMBER)
  AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkEndNode(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_end_node(
    net_mem VARCHAR2, link_id NUMBER,    end_node_id NUMBER),


  STATIC PROCEDURE set_parent_link_s(
   net_mem VARCHAR2, link_id NUMBER,    parent_link_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkParentLink(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_parent_link(
    net_mem VARCHAR2, link_id NUMBER,    parent_link_id NUMBER),


  STATIC PROCEDURE set_geometry_s(
   net_mem VARCHAR2, link_id NUMBER,    geom SDO_GEOMETRY)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkGeometry(
    java.lang.String, oracle.sql.NUMBER,     oracle.spatial.type.SdoGeometry)',

  OVERRIDING MEMBER PROCEDURE set_geometry(
    net_mem VARCHAR2, link_id NUMBER,    geom SDO_GEOMETRY),


  STATIC PROCEDURE set_geom_id_s(
   net_mem VARCHAR2, link_id NUMBER,    geom_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkGeomId(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_geom_id(
    net_mem VARCHAR2, link_id NUMBER,    geom_id NUMBER),


  STATIC PROCEDURE set_measure_s(
   net_mem VARCHAR2, link_id NUMBER, start_measure NUMBER, end_measure NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setLinkMeasure(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER,oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_measure(
    net_mem VARCHAR2, link_id NUMBER, start_measure NUMBER, end_measure NUMBER),


  STATIC FUNCTION is_temporary_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.linkIsTemporary(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_temporary(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_active_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.linkIsActive(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_active(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_logical_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.linkIsLogical(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_logical(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  STATIC FUNCTION is_external_link_s(net_mem VARCHAR2, link_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.linkIsExternalLink(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  ----------------
  -- DEPRECATED --
  ----------------
  OVERRIDING MEMBER FUNCTION is_external_link(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC
)
  ALTER TYPE SDO_LINK_I NOT INSTANTIABLE NOT FINAL CASCADE
 ALTER  TYPE SDO_LINK_I DROP
      STATIC FUNCTION is_external_link_s(net_mem VARCHAR2, link_id NUMBER)
      RETURN VARCHAR2 CASCADE
 ALTER  TYPE SDO_LINK_I DROP
       OVERRIDING MEMBER FUNCTION is_external_link(
       net_mem VARCHAR2, link_id NUMBER) RETURN VARCHAR2 CASCADE
  ALTER TYPE SDO_LINK_I INSTANTIABLE CASCADE
  ALTER TYPE SDO_LINK_I INSTANTIABLE CASCADE
/
CREATE OR REPLACE TYPE BODY mdsys.SDO_LINK_I wrapped
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
161b 327
e6k/UaiLYL3GG9yYgmbkvHnElpEwg5V1r+KMyo5AF1WwcEIg4Ml/BZhRwNQM4uYdoKHqvLW6
dBYWITJdWoS30eVBTk+7IGeq9rkfyhf6uaKCrTNx5F/kooEpouM0NwluUrP3+0CCFpv+xaNq
Y8qkdS2Ng8+0ZeZGAMKUXWBc+C49T0BHe1/jCh74buWOdQrT+Y44cGeycbh5MPZkxy7/UFLz
nOKinWrdzKrO3tnIcpYFHawQAXz+uNa8xdIhLcij/SePpjIWexUA11Zd3595XNSf75kmRKQn
Xpj3Q/aik6j63d8rTO76XeYfYYpiHFG+AsvRwzd8h5ji9PX1a9AzE/5+JSVbWVfCOtJajVH+
hMT4jQ53DFABIE7C04m5xz9hTFWYsgDgjkX8Z8twd3MOE1A/26F9EDfWg/0Zcs+vAL+m5WSe
5ZrHc2icevgZ7qhYX79SzMJEybr6Z6pwIXxxGlExBd08euBgzyaRvW5gY3NAU4N6YO2kHheI
ju9mVXjiEeUPZ798xKzk5Ubg13LUslIN2UNfD/XvNnLmFpfkVorQTIRfRYRF88/vf47RBukm
qF5/rDIe8IXVODUQyWBWsRQRgP4tpH1QAzW88lF2Rttfj9DmnxtzJQhfAPGE94B/iPtPQB5Z
+VMpWALDjkPhnHUbmeJs9AwSzrX0YNcaQBv/3FqZuORT2d0QHAfsygLhYEQYS5zP68Df8q1Y
bcnaLnpHWtvHTtOxfXUIGKqtBi1E3nKXafjNOTKzwVgBaO2KMAz4RY8/fRw6hsFd0eSSW1zu
4ug=
/