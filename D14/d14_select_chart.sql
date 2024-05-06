with acquisto_grp as(
  select prodotto_id,prodotto,
         to_char(data,'YYYY') anno,
         to_char(data,'YYYY-MM') anno_mese,
         sum(quantita)quantita, 
         sum(valore)valore 
    from d08_acquisto_vw
   group by prodotto_id,prodotto,to_char(data,'YYYY'),to_char(data,'YYYY-MM')
)
 select v.*,
  sum(quantita) over (partition by prodotto_id order by anno_mese) quantita_prog,
  sum(valore) over (partition by prodotto_id order by anno_mese) valore_prog
  from acquisto_grp v
  where prodotto_id = :P18_ID
  order by anno_mese;

  with vendita_grp as(
  select prodotto_id,prodotto,
         to_char(data,'YYYY') anno,
         to_char(data,'YYYY-MM') anno_mese,
         sum(quantita)quantita, 
         sum(valore)valore 
    from d08_vendita_vw
   group by prodotto_id,prodotto,to_char(data,'YYYY'),to_char(data,'YYYY-MM')
)
 select v.*,
  sum(quantita) over (partition by prodotto_id order by anno_mese) quantita_prog,
  sum(valore) over (partition by prodotto_id order by anno_mese) valore_prog
  from vendita_grp v
  where prodotto_id = :P18_ID
  order by anno_mese;
