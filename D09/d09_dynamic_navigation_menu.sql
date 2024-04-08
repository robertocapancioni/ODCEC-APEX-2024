select null "level",
  ENTRY_TEXT label,
  ENTRY_TARGET target,
  ENTRY_TEXT image_alt_attribute,
  ENTRY_IMAGE CARD_INITIALS,
  '<img src="' || ENTRY_IMAGE || '"/>'  attribute3
  from APEX_APPLICATION_LIST_ENTRIES 
 where application_name='<NOME APP>'
   and list_name='<nome lista>'
   and parent_entry_text='<Eventuale elemento padre>'
 order by display_sequence;


  select * from APEX_APPLICATION_LIST_ENTRIES;