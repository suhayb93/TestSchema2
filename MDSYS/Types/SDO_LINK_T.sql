CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_LINK_T
  AUTHID current_user
  AS OBJECT(
  object_id INTEGER,

  NOT INSTANTIABLE MEMBER FUNCTION get_cost(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_level(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_state(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_type(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_name(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_start_node_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_end_node_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_parent_link_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_child_links(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_co_link_ids(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_sibling_link_ids(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_geometry(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN SDO_GEOMETRY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_geom_id(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_end_measure(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION get_start_measure(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER PROCEDURE make_temporary(
    net_mem VARCHAR2, link_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_cost(
    net_mem VARCHAR2, link_id NUMBER, cost NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_level(
    net_mem VARCHAR2, link_id NUMBER,    level NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_type(
    net_mem VARCHAR2, link_id NUMBER, type VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE set_name(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE set_state(
    net_mem VARCHAR2, link_id NUMBER, state VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE set_start_node(
    net_mem VARCHAR2, link_id NUMBER,    start_node_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_end_node(
    net_mem VARCHAR2, link_id NUMBER,    end_node_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_parent_link(
    net_mem VARCHAR2, link_id NUMBER,    parent_link_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_geometry(
    net_mem VARCHAR2, link_id NUMBER,    geom SDO_GEOMETRY),

  NOT INSTANTIABLE MEMBER PROCEDURE set_geom_id(
    net_mem VARCHAR2, link_id NUMBER,    geom_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE set_measure(
    net_mem VARCHAR2, link_id NUMBER, start_measure NUMBER, end_measure NUMBER),

  NOT INSTANTIABLE MEMBER FUNCTION is_temporary(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION is_active(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION is_logical(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC,

  ----------------
  -- DEPRECATED --
  ----------------
  NOT INSTANTIABLE MEMBER FUNCTION is_external_link(
    net_mem VARCHAR2, link_id NUMBER)
    RETURN VARCHAR2 DETERMINISTIC

) NOT INSTANTIABLE NOT FINAL
 ALTER  TYPE SDO_LINK_T DROP
       NOT INSTANTIABLE MEMBER FUNCTION is_external_link(
         net_mem VARCHAR2, link_id NUMBER) RETURN VARCHAR2 CASCADE
/