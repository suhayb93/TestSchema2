CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_NET_UPD_HIST_N
    AS OBJECT (id             NUMBER,
               link_level     NUMBER,
               partition_id   NUMBER,
               assigned_partition_id NUMBER,
               operation      VARCHAR2(3))
/