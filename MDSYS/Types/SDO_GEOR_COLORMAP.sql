CREATE OR REPLACE NONEDITIONABLE TYPE mdsys.SDO_GEOR_COLORMAP
                                                                      
AS OBJECT
(
   cellValue     SDO_NUMBER_ARRAY,
   red           SDO_NUMBER_ARRAY,
   green         SDO_NUMBER_ARRAY,
   blue          SDO_NUMBER_ARRAY,
   alpha         SDO_NUMBER_ARRAY) 
/