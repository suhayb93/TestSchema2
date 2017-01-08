CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_NODE_I
  AUTHID current_user
  UNDER SDO_NODE_T
(
 STATIC FUNCTION get_cost_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeCost(
    java.lang.String, oracle.sql.NUMBER) return oracle.sql.NUMBER',

 OVERRIDING MEMBER FUNCTION get_cost(
    net_mem   VARCHAR2,
    node_id   NUMBER
 )  RETURN NUMBER DETERMINISTIC,

 STATIC FUNCTION get_hierarchy_level_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeHierarchyLevel(
    java.lang.String, oracle.sql.NUMBER) return oracle.sql.NUMBER',

 OVERRIDING MEMBER FUNCTION get_hierarchy_level(
   net_mem   VARCHAR2,
   node_id   NUMBER
 ) RETURN NUMBER DETERMINISTIC,

 STATIC FUNCTION get_state_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeState(
    java.lang.String, oracle.sql.NUMBER) return java.lang.String',

 OVERRIDING MEMBER FUNCTION get_state(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC,

 STATIC FUNCTION get_type_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeType(
    java.lang.String, oracle.sql.NUMBER) return java.lang.String',

 OVERRIDING MEMBER FUNCTION get_type(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC,

  STATIC FUNCTION get_name_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeName(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION get_name(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION get_partition_id_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodePartitionId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_partition_id(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_component_no_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeComponentNo(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_component_no(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_in_link_ids_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeInLinkIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_in_link_ids(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_out_link_ids_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeOutLinkIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_out_link_ids(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_incident_link_ids_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeIncidentLinkIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_incident_link_ids(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_child_node_ids_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeChildNodeIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_child_node_ids(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_adjacent_node_ids_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeAdjacentNodeIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_adjacent_node_ids(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  STATIC FUNCTION get_sibling_node_ids_s(net_mem VARCHAR2, id NUMBER)
   RETURN SDO_NUMBER_ARRAY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeSiblingNodeIds(
    java.lang.String, oracle.sql.NUMBER)
        return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION get_sibling_node_ids(
    net_mem VARCHAR2, id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  STATIC FUNCTION get_geometry_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN SDO_GEOMETRY DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeGeometry(
    java.lang.String, oracle.sql.NUMBER)
    return     oracle.spatial.type.SdoGeometry',

  OVERRIDING MEMBER FUNCTION get_geometry(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN SDO_GEOMETRY DETERMINISTIC,


  STATIC FUNCTION get_geom_id_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeGeomId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_geom_id(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  STATIC FUNCTION get_external_node_id_s(net_mem VARCHAR2, id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeExternalNodeId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  ----------------
  -- DEPRECATED --
  ----------------
  OVERRIDING MEMBER FUNCTION get_external_node_id(
    net_mem VARCHAR2, id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  STATIC FUNCTION get_external_network_id_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeExternalNetworkId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  ----------------
  -- DEPRECATED --
  ----------------
  OVERRIDING MEMBER FUNCTION get_external_network_id(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  STATIC FUNCTION get_external_network_name_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeExternalNetworkName(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  ----------------
  -- DEPRECATED --
  ----------------
  OVERRIDING MEMBER FUNCTION get_external_network_name(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION get_parent_node_id_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeParentNodeId(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_parent_node_id(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_measure_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeMeasure(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_measure(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC PROCEDURE set_cost_s(net_mem VARCHAR2, node_id NUMBER, cost NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeCost(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_cost(
    net_mem VARCHAR2, node_id NUMBER, cost NUMBER),


  STATIC PROCEDURE set_hierarchy_level_s(net_mem VARCHAR2, node_id NUMBER,
    level NUMBER)
    AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeHierarchyLevel(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_hierarchy_level(
    net_mem VARCHAR2, node_id NUMBER,    level NUMBER),


  STATIC PROCEDURE set_type_s(net_mem VARCHAR2, node_id NUMBER, type VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeType(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_type(
    net_mem VARCHAR2, node_id NUMBER, type VARCHAR2),


  STATIC PROCEDURE set_name_s(net_mem VARCHAR2, node_id NUMBER,
   node_name VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeName(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_name(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2),


  STATIC PROCEDURE set_state_s(net_mem VARCHAR2, node_id NUMBER, state VARCHAR2)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeState(
    java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE set_state(
    net_mem VARCHAR2, node_id NUMBER, state VARCHAR2),


  STATIC PROCEDURE set_component_no_s(net_mem VARCHAR2,node_id NUMBER,no NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeComponentNo(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_component_no(
    net_mem VARCHAR2, node_id NUMBER,    no NUMBER),


  STATIC PROCEDURE set_parent_node_s(net_mem VARCHAR2, node_id NUMBER,
   parent_node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeParentNode(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_parent_node(
    net_mem VARCHAR2, node_id NUMBER,    parent_node_id NUMBER),

  ----------------
  -- DEPRECATED --
  ----------------
  STATIC PROCEDURE set_external_node_id_s(net_mem VARCHAR2, node_id NUMBER,
   external_node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeExternalNodeId(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  ----------------
  -- DEPRECATED --
  ----------------
  OVERRIDING MEMBER PROCEDURE set_external_node_id(
    net_mem VARCHAR2, node_id NUMBER,    external_node_id NUMBER),

  ----------------
  -- DEPRECATED --
  ----------------
  STATIC PROCEDURE set_external_network_id_s(net_mem VARCHAR2, node_id NUMBER,
   external_network_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeExternalNetworkId(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  ----------------
  -- DEPRECATED --
  ----------------
  OVERRIDING MEMBER PROCEDURE set_external_network_id(
    net_mem VARCHAR2, node_id NUMBER,    external_network_id NUMBER),


  STATIC PROCEDURE set_geometry_s(net_mem VARCHAR2, node_id NUMBER,
   geom SDO_GEOMETRY)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeGeometry(
    java.lang.String, oracle.sql.NUMBER, oracle.spatial.type.SdoGeometry)',

  OVERRIDING MEMBER PROCEDURE set_geometry(
    net_mem VARCHAR2, node_id NUMBER,    geom SDO_GEOMETRY),


  STATIC PROCEDURE set_geom_id_s(net_mem VARCHAR2, node_id NUMBER,
   geom_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeGeomId(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_geom_id(
    net_mem VARCHAR2, node_id NUMBER,    geom_id NUMBER),


  STATIC PROCEDURE set_measure_s(net_mem VARCHAR2, node_id NUMBER,
   measure NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.setNodeMeasure(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE set_measure(
    net_mem VARCHAR2, node_id NUMBER,    measure NUMBER),


  STATIC PROCEDURE make_temporary_s(net_mem VARCHAR2, node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.nodeMakeTemporary(
    java.lang.String, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE make_temporary(
    net_mem VARCHAR2, node_id NUMBER),


  STATIC FUNCTION is_temporary_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.nodeIsTemporary(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_temporary(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_active_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.nodeIsActive(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_active(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION is_logical_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.nodeIsLogical(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_logical(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,


  STATIC FUNCTION link_exists_s(net_mem VARCHAR2, node_id1 NUMBER, node_id2 NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.linkExists(
    java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER)
       return java.lang.String',

  OVERRIDING MEMBER FUNCTION link_exists(
    net_mem VARCHAR2, node_id1 NUMBER, node_id2 NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  STATIC FUNCTION is_external_node_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.nodeIsExternalNode(
    java.lang.String, oracle.sql.NUMBER)
    return java.lang.String',

  ----------------
  -- DEPRECATED --
  ----------------
  OVERRIDING MEMBER FUNCTION is_external_node(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  STATIC FUNCTION get_in_degree_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeInDegree(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_in_degree(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,


  STATIC FUNCTION get_out_degree_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeOutDegree(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_out_degree(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  STATIC FUNCTION get_degree_s(net_mem VARCHAR2, node_id NUMBER)
   RETURN NUMBER DETERMINISTIC AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.getNodeDegree(
    java.lang.String, oracle.sql.NUMBER)
    return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION get_degree(
    net_mem VARCHAR2, node_id NUMBER)
    RETURN NUMBER DETERMINISTIC

)
  ALTER TYPE SDO_NODE_I NOT INSTANTIABLE NOT FINAL CASCADE
 ALTER  TYPE SDO_NODE_I DROP
    STATIC  FUNCTION get_external_network_id_s(
    net_mem VARCHAR2, node_id NUMBER) RETURN NUMBER CASCADE
 ALTER  TYPE SDO_NODE_I DROP
    OVERRIDING MEMBER FUNCTION get_external_network_id(
    net_mem VARCHAR2, node_id NUMBER) RETURN NUMBER CASCADE
 ALTER  TYPE SDO_NODE_I DROP
     STATIC PROCEDURE set_external_network_id_s(net_mem VARCHAR2, node_id NUMBER,
     external_network_id NUMBER) CASCADE
 ALTER  TYPE SDO_NODE_I DROP
     OVERRIDING MEMBER PROCEDURE set_external_network_id(
     net_mem VARCHAR2, node_id NUMBER,    external_network_id NUMBER) CASCADE
 ALTER  TYPE SDO_NODE_I DROP
    STATIC  FUNCTION get_external_node_id_s(
    net_mem VARCHAR2, id NUMBER) RETURN NUMBER CASCADE
 ALTER  TYPE SDO_NODE_I DROP
    OVERRIDING MEMBER FUNCTION get_external_node_id(
    net_mem VARCHAR2, id NUMBER) RETURN NUMBER CASCADE
 ALTER  TYPE SDO_NODE_I DROP
     STATIC PROCEDURE set_external_node_id_s(net_mem VARCHAR2, node_id NUMBER,
   external_node_id NUMBER) CASCADE
 ALTER  TYPE SDO_NODE_I DROP
     OVERRIDING MEMBER PROCEDURE set_external_node_id(
     net_mem VARCHAR2, node_id NUMBER,    external_node_id NUMBER) CASCADE
 ALTER  TYPE SDO_NODE_I DROP
     STATIC FUNCTION get_external_network_name_s(net_mem VARCHAR2, node_id NUMBER)
     RETURN VARCHAR2 CASCADE
 ALTER  TYPE SDO_NODE_I DROP
     OVERRIDING MEMBER FUNCTION get_external_network_name(
        net_mem VARCHAR2, node_id NUMBER) RETURN VARCHAR2 CASCADE
 ALTER  TYPE SDO_NODE_I DROP
     STATIC FUNCTION is_external_node_s(net_mem VARCHAR2, node_id NUMBER)
     RETURN VARCHAR2  CASCADE
 ALTER  TYPE SDO_NODE_I DROP
      OVERRIDING MEMBER FUNCTION is_external_node(
      net_mem VARCHAR2, node_id NUMBER) RETURN VARCHAR2 CASCADE
  ALTER TYPE SDO_NODE_I INSTANTIABLE CASCADE
  ALTER TYPE SDO_NODE_I INSTANTIABLE CASCADE
/
CREATE OR REPLACE TYPE BODY mdsys.SDO_NODE_I wrapped
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
1a72 3c1
J6Dxdq05a6cClSmRdSuQ1geo7vEwg5V11/GMyi/G/m6wj1cmwmEni3tJZu1ApAKOyHcwm3Oa
4Pt/NbI1kSuwCSrM+Ib+sCr1CoOZDrZJYvFGv1+2fX37DPVXytsgyjZsiVxNN4s24XO+wgnM
/2lE5dW+wyCDdKjo0KAC+Z9qUXoLCMwOIo5/6mTU6v0c96YylEeQNTaO40BlxZRigTLFs73F
l35ZF5IOkgBdil0TDDBywOR3It2FweGKgkQ4FgXiQP13utV1GnKO75QrS9wVcA1gRi7406So
Hhyv6pK5BUEZkddxv0ATvc52mAciksqtdxsBG4FEmenX9zO6NZ356P62FycWQsfudHWHL7wm
OSRS6DmXRezCls1s6lpLcTP1BwLdzat/HDXobz9cEm0I88LVXgngJzQSEBt2vq7XWDzbbLQu
dwRmXvMbqlIxJPCYGOxSXbl90hr2h+kBcyTpXuEPaeynnjAd8qDVDIJTZPN/zskrakYxIwP1
rQtd63IGXggbr5iQxEi2NHdYY/am2QqpLkRTbildH68MyoOU+rC3XOOYZ9SfLzgMehXSzpEw
z/yMFKi8blEVoIWjEm35GJ8ixZMK7iDiFexs+nUoyjifCxKd2LF7YbQ3f4woiaK+z4O4xtSo
RCp8ujCz8TBPWWM4cPbkqfDIQBuuH0kIfwykbJ722x8Znff0a3B6vbH4MlkOpLXo0RT+kEGp
0AtAv2Nj+HJUF6OxcOmrnMzZL7bOUQAWfqAalxQyvRDkQw3nxB3+WqFLofhRTEzBLch4NFtv
hBqVNLL5rNw3P1/SYMhQYEDO1Ahlq3TFsXABnVub64uzC3PNOQVR/q1OU/aHs9OxBayYGohd
n18HIJBl37C80L/A8iI/CV/GCKLX+O/efnfjne5mab20YXO8F3M3v6PajyQlyZu73bxG+HD5
c5JbSwK+cQ==
/