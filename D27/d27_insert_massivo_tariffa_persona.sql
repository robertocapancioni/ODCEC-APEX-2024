insert into d27_persona_tariffa 
(persona_id,tariffa_id , data_inizio,data_fine)
select /*+ cardinality (s, 20) */ column_value as persona_id,
 :P8_TARIFFA_IDS as tariffa_id,
 trunc(sysdate) as data_inizio,
 null as data_fine
  from apex_string.split(:P8_PERSONA_IDS,':') s; 
