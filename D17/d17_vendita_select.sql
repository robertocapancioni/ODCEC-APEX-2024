--instr( ':' || nvl(:P2_TIPO_PRODOTTO,TIPO_PRODOTTO)  || ':', ':' || TIPO_PRODOTTO   || ':' ) > 0

-- area annomese con filtro date
select ANNOMESE, count(*) value
  from D17_VENDITA
 where DATA between nvl(:P2_DATA_INIZIO,data) and nvl(:P2_DATA_FINE,data)
 group by ANNOMESE
 order by ANNOMESE;
 
-- area annomese con filtro date e tipo prodotto 
SELECT ANNOMESE, COUNT(*) VALUE
  FROM D17_VENDITA
 WHERE DATA BETWEEN NVL(:P2_DATA_INIZIO,DATA) AND NVL(:P2_DATA_FINE,DATA)
   AND TIPO_PRODOTTO = NVL(:P2_TIPO_PRODOTTO,TIPO_PRODOTTO)
 GROUP BY ANNOMESE
 ORDER BY ANNOMESE
 
 -- area prodotto con filtro date
select PRODOTTO, count(*) value
  from D17_VENDITA
 where DATA between nvl(:P2_DATA_INIZIO,data) and nvl(:P2_DATA_FINE,data)
 group by PRODOTTO
 order by PRODOTTO;
 
-- area prodotto con filtro date e tipo prodotto 
SELECT PRODOTTO, COUNT(*) VALUE
  FROM D17_VENDITA
 WHERE DATA BETWEEN NVL(:P2_DATA_INIZIO,DATA) AND NVL(:P2_DATA_FINE,DATA)
   AND TIPO_PRODOTTO = NVL(:P2_TIPO_PRODOTTO,TIPO_PRODOTTO)
 GROUP BY PRODOTTO
 ORDER BY PRODOTTO
 
 -- query per LOV (List of Values) Tipo Prodotto
 select distinct tipo_prodotto d, 
                tipo_prodotto r 
           from D17_vendita
          order by 1

  -- query per la nuova casella combinata
select distinct tipo_prodotto 
  from d17_vendita 
  order by 1
