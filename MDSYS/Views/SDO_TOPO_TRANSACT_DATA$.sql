CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.sdo_topo_transact_data$ (topology_id,topo_id,topo_type,topo_op,parent_id) AS
select TOPOLOGY_ID,TOPO_ID, TOPO_TYPE, TOPO_OP, PARENT_ID
       from SDO_TOPO_TRANSACT_DATA;