-- nella form
select nvl(:P13_ORE,0)*r.tariffa_oraria 
  from d11_persona p
  join d11_ruolo r on p.ruolo_id = r.id
   and p.id = :P13_PERSONA_ID

-- nella griglia interattiva
select nvl(:ORE,0)*r.tariffa_oraria 
  from d11_persona p
  join d11_ruolo r on p.ruolo_id = r.id
   and p.id = :PERSONA_ID