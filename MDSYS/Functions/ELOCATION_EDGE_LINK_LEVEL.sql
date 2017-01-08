CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.elocation_edge_link_level(func_class in number)
  RETURN NUMBER  DETERMINISTIC
IS
BEGIN
   RETURN floor((8-FUNC_CLASS)/3);
END;
/