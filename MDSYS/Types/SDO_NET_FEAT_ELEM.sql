CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_NET_FEAT_ELEM AS OBJECT
    (
      feat_elem_type   NUMBER,
      net_elem_id      NUMBER,
      start_percentage NUMBER,
      end_percentage   NUMBER
    )
/