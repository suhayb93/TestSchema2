CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_NETWORK_T
  AUTHID current_user
  AS OBJECT(

  object_id  INTEGER,

  --NOT INSTANTIABLE MEMBER PROCEDURE add_node(
  --  net_mem VARCHAR2, node_id NUMBER),

  --NOT INSTANTIABLE MEMBER PROCEDURE add_node(
  --  net_mem VARCHAR2, node_id NUMBER, node_name String),

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  NOT INSTANTIABLE MEMBER PROCEDURE add_node(
    net_mem VARCHAR2, node_id NUMBER, node_name String,
    external_network_id NUMBER, external_node_id NUMBER),

  -- NOT INSTANTIABLE MEMBER PROCEDURE add_node(
  --  net_mem VARCHAR2, node_id NUMBER, x NUMBER, y NUMBER,
  --  external_network_id NUMBER, external_node_id NUMBER),

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  NOT INSTANTIABLE MEMBER PROCEDURE add_sdo_node(
      net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER,
      external_network_id NUMBER, external_node_id NUMBER),

  --NOT INSTANTIABLE MEMBER PROCEDURE add_sdo_node(
  --  net_mem VARCHAR2, node_id NUMBER, x NUMBER, y NUMBER),

  --NOT INSTANTIABLE MEMBER PROCEDURE add_sdo_node(
  --  net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER),

  -----------------------------------------------------
  -- external_network_id: not used. can be any value --
  -- external_node_id:    not used. can be any value --
  -----------------------------------------------------
  NOT INSTANTIABLE MEMBER PROCEDURE add_lrs_node(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, geom_id NUMBER,
    measure NUMBER, geom SDO_GEOMETRY, external_network_id NUMBER,
    external_node_id NUMBER),

  --NOT INSTANTIABLE MEMBER PROCEDURE add_lrs_node(
  --  net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, geom_id NUMBER,
  --  measure NUMBER, geom SDO_GEOMETRY),

  NOT INSTANTIABLE MEMBER PROCEDURE delete_node(
    net_mem VARCHAR2, node_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE add_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE add_lrs_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER, geom_id NUMBER, start_measure NUMBER,
    end_measure NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE add_sdo_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, geom SDO_GEOMETRY,    cost NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE delete_link(
    net_mem VARCHAR2, link_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE add_path(
    net_mem VARCHAR2, path_id NUMBER),

  NOT INSTANTIABLE MEMBER PROCEDURE add_path(
    net_mem VARCHAR2, path_ids SDO_NUMBER_ARRAY),

  NOT INSTANTIABLE MEMBER PROCEDURE delete_path(
    net_mem VARCHAR2, path_id NUMBER)
) NOT INSTANTIABLE NOT FINAL
 ALTER  TYPE SDO_NETWORK_T ADD
   NOT INSTANTIABLE MEMBER FUNCTION get_max_link_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC CASCADE
 ALTER  TYPE SDO_NETWORK_T ADD
   NOT INSTANTIABLE MEMBER FUNCTION get_max_node_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC CASCADE
 ALTER  TYPE SDO_NETWORK_T ADD
   NOT INSTANTIABLE MEMBER FUNCTION get_max_path_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC CASCADE
 ALTER  TYPE SDO_NETWORK_T ADD
   NOT INSTANTIABLE MEMBER FUNCTION get_max_subpath_id(net_mem IN VARCHAR2)
      RETURN NUMBER DETERMINISTIC CASCADE
 ALTER  TYPE SDO_NETWORK_T DROP
   NOT INSTANTIABLE MEMBER PROCEDURE add_sdo_node(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER,
    external_network_id NUMBER, external_node_id NUMBER) CASCADE
 ALTER TYPE SDO_NETWORK_T ADD NOT INSTANTIABLE MEMBER PROCEDURE add_sdo_node(
    net_mem VARCHAR2, node_id NUMBER, node_name VARCHAR2, x NUMBER, y NUMBER,
    srid NUMBER, external_network_id NUMBER, external_node_id NUMBER)
    CASCADE
 ALTER  TYPE SDO_NETWORK_T DROP
   NOT INSTANTIABLE MEMBER PROCEDURE add_node(
    net_mem VARCHAR2, node_id NUMBER, node_name String,
    external_network_id NUMBER, external_node_id NUMBER) CASCADE
 ALTER  TYPE SDO_NETWORK_T ADD
   NOT INSTANTIABLE MEMBER PROCEDURE add_node(
    net_mem VARCHAR2, node_id NUMBER,  node_name VARCHAR2,
    geom SDO_GEOMETRY DEFAULT NULL, external_network_id NUMBER,
    external_node_id NUMBER) CASCADE
 ALTER  TYPE SDO_NETWORK_T DROP
   NOT INSTANTIABLE MEMBER PROCEDURE add_lrs_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER, geom_id NUMBER, start_measure NUMBER,
    end_measure NUMBER) CASCADE
 ALTER  TYPE SDO_NETWORK_T ADD
   NOT INSTANTIABLE MEMBER PROCEDURE add_lrs_link(
    net_mem VARCHAR2, link_id NUMBER, link_name VARCHAR2, start_node_id NUMBER,
    end_node_id NUMBER, cost NUMBER, geom_id NUMBER, start_measure NUMBER,
    end_measure NUMBER, geom SDO_GEOMETRY) CASCADE
/