insert into d28_stato (id,cod_stato,stato) values (1,'DA_INIZIARE','1) Da Iniziare');
insert into d28_stato (id,cod_stato,stato) values (2,'IN_CORSO','2) In Corso');
insert into d28_stato (id,cod_stato,stato) values (3,'COMPLETATO','3) Completato');
insert into d28_stato (id,cod_stato,stato) values (4,'SOSPESO','9) Sospeso');

alter table d28_stato modify id generated by default on null  as identity restart start with 5;

insert into d28_tariffa (id,cod_tariffa,tariffa,valore) values (1,'JUNIOR','Junior',30);
insert into d28_tariffa (id,cod_tariffa,tariffa,valore) values (2,'MIDDLE','Middle',50);
insert into d28_tariffa (id,cod_tariffa,tariffa,valore) values (3,'JSENIOR','Senior',90);

alter table d28_tariffa modify id generated by default on null  as identity restart start with 4;

insert into d28_tipo (id,cod_tipo,tipo) values (1,'PREVISTO','Previsto');
insert into d28_tipo (id,cod_tipo,tipo) values (2,'CONSUNTIVO','Consuntivo');

alter table d28_tipo modify id generated by default on null  as identity restart start with 3;

insert into d28_persona (id,cod_persona,persona,email) values (1,'MARIA','Maria','maria@gmail.com');
insert into d28_persona (id,cod_persona,persona,email) values (2,'PAOLO','Paolo','paolo@gmail.com');
insert into d28_persona (id,cod_persona,persona,email) values (3,'FRANCESCA','Francesca','francesca@gmail.com');
insert into d28_persona (id,cod_persona,persona,email) values (4,'LUIGI','Luigi','luigi@gmail.com');

alter table d28_persona modify id generated by default on null  as identity restart start with 4;

insert into d28_cliente (id,cod_cliente,cliente) values (1,'ORACLE','Oracle');
insert into d28_cliente (id,cod_cliente,cliente) values (2,'MICROSOFT','Microsoft');
insert into d28_cliente (id,cod_cliente,cliente) values (3,'APPLE','Apple');
insert into d28_cliente (id,cod_cliente,cliente) values (4,'IBM','Ibm');
insert into d28_cliente (id,cod_cliente,cliente) values (5,'AMAZON','Amazon');

alter table d28_cliente modify id generated by default on null  as identity restart start with 6;