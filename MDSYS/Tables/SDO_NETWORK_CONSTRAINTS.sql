CREATE TABLE mdsys.sdo_network_constraints (
  sdo_owner VARCHAR2(32 BYTE) DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_USER') NOT NULL,
  "CONSTRAINT" VARCHAR2(32 BYTE) NOT NULL,
  description VARCHAR2(200 BYTE),
  class_name VARCHAR2(4000 BYTE),
  "CLASS" BLOB,
  java_interface VARCHAR2(4000 BYTE),
  CONSTRAINT unique_class_constraint UNIQUE (sdo_owner,class_name),
  CONSTRAINT unique_user_constraint UNIQUE (sdo_owner,"CONSTRAINT")
);