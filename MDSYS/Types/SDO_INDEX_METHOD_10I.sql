CREATE OR REPLACE NONEDITIONABLE type mdsys.sdo_index_method_10i
                                      
AUTHID current_user  AS OBJECT
(
  scan_ctx raw(4),
  STATIC function ODCIGetInterfaces(ifclist OUT sys.ODCIObjectList)
         return number,
  STATIC function ODCIIndexCreate (ia sys.odciindexinfo, parms varchar2,
                                   env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexDrop  (ia sys.odciindexinfo, env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexTruncate (ia sys.odciindexinfo, env sys.ODCIEnv)
          return number,
  STATIC function ODCIIndexCoalescePartition(ia sys.odciindexinfo,
                                             env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexExchangePartition(ia sys.odciindexinfo,
                                             ia1 sys.odciindexinfo,
                                             env sys.ODCIEnv)
          return number,
  STATIC function ODCIIndexMergePartition(ia sys.odciindexinfo,
                                          part_name1 sys.odcipartinfo,
                                          part_name2 sys.odcipartinfo,
                                          params varchar2,
                                          env sys.ODCIEnv)
          return number,
  STATIC function ODCIIndexSplitPartition(ia sys.odciindexinfo,
                                          part_name1 sys.odcipartinfo,
                                          part_name2 sys.odcipartinfo,
                                          params varchar2,
                                          env sys.ODCIEnv)
          return number,
  STATIC function ODCIIndexInsert (ia sys.odciindexinfo, rid varchar2,
                                   newval mdsys.sdo_geometry,
                                   env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexDelete (ia sys.odciindexinfo, rid varchar2,
                                   oldval mdsys.sdo_geometry,
                                   env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexUpdate (ia sys.odciindexinfo, rid varchar2,
                                   oldval mdsys.sdo_geometry,
                                   newval mdsys.sdo_geometry,
                                   env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexAlter (ia sys.odciindexinfo,
                                  params IN OUT varchar2,
                                  alter_option number,
                                  env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i,
                                  ia sys.odciindexinfo,
                                  op sys.OdciPredInfo,
                                  qi sys.OdciQueryInfo,
                                  strt varchar2, stop varchar2,
                                  win_obj mdsys.sdo_geometry,
                                  params varchar2,
                                  env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i,
                                  ia sys.odciindexinfo,
                                  op sys.OdciPredInfo,
                                  qi sys.OdciQueryInfo,
                                  strt varchar2, stop varchar2,
                                  win_obj mdsys.sdo_geometry, rid ROWID,
                                  params varchar2,
                                  idx_tab1 varchar2, idx_tab2 varchar2,
                                  sdo_level number, sdo_ntiles number,
                                  win_ndim number,
                                  env sys.ODCIEnv)
         return number,
  STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i,
                                  ia sys.odciindexinfo,
                                  op sys.OdciPredInfo,
                                  qi sys.OdciQueryInfo,
                                  strt varchar2, stop varchar2,
                                  win_obj mdsys.sdo_geometry,
                                  env sys.ODCIEnv)
         return number,
  member function ODCIIndexFetch (nrows number,
                                  rids OUT sys.odciridlist,
                                  env sys.ODCIEnv)
        return number
        IS LANGUAGE C
        name "md_idx_fetch"
        library ORDMD_IDX_LIBS
        with context
        parameters (
           context,
           self,
           self INDICATOR STRUCT,
           nrows,
           nrows INDICATOR,
           rids,
           rids INDICATOR,
           env,
           env INDICATOR STRUCT,
           return OCINumber
      ),
  member function ODCIIndexClose (env sys.ODCIEnv)
   return number
   IS LANGUAGE C
   name "md_idx_close"
   library ORDMD_IDX_LIBS
   with context
   parameters (
     context,
     self,
     self INDICATOR STRUCT,
     env,
     env INDICATOR STRUCT,
     return OCINumber
   ),
  STATIC function ODCIIndexRewrite(ia1 sys.ODCIIndexInfo,
                                   ia2 sys.ODCIIndexInfo,
                                   cor1 VARCHAR2, cor2 VARCHAR2,
                                   op sys.ODCIPredInfo, qi sys.ODCIQueryInfo,
                                   strt VARCHAR2, stop VARCHAR2,
                                   params varchar2, rstr OUT varchar2,
                                   env sys.ODCIEnv)
      return number,
  STATIC function ODCIIndexGetMetadata(ia sys.odciindexinfo,
                                       expversion VARCHAR2,
                                       newblock OUT PLS_INTEGER,
                                     env sys.ODCIEnv)
      return varchar2,
   static function ODCIIndexUtilGetTableNames(ia        IN  sys.odciindexinfo,
                                              read_only IN  PLS_INTEGER,
                                              version   IN  varchar2,
                                              context   OUT PLS_INTEGER)
            return boolean,
   static procedure ODCIIndexUtilCleanup(context IN PLS_INTEGER),

 STATIC function ODCIIndexInsert (ia sys.odciindexinfo, rid varchar2,
                                   newval mdsys.sdo_topo_geometry,
                                   env sys.ODCIEnv)
         return number,
 STATIC function ODCIIndexDelete (ia sys.odciindexinfo, rid varchar2,
                                   oldval mdsys.sdo_topo_geometry,
                                   env sys.ODCIEnv)
         return number,
 STATIC function ODCIIndexUpdate (ia sys.odciindexinfo, rid varchar2,
                                   oldval mdsys.sdo_topo_geometry,
                                   newval mdsys.sdo_topo_geometry,
                                   env sys.ODCIEnv)
         return number,
 STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i,
                                  ia sys.odciindexinfo,
                                  op sys.OdciPredInfo,
                                  qi sys.OdciQueryInfo,
                                  strt varchar2, stop varchar2,
                                  win_obj mdsys.sdo_topo_geometry,
                                  params varchar2,
                                  env sys.ODCIEnv)
         return number,
 STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i,
                                  ia sys.odciindexinfo,
                                  op sys.OdciPredInfo,
                                  qi sys.OdciQueryInfo,
                                  strt varchar2, stop varchar2,
                                  win_obj mdsys.sdo_topo_geometry,
                                  env sys.ODCIEnv)
         return number,
 STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i,
                                  ia sys.odciindexinfo,
                                  op sys.OdciPredInfo,
                                  qi sys.OdciQueryInfo,
                                  strt varchar2, stop varchar2,
                                  win_obj mdsys.sdo_topo_object_array,
                                  env sys.ODCIEnv)
   RETURN number )
 alter type sdo_index_method_10i  add STATIC FUNCTION execute_index_ptn_drop(ia in SYS.ODCIIndexInfo)  RETURN number
 alter type sdo_index_method_10i  add STATIC FUNCTION index_update (ia sys.odciindexinfo, rid varchar2,  oldval mdsys.sdo_geometry, newval mdsys.sdo_geometry,  env sys.ODCIEnv) RETURN NUMBER
 alter type sdo_index_method_10i  add STATIC FUNCTION insert_delete(ia sys.odciindexinfo, rid varchar2, val mdsys.sdo_geometry, upd_type varchar2, env sys.ODCIEnv)  RETURN number
  alter type sdo_index_method_10i  add STATIC function ODCIIndexInsert (ia sys.odciindexinfo,  rid varchar2, newval mdsys.st_geometry, env sys.ODCIEnv)  return number
  alter type sdo_index_method_10i  add STATIC function ODCIIndexDelete (ia sys.odciindexinfo,   rid varchar2, oldval mdsys.st_geometry, env sys.ODCIEnv)      return number
  alter type sdo_index_method_10i  add STATIC function ODCIIndexUpdate (ia sys.odciindexinfo,   rid varchar2, oldval mdsys.st_geometry, newval mdsys.st_geometry,  env sys.ODCIEnv)  return number
  alter type sdo_index_method_10i  add STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i, ia sys.odciindexinfo,op sys.OdciPredInfo, qi sys.OdciQueryInfo,  strt varchar2, stop varchar2,win_obj mdsys.st_geometry,  env sys.ODCIEnv)  return number
  alter type sdo_index_method_10i  add STATIC function ODCIIndexStart (SCTX IN OUT sdo_index_method_10i, ia sys.odciindexinfo,op sys.OdciPredInfo, qi sys.OdciQueryInfo,  strt varchar2, stop varchar2,win_obj mdsys.st_geometry,  params varchar2, env sys.ODCIEnv)  return number
  alter type sdo_index_method_10i  add STATIC function ODCIIndexRewrite(ia1 sys.ODCIIndexInfo,  ia2 sys.ODCIIndexInfo, cor1 VARCHAR2, cor2 VARCHAR2,  op sys.ODCIPredInfo, qi sys.ODCIQueryInfo, strt VARCHAR2,  stop VARCHAR2, rstr OUT varchar2, env sys.ODCIEnv) return number 
/
CREATE OR REPLACE type body mdsys.sdo_index_method_10i wrapped
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
7b77 1179
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
zkH5fw+mlw/5KKzk7Z4=
/