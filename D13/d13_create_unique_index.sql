create unique index d13_fattura_testata_uq1 on d13_fattura_testata (anno,numero);

create unique index d13_fattura_dettaglio_uq1 on d13_fattura_dettaglio (fattura_testata_id,riga);