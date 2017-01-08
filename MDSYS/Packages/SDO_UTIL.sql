CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.sdo_util AUTHID current_user AS

-- CONSTANT DECLARATION
  SDO_GTYPE_CURVE         CONSTANT  NUMBER := 2;
  SDO_GTYPE_POLYGON       CONSTANT  NUMBER := 3;
  SDO_GTYPE_COLLECTION    CONSTANT  NUMBER := 4;
  SDO_GTYPE_MULTICURVE    CONSTANT  NUMBER := 6;
  SDO_GTYPE_MULTIPOLYGON  CONSTANT  NUMBER := 7;


  Function expand_multi_point (geometry IN mdsys.sdo_geometry)
  RETURN SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

  FUNCTION expand_geom (geometry IN mdsys.sdo_geometry)
  RETURN mdsys.sdo_geometry DETERMINISTIC PARALLEL_ENABLE;

  FUNCTION extract(geometry IN mdsys.sdo_geometry,
                   element  IN NUMBER,
                   ring     IN NUMBER DEFAULT 0)
    RETURN mdsys.sdo_geometry DETERMINISTIC PARALLEL_ENABLE;
    PRAGMA restrict_references(extract, wnds, rnps, wnps, trust);

  FUNCTION extract_all(geometry IN mdsys.sdo_geometry,
                       flatten  IN NUMBER DEFAULT 1)
    RETURN mdsys.sdo_geometry_array DETERMINISTIC PARALLEL_ENABLE;
    PRAGMA restrict_references(extract_all, wnds, rnps, wnps, trust);

  FUNCTION append(geometry1 IN mdsys.sdo_geometry,
                  geometry2 IN mdsys.sdo_geometry)
    RETURN mdsys.sdo_geometry DETERMINISTIC PARALLEL_ENABLE;
    PRAGMA restrict_references(append, wnds, wnps);

  FUNCTION ExtractVoids(geometry IN mdsys.sdo_geometry,
                        dim      IN mdsys.sdo_dim_array)
    RETURN mdsys.sdo_geometry DETERMINISTIC PARALLEL_ENABLE;
    PRAGMA restrict_references(ExtractVoids, rnds, wnds, rnps, wnps, trust);

 FUNCTION GetVertices(geometry IN mdsys.sdo_geometry)
 RETURN vertex_set_type;
