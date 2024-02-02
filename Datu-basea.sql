drop database zinemak;
create database db_zinema collate utf8_spanish2_ci;
use db_zinema;

create table Erabiltzaile(
id_erabiltzaile int primary key auto_increment,
izena varchar(8) unique,
abizena varchar (10),
pasahitza varchar(8),
nan varchar(9),
jaiotze_data datetime,
sexua char
)

