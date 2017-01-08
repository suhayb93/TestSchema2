CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_NETWORK_MANAGER_I
  AUTHID current_user
  UNDER SDO_NETWORK_MANAGER_T
(
  ------------
  -- all_paths
  ------------
  STATIC FUNCTION all_paths_s(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    goal_node_id    NUMBER,
    depth_limit     NUMBER,
    cost_limit      NUMBER,
    no_of_solutions NUMBER,
    constraint      VARCHAR2
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.allPaths(
     java.lang.String,  oracle.sql.NUMBER, oracle.sql.NUMBER,
     oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String)
     return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION all_paths(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    goal_node_id    NUMBER,
    depth_limit     NUMBER,
    cost_limit      NUMBER,
    no_of_solutions NUMBER,
    constraint      VARCHAR2 :=NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  ----------------------------
  -- find_connected_components
  ----------------------------
  STATIC FUNCTION find_connected_components_s(
    net_mem   VARCHAR2
  )
    RETURN NUMBER DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.findConnectedComponents(
     java.lang.String) return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION find_connected_components(
    net_mem   VARCHAR2
  )
    RETURN NUMBER DETERMINISTIC,

  -----------------------
  -- find_reachable_nodes
  -----------------------
  STATIC FUNCTION find_reachable_nodes_s(
    net_mem         VARCHAR2,
    source_node_id  NUMBER,
    constraint      VARCHAR2
  )
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.findReachableNodes(
     java.lang.String, oracle.sql.NUMBER, java.lang.String)
     return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION find_reachable_nodes(
    net_mem   VARCHAR2, source_node_id NUMBER, constraint VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  ------------------------
  -- find_reaching_nodes_s
  ------------------------
  STATIC FUNCTION find_reaching_nodes_s(
    net_mem VARCHAR2, target_node_id NUMBER, constraint VARCHAR2
  )
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.findReachingNodes(
     java.lang.String, oracle.sql.NUMBER, java.lang.String)
     return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION find_reaching_nodes(
    net_mem  VARCHAR2,  target_node_id   NUMBER, constraint VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  ---------------
  -- is_reachable
  ---------------
  STATIC FUNCTION is_reachable_s(
    net_mem          VARCHAR2,
    source_node_id   NUMBER,
    target_node_id   NUMBER,
    constraint       VARCHAR2
  )
    RETURN VARCHAR2 DETERMINISTIC
    AS LANGUAGE JAVA NAME
      'oracle.spatial.type.NetworkWrapper.isReachable(
     java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String)
     return java.lang.String',

  OVERRIDING MEMBER FUNCTION is_reachable(
    net_mem          VARCHAR2,
    source_node_id   NUMBER,
    target_node_id   NUMBER,
    constraint       VARCHAR2 := NULL
  ) RETURN VARCHAR2 DETERMINISTIC,

  -------------------------------------------------------------
  -- mcst_link: Minimal Cost Spanning Tree in the form of links
  -------------------------------------------------------------
  STATIC FUNCTION mcst_link_s(
    net_mem VARCHAR2
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.mcstLinkArray(java.lang.String)
     return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION mcst_link(
    net_mem   VARCHAR2
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  --------------------
  -- nearest_meighbors
  --------------------
  STATIC FUNCTION nearest_neighbors_s(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    no_of_neighbors NUMBER,
    constraint      VARCHAR2
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.nearestNeighbors(
     java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String)
     return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION nearest_neighbors(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    no_of_neighbors NUMBER,
    constraint      VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  ----------------
  -- shortest_path
  ----------------
  STATIC FUNCTION shortest_path_s(net_map VARCHAR2,
    start_node_id NUMBER, goal_node_id NUMBER, constraint VARCHAR2
    ) RETURN NUMBER DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.shortestPath(
     java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String)
     return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION shortest_path(net_mem VARCHAR2,
      start_node_id NUMBER, goal_node_id NUMBER, constraint VARCHAR2 := NULL
    ) RETURN NUMBER DETERMINISTIC,

  -------------------------
  -- shortest_path_dijkstra
  -------------------------
  STATIC FUNCTION shortest_path_dijkstra_s(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    goal_node_id    NUMBER,
    constraint      VARCHAR2
  ) RETURN NUMBER DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.shortestPathDijkstra(
     java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String)
     return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION shortest_path_dijkstra(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    goal_node_id    NUMBER,
    constraint      VARCHAR2 := NULL
  ) RETURN NUMBER DETERMINISTIC,

  STATIC FUNCTION tsp_path_s(
    net_mem     VARCHAR2,  nd_array SDO_NUMBER_ARRAY,
    is_closed   VARCHAR2,  use_exact_cost   VARCHAR2, constraint VARCHAR2
  ) RETURN NUMBER DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.tspPath(
     java.lang.String, oracle.spatial.type.SdoNumberArray, java.lang.String,
     java.lang.String, java.lang.String)  return oracle.sql.NUMBER',

  OVERRIDING MEMBER FUNCTION tsp_path(
    net_mem   VARCHAR2,  nd_array  SDO_NUMBER_ARRAY,
    is_closed VARCHAR2,  use_exact_cost   VARCHAR2, constraint VARCHAR2 := NULL
  ) RETURN NUMBER DETERMINISTIC,

  --------------
  -- within_cost
  --------------
  STATIC FUNCTION within_cost_s(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    cost_limit      NUMBER,
    constraint      VARCHAR2
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.withinCost(
     java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String)
     return oracle.spatial.type.SdoNumberArray',

  OVERRIDING MEMBER FUNCTION within_cost(
    net_mem         VARCHAR2,
    start_node_id   NUMBER,
    cost_limit      NUMBER,
    constraint      VARCHAR2 := NULL
  ) RETURN SDO_NUMBER_ARRAY DETERMINISTIC,

  STATIC PROCEDURE create_logical_network_s(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,   is_directed           VARCHAR2,
    node_table_name VARCHAR2,        node_cost_column      VARCHAR2,
    link_table_name VARCHAR2,        link_cost_column      VARCHAR2,
    path_table_name VARCHAR2,        path_link_table_name  VARCHAR2,
    is_complex VARCHAR2
  )
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createLogicalNetwork(java.lang.String,
     oracle.sql.NUMBER, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String)',

  OVERRIDING MEMBER PROCEDURE create_logical_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,   is_directed           VARCHAR2,
    node_table_name VARCHAR2,        node_cost_column      VARCHAR2,
    link_table_name VARCHAR2,        link_cost_column      VARCHAR2,
    path_table_name VARCHAR2,        path_link_table_name  VARCHAR2,
    is_complex VARCHAR2
  ),

  STATIC PROCEDURE create_lrs_network_s(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2,  srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_cost_column VARCHAR2,
    link_table_name VARCHAR2, link_cost_column VARCHAR2,
    lrs_table_name  VARCHAR2, lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createLRSNetwork(java.lang.String,
     oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
     oracle.sql.NUMBER, java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String, java.lang.String,
     java.lang.String)',

  OVERRIDING MEMBER PROCEDURE create_lrs_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2,  srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_cost_column VARCHAR2,
    link_table_name VARCHAR2, link_cost_column VARCHAR2,
    lrs_table_name  VARCHAR2, lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2),

  STATIC PROCEDURE create_sdo_network_s(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_geom_column VARCHAR2,
    node_cost_column VARCHAR2, link_table_name VARCHAR2,
    link_geom_column VARCHAR2, link_cost_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createSDONetwork(java.lang.String,
     oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER,
     java.lang.String, java.lang.String, java.lang.String,
     java.lang.String, java.lang.String, java.lang.String,
     java.lang.String, java.lang.String, java.lang.String,
     java.lang.String)',

  OVERRIDING MEMBER PROCEDURE create_sdo_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_geom_column VARCHAR2,
    node_cost_column VARCHAR2, link_table_name VARCHAR2,
    link_geom_column VARCHAR2, link_cost_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2),

  ---------------
  -- read_network
  ---------------
  STATIC PROCEDURE read_network_s(
    net_mem  VARCHAR2,
    allow_updates VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.readMap(
     java.lang.String, java.lang.String)',

  OVERRIDING MEMBER PROCEDURE read_network(
    net_mem   VARCHAR2,
    allow_updates  VARCHAR2
  ),


  ------------
  -- list_networks
  ------------
  STATIC FUNCTION list_networks_s RETURN VARCHAR2 DETERMINISTIC
   AS LANGUAGE JAVA NAME
   'oracle.spatial.type.NetworkWrapper.listMaps()
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION list_networks
   RETURN VARCHAR2 DETERMINISTIC,

  STATIC PROCEDURE write_network_s(net_mem VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.writeMap(java.lang.String)',

  OVERRIDING MEMBER PROCEDURE write_network(net_mem VARCHAR2),


  STATIC PROCEDURE drop_network_s(net_mem VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.dropMap(java.lang.String)',

  OVERRIDING MEMBER PROCEDURE drop_network(
    net_mem VARCHAR2),

  STATIC FUNCTION validate_network_schema_s(network VARCHAR2)
    RETURN VARCHAR2 DETERMINISTIC AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.validateNetworkSchema(
     java.lang.String)
    return java.lang.String',

  OVERRIDING MEMBER FUNCTION validate_network_schema(network VARCHAR2)
    RETURN VARCHAR2 DETERMINISTIC,

  STATIC PROCEDURE create_ref_constraints_s(network VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createRefConstraints(
     java.lang.String)',

  OVERRIDING MEMBER PROCEDURE create_ref_constraints(network VARCHAR2),


  STATIC PROCEDURE enable_ref_constraints_s(network VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.enableRefConstraints(java.lang.String)',

  OVERRIDING MEMBER PROCEDURE enable_ref_constraints(network VARCHAR2),


  STATIC PROCEDURE disable_ref_constraints_s(network VARCHAR2)
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.disableRefConstraints(
     java.lang.String)',

  OVERRIDING MEMBER PROCEDURE disable_ref_constraints(network VARCHAR2),

  --- register given network constraint into user_sdo_network_constraints
  OVERRIDING MEMBER PROCEDURE register_constraint(
    constraint_name VARCHAR2, class_name VARCHAR2,
    directory_name VARCHAR2,  description VARCHAR2),

  --- deregister given constraint from user_sdo_network_constraints
  OVERRIDING MEMBER PROCEDURE deregister_constraint(constraint_name VARCHAR2),

  MEMBER FUNCTION read_constraint(constraint_name VARCHAR2)
    RETURN VARCHAR2 DETERMINISTIC

)
  ALTER TYPE SDO_NETWORK_MANAGER_I NOT INSTANTIABLE NOT FINAL CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  STATIC PROCEDURE get_net_tab_names(net_mem IN VARCHAR2,
    link_tab_name OUT VARCHAR2, node_tab_name OUT VARCHAR2,
    path_tab_name OUT VARCHAR2, plink_tab_name OUT VARCHAR2) CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  STATIC FUNCTION is_versioned_tab(tab_name IN VARCHAR2)
    RETURN BOOLEAN CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  STATIC FUNCTION is_versioned_s(net_mem IN VARCHAR2)
    RETURN BOOLEAN DETERMINISTIC CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  STATIC FUNCTION adjust_node_filter(tab_name IN VARCHAR2,
    sql_node_filter IN VARCHAR2, lock_id IN NUMBER)
  RETURN VARCHAR2 CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  STATIC FUNCTION adjust_link_filter(tab_name IN VARCHAR2,
    node_filter IN VARCHAR2, sql_link_filter IN VARCHAR2, lock_id IN NUMBER)
  RETURN VARCHAR2 CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  STATIC FUNCTION adjust_path_filter(path_tab IN VARCHAR2,
    plink_tab IN VARCHAR2, link_filter IN VARCHAR2,
    sql_path_filter IN VARCHAR2, lock_id IN NUMBER)
  RETURN VARCHAR2 CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  STATIC PROCEDURE register_lock(lock_id IN NUMBER, net_mem IN VARCHAR2,
    wspace_name IN VARCHAR2, original_node_filter IN VARCHAR2,
    original_link_filter IN VARCHAR2, original_path_filter IN VARCHAR2,
    adjusted_node_filter IN VARCHAR2, adjusted_link_filter IN VARCHAR2,
    adjusted_path_filter IN VARCHAR2) CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  STATIC PROCEDURE deregister_lock(lock_id IN NUMBER) CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  STATIC FUNCTION get_lock_id
    RETURN NUMBER CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  STATIC PROCEDURE get_lock_info(lock_id IN NUMBER,
    net_mem OUT VARCHAR2, wspace_name OUT VARCHAR2,
    original_node_filter OUT VARCHAR2,
    original_link_filter OUT VARCHAR2, original_path_filter OUT VARCHAR2,
    adjusted_node_filter OUT VARCHAR2, adjusted_link_filter OUT VARCHAR2,
    adjusted_path_filter OUT VARCHAR2) CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  OVERRIDING  MEMBER FUNCTION is_versioned_wm(net_mem IN VARCHAR2)
      RETURN BOOLEAN DETERMINISTIC CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  OVERRIDING  MEMBER PROCEDURE enable_versioning_wm(net_mem IN VARCHAR2) CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  OVERRIDING  MEMBER PROCEDURE disable_versioning_wm(net_mem IN VARCHAR2) CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  OVERRIDING  MEMBER FUNCTION lock_rows_wm(net_mem IN VARCHAR2,
    wspace_name IN VARCHAR2, sql_node_filter IN VARCHAR2 DEFAULT NULL,
    sql_link_filter IN VARCHAR2 DEFAULT NULL,
    sql_path_filter IN VARCHAR2 DEFAULT NULL)
    RETURN NUMBER DETERMINISTIC CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  OVERRIDING  MEMBER PROCEDURE unlock_rows_wm(net_mem IN VARCHAR2,
    wspace_name IN VARCHAR2, lock_id IN NUMBER) CASCADE
  ALTER TYPE SDO_NETWORK_MANAGER_I INSTANTIABLE  CASCADE
  ALTER TYPE SDO_NETWORK_MANAGER_I NOT INSTANTIABLE NOT FINAL CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  OVERRIDING MEMBER PROCEDURE read_network(
        net_mem         VARCHAR2,
        network         VARCHAR2,
        xmin            NUMBER,
        ymin            NUMBER,
        xmax            NUMBER,
        ymax            NUMBER,
        allow_updates   VARCHAR2) CASCADE
  ALTER  TYPE SDO_NETWORK_MANAGER_I ADD  STATIC PROCEDURE read_network_s(
        net_mem         VARCHAR2,
        network         VARCHAR2,
        xmin            NUMBER,
        ymin            NUMBER,
        xmax            NUMBER,
        ymax            NUMBER,
        allow_updates   VARCHAR2)
      AS LANGUAGE JAVA NAME
      'oracle.spatial.type.NetworkWrapper.readMap(
       java.lang.String, java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER,
      oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String)' CASCADE
  ALTER TYPE SDO_NETWORK_MANAGER_I INSTANTIABLE  CASCADE
  ALTER TYPE SDO_NETWORK_MANAGER_I NOT INSTANTIABLE NOT FINAL CASCADE
 ALTER  TYPE SDO_NETWORK_MANAGER_I DROP
   OVERRIDING MEMBER PROCEDURE create_sdo_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_geom_column VARCHAR2,
    node_cost_column VARCHAR2, link_table_name VARCHAR2,
    link_geom_column VARCHAR2, link_cost_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2) CASCADE
 ALTER  TYPE SDO_NETWORK_MANAGER_I ADD
   OVERRIDING MEMBER PROCEDURE create_sdo_network(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,
    is_directed VARCHAR2,
    srid NUMBER,
    no_of_dims NUMBER,
    node_table_name VARCHAR2 DEFAULT NULL,
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
 ALTER TYPE SDO_NETWORK_MANAGER_I DROP STATIC PROCEDURE
   create_sdo_network_s(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER, node_table_name VARCHAR2, node_geom_column VARCHAR2,
    node_cost_column VARCHAR2, link_table_name VARCHAR2,
    link_geom_column VARCHAR2, link_cost_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2) CASCADE
 ALTER TYPE SDO_NETWORK_MANAGER_I ADD STATIC PROCEDURE
   create_sdo_network_s(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,
    is_directed VARCHAR2,
    srid NUMBER,
    no_of_dims NUMBER,
    node_table_name VARCHAR2, node_geom_column VARCHAR2,
    node_cost_column VARCHAR2, link_table_name VARCHAR2,
    link_geom_column VARCHAR2, link_cost_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2,
    sub_path_table_name VARCHAR2,
    sub_path_geom_column VARCHAR2,
    is_complex VARCHAR2
     ) AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createSDONetwork(java.lang.String,
      oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER,
      oracle.sql.NUMBER,  java.lang.String,
      java.lang.String, java.lang.String,
      java.lang.String, java.lang.String, java.lang.String,
      java.lang.String, java.lang.String, java.lang.String,
      java.lang.String, java.lang.String, java.lang.String)'
 ALTER  TYPE SDO_NETWORK_MANAGER_I DROP
   OVERRIDING MEMBER PROCEDURE create_lrs_network(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2, srid NUMBER,
    no_of_dims NUMBER,
    node_table_name VARCHAR2, node_cost_column VARCHAR2,
    link_table_name VARCHAR2, link_cost_column VARCHAR2,
    lrs_table_name  VARCHAR2, lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2, path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2, is_complex VARCHAR2) CASCADE
 ALTER  TYPE SDO_NETWORK_MANAGER_I ADD
   OVERRIDING MEMBER PROCEDURE create_lrs_network(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,
    is_directed VARCHAR2,
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
 ALTER TYPE SDO_NETWORK_MANAGER_I DROP STATIC PROCEDURE
   create_lrs_network_s(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER, is_directed VARCHAR2,
    srid NUMBER, no_of_dims NUMBER,
    node_table_name VARCHAR2,
    node_cost_column VARCHAR2,
    link_table_name VARCHAR2,
    link_cost_column VARCHAR2,
    lrs_table_name  VARCHAR2,
    lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2,
    path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2,
    is_complex VARCHAR2
  ) CASCADE
 ALTER TYPE SDO_NETWORK_MANAGER_I ADD STATIC PROCEDURE
  create_lrs_network_s(
    network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,
    is_directed VARCHAR2,
    srid NUMBER,
    no_of_dims NUMBER,
    node_table_name VARCHAR2,
    node_cost_column VARCHAR2,
    link_table_name VARCHAR2,
    link_cost_column VARCHAR2,
    lrs_table_name  VARCHAR2,
    lrs_geom_column VARCHAR2,
    path_table_name VARCHAR2,
    path_geom_column VARCHAR2,
    path_link_table_name VARCHAR2,
    sub_path_table_name VARCHAR2,
    sub_path_geom_column VARCHAR2,
    is_complex VARCHAR2
     ) AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createLRSNetwork(
      java.lang.String, oracle.sql.NUMBER, java.lang.String,
      oracle.sql.NUMBER, oracle.sql.NUMBER, java.lang.String,
      java.lang.String, java.lang.String, java.lang.String,
      java.lang.String, java.lang.String, java.lang.String,
      java.lang.String, java.lang.String, java.lang.String,
      java.lang.String, java.lang.String)'
 ALTER  TYPE SDO_NETWORK_MANAGER_I DROP
   OVERRIDING MEMBER PROCEDURE create_logical_network(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,   is_directed           VARCHAR2,
    node_table_name VARCHAR2,        node_cost_column      VARCHAR2,
    link_table_name VARCHAR2,        link_cost_column      VARCHAR2,
    path_table_name VARCHAR2,        path_link_table_name  VARCHAR2,
    is_complex VARCHAR2
   ) CASCADE
 ALTER  TYPE SDO_NETWORK_MANAGER_I ADD
   OVERRIDING MEMBER PROCEDURE create_logical_network(network_name VARCHAR2,
     no_of_hierarchy_levels NUMBER,
     is_directed VARCHAR2,
     node_table_name VARCHAR2 DEFAULT NULL,
     node_cost_column VARCHAR2 DEFAULT NULL,
     link_table_name VARCHAR2 DEFAULT NULL,
     link_cost_column VARCHAR2  DEFAULT NULL,
     path_table_name VARCHAR2 DEFAULT NULL,
     path_link_table_name  VARCHAR2 DEFAULT NULL,
     sub_path_table_name VARCHAR2 DEFAULT NULL,
     is_complex VARCHAR2 DEFAULT 'FALSE'
   ) CASCADE
 ALTER TYPE SDO_NETWORK_MANAGER_I DROP STATIC PROCEDURE
   create_logical_network_s(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,   is_directed           VARCHAR2,
    node_table_name VARCHAR2,        node_cost_column      VARCHAR2,
    link_table_name VARCHAR2,        link_cost_column      VARCHAR2,
    path_table_name VARCHAR2,        path_link_table_name  VARCHAR2,
    is_complex VARCHAR2  )
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createLogicalNetwork(java.lang.String,
     oracle.sql.NUMBER, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String)'
 ALTER TYPE SDO_NETWORK_MANAGER_I ADD STATIC PROCEDURE
   create_logical_network_s(network_name VARCHAR2,
    no_of_hierarchy_levels NUMBER,   is_directed           VARCHAR2,
    node_table_name VARCHAR2,        node_cost_column      VARCHAR2,
    link_table_name VARCHAR2,        link_cost_column      VARCHAR2,
    path_table_name VARCHAR2,        path_link_table_name  VARCHAR2,
    sub_path_table_name VARCHAR2,    is_complex VARCHAR2  )
    AS LANGUAGE JAVA NAME
    'oracle.spatial.type.NetworkWrapper.createLogicalNetwork(java.lang.String,
     oracle.sql.NUMBER, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String,
     java.lang.String, java.lang.String)'
 ALTER TYPE SDO_NETWORK_MANAGER_I ADD STATIC FUNCTION
  get_default_value_s(
    parameter   VARCHAR2,
    default_val VARCHAR2) RETURN VARCHAR2
  ALTER TYPE SDO_NETWORK_MANAGER_I INSTANTIABLE  CASCADE
  ALTER TYPE SDO_NETWORK_MANAGER_I INSTANTIABLE CASCADE
/
CREATE OR REPLACE TYPE BODY mdsys.SDO_NETWORK_MANAGER_I wrapped
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
9084 1cb8
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
/