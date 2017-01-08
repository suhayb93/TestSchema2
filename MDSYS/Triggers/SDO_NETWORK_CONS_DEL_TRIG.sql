CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_network_cons_del_trig
INSTEAD OF DELETE ON mdsys.user_sdo_network_constraints
FOR EACH ROW
DECLARE
  err_msg      VARCHAR2(200);
  num          NUMBER := -1;
  stmt         VARCHAR2(200);
BEGIN

  stmt := 'select count(*) from dba_java_classes where owner = :owner '||
   ' and name = :name';
  execute immediate stmt into num using user, :old.class_name;

  if (num=1) then
    err_msg := 'Java class schema object: '||:old.class_name||' exists. Please '||
      'drop it first.';
    mdsys.mderr.raise_md_error('MD', 'SDO', '13385', err_msg);
  else
    stmt := 'delete from sdo_network_constraints where sdo_owner = :owner '||
      ' and class_name = :name';
    execute immediate stmt using user, :old.class_name;
  end if;

EXCEPTION
  when others then raise;
END sdo_network_cons_del_trig;
/