CREATE TABLE mdsys.openlsservices (
  service VARCHAR2(32 BYTE) NOT NULL CONSTRAINT openlsservicedomain CHECK (
                SERVICE IN (
                  'Location Utility Service',
                  'Presentation Service',
                  'Route Service',
                  'Directory Service')),
  url VARCHAR2(128 BYTE),
  "VERSION" VARCHAR2(16 BYTE) NOT NULL,
  UNIQUE (service)
);