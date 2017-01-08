CREATE OR REPLACE NONEDITIONABLE trigger mdsys.sdo_geor_bddl_trigger
before ddl on database
declare
 TYPE attrs_cur IS REF CURSOR;
 m_cur       attrs_cur;
 m_event varchar2(512);
 m_user  varchar2(512);
 m_owner varchar2(512);
 m_type  varchar2(512);
 m_name  varchar2(5120);
 m_column varchar2(5120);
 m_cnt   NUMBER;
 m_adt   NUMBER;
 m_stmt  varchar2(512);
 m_stmt1 varchar2(512);
 m_var   varchar2(512);
 m_o_stmt VARCHAR2(5120);
PRAGMA AUTONOMOUS_TRANSACTION;
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

 m_stmt:='select SYS_CONTEXT(''USERENV'',''SESSION_USER'') from dual';
 execute immediate m_stmt into m_user;







  if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='ALTER')
  then
    m_stmt:='select column_name from dba_tab_columns where owner=:1 and table_name=:2';
    begin
      open m_cur for m_stmt using m_owner,m_name;
      loop
        fetch m_cur into m_column;
        exit when m_cur%NOTFOUND;
        m_stmt:='select sdo_geor_def.isDropColumn(:1) from dual';
        execute immediate m_stmt into m_stmt1 using m_column;
        if (trim(m_stmt1)='TRUE')
        then
          m_stmt:='begin sdo_geor_def.doAlterDropColumn(:1,:2,:3); end;';
          execute immediate m_stmt using m_owner,m_name,m_column;
        end if;
      end loop;
      close m_cur;

      EXCEPTION WHEN OTHERS THEN
        IF m_cur%ISOPEN THEN
          close m_cur;
        END IF;
      RAISE;
    end;
  end if;







 if ((m_event='DROP' and m_type='USER') or (m_event='DROP' and m_type='TABLESPACE'))
 then
   m_stmt:='insert into sdo_geor_ddl__table$$ values (1)';
   EXECUTE IMMEDIATE m_stmt;
   commit;
 end if;

 if (m_event='DROP' and m_type='TABLE')
 then
   if((m_user!='SYS' and m_user!='SYSTEM' and m_user!='MDSYS'and m_owner!='MDSYS' and m_owner!='SYS'))
   then


     m_stmt:='select /*+ FIRST_ROWS(1) */ count(*) from sdo_geor_sysdata_table where sdo_owner=:1 and RDT_TABLE_NAME=:2';
     EXECUTE IMMEDIATE m_stmt into m_cnt using m_owner,m_name;
     if(m_cnt!=0)
     then


       m_stmt:='select /*+ FIRST_ROWS(1) */ count(*) from sdo_geor_ddl__table$$';
       EXECUTE IMMEDIATE m_stmt into m_cnt;
       if(m_cnt=0)
       then
          m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391, ''The referenced raster data table(RDT) cannot be dropped.'')';
          execute immediate m_stmt;
       end if;
     end if;
   end if;

   m_stmt:='insert into sdo_geor_ddl__table$$ values (2)';
   EXECUTE IMMEDIATE m_stmt;
   commit;
 end if;

 if(m_user='SYS' or m_user='SYSTEM' or m_user='MDSYS'
   or m_owner='MDSYS' or m_owner='SYS')
 then
   return;
 end if;


 if (m_event='RENAME' and m_type='TABLE')
 then


   m_stmt:='select /*+ FIRST_ROWS(1) */ count(*) from sdo_geor_sysdata_table where sdo_owner=:1 and RDT_TABLE_NAME=:2';
   EXECUTE IMMEDIATE m_stmt into m_cnt using m_owner,m_name;
   if(m_cnt!=0)
   then


     m_stmt:='select /*+ FIRST_ROWS(1) */ count(*) from sdo_geor_ddl__table$$';
     EXECUTE IMMEDIATE m_stmt into m_cnt;
     if(m_cnt=0)
     then
        m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391, ''The referenced raster data table(RDT) cannot be renamed directly.'')';
        execute immediate m_stmt;
     end if;
   end if;

 end if;

 if (m_type='TRIGGER' and m_event='DROP')
 then
   m_stmt:='select REGEXP_SUBSTR(:1,''GRDMLTR_.+'',1,1,''i'') from dual';
   EXECUTE IMMEDIATE m_stmt into m_var using m_name;
   if(m_var is null)
   then
     return;
   end if;



   m_stmt:='select /*+ FIRST_ROWS(1) */ count(*) from sdo_geor_ddl__table$$';
   EXECUTE IMMEDIATE m_stmt into m_cnt;
   if(m_cnt=0)
   then
     m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391, ''GeoRaster DML triggers cannot be dropped.'')';
     execute immediate m_stmt;
   end if;
 end if;

 if (m_type='TRIGGER' and m_event='ALTER')
 then
   m_stmt:='select sdo_geor_def.getSqlText from dual';
   execute immediate m_stmt into m_o_stmt;
   m_o_stmt:=nls_upper(trim(m_o_stmt));
   if(instr(m_o_stmt,' COMPILE ')>0 or instr(m_o_stmt,' ENABLE ')>0
     or substr(m_o_stmt,length(m_o_stmt)-8,8)=' COMPILE' or substr(m_o_stmt,length(m_o_stmt)-7,7)=' ENABLE' )
   then
     return;
   end if;
   m_stmt:='select REGEXP_SUBSTR(:1,''GRDMLTR_.+'',1,1,''i'') from dual';
   EXECUTE IMMEDIATE m_stmt into m_var using m_name;
   if(m_var is null)
   then
     return;
   end if;



   m_stmt:='select /*+ FIRST_ROWS(1) */ count(*) from sdo_geor_ddl__table$$';
   EXECUTE IMMEDIATE m_stmt into m_cnt;
   if(m_cnt=0)
   then
     m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391, ''GeoRaster DML triggers cannot be altered.'')';
     execute immediate m_stmt;
   end if;
 end if;

 if (m_type='TRIGGER' and m_event='CREATE')
 then
   m_stmt:='select REGEXP_SUBSTR(:1,''GRDMLTR_.+'',1,1,''i'') from dual';
   EXECUTE IMMEDIATE m_stmt into m_var using m_name;
   if(m_var is null)
   then
     return;
   end if;


   m_stmt:='select /*+ FIRST_ROWS(1) */ count(*) from sdo_geor_ddl__table$$';
   EXECUTE IMMEDIATE m_stmt into m_cnt;
   if(m_cnt=0)
   then
     m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391, ''GeoRaster reserved names cannot be used to create regular triggers.'')';
     execute immediate m_stmt;
   end if;
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