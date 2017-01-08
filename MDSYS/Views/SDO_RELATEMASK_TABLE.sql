CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.sdo_relatemask_table (sdo_mask,sdo_relation) AS
select sdo_mask, sdo_relation from md$relate;