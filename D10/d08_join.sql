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