-- PRAGMA restrict_references(GetVertices, wnds, rnps, wnps);

  FUNCTION GetNumElem(geometry IN mdsys.sdo_geometry)
    RETURN NUMBER DETERMINISTIC PARALLEL_ENABLE;
    PRAGMA restrict_references(GetNumElem, rnds, wnds, rnps, wnps, trust);

  FUNCTION GetNumRings(
    geom IN mdsys.SDO_GEOMETRY)
      RETURN NUMBER DETERMINISTIC PARALLEL_ENABLE;
  PRAGMA restrict_references(GetNumRings, rnds, wnds, rnps, wnps, trust);

  FUNCTION GetNumVertices(geometry IN mdsys.sdo_geometry)
    RETURN NUMBER PARALLEL_ENABLE;
    PRAGMA restrict_references(GetNumVertices, rnds, wnds, rnps, wnps, trust);

  FUNCTION OuterLn(geometry IN mdsys.sdo_geometry,
                   dim      IN mdsys.sdo_dim_array)
    RETURN mdsys.sdo_geometry DETERMINISTIC PARALLEL_ENABLE;
    PRAGMA restrict_references(OuterLn,rnds,wnds,rnps,wnps,trust);

  FUNCTION RefineMGon(mgon IN mdsys.sdo_geometry,
                      gon  IN mdsys.sdo_geometry,
                      dim  IN mdsys.sdo_dim_array)
    RETURN mdsys.sdo_geometry;
    PRAGMA restrict_references(RefineMGon,rnds,wnds,rnps,wnps,trust);

 -- Determine whether or not a string contains a valid numeric value.
 FUNCTION mdutl_is_numeric(instr varchar2,
                           format_mask varchar2)
 RETURN number DETERMINISTIC PARALLEL_ENABLE;
 PRAGMA restrict_references(mdutl_is_numeric, wnds, rnps, wnps, trust);

 -- Safely convert "number" to corresponding "character" representation
 -- For more information on this function, please refer to the PL/SQL
 -- documentation for the TO_CHAR() function.
 FUNCTION number_to_char(value IN NUMBER,
                         format_mask IN VARCHAR2 DEFAULT NULL,
                         nls_language IN VARCHAR2 DEFAULT NULL)
    RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE;
 PRAGMA restrict_references(number_to_char, wnds, rnps, wnps, trust);

 FUNCTION number_to_char(value IN VARCHAR2,
                         format_mask IN VARCHAR2 DEFAULT NULL,
                         nls_language IN VARCHAR2 DEFAULT NULL)
    RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE;
 PRAGMA restrict_references(number_to_char, wnds, rnps, wnps, trust);

 FUNCTION number_to_char(value IN DATE,
                         format_mask IN VARCHAR2 DEFAULT NULL,
                         option_setting IN VARCHAR2 DEFAULT NULL)
    RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE;
 PRAGMA restrict_references(number_to_char, wnds, rnps, wnps, trust);

 FUNCTION number_to_char(value IN TIMESTAMP,
                         format_mask IN VARCHAR2 DEFAULT NULL,
                         option_setting IN VARCHAR2 DEFAULT NULL)
    RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE;
 PRAGMA restrict_references(number_to_char, wnds, rnps, wnps, trust);

 FUNCTION number_to_char(value IN RAW)
    RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE;
 PRAGMA restrict_references(number_to_char, wnds, rnps, wnps, trust);

 FUNCTION number_to_char(value IN CLOB) -- NTEXT
    RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE;
 PRAGMA restrict_references(number_to_char, wnds, rnps, wnps, trust);

 -- truncate the original number up to no_of_digits
 -- no_of_digits positive:  truncate the number to no_of_digits AFTER the decimal point
 -- ex: truncate_number(1.123456789,5) returns 1.12345
 -- no_of_digits negative:  truncate the number up to no_of_digits BEFORE the decimal point
 -- ex: truncate_number(987654321.123456789,-5) returns 987600000.0

 FUNCTION truncate_number(value NUMBER, no_of_digits NUMBER)
    RETURN NUMBER PARALLEL_ENABLE;
 PRAGMA restrict_references(truncate_number, wnds, rnps, wnps);

 FUNCTION rectify_geometry(
    geometry     IN mdsys.SDO_GEOMETRY,
    tolerance    IN NUMBER)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;
   PRAGMA RESTRICT_REFERENCES(rectify_geometry, rnds, wnds, rnps, wnps, trust);

  /* simplify a geometry */
  FUNCTION simplify(
   geometry       IN mdsys.sdo_geometry,
   threshold      IN NUMBER,
   tolerance      IN NUMBER := 0.0000005,
   remove_loops   IN NUMBER := 0)
    RETURN mdsys.sdo_geometry DETERMINISTIC PARALLEL_ENABLE;
    PRAGMA restrict_references(simplify, rnds, wnds, rnps, wnps, trust);

  FUNCTION simplifyVW(
   geometry       IN mdsys.sdo_geometry,
   vertex_threshold  IN NUMBER,
   tolerance      IN NUMBER := 0.0000005,
   remove_loops   IN NUMBER := 0)
    RETURN mdsys.sdo_geometry DETERMINISTIC PARALLEL_ENABLE;
    PRAGMA restrict_references(simplifyVW, rnds, wnds, rnps, wnps, trust);


 FUNCTION polygontoline(geometry IN mdsys.sdo_geometry)
    return mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION point_to_line(
   geom1 IN mdsys.sdo_geometry,
   geom2 IN mdsys.sdo_geometry,
   tol   IN number := 10e-16)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION remove_duplicates(geometry IN sdo_geometry, dim in sdo_dim_array)
    return mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION remove_duplicate_vertices(geometry IN sdo_geometry,
                                                tolerance in NUMBER)
    return mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION circle_polygon (point                           mdsys.SDO_GEOMETRY,
                          radius                          number,
                          arc_tolerance                   number,
                          start_azimuth                   number default NULL,
                          end_azimuth                     number default NULL,
                          orientation                     number default NULL,
                          arc                             number default NULL)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION circle_polygon (center_longitude     number,
                          center_latitude      number,
                          radius               number,
                          arc_tolerance            number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION circle_polygon (center_longitude     number,
                          center_latitude      number,
                          radius               number,
                          start_azimuth        number,
                          end_azimuth          number,
                          arc_tolerance            number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION ellipse_polygon (center_longitude                number,
                           center_latitude                 number,
                           semi_major_axis                 number,
                           semi_minor_axis                 number,
                           azimuth                         number,
                           arc_tolerance                       number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION point_at_bearing(start_point sdo_geometry,
                   bearing number,
                   distance number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 PROCEDURE bearing_tilt_for_points(
                   start_point sdo_geometry,
                   end_point sdo_geometry,
                   tol number,
                   bearing OUT number,
                   tilt OUT number) ;

 FUNCTION convert_unit(value NUMBER, in_unit varchar2, out_unit varchar2)
 RETURN number PARALLEL_ENABLE;

 FUNCTION convert_distance(srid  number, distance NUMBER, unit_spec  varchar2)
 RETURN number PARALLEL_ENABLE;

 PROCEDURE Prepare_For_TTS (table_space IN VARCHAR2);

 PROCEDURE Initialize_Indexes_For_TTS ;

 FUNCTION to_clob(Geometry IN mdsys.SDO_GEOMETRY)
  RETURN CLOB DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_clob(ClobGeom IN CLOB)
  RETURN SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION to_gmlgeometry(Geometry IN mdsys.SDO_GEOMETRY)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE;

 FUNCTION to_gmlgeometry(Geometry IN mdsys.SDO_GEOMETRY,
                            srsNameSpace IN varchar2, srsNSAlias IN varchar2)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE;

 FUNCTION to_gmlgeometry(Geometry IN mdsys.SDO_GEOMETRY,
                         coordOrder IN number)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE;

 FUNCTION to_gmlgeometry(Geometry IN mdsys.SDO_GEOMETRY,
                         srsNameSpace IN varchar2, srsNSAlias IN varchar2,
                         coordOrder IN number)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE;

 FUNCTION to_gml311geometry(Geometry IN mdsys.SDO_GEOMETRY)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE;

 FUNCTION to_gml311geometry(Geometry IN mdsys.SDO_GEOMETRY,
                            srsNameSpace IN varchar2, srsNSAlias IN varchar2)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE;

 FUNCTION to_gml311geometry(Geometry IN mdsys.SDO_GEOMETRY,
                            coordOrder IN number)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE;

 FUNCTION to_gml311geometry(Geometry IN mdsys.SDO_GEOMETRY,
                            srsNameSpace IN varchar2, srsNSAlias IN varchar2,
                            coordOrder IN number)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE;

 FUNCTION to_gml321geometry(Geometry IN mdsys.SDO_GEOMETRY)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE;

 FUNCTION to_gml321geometry(Geometry IN mdsys.SDO_GEOMETRY,
                            srsNameSpace IN varchar2, srsNSAlias IN varchar2)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE;

 FUNCTION to_gml321geometry(Geometry IN mdsys.SDO_GEOMETRY,
                            coordOrder IN number)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE;

 FUNCTION to_gml321geometry(Geometry IN mdsys.SDO_GEOMETRY,
                            srsNameSpace IN varchar2, srsNSAlias IN varchar2,
                            coordOrder IN number)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE;

 FUNCTION to_kmlgeometry(Geometry IN mdsys.SDO_GEOMETRY)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE;

 FUNCTION to_wkbgeometry(geometry IN mdsys.SDO_GEOMETRY)
 RETURN BLOB DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION to_wktgeometry(geometry IN mdsys.SDO_GEOMETRY)
 RETURN CLOB DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION to_wktgeometry_varchar(geometry IN mdsys.SDO_GEOMETRY)
 RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_wkbgeometry(geometry IN BLOB)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_wktgeometry(geometry IN CLOB)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_wktgeometry(geometry IN VARCHAR2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GMLgeometry(geometry IN CLOB)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GMLgeometry(geometry IN CLOB, srsNameSpace IN varchar2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GMLgeometry(geometry IN VARCHAR2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GMLgeometry(geometry IN VARCHAR2, srsNameSpace IN varchar2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GMLgeometry(geometry IN CLOB,
                           coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GMLgeometry(geometry IN CLOB, srsNameSpace IN varchar2,
                           coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GMLgeometry(geometry IN VARCHAR2,
                           coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GMLgeometry(geometry IN VARCHAR2, srsNameSpace IN varchar2,
                           coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GML311geometry(geometry IN CLOB)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GML311geometry(geometry IN CLOB, srsNameSpace IN varchar2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GML311geometry(geometry IN VARCHAR2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GML311geometry(geometry IN VARCHAR2, srsNameSpace IN varchar2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GML311geometry(geometry IN CLOB,
                              coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GML311geometry(geometry IN CLOB, srsNameSpace IN varchar2,
                              coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GML311geometry(geometry IN VARCHAR2,
                              coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_GML311geometry(geometry IN VARCHAR2, srsNameSpace IN varchar2,
                              coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_KMLgeometry(geometry IN CLOB)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION from_KMLgeometry(geometry IN VARCHAR2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION extrude(geometry IN mdsys.SDO_GEOMETRY,
                  grdHeight IN SDO_NUMBER_ARRAY,
                  height IN SDO_NUMBER_ARRAY,
                  cond IN VARCHAR2,
                  tol IN NUMBER)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION extrude(geometry IN mdsys.SDO_GEOMETRY,
                  grdHeight IN SDO_NUMBER_ARRAY,
                  height IN SDO_NUMBER_ARRAY,
                  tol IN NUMBER,
                  optional3dSrid IN NUMBER DEFAULT NULL)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


 FUNCTION affinetransforms(geometry IN mdsys.SDO_GEOMETRY,
                           translation IN VARCHAR2 DEFAULT 'FALSE', tx IN NUMBER DEFAULT 0.0, ty IN NUMBER DEFAULT 0.0, tz IN NUMBER DEFAULT 0.0,
                           scaling IN VARCHAR2 DEFAULT 'FALSE', Psc1 IN mdsys.SDO_GEOMETRY DEFAULT NULL, sx IN NUMBER DEFAULT 0.0, sy IN NUMBER DEFAULT 0.0, sz IN NUMBER DEFAULT 0.0,
                           rotation IN VARCHAR2 DEFAULT 'FALSE', P1 IN mdsys.SDO_GEOMETRY DEFAULT NULL, line1 IN mdsys.SDO_GEOMETRY DEFAULT NULL, angle IN NUMBER DEFAULT 0.0, dir IN NUMBER DEFAULT -1,
                           shearing IN VARCHAR2 DEFAULT 'FALSE', SHxy IN NUMBER DEFAULT 0.0, SHyx IN NUMBER DEFAULT 0.0, SHxz IN NUMBER DEFAULT 0.0, SHzx IN NUMBER DEFAULT 0.0, SHyz IN NUMBER DEFAULT 0.0, SHzy IN NUMBER DEFAULT 0.0,
                           reflection IN VARCHAR2 DEFAULT 'FALSE', Pref IN mdsys.SDO_GEOMETRY DEFAULT NULL, lineR IN mdsys.SDO_GEOMETRY DEFAULT NULL, dirR IN NUMBER DEFAULT -1, planeR IN VARCHAR2 DEFAULT 'FALSE', n IN SDO_NUMBER_ARRAY DEFAULT NULL, bigD IN SDO_NUMBER_ARRAY DEFAULT NULL)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION extract3d(geometry IN mdsys.SDO_GEOMETRY, label IN VARCHAR2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION getlabelbyelement(sourceGeometry IN mdsys.SDO_GEOMETRY, queryElement IN mdsys.SDO_GEOMETRY, tol IN NUMBER)
 RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION validate_wkbgeometry(geometry IN BLOB)
 RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION validate_wktgeometry(geometry IN CLOB)
 RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION validate_wktgeometry(geometry IN VARCHAR2)
 RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION concat_lines (geometry1 IN mdsys.SDO_GEOMETRY,
                        geometry2 IN mdsys.SDO_GEOMETRY)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 PROCEDURE internal_ordinate_copy(src IN mdsys.SDO_ORDINATE_ARRAY,
                            src_position IN INTEGER,
                            dst IN OUT NOCOPY mdsys.SDO_ORDINATE_ARRAY,
                            dst_position IN INTEGER,
                            length IN INTEGER);

 FUNCTION reverse_linestring(geometry IN mdsys.SDO_GEOMETRY)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION internal_merge_linestrings(geometry IN mdsys.SDO_GEOMETRY)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC;

 FUNCTION internal_merge_linestrings(geomArr IN mdsys.SDO_GEOMETRY_ARRAY)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC;

 FUNCTION internal_make_line_out_of_elem(
     multilinestring IN mdsys.SDO_GEOMETRY, element_index IN INTEGER)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 PROCEDURE internal_reverse_line_points(
       ordinates IN OUT NOCOPY mdsys.SDO_ORDINATE_ARRAY);

------------------------------------------------------------------
-- Name
--   Partition_Table
-- Purpose
--   Partitions the input "schema.tablename" into buckets of at
--   most ptn_capacity each. The partitioning is based on the
--   spatial extent or MBR stored as the intervals <min_di, max_di>
--   in each dimension di.  The data is written back with
--   the ptn_id into the "output_table" which is assumed to be
--   be pre-created by the user.
--   The input <tablename> table is expected to have the following columns:
--      "rid" -- unique id for each row (e.g., the table rowid)
--      min_d1, max_d1 -- minimum and maximum values in dimension 1
--      min_d2, max_d2 -- minimum and maximum values in dimension 2
--      ..
--      min_dn, max_dn -- minimum and maximum values in dimension n
--      where n is the dimensionality specified by inp arg "numdim"
--   The input "wrk_tblspc" specifies the tablespace where "scratch-pad"
--      tables are created and dropped. Keep this tablespace different from
--      the tablespace in which the input <tablename> and output_table are.
--      (typical usage: create wrk_tblspc and drop after this procedure)
--   The arg "output_table" specifies where to write the output partitions
--     This routine assumes the output_table is pre-created and has the
--     following columns:
--     ptn_id number, rid varchar2(24), min_d1 number, max_d1 number,
--     min_d2, max_d2, ...., min_dn, max_dn (all number columns).
--     This routine writes the rows from <tablename> back to <output_table>
--       with the ptn_id set.
--  The arg <output_ptn_table> specifies where to write ptn extent information
--     This table should have the following numeric columns:
--     ptn_id, min_d1, max_d1, min_d2, max_d2, ...., min_dn, max_dn.
--  Parameter "numdim" specifies the number of dimensions.
--  Parameter "commit_interval" "n" specifies that commits happen
--  after every batch of n rows that are written to the <output_table>.
--  Parameter "packed_ptns" tries to pack the partitions.


 PROCEDURE partition_table(schemaname in varchar2, tablename in varchar2,
                           output_data_table in varchar2,
                           output_ptn_table in varchar2,
                           ptn_capacity in number default 100,
                           numdim in number default 2,
                           wrk_tblspc in varchar2 default null,
                           ptn_type in varchar2 default null,
                           dop in number default 1);


------------------------------------------------------------------
-- Name
--   DROP_WORK_TABLES
-- Purpose
--   This function drops any work tables and views in the current schema
--   created as part of partition_table, index creation, or
--   TIN/Point Cloud utilities.
--
--   DROPS all tables/views that match 'M%_<oidstr>$$%'
--   Input oidstr has to contain only hexadecimal numbers w/o spaces

 PROCEDURE DROP_WORK_TABLES(oidstr varchar2);

 FUNCTION remove_inner_rings(inpgeom SDO_GEOMETRY, inptol number)
 RETURN SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION quad_tiles(geom SDO_GEOMETRY, sdo_level number, tol number:=0.0000000005)
 RETURN mdsys.F81_index_obj_array DETERMINISTIC;

 /* This function generates hybrid tiles for a given Geometry.
    Only 2D Geometry is supported.
    The SDO_META values are appended to the SDO_CODE to make it easier
    for use with other HHCODE functions. */
 FUNCTION hybrid_tiles(geom SDO_GEOMETRY, sdo_level number := 4,
                       sdo_ntiles number := 100, tol number:=0.0000000005)
 RETURN mdsys.H81_index_obj_array DETERMINISTIC;

 FUNCTION interior_point (geom SDO_GEOMETRY, tol number := 0.00000000005)
 RETURN SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION number_of_components(geometry SDO_GEOMETRY, requested_type varchar2)
 RETURN NUMBER PARALLEL_ENABLE;

 FUNCTION get_2d_footprint(geometry SDO_GEOMETRY, tolerance number := 0.05)
 RETURN SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION convert3007to3008(geometry sdo_geometry)
 RETURN SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION get_boundary(geometry  in sdo_geometry)
 RETURN SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;
-------------------------------------------------------------------------

  function validate_3dtheme(
    theme_name varchar2)
      return varchar2;

  function validate_scene(
    scene_name varchar2)
      return varchar2;

  function validate_viewframe(
    viewframe_name varchar2)
      return varchar2;

  function theme3d_has_lod(
    theme_name varchar2)
      return number;

  function theme3d_has_texture(
    theme_name varchar2)
      return number;

  function theme3d_get_block_table(
    theme_name varchar2)
      return varchar2;

 FUNCTION ToGnomonic(geom in sdo_geometry, longitude in number,
                     latitude in number)
 RETURN SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION getNurbsApprox(geometry  IN mdsys.sdo_geometry,
                         tolerance IN number)
 RETURN mdsys.sdo_geometry DETERMINISTIC PARALLEL_ENABLE;
 PRAGMA restrict_references(getNurbsApprox, rnds, wnds, rnps, wnps, trust);

 FUNCTION jsph_getnurbsapprox(geometry  IN mdsys.sdo_geometry)
 RETURN mdsys.sdo_geometry DETERMINISTIC PARALLEL_ENABLE;
 PRAGMA restrict_references(jsph_getnurbsapprox, rnds, wnds, rnps, wnps, trust);

 FUNCTION linear_key(geometry  IN mdsys.sdo_geometry,
                     diminfo mdsys.sdo_dim_array,
                     lvl IN NUMBER := 8)
 RETURN RAW DETERMINISTIC PARALLEL_ENABLE;

 FUNCTION linear_key(geometry  IN mdsys.sdo_geometry,
                     min_x IN NUMBER, min_y IN NUMBER,
                     max_x IN NUMBER, max_y IN NUMBER,
                     lvl IN NUMBER := 8)
 RETURN RAW DETERMINISTIC PARALLEL_ENABLE;

 procedure insert_sdo_geom_metadata(owner IN VARCHAR2,
                                    table_name IN VARCHAR2,
                                    column_name IN VARCHAR2,
                                    diminfo IN mdsys.sdo_dim_array,
                                    srid IN number);

END sdo_util;
/