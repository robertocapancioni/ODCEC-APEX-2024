select 
      a.ID,
      a.DATA_INIZIO,
      a.DATA_FINE,
      a.DESCRIZIONE,
      a.TIPO_APPUNTAMENTO_ID,
     ta.TIPO_APPUNTAMENTO, 
      a.NOME_ID,
      n.NOME,
      a.DESCRIZIONE||' - '||n.NOME||' - '||ta.TIPO_APPUNTAMENTO DESCRIZIONE_EXT,
      case ta.TIPO_APPUNTAMENTO
          when 'Primo Appuntamento'  then 'u-color-1'
          when 'Altro Appuntamento'  then 'u-color-9'
          when 'Ultimo Appuntamento' then 'u-color-31'
      end CLASSE_COLORE
 from D12_APPUNTAMENTO a
 left join D12_TIPO_APPUNTAMENTO ta
   on a.TIPO_APPUNTAMENTO_ID = ta.TIPO_APPUNTAMENTO_ID
 left join D12_NOME n
   on a.NOME_ID = n.NOME_ID
