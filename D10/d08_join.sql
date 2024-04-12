select p.ID,
       p.TIPO_PRODOTTO_ID,
       tp.TIPO_PRODOTTO,
       tp.GRUPPO,
       p.PRODOTTO,
       p.PREZZO_ACQUISTO,
       p.PREZZO_VENDITA
  from D08_PRODOTTO p
  join D08_TIPO_PRODOTTO tp on p.TIPO_PRODOTTO_ID = tp.ID;
