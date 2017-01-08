CREATE OR REPLACE NONEDITIONABLE FUNCTION mdsys.hhsubdivide (hh1 IN RAW, cid IN BINARY_INTEGER)
    RETURN RAW IS
begin
 return md.hhsubdivide(hh1, cid);
end;
/