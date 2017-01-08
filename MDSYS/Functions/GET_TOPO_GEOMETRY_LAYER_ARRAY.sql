CREATE OR REPLACE NONEDITIONABLE function mdsys.get_Topo_Geometry_Layer_Array (
   Topo_Geometry_Layers IN SDO_Topo_Geometry_Layer_Table) return
  SDO_Topo_Geometry_Layer_Array DETERMINISTIC IS
tp_array SDO_Topo_Geometry_Layer_Array;
layer SDO_TOPO_GEOMETRY_LAYER;
layer_arr SDO_Topo_Geometry_Layer_Array;
idx number;
begin
  layer := Topo_Geometry_Layers(1);
  if (layer.owner IS NULL) then
    return SDO_Topo_Geometry_Layer_Array(NULL);
  else
   layer_arr := SDO_Topo_Geometry_Layer_Array();
   for idx in 1 .. Topo_Geometry_Layers.count loop
    layer_arr.extend;
    layer_arr(idx) := Topo_Geometry_Layers(idx);
   end loop;
   return layer_arr;
  end if;

end;
/