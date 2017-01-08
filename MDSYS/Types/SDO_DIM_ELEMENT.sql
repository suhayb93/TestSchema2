CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_DIM_ELEMENT
                                                                      
AS OBJECT (
          SDO_DIMNAME     VARCHAR(64),
          SDO_LB          NUMBER,
          SDO_UB          NUMBER,
          SDO_TOLERANCE   NUMBER ) 
/