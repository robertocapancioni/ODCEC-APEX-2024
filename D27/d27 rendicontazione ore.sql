drop table d27_tariffa cascade constraints;
drop table d27_persona cascade constraints;
drop table d27_persona_tariffa cascade constraints;
drop table d27_cliente cascade constraints;
drop table d27_progetto cascade constraints;
drop table d27_commessa cascade constraints;
drop table d27_ore cascade constraints;
-- create tables

create table d27_tariffa (
    id                number generated by default on null as identity
                      constraint d27_tariffa_id_pk primary key,
    tariffa           varchar2(20 char) not null,
    tariffa_oraria    number not null
);

alter table d27_tariffa add constraint d27_tariffa_uk unique (tariffa);



create table d27_persona (
    id            number generated by default on null as identity
                  constraint d27_persona_id_pk primary key,
    tariffa_id    number                  constraint d27_persona_tariffa_id_fk
                  references d27_tariffa not null,
    persona       varchar2(30 char) not null
);

-- table index
create index d27_persona_i1 on d27_persona (tariffa_id);

alter table d27_persona add constraint d27_persona_uk unique (persona);



create table d27_persona_tariffa (
    id             number generated by default on null as identity
                   constraint d27_persona_tariffa_id_pk primary key,
    persona_id     number                   constraint d27_persona_tariffa_persona_id_fk
                   references d27_persona not null,
    tariffa_id     number                   constraint d27_persona_tariffa_tariffa_id_fk
                   references d27_tariffa not null,
    data_inizio    date not null,
    data_fine      date
);

-- table index
create index d27_persona_tariffa_i1 on d27_persona_tariffa (persona_id);

create index d27_persona_tariffa_i2 on d27_persona_tariffa (tariffa_id);

alter table d27_persona_tariffa add constraint d27_persona_tariffa_uk unique (persona_id,data_fine);



create table d27_cliente (
    id         number generated by default on null as identity
               constraint d27_cliente_id_pk primary key,
    cliente    varchar2(30 char)
               constraint cliente_cliente_unq unique not null
);



create table d27_progetto (
    id            number generated by default on null as identity
                  constraint d27_progetto_id_pk primary key,
    cliente_id    number                  constraint d27_progetto_cliente_id_fk
                  references d27_cliente not null,
    progetto      varchar2(30 char) not null
);

-- table index
create index d27_progetto_i1 on d27_progetto (cliente_id);

alter table d27_progetto add constraint d27_progetto_uk unique (progetto);



create table d27_commessa (
    id                      number generated by default on null as identity
                            constraint d27_commessa_id_pk primary key,
    progetto_id             number                            constraint d27_commessa_progetto_id_fk
                            references d27_progetto not null,
    codice_commessa         varchar2(30 char) not null,
    descrizione_commessa    varchar2(50 char) not null
);

-- table index
create index d27_commessa_i1 on d27_commessa (progetto_id);

alter table d27_commessa add constraint d27_commessa_uk unique (codice_commessa);



create table d27_ore (
    id             number generated by default on null as identity
                   constraint d27_ore_id_pk primary key,
    persona_id     number                   constraint d27_ore_persona_id_fk
                   references d27_persona not null,
    commessa_id    number                   constraint d27_ore_commessa_id_fk
                   references d27_commessa not null,
    data           date not null,
    ore            number not null
);

-- table index
create index d27_ore_i1 on d27_ore (persona_id);

create index d27_ore_i2 on d27_ore (commessa_id);

alter table d27_ore add constraint d27_ore_uk unique (persona_id,commessa_id,data);



-- Generated by Quick SQL 1.2.9 19/07/2024, 13:49:14

/*
tariffa /unique tariffa
  tariffa vc20 /nn 
  tariffa_oraria num /nn

persona /unique persona
  persona vc30 /nn 
  tariffa id num /nn

persona_tariffa /unique persona_id,data_fine
  persona id /nn
  tariffa id /nn
  data_inizio d /nn
  data_fine  d

cliente
  cliente vc30 /nn /unique
  
progetto /unique progetto
  progetto vc30 /nn 
  cliente id num /nn

commessa /unique codice_commessa
  codice_commessa vc30 /nn 
  descrizione_commessa vc50 /nn
  progetto id num /nn

ore /unique persona_id,commessa_id,data
  persona id num /nn
  commessa id num /nn
  data date /nn
  ore num /nn





 Non-default options:
# settings = {"apex":"Y","db":"19c","drop":true,"prefix":"d27","pk":"IDENTITY"}

*/