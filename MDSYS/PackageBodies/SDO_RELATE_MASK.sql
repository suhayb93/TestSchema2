CREATE OR REPLACE NONEDITIONABLE package body mdsys.sdo_relate_mask as
procedure insert_mask(mask      in varchar2,
                      relation  in varchar2) is
begin
  insert into md$relate values(mask,nls_upper(relation),user);
  commit;
end insert_mask;

procedure update_mask(mask      in varchar2,
                 relation  in varchar2) is
owner varchar2(30);
begin
  select definer into owner from md$relate where sdo_mask=mask;
  if (owner <> user) then
    mderr.raise_md_error('MD','SDO',-13108,'Not definer');
         return;
  end if;
  update md$relate set sdo_relation=nls_upper(relation) where sdo_mask=mask;
  commit;
end update_mask;

procedure delete_mask(mask      in varchar2) is
owner varchar2(30);
begin
  select definer into owner from md$relate where sdo_mask=mask;
  if (owner <> user) then
    mderr.raise_md_error('MD','SDO',-13108,'Not definer');
         return;
  end if;
  delete from md$relate where sdo_mask=mask;
  commit;
end delete_mask;
end sdo_relate_mask;
/