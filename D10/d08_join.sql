select p.ID,
       p.TIPO_PRODOTTO_ID,
       tp.TIPO_PRODOTTO,
       tp.GRUPPO,
       p.PRODOTTO,
       p.PREZZO_ACQUISTO,
       p.PREZZO_VENDITA
  from D08_PRODOTTO p
  join D08_TIPO_PRODOTTO tp on p.TIPO_PRODOTTO_ID = tp.ID;


select v.id,
       v.cliente_id,
       c.cliente,
       c.zona,
       v.prodotto_id,
       p.prodotto,
       p.tipo_prodotto_id,
       tp.tipo_prodotto,
       v.data,
       v.quantita
  from d08_vendita v
  join d08_cliente c on v.cliente_id = c.id 
  join d08_prodotto p on v.prodotto_id = p.id
  join d08_tipo_prodotto tp on p.tipo_prodotto_id = tp.id;

select a.id,
       a.fornitore_id,
       f.fornitore,
       f.zona,  
       a.prodotto_id,
       p.prodotto,
       p.tipo_prodotto_id,
       tp.tipo_prodotto,
       a.data,
       a.quantita,
       a.quantita * p.prezzo_acquisto valore
  from d08_acquisto a
  join d08_fornitore f      on a.fornitore_id     = f.id
  join d08_prodotto p       on a.prodotto_id      = p.id
  join d08_tipo_prodotto tp on p.tipo_prodotto_id = tp.id;
