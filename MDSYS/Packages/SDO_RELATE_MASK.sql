CREATE OR REPLACE NONEDITIONABLE package mdsys.sdo_relate_mask authid definer as
procedure insert_mask(mask      in varchar2,
                 relation  in varchar2);

procedure update_mask(mask      in varchar2,
                 relation  in varchar2);

procedure delete_mask(mask      in varchar2);
end sdo_relate_mask;
/