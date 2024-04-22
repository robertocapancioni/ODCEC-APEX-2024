create or replace view d13_fattura_testata_vw as
select ft.id,
       ft.cliente_id,
       ft.anno,
       ft.numero,
       ft.descrizione,
       ft.data,
       c.codice_cliente,
       c.ragione_sociale,
       c.piva,
       c.indirizzo,
       c.codice_sdi
  from d13_fattura_testata ft
  join d13_cliente c on ft.cliente_id = c.id;
  
 create or replace view d13_fattura_dettaglio_vw as
select fd.id,
       fd.fattura_testata_id,
       ft.anno,
       ft.numero,
       ft.data,
        c.codice_cliente,
        c.ragione_sociale,
       fd.riga,
       fd.descrizione,
       fd.quantita,
       fd.importo
  from d13_fattura_dettaglio fd
  join d13_fattura_testata ft on fd.fattura_testata_id = ft.id
  join d13_cliente c on ft.cliente_id = c.id;