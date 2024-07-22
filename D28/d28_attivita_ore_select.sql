-- Cliente KPI Area
select 
       nvl(count(distinct attivita_id),0)num_attivita,
       nvl(sum(ore),0)ore,
       nvl(sum(importo),0)importo 
  from d28_ore_vw
  where cliente_id = :P18_ID;


-- Cliente Persone Area
select PERSONA_ID,
       COD_PERSONA,
       PERSONA,
       count(distinct attivita_id)num_attivita,
       sum(ore)ore,
       sum(importo)importo 
  from d28_ore_vw
 where cliente_id = :P18_ID
group by PERSONA_ID,COD_PERSONA,PERSONA;
