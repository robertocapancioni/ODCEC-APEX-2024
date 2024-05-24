create or replace trigger d19_persona_biu
    before insert or update
    on d19_persona
    for each row
Begin

    if :new.eta < 0 then
       begin
            
            raise_application_error(-20001,'Attenzione Valore non corretto');

       end;
    end if;  

    if inserting then
        :new.created := sysdate;
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
end d19_persona_biu;
/