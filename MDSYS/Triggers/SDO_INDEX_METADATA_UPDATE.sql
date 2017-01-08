CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_INDEX_METADATA_UPDATE
AFTER UPDATE OR DELETE ON mdsys.SDO_INDEX_METADATA_TABLE
FOR EACH ROW
BEGIN


  mdsys.mdprvt_idx.invalidate_cache(:old.sdo_index_owner,
                                    :old.sdo_index_name,
                                    :old.sdo_index_partition,
                                    :old.sdo_index_table);
END;
/