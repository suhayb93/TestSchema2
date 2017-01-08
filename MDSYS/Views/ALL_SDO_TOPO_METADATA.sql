CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_topo_metadata ("OWNER",topology,topology_id,tolerance,srid,table_owner,table_name,column_name,tg_layer_id,tg_layer_type,tg_layer_level,child_layer_id,node_sequence,edge_sequence,face_sequence,tg_sequence,digits_right_of_decimal) AS
SELECT SDO_OWNER OWNER,
       Topology,
       Topology_id,
       Tolerance,
       SRID,
       b.owner Table_owner,
       b.Table_Name Table_Name,
       b.Column_Name Column_Name,
       b.Layer_ID TG_Layer_ID,
       b.Layer_Type TG_Layer_Type,
       b.Layer_Level TG_Layer_Level,
       b.Child_Layer_id Child_Layer_id,
       Topology||'_NODE_S' Node_Sequence,
       Topology||'_EDGE_S' Edge_Sequence,
       Topology||'_FACE_S' Face_Sequence,
       Topology||'_TG_S' TG_Sequence,
       Digits_Right_Of_Decimal
FROM SDO_TOPO_METADATA_TABLE a,
     TABLE (a.Topo_Geometry_Layers) b
WHERE
(exists
   (select table_name from all_tables
    where table_name=topology || '_NODE$'
      and owner = sdo_owner
    union all
    select view_name from all_views
    where  view_name=topology || '_NODE$'
      and owner = sdo_owner));