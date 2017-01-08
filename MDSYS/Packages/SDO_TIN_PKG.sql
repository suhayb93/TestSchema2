CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.sdo_tin_pkg authid current_user AS
  -- all tables as "schema.table" for simpler interface.
  FUNCTION INIT(basetable varchar2, basecol varchar2,
       blktable varchar2,
       ptn_params varchar2 default null,
       tin_extent            sdo_geometry default null,
       tin_tol               NUMBER default 0.000000000000005,
       tin_tot_dimensions    NUMBER default 2,
       tin_domain            sdo_orgscl_type default null,
       tin_break_lines       SDO_GEOMETRY default null,
       tin_stop_lines        SDO_GEOMETRY default null,
       tin_void_rgns         SDO_GEOMETRY default null,
       tin_val_attr_tables   SDO_STRING_ARRAY default null,
       tin_other_attrs       SYS.XMLTYPE default null)
    RETURN SDO_TIN ;

  PROCEDURE CREATE_TIN(inp sdo_tin, inptable varchar2,
                       clstpcdatatbl varchar2 default null);

  -- works as read if qry is null
  FUNCTION CLIP_TIN(inp sdo_tin,
                   qry sdo_geometry, qry_min_res number, qry_max_res number,
                   blkno number default null)
    RETURN mdsys.SDO_TIN_BLK_TYPE PIPELINED ;

  PROCEDURE DROP_DEPENDENCIES(basetable varchar2, col varchar2);

  FUNCTION TO_GEOMETRY(pts BLOB, trs BLOB,
                       num_pts NUMBER, num_trs NUMBER,
                       tin_ind_dim NUMBER,
                       tin_tot_dim NUMBER, srid number default null,
                       blk_domain sdo_orgscl_type default null,
                       get_ids NUMBER default NULL)
    RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

  PROCEDURE TO_DEM(
    tin                 IN     sdo_tin,
    dem                 IN OUT sdo_georaster,
    blocksize           IN     NUMBER,
    crs_units_per_pixel IN     NUMBER);
--  PRAGMA RESTRICT_REFERENCES(to_geometry, WNDS, WNPS, RNPS);

/*

  -- works as read if qry is null
  FUNCTION CLIP_Pts(inp sdo_tin,
                    qry sdo_geometry,
                    qry_min_res number, qry_max_res number,
                    blkno number default null)
    RETURN ANYDATASET;
  FUNCTION CLIP_PtIds(inp sdo_tin,
                    qry sdo_geometry,
                    qry_min_res number, qry_max_res number)
    RETURN ANYDATASET;

  -- works as read if qry is null
  FUNCTION CLIP_Triangles(inp sdo_tin, qry sdo_geometry,
                    qry_min_res number, qry_max_res number,
                    blkno number default null)
    RETURN ANYDATASET;
  FUNCTION CLIP_TriangleIds(inp sdo_tin, qry sdo_geometry,
                    qry_min_res number, qry_max_res number,
                    blkno number default null)
    RETURN ANYDATASET;
*/

  function clip_tin_into_pc(
    tin_inp         sdo_tin,
    tin_qry         sdo_geometry,
    tin_qry_min_res number,
    tin_qry_max_res number,
    pc_basetable    varchar2,
    pc_basecol      varchar2,
    pc_blktable     varchar2,
    pc_ptn_params   varchar2 default null,
    tin_blkno       number   default null)
      return mdsys.sdo_pc;

  function project_ordinates_onto_tin(
    ordinates2d sdo_ordinate_array,
    tin         sdo_tin)
      return sdo_ordinate_array deterministic;

  function get_surface_of_tin(
    tin    sdo_tin,
    geom2d sdo_geometry)
      return number deterministic;

  function get_surface_of_tin_footprint(
    tin    sdo_tin,
    geom2d sdo_geometry)
      return number deterministic;

  function get_volume_under_tin(
    tin         sdo_tin,
    geom2d      sdo_geometry,
    base_height number)
      return number deterministic;

END sdo_tin_pkg;
/