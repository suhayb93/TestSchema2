CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_NET_LINK
    AS OBJECT (link_id             NUMBER,
               start_node_id       NUMBER,
               end_node_id         NUMBER,
               operation           VARCHAR2(3))
/