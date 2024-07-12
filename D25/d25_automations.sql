--aut1
    insert into d25_log (data,log) values (sysdate,'AUT 1: insert');


-- aut2
select * from d25_utente where attivo_yn='Y'

insert into d25_log (data,log) values (sysdate,'AUT2: '||:UTENTE);


select * from APEX_AUTOMATION_LOG
select * from APEX_AUTOMATION_MSG_LOG
select * from APEX_APPL_AUTOMATION_ACTIONS order by AUTOMATION_NAME 
select * from APEX_APPL_AUTOMATIONS where POLLING_STATUS_CODE = 'ACTIVE' order by NAME 