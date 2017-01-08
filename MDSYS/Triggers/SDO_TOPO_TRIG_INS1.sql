CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_TOPO_TRIG_INS1
INSTEAD OF INSERT ON mdsys.SDO_TOPO_TRANSACT_DATA$
REFERENCING NEW AS n
FOR EACH ROW
declare
begin

   INSERT INTO SDO_TOPO_TRANSACT_DATA
      values(SDO_TOPO_TRANSACT_SUBSEQ.nextval, :n.topology_id, :n.topo_id,
                :n.topo_type, :n.topo_op, :n.parent_id);

end;
/