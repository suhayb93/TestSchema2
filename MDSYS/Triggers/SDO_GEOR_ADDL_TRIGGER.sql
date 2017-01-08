CREATE OR REPLACE NONEDITIONABLE trigger mdsys.sdo_geor_addl_trigger
after ddl on database
declare
 m_event   varchar2(512);
 m_owner   varchar2(512);
 m_type    varchar2(512);
 m_name    varchar2(5120);
 m_adt     NUMBER;
 m_cnt     NUMBER;
 m_stmt    varchar2(512);
 m_ret     varchar2(3000);
 m_ret1     varchar2(512);
begin



 m_stmt := 'select mdsys.GetMdsysEvent() from dual';
 execute immediate m_stmt into m_cnt;
 if ( m_cnt != 0 ) then
   return;
 end if;

 m_stmt:='select sys.dbms_standard.dictionary_obj_type from dual';
 execute immediate m_stmt into m_type;
 if(not (m_type='TABLE' or m_type='TRIGGER' or m_type='USER' or m_type='TABLESPACE'))
 then
   return;
 end if;

 m_stmt:='select sys.dbms_standard.dictionary_obj_owner from dual';
 execute immediate m_stmt into m_owner;

 m_stmt:='select sys.dbms_standard.dictionary_obj_name from dual';
 execute immediate m_stmt into m_name;

 m_stmt:='select sys.dbms_standard.sysevent from dual';
 execute immediate m_stmt into m_event;





 if ( m_type = 'TABLE' and m_event != 'DROP' and m_event != 'RENAME' ) then
   m_stmt := 'select mdsys.TblContainsAdt(:own, :tab) from dual';
   begin
     execute immediate m_stmt into m_adt using m_owner, m_name;
     exception when others then
       m_adt := 1;
   end;
   if ( m_adt = 0 ) then
     return;
   end if;
 end if;

 if((instr(nls_upper(m_name),'MDRT_')>0) and m_event='DROP')
 then
   return;
 end if;








 if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='CREATE')
 then
   m_stmt:='select sdo_geor_def.listAllGeoRasterFieldsStr(:1,:2) from dual';
   execute immediate m_stmt  into m_ret  using m_owner,m_name;
   m_ret:=trim(m_ret);
   while (length(m_ret)!=0) loop
     if (instr(m_ret,' $$__## ')!=0)
     then
       m_ret1:=trim(substr(m_ret,1,instr(m_ret,' $$__## ')-1));
       m_ret:=trim(substr(m_ret,instr(m_ret,' $$__## ')+8));
     else
       m_ret1:=trim(m_ret);
       m_ret:='';
     end if;
     m_stmt:='begin SDO_GEOR_UTL.createDMLTrigger(:1,:2); end;';
    execute immediate m_stmt using m_owner||'.'||m_name,m_ret1;
   end loop;
   return;
 end if;






















  if (m_name!='MDSYS' and m_type='USER' and m_event='DROP')
  then
     m_stmt:='call sdo_geor_def.doDropUserAndTable()';
     execute immediate m_stmt;
  end if;

  if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='DROP')
  then
     m_stmt:='call sdo_geor_def.doDropUserAndTable()';
     execute immediate m_stmt;
  end if;

  if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='TRUNCATE')
  then
     m_stmt:='call sdo_geor_def.doTruncateTable()';
     execute immediate m_stmt;
  end if;

  if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='ALTER')
  then
     m_stmt:='call sdo_geor_def.doAlterRenameTable()';
     execute immediate m_stmt;
  end if;

  if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='RENAME')
  then
     m_stmt:='call sdo_geor_def.doRenameTable()';
     execute immediate m_stmt;
  end if;






 if (m_event='DROP' and m_type='TABLE')
 then
   m_stmt:='delete from sdo_geor_ddl__table$$ where id=2';
   EXECUTE IMMEDIATE m_stmt;
 end if;

 if ((m_type='USER' and m_event='DROP') or (m_type='TABLESPACE' and m_event='DROP'))
 then
   m_stmt:='delete from sdo_geor_ddl__table$$';
   EXECUTE IMMEDIATE m_stmt;
 end if;

 Exception
   when others then
     if(sqlcode=-13391)
     then
       m_stmt:=sqlerrm;
       m_stmt:=substr(m_stmt,11);
       m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391,'''||m_stmt||''')';
       execute immediate m_stmt;
     end if;
end;
/