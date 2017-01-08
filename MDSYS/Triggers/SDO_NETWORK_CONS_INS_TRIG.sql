CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_network_cons_ins_trig
INSTEAD OF INSERT ON mdsys.user_sdo_network_constraints
REFERENCING NEW AS n
FOR EACH ROW
DECLARE
  err_msg         VARCHAR2(200);
  num             NUMBER := -1;
  stmt            VARCHAR2(200);
BEGIN

  stmt := 'select count(*) from dba_java_classes where owner = :owner '||
   ' and name = :name';
  execute immediate stmt into num using user, :n.class_name;

  if (num<>1) then
    err_msg := 'Could not find Java class schema object: ' || :n.class_name ||
        '. Did not load Java class properly.';
    mdsys.mderr.raise_md_error('MD', 'SDO','13385', err_msg);
  else
    stmt := 'insert into sdo_network_constraints(sdo_owner, constraint, ' ||
     'description, class_name, class) values (:owner, :constraint, '||
     ':description, :class_name, :class)';
    execute immediate stmt using NLS_UPPER(user),:n.constraint,
     :n.description, :n.class_name,:n.class;
  end if;

EXCEPTION
  when others then raise;
END sdo_network_cons_ins_trig;
/