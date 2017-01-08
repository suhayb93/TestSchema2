CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.SDO_ROUTER_PARTITION AUTHID current_user AS
  FUNCTION adjust_m(start_m IN NUMBER, end_m IN NUMBER, m IN NUMBER)
    RETURN NUMBER;

  FUNCTION get_pid(m IN NUMBER, pid IN NUMBER)
    RETURN NUMBER;

  FUNCTION min_eigenvector(sum_x2 IN NUMBER, sum_y2 IN NUMBER, sum_xy IN NUMBER)
    RETURN mdsys.vector_2d;

  PROCEDURE cleanup_router(all_tables IN BOOLEAN DEFAULT TRUE);

  PROCEDURE create_sdo_router_log_dir(
             router_schema    IN VARCHAR2,
             new_dir_path     IN VARCHAR2 DEFAULT NULL);

  PROCEDURE partition_router(log_file_name IN VARCHAR2 := 'sdo_router_partition.log',
                        max_v_no IN NUMBER DEFAULT 10000,
                        driving_side IN VARCHAR2 := 'R',
                        network_name IN VARCHAR := 'ROUTER_NETWORK',
                        max_memory IN NUMBER := 1.75,
                        cleanup IN BOOLEAN DEFAULT TRUE,
                        use_securefiles IN BOOLEAN DEFAULT TRUE,
                        generate_11g_restrictions IN BOOLEAN DEFAULT TRUE);

  PROCEDURE validate_sdo_router_log_dir(log_file_name IN VARCHAR2 := 'sdo_router_partition.log');

  PROCEDURE create_trucking_data(
                      log_file_name IN VARCHAR2 := 'sdo_router_partition.log',
                      cleanup IN BOOLEAN DEFAULT TRUE);

  PROCEDURE create_turn_restriction_data(
                      log_file_name IN VARCHAR2 := 'sdo_router_partition.log',
                      cleanup IN BOOLEAN DEFAULT TRUE);

  PROCEDURE dump_partitions(log_file_name IN VARCHAR2 := 'sdo_router_partition.log',
                      start_pid IN NUMBER DEFAULT 0,
                      end_pid IN NUMBER DEFAULT -1,
                      verbose IN BOOLEAN DEFAULT FALSE);

  PROCEDURE dump_trucking_data(log_file_name IN VARCHAR2 := 'sdo_router_partition.log',
                      start_pid IN NUMBER DEFAULT 0,
                      end_pid IN NUMBER DEFAULT -1,
                      skip_unsupported IN BOOLEAN DEFAULT TRUE);

  PROCEDURE dump_turn_restriction_data(log_file_name IN VARCHAR2 := 'sdo_router_partition.log',
                      start_pid IN NUMBER DEFAULT 0,
                      end_pid IN NUMBER DEFAULT -1,
                      dump_soft_restrictions IN BOOLEAN DEFAULT FALSE);

  PROCEDURE validate_partitions(log_file_name IN VARCHAR2 := 'sdo_router_partition.log',
                      start_pid IN NUMBER DEFAULT 0,
                      end_pid IN NUMBER DEFAULT -1,
                      verbose IN BOOLEAN DEFAULT FALSE);

   PROCEDURE gather_table_stats(table_name IN VARCHAR2);

   PROCEDURE get_version(log_file_name IN VARCHAR2 := 'sdo_router_partition.log');

  PROCEDURE create_router_network(log_file_name IN VARCHAR2 := 'sdo_router_partition.log',
                                  network_name  IN VARCHAR2 := 'ROUTER_NETWORK');

  PROCEDURE delete_router_network(log_file_name IN VARCHAR2 := 'sdo_router_partition.log',
                                  network_name  IN VARCHAR2 := 'ROUTER_NETWORK',
                                  log_delete IN BOOLEAN := TRUE);

  PROCEDURE elocation_partition_router (logfile_name  IN VARCHAR2,
                                        blob_format IN VARCHAR2) AS LANGUAGE java
    NAME 'oracle.spatial.router.partitioning.ElocationPartition.partition_router(
      java.lang.String, java.lang.String)';

  PROCEDURE elocation_trucking_data (logfile_name IN VARCHAR2) AS LANGUAGE java
    NAME 'oracle.spatial.router.partitioning.ElocationPartition.create_trucking_data(
      java.lang.String)';

  PROCEDURE elocation_turn_restrict_data (logfile_name IN VARCHAR2) AS LANGUAGE java
    NAME 'oracle.spatial.router.partitioning.ElocationPartition.create_turn_restriction_data(
      java.lang.String)';

  PROCEDURE elocation_dump_partition (logfile_name in VARCHAR2,
                                      start_pid in NUMBER,
                                      end_pid in NUMBER,
                                      verbose in BOOLEAN,
                                      is10g in BOOLEAN) AS LANGUAGE java
    NAME 'oracle.spatial.router.partitioning.ElocationPartition.dumpPartition(
      java.lang.String, int, int, boolean, boolean)';

  PROCEDURE elocation_dump_trucking_data (logfile_name IN VARCHAR2,
                                         start_pid IN NUMBER,
                                         end_pid IN NUMBER,
                                         skip_unsupported IN BOOLEAN) AS LANGUAGE java
    NAME 'oracle.spatial.router.partitioning.ElocationPartition.dumpTruckingData(
      java.lang.String, int, int, boolean)';

  -- PLSQL limit, full name elocation_dump_turn_restrict_data
  PROCEDURE elocation_dump_turn_restrict (logfile_name IN VARCHAR2,
                                         start_pid IN NUMBER,
                                         end_pid IN NUMBER,
                                         dump_soft_restrictions IN BOOLEAN) AS LANGUAGE java
    NAME 'oracle.spatial.router.partitioning.ElocationPartition.dumpTurnRestrictionData(
      java.lang.String, int, int, boolean)';


  PROCEDURE elocation_validate_partition (logfile_name in VARCHAR2,
                                          start_pid in NUMBER,
                                          end_pid in NUMBER,
                                          verbose in BOOLEAN,
                                          is10g in BOOLEAN) AS LANGUAGE java
    NAME 'oracle.spatial.router.partitioning.ElocationPartition.validatePartition(
      java.lang.String, int, int, boolean, boolean)';

  PROCEDURE build_turn_restrictions (logdir in VARCHAR2,
                                     drivingside in VARCHAR2) AS LANGUAGE java
    NAME 'oracle.spatial.router.partitioning.TurnRestriction.buildTurnRestrictions(java.lang.String, java.lang.String)';

  PROCEDURE elocation_validate_logfile(logfile_name  IN VARCHAR2,
                                     schema_name IN VARCHAR2) AS LANGUAGE java
    NAME 'oracle.spatial.router.partitioning.ElocationPartition.validate_logfile(
      java.lang.String, java.lang.String)';

    FUNCTION get_edge_info(edge_ids       IN  sdo_list_type,
                         to_edge_ids    OUT sdo_list_type,
                         rets           OUT mdsys.string_array,
                         angle_segments OUT sdo_list_type)
  RETURN mdsys.string_array ;


  FUNCTION get_geometry_info(edge_ids       IN  sdo_list_type,
                             merged_coords  OUT sdo_list_type)
  RETURN NUMBER;

END SDO_ROUTER_PARTITION;
/