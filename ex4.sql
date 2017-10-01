alter table movies drop constraint mov_key;

alter table movies add mid serial primary key;

alter table producer alter pmotherland set default 'UK';

create table m_actor (
	aid integer references actors (aid),
	mid integer references movies (mid)
);

alter table movies add m_producer integer references producers (pid);

alter table producers add p_best_mov integer references movies (mid);

alter table actors drop constraint ch_number_of_movies;

alter table movies drop constraint ch_mov_budget;

alter table movies add constraint ch_mov_budget check (cast(mbudget as numeric) > 1000);

create table genres (
	gname varchar(30),
	gid serial primary key
);

alter table movies drop mgenres;

create table mgenres (
	gid integer references genres (gid),
	mid integer references movies (mid)
);

create type motherland as enum ('USA', 'UK', 'Russia', 'France', 'Germany');

alter table producers alter pmotherland drop default;

alter table person alter pmotherland type motherland using 'UK';

alter table producers alter pmotherland set default 'UK';

alter table person add constraint ch_pbirthday check (extract(year from pbirthday) <= (extract(year from current_date)));

create index aindex on actors (pname, psurname);

update movies set mname = concat(mname, ' ( ' , extract(year from myear) , ' ) ');



