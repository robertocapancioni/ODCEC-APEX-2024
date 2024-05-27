create or replace view d20_fatture_xml_coll_vw as
select c.seq_id seq_id
      ,c.c001 filename
      ,c.clob001 xml
      ,x.idpaesetrasmittente      
      ,x.idcodicetrasmittente     
      ,x.progressivoinvio         
      ,x.formatotrasmissione      
      ,x.codicedestinatario       
      ,x.pecdestinatario          
      ,x.cedentedenominazione     
      ,x.cedenteindirizzo         
      ,x.cedentecomune            
      ,x.cedenteprovincia         
      ,x.cedentenazione           
      ,x.cessionariodenominazione 
      ,x.cessionarioindirizzo     
      ,x.cessionariocomune        
      ,x.cessionarioprovincia     
      ,x.cessionarionazione       
      ,x.tipodocumento            
      ,x.divisa  
      ,to_date(x.datadocumento default null on conversion error,'yyyy-mm-dd')datadocumento
      ,to_char(to_date(x.datadocumento default null on conversion error,'yyyy-mm-dd'),'yyyy')  annodocumento          
      ,to_char(to_date(x.datadocumento default null on conversion error,'yyyy-mm-dd'),'mm')  mesedocumento          
      ,to_char(to_date(x.datadocumento default null on conversion error,'yyyy-mm-dd'),'yyyy-mm')  annomesedocumento          
      ,x.numerodocumento          
      ,to_number(replace(x.importototaledocumento,'.',','))   importototaledocumento
  from apex_collections c
  ,xmltable(xmlnamespaces('http://ivaservizi.agenziaentrate.gov.it/docs/xsd/fatture/v1.2' as "ns"),
           '/ns:FatturaElettronica' passing xmltype(c.clob001)
           columns 
            idpaesetrasmittente      path 'ns:FatturaElettronicaHeader/ns:DatiTrasmissione/ns:IdTrasmittente/ns:IdPaese',
            idcodicetrasmittente     path 'ns:FatturaElettronicaHeader/ns:DatiTrasmissione/ns:IdTrasmittente/ns:IdCodice',
            progressivoinvio         path 'ns:FatturaElettronicaHeader/ns:DatiTrasmissione/ns:ProgressivoInvio',
            formatotrasmissione      path 'ns:FatturaElettronicaHeader/ns:DatiTrasmissione/ns:FormatoTrasmissione',
            codicedestinatario       path 'ns:FatturaElettronicaHeader/ns:DatiTrasmissione/ns:CodiceDestinatario',
            pecdestinatario          path 'ns:FatturaElettronicaHeader/ns:DatiTrasmissione/ns:PECDestinatario',
            cedentedenominazione     path 'ns:FatturaElettronicaHeader/ns:CedentePrestatore/ns:DatiAnagrafici/ns:Anagrafica/ns:Denominazione',
            cedenteindirizzo         path 'ns:FatturaElettronicaHeader/ns:CedentePrestatore/ns:DatiAnagrafici/ns:Sede/ns:Indirizzo',
            cedentecomune            path 'ns:FatturaElettronicaHeader/ns:CedentePrestatore/ns:DatiAnagrafici/ns:Sede/ns:Comune',
            cedenteprovincia         path 'ns:FatturaElettronicaHeader/ns:CedentePrestatore/ns:DatiAnagrafici/ns:Sede/ns:Provincia',
            cedentenazione           path 'ns:FatturaElettronicaHeader/ns:CedentePrestatore/ns:DatiAnagrafici/ns:Sede/ns:Nazione',
            cessionariodenominazione path 'ns:FatturaElettronicaHeader/ns:CessionarioCommittente/ns:DatiAnagrafici/ns:Anagrafica/ns:Denominazione',
            cessionarioindirizzo     path 'ns:FatturaElettronicaHeader/ns:CessionarioCommittente/ns:DatiAnagrafici/ns:Sede/ns:Indirizzo',
            cessionariocomune        path 'ns:FatturaElettronicaHeader/ns:CessionarioCommittente/ns:DatiAnagrafici/ns:Sede/ns:Comune',
            cessionarioprovincia     path 'ns:FatturaElettronicaHeader/ns:CessionarioCommittente/ns:DatiAnagrafici/ns:Sede/ns:Provincia',
            cessionarionazione       path 'ns:FatturaElettronicaHeader/ns:CessionarioCommittente/ns:DatiAnagrafici/ns:Sede/ns:Nazione',
            tipodocumento            path 'ns:FatturaElettronicaBody/ns:DatiGenerali/ns:DatiGeneraliDocumento/ns:TipoDocumento',
            divisa                   path 'ns:FatturaElettronicaBody/ns:DatiGenerali/ns:DatiGeneraliDocumento/ns:Divisa',
            datadocumento            path 'ns:FatturaElettronicaBody/ns:DatiGenerali/ns:DatiGeneraliDocumento/ns:Data',
            numerodocumento          path 'ns:FatturaElettronicaBody/ns:DatiGenerali/ns:DatiGeneraliDocumento/ns:Numero',
            importototaledocumento   path 'ns:FatturaElettronicaBody/ns:DatiGenerali/ns:DatiGeneraliDocumento/ns:ImportoTotaleDocumento'

  )x 
  where collection_name='FATTURE_XML_COLL';