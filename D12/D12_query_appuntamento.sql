select 
      a.ID,
      a.DATA_INIZIO,
      a.DATA_FINE,
      a.DESCRIZIONE,
      a.TIPO_APPUNTAMENTO_ID,
     ta.TIPO_APPUNTAMENTO, 
      a.NOME_ID,
      n.NOME
 from D12_APPUNTAMENTO a
 left join D12_TIPO_APPUNTAMENTO ta
   on a.TIPO_APPUNTAMENTO_ID = ta.TIPO_APPUNTAMENTO_ID
 left join D12_NOME n
   on a.NOME_ID = n.NOME_ID;


select 
      a.ID,
      a.DATA_INIZIO,
      a.DATA_FINE,
      a.DESCRIZIONE,
      a.TIPO_APPUNTAMENTO_ID,
     ta.TIPO_APPUNTAMENTO, 
      a.NOME_ID,
      n.NOME,
      a.DESCRIZIONE||' - '||n.NOME||' - '||ta.TIPO_APPUNTAMENTO DESCRIZIONE_EXT
 from D12_APPUNTAMENTO a
 left join D12_TIPO_APPUNTAMENTO ta
   on a.TIPO_APPUNTAMENTO_ID = ta.TIPO_APPUNTAMENTO_ID
 left join D12_NOME n
   on a.NOME_ID = n.NOME_ID;
