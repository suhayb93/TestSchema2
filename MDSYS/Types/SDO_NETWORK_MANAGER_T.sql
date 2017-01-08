CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_NETWORK_MANAGER_T
  AUTHID current_user
AS OBJECT(
  object_id INTEGER,

  NOT INSTANTIABLE MEMBER FUNCTION all_paths(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    goal_node_id    NUMBER,
    depth_limit     NUMBER,
    cost_limit      NUMBER,
    no_of_solutions NUMBER,
    constraint      VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION find_connected_components(
    net_mem   VARCHAR2
  ) RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION find_reachable_nodes(
    net_mem          VARCHAR2,
    source_node_id   NUMBER,
    constraint       VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION find_reaching_nodes(
    net_mem VARCHAR2, target_node_id NUMBER, constraint VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  -- parameter lists
  --   constraint: the name of the Network Constraint.  Set to NULL if no
  --               constraint is desired.
  NOT INSTANTIABLE MEMBER FUNCTION is_reachable(
    net_mem          VARCHAR2,
    source_node_id   NUMBER,
    target_node_id   NUMBER,
    constraint       VARCHAR2 := NULL
  )
  RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION mcst_link(
    net_mem   VARCHAR2
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,


  NOT INSTANTIABLE MEMBER FUNCTION nearest_neighbors(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    no_of_neighbors NUMBER,
    constraint      VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION shortest_path(
    net_mem       VARCHAR2,
    start_node_id NUMBER,
    goal_node_id  NUMBER,
    constraint    VARCHAR2 := NULL
  ) RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION shortest_path_dijkstra(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    goal_node_id    NUMBER,
    constraint      VARCHAR2 := NULL
  ) RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION tsp_path(
    net_mem          VARCHAR2,
    nd_array         SDO_NUMBER_ARRAY,
    is_closed        VARCHAR2,
    use_exact_cost   VARCHAR2,
    constraint       VARCHAR2 := NULL
  ) RETURN NUMBER DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION within_cost(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    cost_limit      NUMBER,
    constraint      VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  NOT INSTANTIABLE MEMBER FUNCTION list_networks RETURN VARCHAR2 DETERMINISTIC,


  NOT INSTANTIABLE MEMBER PROCEDURE create_logical_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,   is_directed           VARCHAR2,
    node_table_name VARCHAR2,        node_cost_column      VARCHAR2,
    link_table_name VARCHAR2,        link_cost_column      VARCHAR2,
    path_table_name VARCHAR2,        path_link_table_name  VARCHAR2,
    is_complex VARCHAR2
  ),

  NOT INSTANTIABLE MEMBER PROCEDURE create_lrs_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2,  srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_cost_column VARCHAR2,
    link_table_name VARCHAR2, link_cost_column VARCHAR2,
    lrs_table_name  VARCHAR2, lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE create_sdo_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_geom_column VARCHAR2,
    node_cost_column VARCHAR2, link_table_name VARCHAR2,
    link_geom_column VARCHAR2, link_cost_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE read_network(
    net_mem        VARCHAR2,
    allow_updates  VARCHAR2
  ),

  NOT INSTANTIABLE MEMBER PROCEDURE write_network(net_mem VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE drop_network(net_mem VARCHAR2),

  --- register given network constraint into user_sdo_network_constraints
  --- directory_name must be the name of a valid Oracle directory object
  --- class_name should be given without suffix ".class"
  --- Deprecated. Use SDO_NET.REGISTER_CONSTRAINT instead.
  NOT INSTANTIABLE MEMBER PROCEDURE register_constraint(
    constraint_name VARCHAR2, class_name  VARCHAR2,
    directory_name VARCHAR2,  description VARCHAR2),

  --- deregister given constraint from user_sdo_network_constraints
  --- Deprecated. Use SDO_NET.DEREGISTER_CONSTRAINT instead.
  NOT INSTANTIABLE MEMBER PROCEDURE deregister_constraint(
    constraint_name  VARCHAR2),

  NOT INSTANTIABLE MEMBER FUNCTION validate_network_schema(network VARCHAR2)
      RETURN VARCHAR2 DETERMINISTIC,

  NOT INSTANTIABLE MEMBER PROCEDURE create_ref_constraints(network VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE enable_ref_constraints(network VARCHAR2),

  NOT INSTANTIABLE MEMBER PROCEDURE disable_ref_constraints(network VARCHAR2)

) NOT INSTANTIABLE NOT FINAL
 ALTER  TYPE SDO_NETWORK_MANAGER_T ADD
   NOT INSTANTIABLE MEMBER FUNCTION is_versioned_wm(net_mem IN VARCHAR2)
      RETURN BOOLEAN DETERMINISTIC CASCADE
 ALTER  TYPE SDO_NETWORK_MANAGER_T ADD
   NOT INSTANTIABLE MEMBER PROCEDURE enable_versioning_wm(net_mem IN VARCHAR2) CASCADE
 ALTER  TYPE SDO_NETWORK_MANAGER_T ADD
   NOT INSTANTIABLE MEMBER PROCEDURE disable_versioning_wm(net_mem IN VARCHAR2) CASCADE
 ALTER  TYPE SDO_NETWORK_MANAGER_T ADD
   NOT INSTANTIABLE MEMBER FUNCTION lock_rows_wm(net_mem IN VARCHAR2,
    wspace_name IN VARCHAR2, sql_node_filter IN VARCHAR2 DEFAULT NULL,
    sql_link_filter IN VARCHAR2 DEFAULT NULL,
    sql_path_filter IN VARCHAR2 DEFAULT NULL)
    RETURN NUMBER DETERMINISTIC CASCADE
 ALTER  TYPE SDO_NETWORK_MANAGER_T ADD
   NOT INSTANTIABLE MEMBER PROCEDURE unlock_rows_wm(net_mem IN VARCHAR2,
    wspace_name IN VARCHAR2, lock_id IN NUMBER) CASCADE
 ALTER  TYPE SDO_NETWORK_MANAGER_T ADD
       NOT INSTANTIABLE MEMBER PROCEDURE read_network(
         net_mem        VARCHAR2,
         network         VARCHAR2,
         xmin           NUMBER,
         ymin           NUMBER,
         xmax           NUMBER,
         ymax           NUMBER,
         allow_updates  VARCHAR2) CASCADE
 ALTER  TYPE SDO_NETWORK_MANAGER_T DROP
   NOT INSTANTIABLE MEMBER PROCEDURE create_sdo_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_geom_column VARCHAR2,
    node_cost_column VARCHAR2, link_table_name VARCHAR2,
    link_geom_column VARCHAR2, link_cost_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2) CASCADE
 ALTER  TYPE SDO_NETWORK_MANAGER_T ADD
   NOT INSTANTIABLE MEMBER PROCEDURE create_sdo_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2 DEFAULT NULL,
    node_geom_column VARCHAR2 DEFAULT NULL,
    node_cost_column VARCHAR2 DEFAULT NULL,
    link_table_name VARCHAR2  DEFAULT NULL,
    link_geom_column VARCHAR2 DEFAULT NULL,
    link_cost_column VARCHAR2 DEFAULT NULL,
    path_table_name  VARCHAR2 DEFAULT NULL,
    path_geom_column VARCHAR2 DEFAULT NULL,
    path_link_table_name VARCHAR2 DEFAULT NULL,
    sub_path_table_name VARCHAR2 DEFAULT NULL,
    sub_path_geom_column VARCHAR2 DEFAULT NULL,
    is_complex VARCHAR2 DEFAULT 'FALSE') CASCADE
 ALTER  TYPE SDO_NETWORK_MANAGER_T DROP
   NOT INSTANTIABLE MEMBER PROCEDURE create_lrs_network(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER,
    node_table_name VARCHAR2, node_cost_column VARCHAR2,
    link_table_name VARCHAR2, link_cost_column VARCHAR2,
    lrs_table_name  VARCHAR2, lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2
   ) CASCADE
 ALTER  TYPE SDO_NETWORK_MANAGER_T ADD
   NOT INSTANTIABLE MEMBER PROCEDURE create_lrs_network(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2,
    srid NUMBER, no_of_dims NUMBER,
    node_table_name VARCHAR2 DEFAULT NULL,
    node_cost_column VARCHAR2 DEFAULT NULL,
    link_table_name VARCHAR2 DEFAULT NULL,
    link_cost_column VARCHAR2 DEFAULT NULL,
    lrs_table_name  VARCHAR2,
    lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2 DEFAULT NULL,
    path_geom_column VARCHAR2 DEFAULT NULL,
    path_link_table_name VARCHAR2 DEFAULT NULL,
    sub_path_table_name VARCHAR2 DEFAULT NULL,
    sub_path_geom_column VARCHAR2 DEFAULT NULL,
    is_complex VARCHAR2 DEFAULT 'FALSE'
   ) CASCADE
 ALTER  TYPE SDO_NETWORK_MANAGER_T DROP
   NOT INSTANTIABLE MEMBER PROCEDURE create_logical_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,   is_directed           VARCHAR2,
    node_table_name VARCHAR2,        node_cost_column      VARCHAR2,
    link_table_name VARCHAR2,        link_cost_column      VARCHAR2,
    path_table_name VARCHAR2,        path_link_table_name  VARCHAR2,
    is_complex VARCHAR2
  ) CASCADE
 ALTER  TYPE SDO_NETWORK_MANAGER_T ADD
   NOT INSTANTIABLE MEMBER PROCEDURE create_logical_network(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2,
    node_table_name VARCHAR2 DEFAULT NULL,
    node_cost_column VARCHAR2 DEFAULT NULL,
    link_table_name VARCHAR2 DEFAULT NULL,
    link_cost_column VARCHAR2 DEFAULT NULL,
    path_table_name VARCHAR2 DEFAULT NULL,
    path_link_table_name VARCHAR2 DEFAULT NULL,
    sub_path_table_name VARCHAR2 DEFAULT NULL,
    is_complex VARCHAR2 DEFAULT 'FALSE'
   ) CASCADE
/