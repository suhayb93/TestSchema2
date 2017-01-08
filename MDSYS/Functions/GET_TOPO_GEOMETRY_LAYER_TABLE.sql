CREATE OR REPLACE NONEDITIONABLE function mdsys.get_Topo_Geometry_Layer_Table (
   Topo_Geometry_Layers IN SDO_Topo_Geometry_Layer_Array) return
  SDO_Topo_Geometry_Layer_Table DETERMINISTIC IS
tp_table SDO_Topo_Geometry_Layer_Table;
layer SDO_TOPO_GEOMETRY_LAYER;
layer_tab SDO_Topo_Geometry_Layer_Table;
idx number;
begin
  layer := Topo_Geometry_Layers(1);
  if (layer IS NULL) then
    return SDO_Topo_Geometry_Layer_Table(SDO_TOPO_GEOMETRY_LAYER(NULL,NULL,NULL,NULL,NULL,NULL,NULL));
  else
   layer_tab := SDO_Topo_Geometry_Layer_Table();
   for idx in 1 .. Topo_Geometry_Layers.count loop
    layer_tab.extend;
    layer_tab(idx) := Topo_Geometry_Layers(idx);
   end loop;
   return layer_tab;
  end if;

end;
/