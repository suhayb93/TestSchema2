CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.SDO_JAVA_STP AUTHID current_user AS

 FUNCTION to_gmlgeometry(Geometry IN mdsys.SDO_GEOMETRY)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE AS LANGUAGE JAVA NAME
    'oracle.spatial.util.GML2.to_GMLGeometryCLOBJS(java.sql.Struct) return oracle.jdbc.OracleClob' ;

 FUNCTION to_gmlgeometry(Geometry IN mdsys.SDO_GEOMETRY,
                            srsNameSpace IN varchar2, srsNSAlias IN varchar2)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE AS LANGUAGE JAVA NAME
    'oracle.spatial.util.GML2.to_GMLGeometryCLOBJS(java.sql.Struct, java.lang.String, java.lang.String) return oracle.jdbc.OracleClob' ;

 FUNCTION to_gmlgeometry(Geometry IN mdsys.SDO_GEOMETRY,
                         coordOrder number)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE AS LANGUAGE JAVA NAME
    'oracle.spatial.util.GML2.to_GMLGeometryCLOBJS(java.sql.Struct, oracle.sql.NUMBER) return oracle.jdbc.OracleClob' ;

 FUNCTION to_gmlgeometry(Geometry IN mdsys.SDO_GEOMETRY,
                         srsNameSpace IN varchar2, srsNSAlias IN varchar2,
                         coordOrder number)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE AS LANGUAGE JAVA NAME
    'oracle.spatial.util.GML2.to_GMLGeometryCLOBJS(java.sql.Struct, java.lang.String, java.lang.String, oracle.sql.NUMBER) return oracle.jdbc.OracleClob' ;

 FUNCTION to_gml311geometry(Geometry IN mdsys.SDO_GEOMETRY)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE AS LANGUAGE JAVA NAME
    'oracle.spatial.util.GML3.to_GML3GeometryCLOBJS(java.sql.Struct) return oracle.jdbc.OracleClob' ;

 FUNCTION to_gml311geometry(Geometry IN mdsys.SDO_GEOMETRY,
                            srsNameSpace IN varchar2, srsNSAlias IN varchar2)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE AS LANGUAGE JAVA NAME
    'oracle.spatial.util.GML3.to_GML3GeometryCLOBJS(java.sql.Struct, java.lang.String, java.lang.String) return oracle.jdbc.OracleClob' ;

 FUNCTION to_gml311geometry(Geometry IN mdsys.SDO_GEOMETRY,
                            coordOrder number)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE AS LANGUAGE JAVA NAME
    'oracle.spatial.util.GML3.to_GML3GeometryCLOBJS(java.sql.Struct, oracle.sql.NUMBER) return oracle.jdbc.OracleClob' ;

 FUNCTION to_gml311geometry(Geometry IN mdsys.SDO_GEOMETRY,
                            srsNameSpace IN varchar2, srsNSAlias IN varchar2,
                            coordOrder number)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE AS LANGUAGE JAVA NAME
    'oracle.spatial.util.GML3.to_GML3GeometryCLOBJS(java.sql.Struct, java.lang.String, java.lang.String, oracle.sql.NUMBER) return oracle.jdbc.OracleClob' ;

 FUNCTION to_gml321geometry(Geometry IN mdsys.SDO_GEOMETRY)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE AS LANGUAGE JAVA NAME
    'oracle.spatial.util.GML3.to_GML3_2GeometryCLOBJS(java.sql.Struct) return oracle.jdbc.OracleClob' ;

 FUNCTION to_gml321geometry(Geometry IN mdsys.SDO_GEOMETRY,
                            srsNameSpace IN varchar2, srsNSAlias IN varchar2)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE AS LANGUAGE JAVA NAME
    'oracle.spatial.util.GML3.to_GML3_2GeometryCLOBJS(java.sql.Struct, java.lang.String, java.lang.String) return oracle.jdbc.OracleClob' ;

 FUNCTION to_gml321geometry(Geometry IN mdsys.SDO_GEOMETRY,
                            coordOrder number)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE AS LANGUAGE JAVA NAME
    'oracle.spatial.util.GML3.to_GML3_2GeometryCLOBJS(java.sql.Struct, oracle.sql.NUMBER) return oracle.jdbc.OracleClob' ;

 FUNCTION to_gml321geometry(Geometry IN mdsys.SDO_GEOMETRY,
                            srsNameSpace IN varchar2, srsNSAlias IN varchar2,
                            coordOrder number)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE AS LANGUAGE JAVA NAME
    'oracle.spatial.util.GML3.to_GML3_2GeometryCLOBJS(java.sql.Struct, java.lang.String, java.lang.String, oracle.sql.NUMBER) return oracle.jdbc.OracleClob' ;

