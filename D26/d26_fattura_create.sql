-- drop objects
drop table d26_cliente cascade constraints;
drop table d26_fattura_testata cascade constraints;
drop table d26_fattura_dettaglio cascade constraints;

-- create tables
create table d26_cliente (
    id                             number generated by default on null as identity 
                                   constraint d26_cliente_id_pk primary key,
    codice_cliente                 varchar2(20 char)
                                   constraint d26_cliente_codice_client_unq unique not null,
    ragione_sociale                varchar2(50 char) not null,
    piva                           varchar2(11 char) not null,
    indirizzo                      varchar2(100 char) not null,
    codice_sdi                     varchar2(6 char)
)
;

create table d26_fattura_testata (
    id                             number generated by default on null as identity 
                                   constraint d26_fattura_testa_id_pk primary key,
    cliente_id                     number
                                   constraint d26_fattura_te_cliente_id_fk
                                   references d26_cliente not null,
    anno                           number not null,
    numero                         number not null,
    descrizione                    varchar2(50 char) not null,
    data                           date not null
)
;

-- table index
create index d26_fattura_testa_i1 on d26_fattura_testata (cliente_id);

create table d26_fattura_dettaglio (
    id                             number generated by default on null as identity 
                                   constraint d26_fattura_detta_id_pk primary key,
    fattura_testata_id             number
                                   constraint d26_fattura_fattura_testa_fk
                                   references d26_fattura_testata not null,
    riga                           number not null,
    descrizione                    varchar2(100 char) not null,
    quantita                       number not null,
    importo                        number not null
)
;

-- table index
create index d26_fattura_detta_i1 on d26_fattura_dettaglio (fattura_testata_id);

-- load data
 
-- Generated by Quick SQL Sabato Gennaio 21, 2023  08:26:44
 
/*
cliente
  codice_cliente vc20 /nn /unique
  ragione_sociale vc50 /nn
  piva vc11 /nn
  indirizzo vc100 /nn
  codice_sdi vc6 

fattura_testata
  anno num /nn
  numero num /nn
  descrizione vc50 /nn
  data d /nn
  cliente_id /nn

fattura_dettaglio
  fattura_testata_id /nn
  riga num /nn
  descrizione vc100 /nn
  quantita num /nn
  importo num /nn
#ondelete:restrict
#drop:true

# settings = { prefix: "d26", onDelete: "RESTRICT", semantics: "CHAR", drop: true, language: "EN", APEX: true }
*/