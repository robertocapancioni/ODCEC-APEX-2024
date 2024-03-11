-- create tables

create table d05_marchio (
    id         number generated by default on null as identity
               constraint d05_id_pk primary key,
    marchio    varchar2(4000 char)
);



create table d05_prodotto (
    id               number generated by default on null as identity
                     constraint d05_prodotto_id_pk primary key,
    id       number
                     constraint d05_prodotto_id_fk
                     references d05_marchio not null,
    prodotto_cod     varchar2(255 char) not null,
    prodotto         varchar2(255 char) not null,
    descrizione      varchar2(1500 char),
    prezzo           number,
    tags             varchar2(400 char),
    genere           varchar2(20 char),
    data_rilascio    date,
    url_immagine     varchar2(400 char)
);

-- table index
create index d05_prodotto_i1 on d05_prodotto (id);



-- Generated by Quick SQL undefined 11/3/2024, 13:30:06

/*
marchio
  marchio

prodotto
  marchio id /nn
  prodotto_cod vc255 /nn
  prodotto vc255 /nn
  descrizione vc1500
  prezzo num
  tags vc400
  genere vc20
  data_rilascio d
  url_immagine vc400




 Non-default options:
# settings = {"apex":"Y","db":"19c","prefix":"d05"}

*/