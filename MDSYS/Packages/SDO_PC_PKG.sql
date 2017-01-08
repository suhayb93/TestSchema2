CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.sdo_pc_pkg authid current_user AS
  -- all tables as "schema.table" for simpler interface.
  FUNCTION INIT(
    basetable          varchar2,
    basecol            varchar2,
    blktable           VARCHAR2,
    ptn_params         varchar2,
    pc_extent          sdo_geometry     default null,
    pc_tol             NUMBER           default 0.0000000000005,
    pc_tot_dimensions  NUMBER           default 2,
    pc_domain          sdo_orgscl_type  default null,
    pc_val_attr_tables SDO_STRING_ARRAY default null,
    pc_other_attrs     SYS.XMLTYPE      default null)
      RETURN SDO_PC;

  procedure create_liblas_pyramid(
    pc               in sdo_pc,
    keepLevel1Intact in number);

  PROCEDURE CREATE_PC(
    inp              sdo_pc,
    inptable         varchar2,
          clstpcdatatbl    varchar2 default null);

  PROCEDURE ADD_TO_PC(
    inp      sdo_pc,
    inptable varchar2);

  FUNCTION HAS_PYRAMID(
    inp sdo_pc)
      return number;

  FUNCTION PRESERVES_LEVEL1(
    inp sdo_pc)
      return number;

  -- works as read if qry params are null
  FUNCTION CLIP_PC(
    inp                 sdo_pc,
    ind_dim_qry         sdo_geometry,
    other_dim_qry       sdo_mbr,
    qry_min_res         number,
    qry_max_res         number,
    blkno               number default null,
    include_custom_dims number default 0)
      RETURN mdsys.SDO_PC_BLK_TYPE PIPELINED;

  PROCEDURE DROP_DEPENDENCIES(basetable varchar2, col varchar2);

  FUNCTION TO_GEOMETRY(pts BLOB, num_pts NUMBER,
                       pc_tot_dim NUMBER, srid NUMBER default null,
                       blk_domain sdo_orgscl_type default null,
                       get_ids  NUMBER default NULL)
    RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

  FUNCTION GET_PT_IDs(pts BLOB, num_pts NUMBER,
                      pc_tot_dim NUMBER,
                      blk_domain sdo_orgscl_type default null)
    RETURN SDO_NUMBER_ARRAY DETERMINISTIC;

  function tin_to_pc(
    tin       sdo_tin,
    basetable varchar2,
    basecol   varchar2,
    blktable  varchar2)
      return sdo_pc deterministic;

/*
PROCEDURE POPULATE_FROM_CLSTPCDATA(inp sdo_pc, clstpcdatatbl varchar2);

  PROCEDURE WRITE_CLSTPCDATA(inp sdo_pc, clstpcdatatbl varchar2);
*/


/*
  -- works as read if qry is null
  FUNCTION CLIP_PCAttrs(inp sdo_pc, qry sdo_geometry, blkno number default null)
    RETURN ANYDATASET;
  FUNCTION CLIP_PC_PtIds(inp sdo_pc, qry sdo_geometry, blkno number default null)
    RETURN ANYDATASET;
*/

  function clip_pc_into_tin(
    pc_inp            sdo_pc,
    pc_ind_dim_qry    sdo_geometry,
    pc_other_dim_qry  sdo_mbr,
    pc_qry_min_res    number,
    pc_qry_max_res    number,
    tin_basetable     varchar2,
    tin_basecol       varchar2,
    tin_blktable      varchar2,
    tin_ptn_params    varchar2     default null,
    tin_break_lines   sdo_geometry default null,
    tin_stop_lines    sdo_geometry default null,
    tin_void_rgns     sdo_geometry default null,
    tin_clstpcdatatbl varchar2     default null,
    pc_blkno          number       default null)
      return mdsys.sdo_tin;

  function create_contour_geometries(
    pc                  sdo_pc,
    sampling_resolution number,
    elevations          sdo_ordinate_array,
    region              sdo_geometry)
      return sdo_geometry_array;

  function create_contour_geometries(
    pc_flat_table       varchar2,
    srid                number,
    sampling_resolution number,
    elevations          sdo_ordinate_array,
    region              sdo_geometry)
      return sdo_geometry_array;

  /* This procedure takes a 2D Geometry as input and generates
     two SQL strings which can be appended to a user cursor in the
     where clause. */
  PROCEDURE get_tile_sql ( geometry IN SDO_GEOMETRY,
                           sql_interior OUT VARCHAR2,
                           sql_boundary OUT VARCHAR2,
                           tolerance IN NUMBER DEFAULT 0.0000005,
                           sdo_level in NUMBER DEFAULT 4,
                           sdo_ntiles in NUMBER DEFAULT 100);

  /* This function returns a REFCURSOR which can be queried by the client
     side code to fetch rows from the base table. The columns are the columns
     of the base table: only numberic and VARCHAR columns allowed.
     Query Geometry is used to clip the points from the base table.
     First two colums should be X and Y. SRID is assumed to be the same
     as the one used in Geometry.  */
  FUNCTION clip_pc_flat (geometry IN SDO_GEOMETRY,
                         table_name IN VARCHAR2,
                         tolerance IN NUMBER,
                         other_dim_qry  IN mdsys.SDO_MBR DEFAULT NULL,
                         mask IN VARCHAR2 DEFAULT 'ANYINTERACT')

  RETURN SYS_REFCURSOR;

  /* Same as the above, but return the actual SQL statement instead of the
     cursor. Users can add additional predicates or select list and
     execute it. */
  FUNCTION clip_pc_flat_string (geometry IN SDO_GEOMETRY,
                                table_name IN VARCHAR2,
                                tolerance IN NUMBER,
                                other_dim_qry  IN mdsys.SDO_MBR DEFAULT NULL,
                                mask IN VARCHAR2 DEFAULT 'ANYINTERACT',
                                dop IN INTEGER DEFAULT NULL,
                                sdo_level in number DEFAULT 4,
                                sdo_ntiles in number DEFAULT 100)
  RETURN clob;

  procedure import_las(
    source_las_file    varchar2,
    source_las_file_id varchar2,
    target_table       varchar2,
    add_columns        number);

  function hilbert_xy2d(
    n number,
    x number,
    y number)
      return number;

  function get_blocking_method(
    inp sdo_pc)
      return varchar2;

  function getNthHilbertValue(
    table_name varchar2,
    n          number)
      return number;

END sdo_pc_pkg;
/