create or replace view d28_persona_tariffa_vw as  
select pt.id,pt.data_inizio,pt.data_fine,
       pt.persona_id,p.cod_persona,p.persona,
       pt.tariffa_id,t.cod_tariffa,t.tariffa,t.valore
  from d28_persona_tariffa   pt
  join d28_persona p on pt.persona_id = p.id
  join d28_tariffa t on pt.tariffa_id = t.id;

create or replace view d28_ore_vw as
select o.id,o.data,o.ore,
       (select pt.valore
          from d28_persona_tariffa_vw pt
         where o.persona_id = pt.persona_id and o.data between pt.data_inizio and nvl(pt.data_fine,o.data))valore,
       (select pt.valore*o.ore 
          from d28_persona_tariffa_vw pt
         where o.persona_id = pt.persona_id and o.data between pt.data_inizio and nvl(pt.data_fine,o.data))importo,
       o.persona_id,p.cod_persona,p.persona,
       o.tipo_id,t.cod_tipo,t.tipo,
       o.attivita_id,a.cod_attivita,a.attivita,perc_completamento,
       a.stato_id,s.cod_stato,s.stato,
       a.cliente_id,c.cod_cliente,c.cliente
  from d28_ore o
  join d28_persona p on o.persona_id = p.id
  join d28_tipo t on o.tipo_id = t.id
  join d28_attivita a on o.attivita_id = a.id
  join d28_stato s on a.stato_id = s.id
  join d28_cliente c on a.cliente_id = c.id;


create or replace view d28_attivita_vw as
select a.id,a.cod_attivita,a.attivita,perc_completamento,
       a.stato_id,s.cod_stato,s.stato,
       a.cliente_id,c.cod_cliente,c.cliente
  from d28_attivita a 
  join d28_stato s on a.stato_id = s.id
  join d28_cliente c on a.cliente_id = c.id;

