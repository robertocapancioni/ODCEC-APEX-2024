
create or replace view d16_fattura_elettronica_xml_vw as
select ft.id,ft.anno,ft.numero,c.ragione_sociale,
  '<?xml version="1.0" encoding="utf-8"?><?xml-stylesheet type="text/xsl" href="fatturaordinaria_v1.2.1.xsl"?>'||
xmlelement("FatturaElettronica",
                 xmlattributes( 'http://www.w3.org/2001/XMLSchema-instance' as "xmlns:xsi"
                               ,'http://www.w3.org/2001/XMLSchema' as "xmlns:xsd"
                               ,'FPR12' as "versione"
                               ,'http://ivaservizi.agenziaentrate.gov.it/docs/xsd/fatture/v1.2' as "xmlns"),
                   xmlelement("FatturaElettronicaHeader",
                         xmlelement("DatiTrasmissione",
                                        xmlelement("IdTrasmittente",
                                                     xmlelement("IdPaese",'IT'),
                                                     xmlelement("IdCodice",'000')
                                                  ),
                                        xmlelement("ProgressivoInvio",ft.id),
                                        xmlelement("FormatoTrasmissione",'FPR12'),
                                        xmlelement("CodiceDestinatario",c.codice_sdi),
                                        xmlelement("PECDestinatario",'nail@pec.it')
                                       ),
                        xmlelement("CedentePrestatore",
                                        xmlelement("DatiAnagrafici",
                                                    xmlelement("IdFiscaleIVA",
                                                               xmlelement("IdPaese",'IT'),
                                                               xmlelement("IdCodice",'00000000000')
                                                              ),
                                                    xmlelement("CodiceFiscale",'00000000000') ,       
                                                    xmlelement("Anagrafica",
                                                                xmlelement("Denominazione",'Mia Azienda SPA' )       
                                                              ),
                                                    xmlelement("Sede",
                                                                xmlelement("Indirizzo",'Mio Indirizzo' ),
                                                                xmlelement("NumeroCivico",'0' ),
                                                                xmlelement("CAP",'00000' ),
                                                                xmlelement("Comune",'Mio Comune' ),
                                                                xmlelement("Provincia",'MI' ),
                                                                xmlelement("Nazione",'IT' )      
                                                              ),
                                                    xmlelement("IscrizioneREA",
                                                                xmlelement("Ufficio",'Uff REA' ),
                                                                xmlelement("NumeroREA",'Num REA' ),
                                                                xmlelement("StatoLiquidazione",'ST' )
                                                              )                                                              )
                                       ),
                        xmlelement("CessionarioCommittente",
                                        xmlelement("DatiAnagrafici",
                                                    xmlelement("IdFiscaleIVA",
                                                               xmlelement("IdPaese",'IT'),
                                                               xmlelement("IdCodice",c.piva)
                                                              ),
                                                    xmlelement("CodiceFiscale",c.piva) ,       
                                                    xmlelement("Anagrafica",
                                                                xmlelement("Denominazione",c.ragione_sociale )       
                                                              ),
                                                    xmlelement("Sede",
                                                                xmlelement("Indirizzo",c.indirizzo ),
                                                                xmlelement("CAP",'00000' ),
                                                                xmlelement("Comune",'Comune Cliente' ),
                                                                xmlelement("Provincia",'XX' ),
                                                                xmlelement("Nazione",'IT' )      
                                                              )                                                              )
                                       )
                    ),
                   xmlelement("FatturaElettronicaBody",
                              xmlelement("DatiGenerali",
                                         xmlelement("DatiGeneraliDocumento",
                                                    xmlelement("TipoDocumento",'TD01'),
                                                    --xmlelement("Causale",'' ),
                                                    xmlelement("Divisa",'EUR' ),
                                                    xmlelement("Data",ft.data ),
                                                    xmlelement("Numero",ft.anno||'/'||ft.numero ),
                                                    xmlelement("ImportoTotaleDocumento",(select replace(to_char(sum(importo),'999999990D00'),',','.') from d16_fattura_dettaglio fd where fd.fattura_testata_id = ft.id) )
                                                  )                                                   
                                        ),
                              xmlelement("DatiBeniServizi",
                                          (select xmlagg(xmlelement("DettaglioLinee",
                                                                     xmlelement("NumeroLinea",fd.riga),
                                                                     xmlelement("Descrizione",fd.Descrizione),
                                                                     xmlelement("PrezzoUnitario",replace(to_char(case when nvl(fd.quantita,0) <> 0 then fd.importo/fd.quantita else 0 end,'999999990D00'),',','.')),
                                                                     xmlelement("Quantita",fd.Quantita),
                                                                     xmlelement("PrezzoTotale",replace(to_char(fd.importo,'999999990D00'),',','.')),
                                                                     xmlelement("AliquotaIVA",replace(to_char('22,00','990D00'),',','.')),
                                                                     xmlelement("Natura",'')
                                                                    )
                                                        order by fd.riga)  from d16_fattura_dettaglio fd 
                                                          where fd.fattura_testata_id = ft.id 
                                                          --order by fd.riga
                                          )  ,  
                                         ( select xmlagg(xmlelement("DatiRiepilogo",
                                                                    xmlelement("AliquotaIVA",replace(to_char('22,00','990D00'),',','.')),
                                                                    xmlelement("Natura",''),
                                                                    xmlelement("importoImporto",replace(to_char(sum(fd.importo),'999G999G9990D00'),',','.')),
                                                                    xmlelement("Imposta",replace(to_char(round(sum(fd.importo*22.00/100),2),'999G999G9990D00'),',','.')),
                                                                    xmlelement("RiferimentoNormativo",'RIF'),
                                                                    xmlelement("EsigibilitaIVA",'I')
                                                                )
                                        order by fd.riga)  a
                                            from d16_fattura_dettaglio fd
                                            where fd.fattura_testata_id = ft.id 
                                            group by fd.riga
                                          ),
                                          xmlelement("DatiPagamento",
                                                    xmlelement("CondizioniPagamento",'TP02'),
                                                    xmlelement("DettaglioPagamento",
                                                               xmlelement("ModalitaPagamento",'MP01'),
                                                               xmlelement("DataScadenzaPagamento",ft.data + 30),
                                                               xmlelement("ImportoPagamento",(select replace(to_char(sum(importo)+sum(round(importo*22.0/100,2)),'999G999G9990D00'),',','.') importo_pagamento 
                                                                                                from d16_fattura_dettaglio 
                                                                                               where fattura_testata_id = ft.id)
                                                                                               ),
                                                               xmlelement("IstitutoFinanziario",'XXX'),
                                                               xmlelement("IBAN",'XXX')
                                                    )
                                                  )    
                                        )
                   )
                   ).getClobval() XML
  from d16_fattura_testata ft
  join d16_cliente c on ft.cliente_id = c.id;