FUNCTION to_kmlgeometry(Geometry IN mdsys.SDO_GEOMETRY)
 RETURN CLOB DETERMINISTIC  PARALLEL_ENABLE AS LANGUAGE JAVA NAME
    'oracle.spatial.util.KML2.to_KMLGeometryCLOBJS(java.sql.Struct) return oracle.jdbc.OracleClob' ;


 FUNCTION from_wkbgeometry(geometry IN BLOB)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.wkbToSTRUCT(oracle.jdbc.OracleBlob) return java.sql.Struct';

 FUNCTION from_wktgeometry(geometry IN CLOB)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.wktToSTRUCT(oracle.jdbc.OracleClob) return java.sql.Struct';


 FUNCTION from_wktgeometry(geometry IN VARCHAR2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.wktToSTRUCT(java.lang.String) return java.sql.Struct';


 FUNCTION from_GMLgeometry(geometry IN CLOB)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gmlToSTRUCT(oracle.jdbc.OracleClob) return java.sql.Struct';

 FUNCTION from_GMLgeometry(geometry IN CLOB, srsNameSpace IN varchar2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gmlToSTRUCT(oracle.jdbc.OracleClob, java.lang.String) return java.sql.Struct';

 FUNCTION from_GMLgeometry(geometry IN VARCHAR2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gmlToSTRUCT(java.lang.String) return java.sql.Struct';

 FUNCTION from_GMLgeometry(geometry IN VARCHAR2, srsNameSpace IN varchar2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gmlToSTRUCT(java.lang.String, java.lang.String) return java.sql.Struct';

 FUNCTION from_GMLgeometry(geometry IN CLOB,
                           coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gmlToSTRUCT(oracle.jdbc.OracleClob, oracle.sql.NUMBER) return java.sql.Struct';

 FUNCTION from_GMLgeometry(geometry IN CLOB, srsNameSpace IN varchar2,
                           coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gmlToSTRUCT(oracle.jdbc.OracleClob, java.lang.String, oracle.sql.NUMBER) return java.sql.Struct';

 FUNCTION from_GMLgeometry(geometry IN VARCHAR2,
                           coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gmlToSTRUCT(java.lang.String, oracle.sql.NUMBER) return java.sql.Struct';

 FUNCTION from_GMLgeometry(geometry IN VARCHAR2, srsNameSpace IN varchar2,
                           coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gmlToSTRUCT(java.lang.String, java.lang.String, oracle.sql.NUMBER) return java.sql.Struct';

 FUNCTION from_GML311geometry(geometry IN CLOB)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gml311ToSTRUCT(oracle.jdbc.OracleClob) return java.sql.Struct';

 FUNCTION from_GML311geometry(geometry IN CLOB, srsNameSpace IN varchar2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gml311ToSTRUCT(oracle.jdbc.OracleClob, java.lang.String) return java.sql.Struct';

 FUNCTION from_GML311geometry(geometry IN VARCHAR2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gml311ToSTRUCT(java.lang.String) return java.sql.Struct';

 FUNCTION from_GML311geometry(geometry IN VARCHAR2, srsNameSpace IN varchar2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gml311ToSTRUCT(java.lang.String, java.lang.String) return java.sql.Struct';

 FUNCTION from_GML311geometry(geometry IN CLOB,
                              coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gml311ToSTRUCT(oracle.jdbc.OracleClob, oracle.sql.NUMBER) return java.sql.Struct';

 FUNCTION from_GML311geometry(geometry IN CLOB, srsNameSpace IN varchar2,
                              coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gml311ToSTRUCT(oracle.jdbc.OracleClob, java.lang.String, oracle.sql.NUMBER) return java.sql.Struct';

 FUNCTION from_GML311geometry(geometry IN VARCHAR2,
                              coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gml311ToSTRUCT(java.lang.String, oracle.sql.NUMBER) return java.sql.Struct';

 FUNCTION from_GML311geometry(geometry IN VARCHAR2, srsNameSpace IN varchar2,
                              coordOrder IN number)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.gml311ToSTRUCT(java.lang.String, java.lang.String, oracle.sql.NUMBER) return java.sql.Struct';

 FUNCTION from_KMLgeometry(geometry IN CLOB)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.kmlToSTRUCT(oracle.jdbc.OracleClob) return java.sql.Struct';


 FUNCTION from_KMLgeometry(geometry IN VARCHAR2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.kmlToSTRUCT(java.lang.String) return java.sql.Struct';


 FUNCTION affinetransforms(geometry IN mdsys.SDO_GEOMETRY,
                           translation IN VARCHAR2, tx IN NUMBER, ty IN NUMBER, tz IN NUMBER,
                           scaling IN VARCHAR2, Psc1 IN mdsys.SDO_GEOMETRY, sx IN NUMBER, sy IN NUMBER, sz IN NUMBER,
                           rotation IN VARCHAR2, P1 IN mdsys.SDO_GEOMETRY, line1 IN mdsys.SDO_GEOMETRY, angle IN NUMBER, dir IN NUMBER,
                           shearing IN VARCHAR2, SHxy IN NUMBER, SHyx IN NUMBER, SHxz IN NUMBER, SHzx IN NUMBER, SHyz IN NUMBER, SHzy IN NUMBER,
                           reflection IN VARCHAR2, Pref IN mdsys.SDO_GEOMETRY, lineR IN mdsys.SDO_GEOMETRY, dirR IN NUMBER, planeR IN VARCHAR2, n IN SDO_NUMBER_ARRAY, bigD IN SDO_NUMBER_ARRAY)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.affineTransforms(java.sql.Struct, java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER,
java.lang.String, java.sql.Struct, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER,
java.lang.String, java.sql.Struct, java.sql.Struct, oracle.sql.NUMBER, oracle.sql.NUMBER,
java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER,
java.lang.String, java.sql.Struct, java.sql.Struct, oracle.sql.NUMBER, java.lang.String, oracle.spatial.type.SdoNumberArray, oracle.spatial.type.SdoNumberArray) return java.sql.Struct';


 FUNCTION extract3d(geometry IN mdsys.SDO_GEOMETRY, label IN VARCHAR2)
 RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.extract3d(java.sql.Struct, java.lang.String) return java.sql.Struct';

 FUNCTION getlabelbyelement(sourceGeometry IN mdsys.SDO_GEOMETRY, queryElement IN mdsys.SDO_GEOMETRY, tol IN NUMBER)
 RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.getlabelbyelement(java.sql.Struct, java.sql.Struct, oracle.sql.NUMBER) return java.lang.String';

 FUNCTION validate_wkbgeometry(geometry IN BLOB)
 RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.validateWkb(oracle.jdbc.OracleBlob) return java.lang.String';

 FUNCTION validate_wktgeometry(geometry IN CLOB)
 RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.validateWkt(oracle.jdbc.OracleClob) return java.lang.String';

 FUNCTION validate_wktgeometry(geometry IN VARCHAR2)
 RETURN VARCHAR2 DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.validateWkt(java.lang.String) return java.lang.String';


 -- these functions are from sdo_3gl package
  FUNCTION generate_buffer(geomobj IN mdsys.sdo_geometry,
                           dist  IN NUMBER,
                           sma   IN NUMBER, iflat IN NUMBER,
                           arcT  IN NUMBER)
  RETURN SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
  AS LANGUAGE JAVA NAME
  'oracle.spatial.util.Adapters.buffer(java.sql.Struct, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER) return java.sql.Struct ';

 FUNCTION anyInteract3D(Geometry1 IN mdsys.SDO_GEOMETRY,
                        Geometry2 IN mdsys.SDO_GEOMETRY,
                        is_g3d IN VARCHAR2,
                        tolerance IN number)
 RETURN VARCHAR2 DETERMINISTIC
  AS LANGUAGE JAVA NAME
  'oracle.spatial.util.Adapters.anyInteract(java.sql.Struct, java.sql.Struct, java.lang.String, oracle.sql.NUMBER) return java.lang.String';

 FUNCTION distance3D(Geometry1 IN mdsys.SDO_GEOMETRY,
                     Geometry2 IN mdsys.SDO_GEOMETRY,
                     is_g3d IN VARCHAR2,
                     smajax IN NUMBER,
                     flattening IN NUMBER,
                     g3d_geog_crs_uom_factor IN NUMBER,
                     tolerance IN number)
 RETURN number DETERMINISTIC
  AS LANGUAGE JAVA NAME
  'oracle.spatial.util.Adapters.distance(java.sql.Struct, java.sql.Struct, java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER) return oracle.sql.NUMBER';

 FUNCTION length3D(Geometry IN mdsys.SDO_GEOMETRY,
                   count_shared_edges IN NUMBER,
                   is_g3d IN VARCHAR2,
                   smajax IN NUMBER,
                   flattening IN NUMBER,
                   g3d_geog_crs_uom_factor IN NUMBER,
                   tolerance IN number)
 RETURN number DETERMINISTIC
  AS LANGUAGE JAVA NAME
  'oracle.spatial.util.Adapters.length(java.sql.Struct, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER) return oracle.sql.NUMBER';

 FUNCTION area3D(Geometry IN mdsys.SDO_GEOMETRY,
                 is_g3d IN VARCHAR2,
                 smajax IN NUMBER,
                 flattening IN NUMBER,
                 g3d_geog_crs_uom_factor IN NUMBER,
                 tolerance IN number)
 RETURN number DETERMINISTIC
  AS LANGUAGE JAVA NAME
  'oracle.spatial.util.Adapters.area(java.sql.Struct, java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER) return oracle.sql.NUMBER';

 FUNCTION volume3D(Geometry IN mdsys.SDO_GEOMETRY,
                   is_g3d IN VARCHAR2,
                   smajax IN NUMBER,
                   flattening IN NUMBER,
                   g3d_geog_crs_uom_factor IN NUMBER,
                   tolerance IN number)
 RETURN number DETERMINISTIC
  AS LANGUAGE JAVA NAME
  'oracle.spatial.util.Adapters.volume(java.sql.Struct, java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER) return oracle.sql.NUMBER';


 FUNCTION validateGeom3D(Geometry IN mdsys.SDO_GEOMETRY,
                         conditional IN VARCHAR2,
                         chck3dsrid IN NUMBER,
                         tolerance IN number)
 RETURN VARCHAR2 DETERMINISTIC
  AS LANGUAGE JAVA NAME
  'oracle.spatial.util.Adapters.validateGeom(java.sql.Struct, java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER) return java.lang.String';

 FUNCTION validate_layer_with_context3D(geom_table IN VARCHAR2,
                         geom_column IN VARCHAR2,
                         result_table IN VARCHAR2,
                         commit_interval IN NUMBER,
                         conditional IN VARCHAR2,
                         chck3dsrid IN NUMBER,
                         tolerance IN NUMBER)
 RETURN NUMBER DETERMINISTIC
  AS LANGUAGE JAVA NAME
  'oracle.spatial.util.Adapters.validate_layer_with_context_3D(java.lang.String, java.lang.String, java.lang.String, oracle.sql.NUMBER, java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER) return java.sql.NUMBER';

 FUNCTION closestPoints3D(Geometry1 IN mdsys.SDO_GEOMETRY,
                         Geometry2 IN mdsys.SDO_GEOMETRY,
                         is_g3d IN VARCHAR2,
                         smajax IN NUMBER,
                         flattening IN NUMBER,
                         g3d_geog_crs_uom_factor IN NUMBER,
                         tolerance IN number)
  RETURN SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
  AS LANGUAGE JAVA NAME
  'oracle.spatial.util.Adapters.closestPoints(java.sql.Struct, java.sql.Struct, java.lang.String, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER) return java.sql.Struct';

FUNCTION centroid3D(Geometry IN mdsys.SDO_GEOMETRY,
                    tolerance IN number)
RETURN SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
 AS LANGUAGE JAVA NAME
 'oracle.spatial.util.Adapters.centroid_3d(java.sql.Struct, oracle.sql.NUMBER) return java.sql.Struct';

  -- Removes innner rings of geom and returns collection
  FUNCTION ring_union_approx(geom SDO_GEOMETRY, tol number)
  RETURN SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
  AS LANGUAGE JAVA NAME
  'oracle.spatial.util.Adapters.ringUnionApprox(java.sql.Struct, oracle.sql.NUMBER) return java.sql.Struct';

  FUNCTION inside3D(Geometry1 IN mdsys.SDO_GEOMETRY,
                    Geometry2 IN mdsys.SDO_GEOMETRY,
                    is_g3d IN VARCHAR2,
                    tolerance IN number)
  RETURN VARCHAR2 DETERMINISTIC
   AS LANGUAGE JAVA NAME
   'oracle.spatial.util.Adapters.inside3d(java.sql.Struct, java.sql.Struct, java.lang.String, oracle.sql.NUMBER) return java.lang.String';

  FUNCTION pctrclip(qry IN sdo_geometry,
                    other_qry IN mdsys.sdo_mbr,
                    pts IN BLOB, npts IN number, totdim IN number,
                    trs IN BLOB, ntrs IN number,
                    tol IN number,
                    include_custom_dim IN NUMBER) RETURN BLOB
   AS LANGUAGE JAVA NAME
   'oracle.spatial.util.Adapters.pctrclipJS(java.sql.Struct, java.sql.Struct, oracle.jdbc.OracleBlob, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.jdbc.OracleBlob, oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER) return oracle.jdbc.OracleBlob';

  function expandG3DGeoms(geom IN mdsys.sdo_geometry)
  RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
  AS LANGUAGE JAVA NAME
  'oracle.spatial.util.Adapters.expandG3Dgeoms(java.sql.Struct) return java.sql.Struct';


 FUNCTION internal_simplifyvw(geometry IN mdsys.SDO_GEOMETRY,
                              vertex_threshold IN NUMBER,
                              sma number,
                              iflat number)
 return mdsys.SDO_GEOMETRY deterministic PARALLEL_ENABLE
  AS LANGUAGE JAVA NAME
  'oracle.spatial.util.Adapters.simplifyVW(java.sql.Struct,  oracle.sql.NUMBER, oracle.sql.NUMBER, oracle.sql.NUMBER) return java.sql.Struct';

-- Java API for NURBS curve approximation
  FUNCTION internal_getnurbsapprox(geometry IN mdsys.SDO_GEOMETRY)
  RETURN mdsys.SDO_GEOMETRY deterministic PARALLEL_ENABLE
  AS LANGUAGE JAVA NAME
    'oracle.spatial.util.Adapters.getNurbsApprox(java.sql.Struct) return java.sql.Struct';

  FUNCTION intl_to_wkbgeometry(geometry IN mdsys.SDO_GEOMETRY)
  RETURN BLOB DETERMINISTIC
  AS LANGUAGE JAVA NAME
  'oracle.spatial.util.Adapters.structToWkbJS(java.sql.Struct) return oracle.jdbc.OracleBlob';

  FUNCTION intl_to_wktgeometry(geometry IN mdsys.SDO_GEOMETRY)
  RETURN CLOB DETERMINISTIC
  AS LANGUAGE JAVA NAME
  'oracle.spatial.util.Adapters.structToWktJS(java.sql.Struct) return oracle.jdbc.OracleClob';

  FUNCTION intl_to_wktgeometry_varchar(geometry IN mdsys.SDO_GEOMETRY)
  RETURN VARCHAR2 DETERMINISTIC
  AS LANGUAGE JAVA NAME
  'oracle.spatial.util.Adapters.structToWktString(java.sql.Struct) return String';


  FUNCTION intl_extrude(geometry IN mdsys.SDO_GEOMETRY,
                        grdHeight IN SDO_NUMBER_ARRAY,
                        height IN SDO_NUMBER_ARRAY,
                        tol IN NUMBER,
                        optional3dSrid IN NUMBER)
  RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
   AS LANGUAGE JAVA NAME
   'oracle.spatial.util.Adapters.extrusion2(java.sql.Struct, oracle.spatial.type.SdoNumberArray, oracle.spatial.type.SdoNumberArray, oracle.sql.NUMBER, oracle.sql.NUMBER) return java.sql.Struct';



   --
   -- geodetic 3D related functions/procedures
   --


   FUNCTION populate_measure_geo3d(geom_segment      IN mdsys.SDO_GEOMETRY,
                                   smax      IN NUMBER,
                                   flat      IN NUMBER,
                                   geog_crs_uom_factor IN NUMBER,
                                   start_measure IN NUMBER,
                                   end_measure   IN NUMBER,
                                   tolerance     IN NUMBER)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
   AS LANGUAGE JAVA NAME
   'oracle.spatial.geometry.LRSGeometryG3D.defineG3D(
    java.sql.Struct,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER)  return java.sql.Struct';


   FUNCTION locate_pt_geo3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                            smax             IN NUMBER,
                            flat             IN NUMBER,
                            geog_crs_uom_factor IN NUMBER,
                            measure      IN NUMBER,
                            tolerance    IN NUMBER)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
   AS LANGUAGE JAVA NAME
   'oracle.spatial.geometry.LRSGeometryG3D.locateG3D(
    java.sql.Struct,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER)  return java.sql.Struct';

   FUNCTION clip_geom_segment_geo3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                                    smax             IN NUMBER,
                                    flat             IN NUMBER,
                                    geog_crs_uom_factor IN NUMBER,
                                    start_measure IN NUMBER,
                                    end_measure   IN NUMBER,
                                    tolerance     IN NUMBER)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
   AS LANGUAGE JAVA NAME
   'oracle.spatial.geometry.LRSGeometryG3D.clipG3D(
    java.sql.Struct,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER)  return java.sql.Struct';

   FUNCTION project_pt_geo3d(geom_segment    IN mdsys.SDO_GEOMETRY,
                             smax            IN NUMBER,
                             flat            IN NUMBER,
                             geog_crs_uom_factor IN NUMBER,
                             point           IN mdsys.SDO_GEOMETRY,
                             tolerance       IN NUMBER)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE
   AS LANGUAGE JAVA NAME
   'oracle.spatial.geometry.LRSGeometryG3D.projectG3D(
    java.sql.Struct,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER,
    java.sql.Struct,
    oracle.sql.NUMBER)  return java.sql.Struct';

   FUNCTION length_geo3d(geom_segment    IN mdsys.SDO_GEOMETRY,
                         smax            IN NUMBER,
                         flat            IN NUMBER,
                         geog_crs_uom_factor IN NUMBER,
                         tolerance       IN NUMBER)
   RETURN NUMBER PARALLEL_ENABLE
   AS LANGUAGE JAVA NAME
   'oracle.spatial.geometry.LRSGeometryG3D.lengthG3D(
    java.sql.Struct,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER,
    oracle.sql.NUMBER)  return oracle.sql.NUMBER';


    ---
    --- NDM sdo_net java stored procedure/function
    ---

  --
  -- sdonetb.sql
  --

  -- private procedure to call java wrapper
  PROCEDURE generate_partition_blobs_java(
                              network                   IN VARCHAR2,
                              link_level                IN NUMBER,
                              partition_blob_table_name IN VARCHAR2,
                              include_user_data         IN BOOLEAN,
                              commit_for_each_blob      IN BOOLEAN,
                              perform_delta_update      IN BOOLEAN)
  AS LANGUAGE JAVA
  NAME 'oracle.spatial.network.lod.LODNetworkWrapper.generatePartitionBlobs(java.lang.String, int, java.lang.String, boolean, boolean, boolean)';


  -- private procedure to call java wrapper
  PROCEDURE generate_partition_blobs_java2(
                              network                   IN VARCHAR2,
                              partition_blob_table_name IN VARCHAR2,
                              include_user_data         IN BOOLEAN,
                              commit_for_each_blob      IN BOOLEAN,
                              perform_delta_update      IN BOOLEAN)
  AS LANGUAGE JAVA
  NAME 'oracle.spatial.network.lod.LODNetworkWrapper.generatePartitionBlobs(java.lang.String, java.lang.String, boolean, boolean, boolean)';


  -- private procedure to call java wrapper
  PROCEDURE generate_partition_blob_java(
                              network           IN VARCHAR2,
                              link_level        IN NUMBER,
                              partition_id      IN NUMBER,
                              include_user_data IN BOOLEAN,
                              perform_delta_update IN BOOLEAN)
  AS LANGUAGE JAVA
  NAME 'oracle.spatial.network.lod.LODNetworkWrapper.generatePartitionBlob(java.lang.String, int, int, boolean, boolean)';


  -- private procedure to call java wrapper
  PROCEDURE find_connected_components_java(
                              network              IN VARCHAR2,
                              link_level           IN NUMBER,
                              component_table_name IN VARCHAR2)
  AS LANGUAGE JAVA
  NAME 'oracle.spatial.network.lod.LODNetworkWrapper.findConnectedComponents(java.lang.String, int, java.lang.String)';


  FUNCTION find_conn_comp_part_java(
                              network                IN VARCHAR2,
                              link_level             IN NUMBER,
                              partition_id           IN NUMBER,
                              start_comp_id          IN NUMBER,
                              node_id_array          OUT mdsys.SDO_NUMBER_ARRAY, --SYS.ODCINUMBERLIST,
                              comp_id_array          OUT mdsys.SDO_NUMBER_ARRAY) -- SYS.ODCINUMBERLIST)
  RETURN NUMBER
  AS LANGUAGE JAVA
  NAME 'oracle.spatial.network.lod.LODNetworkWrapper.findConnectedComponentsInPartition(
          java.lang.String,
          int,
          int,
          int,
          java.sql.Array[],
          java.sql.Array[])
        return int';

  PROCEDURE set_max_java_heap_size(bytes NUMBER)
   AS LANGUAGE JAVA NAME
   'oracle.aurora.vm.OracleRuntime.setMaxMemorySize(long)';


  PROCEDURE load_config_java( config_xml  IN CLOB )
  AS LANGUAGE JAVA
  NAME 'oracle.spatial.network.lod.LODNetworkWrapper.loadConfig(java.sql.Clob)';


  FUNCTION get_partition_size_java( network                     IN VARCHAR2,
                                    partition_id                IN NUMBER,
                                    link_level                  IN NUMBER,
                                    inlcude_user_data           IN BOOLEAN,
                                    include_spatial_data        IN BOOLEAN)
  RETURN NUMBER
  AS LANGUAGE JAVA
  NAME 'oracle.spatial.network.lod.LODNetworkWrapper.getPartitionSize(
        java.lang.String,
        int,
        int,
        boolean,
        boolean) return long';

  ---
  --- prvtnetb.sql
  ---

  PROCEDURE set_logging_level_java( level     IN NUMBER )
  AS LANGUAGE JAVA
  NAME 'oracle.spatial.network.lod.LODNetworkWrapper.setLoggingLevel(int)';


END;
/