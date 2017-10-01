create user ex3 with login nosuperuser nocreaterole noreplication createdb;

create database films;

create table movies (
	mname varchar(50) not null,
	mdescription text not null,
	myear date not null,
	mgenres varchar(50) not null,
	mcountry varchar(50) not null,
	mbudget money not null,
	constraint mov_key primary key (name, year)	
);

create table person (
	psurname varchar(50) not null,
	pname varchar(50) not null,
	pbirthday date not null,
	pmotherland varchar(20) not null
);

create table actors (
	anumber_of_movies integer not null,
	aid serial unique not null,
	constraint act_key primary key (psurname, pname, pbirthday)
) Inherits (person);

create table producers(
	pmotherland varchar(20) not null default 'USA',
	pid serial primary key
) Inherits (person);

alter table movies add constraint ch_mov_budget check (cast(mbudget as Numeric) > 10000);

alter table movies add constraint ch_mov_year check ((Extract(year from myear) > 1900) and (Extract(year from myear) < (Extract(year from current_date)) + 10));

alter table actors add constraint ch_number_of_movies check (number_of_movies > 5);

insert into movies (mname, mdescription, myear, mgenres, mcountry, mbudget) values ('M1', 'Description 1', '05.02.2001', 'Action', 'Russia', '500000');
insert into movies (mname, mdescription, myear, mgenres, mcountry, mbudget) values ('M2', 'Description 2', '11.03.2002', 'Animation', 'Russia', '500000');
insert into movies (mname, mdescription, myear, mgenres, mcountry, mbudget) values ('M3', 'Description 3', '01.04.2003', 'Crime', 'Russia', '500000');
insert into movies (mname, mdescription, myear, mgenres, mcountry, mbudget) values ('M4', 'Description 4', '24.05.2005', 'Drama', 'Russia', '500000');
insert into movies (mname, mdescription, myear, mgenres, mcountry, mbudget) values ('M5', 'Description 5', '09.06.2004', 'Fantasy', 'Russia', '500000');
insert into movies (mname, mdescription, myear, mgenres, mcountry, mbudget) values ('M6', 'Description 6', '18.07.2006', 'Horror', 'Russia', '500000');

insert into actors (psurname, pname, pbirthday, pmotherland, anumber_of_movies) VALUES ('S1', 'N1', '05.02.2001', 'Russia', '1');
insert into actors (psurname, pname, pbirthday, pmotherland, anumber_of_movies) VALUES ('S2', 'N2', '11.03.2002', 'Russia', '2');
insert into actors (psurname, pname, pbirthday, pmotherland, anumber_of_movies) VALUES ('S3', 'N3', '01.04.2003', 'Russia', '3');
insert into actors (psurname, pname, pbirthday, pmotherland, anumber_of_movies) VALUES ('S4', 'N4', '24.05.2005', 'Russia', '4');
insert into actors (psurname, pname, pbirthday, pmotherland, anumber_of_movies) VALUES ('S5', 'N5', '09.06.2004', 'Russia', '5');
insert into actors (psurname, pname, pbirthday, pmotherland, anumber_of_movies) VALUES ('S6', 'N6', '18.07.2006', 'Russia', '20');

insert into producers (psurname, pname, pbirthday) values ('D1', 'Description 1', '05.02.2001');
insert into producers (psurname, pname, pbirthday) values ('D2', 'Description 2', '11.03.2002');
insert into producers (psurname, pname, pbirthday, pmotherland) values ('D3', 'Description 3', '01.04.2003', 'Russia');
insert into producers (psurname, pname, pbirthday) values ('D4', 'Description 6', '24.05.2005');
insert into producers (psurname, pname, pbirthday) values ('D5', 'Description 6', '09.06.2004');
insert into producers (psurname, pname, pbirthday) values ('D6', 'Description 6', '18.07.2006');