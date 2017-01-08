CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.sem_upgrade_to_11 authid current_user AS
  PROCEDURE unload_all_into_staging_tables(downgrade BOOLEAN DEFAULT FALSE);
  PROCEDURE empty_app_tabs_drop_RDF_cols(downgrade BOOLEAN DEFAULT FALSE);

  PROCEDURE setup_for_loading_in_11;
  PROCEDURE create_all_models_in_11;
  PROCEDURE load_from_all_staging_tables;

  PROCEDURE save_10_2_RDF_network_for_11;
  PROCEDURE restore_10_2_RDF_network_in_11;
END sem_upgrade_to_11;
/