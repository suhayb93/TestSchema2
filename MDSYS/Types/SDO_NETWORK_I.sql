CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_NETWORK_I
  AUTHID current_user
  UNDER SDO_NETWORK_T(

  -- STATIC PROCEDURE add_node_s(net_mem VARCHAR2, node_id NUMBER)
  -- AS LANGUAGE JAVA NAME
  -- 'oracle.spatial.type.NetworkWrapper.addNode(
  --  java.lang.String, oracle.sql.NUMBER)',

  -- OVERRIDING MEMBER PROCEDURE add_node(net_mem VARCHAR2, node_id NUMBER),


  -- STATIC PROCEDURE add_node_s(net_mem VARCHAR2,node_id NUMBER,node_name String)
  -- AS LANGUAGE JAVA NAME
  -- 'oracle.spatial.type.NetworkWrapper.addNode(
  --  java.lang.String, oracle.sql.NUMBER, java.lang.String)',

  -- OVERRIDING MEMBER PROCEDURE add_node(
  --  net_mem VARCHAR2, node_id NUMBER, node_name String),

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  STATIC PROCEDURE add_node_s(net_mem VARCHAR2,node_id NUMBER,node_name String,
   external_network_id NUMBER, external_node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addNode(
    java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
    oracle.sql.NUMBER)',

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  OVERRIDING MEMBER PROCEDURE add_node(
    net_mem VARCHAR2, node_id NUMBER, node_name String,
    external_network_id NUMBER, external_node_id NUMBER),


  -- STATIC PROCEDURE add_node_s(net_mem VARCHAR2, node_id NUMBER, x NUMBER,
  -- y NUMBER, external_network_id NUMBER, external_node_id NUMBER)
  -- AS LANGUAGE JAVA NAME
  -- 'oracle.spatial.type.NetworkWrapper.addNode(
  --  java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER,
  --  oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  -- OVERRIDING MEMBER PROCEDURE add_node(
  --  net_mem VARCHAR2, node_id NUMBER, x NUMBER, y NUMBER,
  --  external_network_id NUMBER, external_node_id NUMBER),

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  STATIC PROCEDURE add_sdo_node_s(net_mem VARCHAR2, node_id NUMBER,
   node_name VARCHAR2, x NUMBER, y NUMBER,
   external_network_id NUMBER, external_node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addSdoNode(
    java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER)',

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  OVERRIDING MEMBER PROCEDURE add_sdo_node(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER,
    external_network_id NUMBER, external_node_id NUMBER),

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  STATIC PROCEDURE add_lrs_node_s(net_mem VARCHAR2, node_id NUMBER,
   node_name VARCHAR2, geom_id NUMBER, measure NUMBER, geom SDO_GEOMETRY,
   external_network_id NUMBER, external_node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addLRSNode(
    java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.spatial.type.SdoGeometry, oracle.sql.NUMBER,
    oracle.sql.NUMBER)',

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  OVERRIDING MEMBER PROCEDURE add_lrs_node(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, geom_id NUMBER,
    measure NUMBER, geom SDO_GEOMETRY, external_network_id NUMBER,
    external_node_id NUMBER),


  -- STATIC PROCEDURE add_lrs_node_s(net_mem VARCHAR2, node_id NUMBER,
  -- node_name VARCHAR2,    geom_id NUMBER, measure NUMBER, geom SDO_GEOMETRY)
  -- AS LANGUAGE JAVA NAME
  -- 'oracle.spatial.type.NetworkWrapper.addLRSNode(
  --  java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
  --  oracle.sql.NUMBER, oracle.spatial.type.SdoGeometry)',

  -- OVERRIDING MEMBER PROCEDURE add_lrs_node(
  --  net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, geom_id NUMBER,
  --  measure NUMBER, geom SDO_GEOMETRY),


  STATIC PROCEDURE delete_node_s(net_mem VARCHAR2, node_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.deleteNode(
    java.lang.String, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE delete_node(
    net_mem VARCHAR2, node_id NUMBER),


  STATIC PROCEDURE add_link_s(net_mem VARCHAR2, link_id NUMBER,
   link_name VARCHAR2, start_node_id NUMBER, end_node_id NUMBER, cost NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addLink(
    java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE add_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER),


  STATIC PROCEDURE add_lrs_link_s(net_mem VARCHAR2, link_id NUMBER,
   link_name VARCHAR2, start_node_id NUMBER, end_node_id NUMBER, cost NUMBER,
   geom_id NUMBER, start_measure NUMBER, end_measure NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addLink(
    java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER,
    oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE add_lrs_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER,   geom_id NUMBER, start_measure NUMBER,
    end_measure NUMBER),


  STATIC PROCEDURE add_sdo_link_s(net_mem VARCHAR2, link_id NUMBER,
   link_name VARCHAR2,    start_node_id NUMBER, end_node_id NUMBER,
   geom SDO_GEOMETRY,    cost NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addLink(
    java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.spatial.type.SdoGeometry, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE add_sdo_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, geom SDO_GEOMETRY, cost NUMBER),


  STATIC PROCEDURE delete_link_s(net_mem VARCHAR2, link_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.deleteLink(
    java.lang.String, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE delete_link(
    net_mem VARCHAR2, link_id NUMBER),


  STATIC PROCEDURE add_path_s(net_mem VARCHAR2, path_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addPath(
    java.lang.String, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE add_path(
    net_mem VARCHAR2, path_id NUMBER),


  STATIC PROCEDURE add_path_s(net_mem VARCHAR2, path_ids SDO_NUMBER_ARRAY)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addPath(
    java.lang.String, oracle.spatial.type.SdoNumberArray)',

  OVERRIDING MEMBER PROCEDURE add_path(
    net_mem VARCHAR2, path_ids SDO_NUMBER_ARRAY),


  STATIC PROCEDURE delete_path_s(net_mem VARCHAR2, path_id NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.deletePath(
    java.lang.String, oracle.sql.NUMBER)',

  OVERRIDING MEMBER PROCEDURE delete_path(
    net_mem VARCHAR2, path_id NUMBER)
)
  ALTER TYPE SDO_NETWORK_I NOT INSTANTIABLE NOT FINAL CASCADE
 ALTER  TYPE SDO_NETWORK_I ADD
   STATIC FUNCTION get_max_link_id_s(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
      AS LANGUAGE JAVA NAME
      'oracle.spatial.type.NetworkWrapper.getMaxLinkID(java.lang.String)
      return oracle.spatial.NUMBER'
 ALTER TYPE SDO_NETWORK_I ADD
   OVERRIDING MEMBER FUNCTION get_max_link_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
 ALTER  TYPE SDO_NETWORK_I ADD
   STATIC FUNCTION get_max_node_id_s(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
      AS LANGUAGE JAVA NAME
      'oracle.spatial.type.NetworkWrapper.getMaxNodeID(java.lang.String)
      return oracle.spatial.NUMBER'
 ALTER  TYPE SDO_NETWORK_I ADD
   OVERRIDING MEMBER FUNCTION get_max_node_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
 ALTER  TYPE SDO_NETWORK_I ADD
   STATIC FUNCTION get_max_path_id_s(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
      AS LANGUAGE JAVA NAME
      'oracle.spatial.type.NetworkWrapper.getMaxPathID(java.lang.String)
      return oracle.spatial.NUMBER'
 ALTER  TYPE SDO_NETWORK_I ADD
   OVERRIDING MEMBER FUNCTION get_max_path_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
 ALTER  TYPE SDO_NETWORK_I ADD
   STATIC FUNCTION get_max_subpath_id_s(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
      AS LANGUAGE JAVA NAME
      'oracle.spatial.type.NetworkWrapper.getMaxSubPathID(java.lang.String)
      return oracle.spatial.NUMBER'
 ALTER  TYPE SDO_NETWORK_I ADD
   OVERRIDING MEMBER FUNCTION get_max_subpath_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC
  ALTER TYPE SDO_NETWORK_I INSTANTIABLE  CASCADE
  ALTER TYPE SDO_NETWORK_I NOT INSTANTIABLE NOT FINAL CASCADE
 ALTER  TYPE SDO_NETWORK_I DROP
   OVERRIDING MEMBER PROCEDURE add_sdo_node(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER,
    external_network_id NUMBER, external_node_id NUMBER) CASCADE
 ALTER TYPE SDO_NETWORK_I ADD OVERRIDING MEMBER PROCEDURE add_sdo_node(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER,
    srid NUMBER, external_network_id NUMBER, external_node_id NUMBER)
    CASCADE
 ALTER TYPE SDO_NETWORK_I DROP STATIC PROCEDURE add_sdo_node_s(net_mem VARCHAR2,
    node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER, external_network_id NUMBER,
    external_node_id NUMBER) CASCADE
 ALTER TYPE SDO_NETWORK_I ADD STATIC PROCEDURE add_sdo_node_s(net_mem VARCHAR2,
   node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER, srid NUMBER,
   external_network_id NUMBER, external_node_id NUMBER) AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addSdoNode(java.lang.String,
    oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.sql.NUMBER,  oracle.sql.NUMBER)'
 ALTER  TYPE SDO_NETWORK_I DROP
   OVERRIDING MEMBER PROCEDURE add_node(
    net_mem VARCHAR2, node_id NUMBER, node_name String,
    external_network_id NUMBER, external_node_id NUMBER) CASCADE
 ALTER  TYPE SDO_NETWORK_I ADD
    OVERRIDING MEMBER PROCEDURE add_node(
    net_mem VARCHAR2,
    node_id NUMBER,
    node_name VARCHAR2,
    geom SDO_GEOMETRY DEFAULT NULL,
    external_network_id NUMBER,
    external_node_id NUMBER) CASCADE
 ALTER TYPE SDO_NETWORK_I DROP
    STATIC PROCEDURE add_node_s(net_mem VARCHAR2,node_id NUMBER,
    node_name String, external_network_id NUMBER,
    external_node_id NUMBER) CASCADE
 ALTER TYPE SDO_NETWORK_I ADD
    STATIC PROCEDURE add_node_s(net_mem VARCHAR2,node_id NUMBER,
    node_name VARCHAR2, geom SDO_GEOMETRY, external_network_id NUMBER,
    external_node_id NUMBER) AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addNode(
    java.lang.String, oracle.sql.NUMBER, java.lang.String,
    oracle.spatial.type.SdoGeometry,oracle.sql.NUMBER, oracle.sql.NUMBER)'
  ALTER TYPE SDO_NETWORK_I INSTANTIABLE CASCADE
  ALTER TYPE SDO_NETWORK_I NOT INSTANTIABLE NOT FINAL CASCADE
 ALTER  TYPE SDO_NETWORK_I DROP
   OVERRIDING MEMBER PROCEDURE add_lrs_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER,   geom_id NUMBER, start_measure NUMBER,
    end_measure NUMBER) CASCADE
 ALTER  TYPE SDO_NETWORK_I ADD
   OVERRIDING MEMBER PROCEDURE add_lrs_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER,   geom_id NUMBER, start_measure NUMBER,
    end_measure NUMBER, geom SDO_GEOMETRY) CASCADE
 ALTER TYPE SDO_NETWORK_I DROP
   STATIC PROCEDURE add_lrs_link_s(net_mem VARCHAR2, link_id NUMBER,
   link_name VARCHAR2, start_node_id NUMBER, end_node_id NUMBER, cost NUMBER,
   geom_id NUMBER, start_measure NUMBER, end_measure NUMBER) CASCADE
 ALTER TYPE SDO_NETWORK_I ADD
   STATIC PROCEDURE add_lrs_link_s(net_mem VARCHAR2, link_id NUMBER,
   link_name VARCHAR2, start_node_id NUMBER, end_node_id NUMBER, cost NUMBER,
   geom_id NUMBER, start_measure NUMBER, end_measure NUMBER, geom SDO_GEOMETRY)
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.addLink(
    java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER,
    oracle.sql.NUMBER, oracle.spatial.type.SdoGeometry)'
  ALTER TYPE SDO_NETWORK_I INSTANTIABLE  CASCADE
  ALTER TYPE SDO_NETWORK_I INSTANTIABLE CASCADE
/
CREATE OR REPLACE TYPE BODY mdsys.SDO_NETWORK_I wrapped
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
e9a 2f2
9vWxtCbVoti33XlV6257ppp7Amswg5WNNccKyi/GEv+wtAuCatJQ9q6iM2NZ75Gm+Ab0u7Vi
nuPzlIxdY0JKWwIy/sS1VenrQfPL8Q0OWKDh1w8mvFaazO0F+1+55JjkYGNXhgbnKjxbw7gr
wuY8FjaXdZTx7goDHbj/O4I3IOXlruUZvfXZ/93AOVEID7BtrDxXVAeB75d7yJJbIeVsPyp+
7pUO09IhFH8IrQRfZrlVG7G43e8fr0gU27pP1j1kf/sl77f7tzbC+8kIl2nxiDH5aq01ryLJ
7JwWLJtTa/nDzl+LuL65YQt/DfK8NGxzc+X+5PaXD3Z2vWeR6eRbjspOvCsHtyW1cVuaTANA
4vcnLBoPR7LGltzpT7Gn+uf293g5uTmLzE64Cud0rhFLDjnV+kn5Zb7QcOoS1m1kbBudnKfV
NK6S5v3lX9cca8s4YcyheZ6eih0bvWAORpHhS9+qvQnGCeiNHsS1sB83MS+f/+heMDJhe0H9
F4r5ZUfSG6ZqV0qloRhoLW+UxowkvldYhuLYnRKLmh4IuV/V/NIwU36xwAU4DcgXzPByd8/R
fzrtUZ2Azsr7GMscshqYUDeXCWMREiQT0WIGajYM5Dven+3Bz6qrzIjRAvYMwamHfn6sGai4
UkRoxtHqEatsZmPZ2XN19tFT3zTsZoDrfzoUd2dPZyDW8ISBdLQExZmY9Cpvi4jYf3dz2EWt
evO/42FniiC15JsdIF5RZg==
/