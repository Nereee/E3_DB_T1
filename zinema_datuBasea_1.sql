drop database if exists db_zinema1;
create database db_zinema1 collate utf8_spanish2_ci;
use db_zinema1;


CREATE TABLE ERABILTZAILE(
id_erabiltzaile int auto_increment primary key,
izena varchar(8),
e_izena varchar(20) unique not null,
abizena varchar (20),
pasahitza varchar(15),
nan varchar(9),
jaiotze_data date,
generoa char
);

CREATE TABLE ZINEMA (
    id_zinema INT  PRIMARY KEY auto_increment,
    izena VARCHAR(50) UNIQUE,
    Ordutegia VARCHAR(60),
    Kokapena VARCHAR(60)
);

CREATE TABLE ARETO (
    id_areto INT,
    izena VARCHAR(30),
    id_zinema INT,
    PRIMARY KEY (id_areto, id_zinema),
	FOREIGN KEY (id_zinema) REFERENCES ZINEMA(id_zinema)
);

CREATE TABLE FILMA (
    id_filma INT UNSIGNED auto_increment PRIMARY KEY,
    izena VARCHAR(40),
    generoa VARCHAR(20),
    iraupena INT
);

CREATE TABLE SAIOA (
id_saioa INT auto_increment,
prezioa DECIMAL(10,2),
id_zinema INT,
id_areto INT,
id_filma INT UNSIGNED,
saioa_data DATE,
hasiera_ordua TIME,
   
    PRIMARY KEY (id_saioa),
    Unique(id_zinema,id_areto,saioa_data,hasiera_ordua),
    FOREIGN KEY (id_areto, id_zinema) REFERENCES ARETO( id_areto, id_zinema),
	FOREIGN KEY (id_filma) REFERENCES FILMA(id_filma)
);

CREATE TABLE EROSKETA (
    id_erosketa INT auto_increment PRIMARY KEY,
    prezioa DECIMAL(30,2),
    erosketa_data DATE,
    descuento DECIMAL(5, 2) DEFAULT 0.30,
    id_erabiltzaile INT,
    FOREIGN KEY (id_erabiltzaile) REFERENCES ERABILTZAILE(id_erabiltzaile)
);


CREATE TABLE SARRERA (
    id_sarrera INT auto_increment PRIMARY KEY ,
    id_erosketa INT,
    prezioa DECIMAL(10,2),
id_saioa INT,
    FOREIGN KEY (id_erosketa) REFERENCES EROSKETA(id_erosketa),
    FOREIGN KEY (id_saioa) REFERENCES SAIOA(id_saioa)
);


/*Erabiltzaile INSERT-A*/
INSERT INTO ERABILTZAILE(e_izena, izena, abizena, pasahitza, nan, jaiotze_data, generoa) VALUES
('Aitzol434','Aitzol', 'Sagardui', 'abcd1234', '33334444J', '2002-01-01', 'M'),
('Uxue34','Uxue', 'Gonzalez', 'clave123', '88889999E', '2002-11-20', 'F'),
('Andoni', 'Andoni', 'Salsidua', 'p123', '44445555A', '2002-03-12', 'M'),
('Oier65', 'Oier', 'Garcia', 'password123', '55556666B', '2002-05-23', 'M'),
('Jon8', 'Jon', 'Martinez', 'secure123', '66667777C', '2002-07-07', 'M'),
('Miguel90', 'Miguel', 'Sanchez', 'pass1234', '77778888D', '2002-09-15', 'M'),
('Ane', 'Ane', 'Etxebarria', 'contraseña123', '99990000F', '2002-12-31', 'F'),
('Maite', 'Maite', 'Zubizarreta', 'p@ssw0rd', '11112222G', '2003-02-14', 'F');

/*ZINEMA datuen INSERT-A*/

INSERT INTO ZINEMA (izena, ordutegia, kokapena) VALUES
("Cinesa Zubiarte", "Astelehenetik igandera 15:00 - 23:00", "Leizaola Lehendakariaren Kalea, 2, 48009 Bilbao"),
("Cinesa Max Ocio", "Astelehenetik igandera 15:00 - 23:00", "Max Ocio, Kareaga K., S/N, 48903 Barakaldo"),
("Golem Alhondiga", "Astelehenetik igandera 15:00 - 23:00",  "Arriquíbar Plaza, 4, 48001 Bilbo"),
("Cine Yelmo Premium Artea", "Astelehenetik igandera 15:00 - 23:00", "Peruri Auzoa, 33, 48940 Leioa");
   
INSERT INTO ARETO (id_areto, izena, id_zinema)VALUES
#ZUBIARTE
('1', 'Aretoa 1', '1'),
('2', 'Aretoa 2', '1'),
('3', 'Aretoa 3 Junior', '1'),
('4', 'Aretoa 4 Junior', '1'),
('5', 'Aretoa 5 Premium', '1'),
('6', 'Aretoa 6 Handia', '1'),
#MAX-OCIO
('1', 'Aretoa 1', '2'),
('2', 'Aretoa 2', '2'),
('3', 'Aretoa 3', '2'),
('4', 'Aretoa 4', '2'),
('5', 'Aretoa 5 Premium', '2'),
('6', 'Aretoa 6 Premium', '2'),
('7', 'Aretoa 7 Junior', '2'),
('8', 'Aretoa 8 Jumior', '2'),
('9', 'Aretoa 9 Junior', '2'),
('10', 'Aretoa 10 Handia', '2'),
('11', 'Aretoa 11 Handia', '2'),
('12', 'Aretoa 12 Handia', '2'),
#GOLEM
('1', 'Aretoa 1 Jumior', '3'),
('2', 'Aretoa 2 Junior', '3'),
('3', 'Aretoa 3 Handia', '3'),
('4', 'Aretoa 4 Junior', '3'),
('5', 'Aretoa 5 Junior', '3'),
#YELMO
('1', 'Aretoa 1 Jumior', '4'),
('2', 'Aretoa 2 Junior', '4'),
('3', 'Aretoa 3', '4'),
('4', 'Aretoa 4', '4'),
('5', 'Aretoa 5 Handia', '4'),
('6', 'Aretoa 6 Handia', '4'),
('7', 'Aretoa 7 Premium', '4'),
('8', 'Aretoa 8 Premium', '4');


/*FILMEN DATUEN INSERT-A*/
INSERT INTO FILMA (izena, generoa, iraupena) VALUES
#DRAMA
('Handia', 'Drama', 116),
('La lista de Schindler', 'Drama', 197),
('Cadena Perpetua', 'Drama', 142),
('Million Dollar Baby', 'Drama', 133),

#SCI-FI
('2001: Odisea en el espacio', 'Sci-Fi', 142),
('La novia de Frankenstein', 'Sci-Fi', 75),
('El planeta de los simios', 'Sci-Fi', 115),
('Alien, el octavo pasajero', 'Sci-Fi', 117),
#KOMEDIA
('Scary movie', 'Komedia', 90),
('El gran Lebowsky', 'Komedia', 119),
('La vida de Brian', 'Komedia', 94),
('Aterriza como puedas', 'Komedia', 88),
#TERROR
('Psicosis', 'Terror', 109),
('El resplandor', 'Terror', 146),
('Dracula', 'Terror', 155),
('Cisne negro', 'Terror', 110);

INSERT INTO SAIOA(id_zinema, id_areto, id_filma, saioa_data, hasiera_ordua, prezioa) VALUES
 #zine 1
  (1, 2, 1, '2024-02-01', '15:00:00', 15.00),
  (1, 2, 2, '2024-02-02', '16:00:00', 15.00),
  (1, 2, 3, '2024-02-03', '17:00:00', 15.00),
  (1, 2, 4, '2024-02-04', '18:00:00', 15.00),
  (1, 2, 5, '2024-02-05', '19:00:00', 15.00),
  (1, 2, 6, '2024-02-06', '20:00:00', 15.00),
  (1, 2, 7, '2024-02-07', '21:00:00', 15.00),
  (1, 2, 8, '2024-02-08', '22:00:00', 15.00),
  (1, 2, 9, '2024-02-09', '15:00:00', 15.00),
  (1, 2, 10, '2024-02-10', '16:00:00', 15.00),
  (1, 2, 11, '2024-02-11', '17:00:00', 15.00),
  (1, 2, 12, '2024-02-12', '18:00:00', 15.00),
  (1, 2, 13, '2024-02-13', '19:00:00', 15.00),
  (1, 2, 14, '2024-02-14', '20:00:00', 15.00),
  (1, 2, 15, '2024-02-15', '21:00:00', 15.00),
  (1, 2, 16, '2024-02-01', '22:00:00', 15.00),
  
   #zine 2
  (2, 1, 1, '2024-02-01', '15:30:00', 14.00),
  (2, 1, 2, '2024-02-01', '16:00:00', 14.00),
  (2, 1, 3, '2024-02-02', '17:00:00', 14.00),
  (2, 1, 4, '2024-02-03', '18:00:00', 14.00),
  (2, 1, 5, '2024-02-04', '19:00:00', 14.00),
  (2, 1, 6, '2024-02-05', '20:00:00', 14.00),
  (2, 1, 7, '2024-02-06', '21:00:00', 14.00),
  (2, 1, 8, '2024-02-07', '22:00:00', 14.00),
  (2, 1, 9, '2024-02-08', '15:00:00', 14.00),
  (2, 1, 10, '2024-02-09', '16:00:00', 14.00),
  (2, 1, 11, '2024-02-10', '17:00:00', 14.00),
  (2, 1, 12, '2024-02-11', '18:00:00', 14.00),
  (2, 1, 13, '2024-02-12', '19:00:00', 14.00),
  (2, 1, 14, '2024-02-13', '20:00:00', 14.00),
  (2, 1, 15, '2024-02-14', '21:00:00', 14.00),
  (2, 1, 16, '2024-02-15', '22:00:00', 14.00),
  
	#zine 3
   (3, 1, 1, '2024-02-01', '15:30:00', 15.00),
  (3, 1, 2, '2024-02-01', '16:00:00', 15.00),
  (3, 1, 3, '2024-02-02', '17:00:00', 15.00),
  (3, 1, 4, '2024-02-03', '18:00:00', 15.00),
  (3, 1, 5, '2024-02-04', '19:00:00', 15.00),
  (3, 1, 6, '2024-02-05', '20:00:00', 15.00),
  (3, 1, 7, '2024-02-06', '21:00:00', 15.00),
  (3, 1, 8, '2024-02-07', '22:00:00', 15.00),
  (3, 1, 9, '2024-02-08', '15:00:00', 15.00),
  (3, 1, 10, '2024-02-09', '16:00:00', 15.00),
  (3, 1, 11, '2024-02-10', '17:00:00', 15.00),
  (3, 1, 12, '2024-02-11', '18:00:00', 15.00),
  (3, 1, 13, '2024-02-12', '19:00:00', 15.00),
  (3, 1, 14, '2024-02-13', '20:00:00', 15.00),
  (3, 1, 15, '2024-02-14', '21:00:00', 15.00),
  (3, 1, 16, '2024-02-15', '22:00:00', 15.00),

	#zine 4
      (4, 1, 1, '2024-02-01', '15:30:00', 16.00),
  (4, 1, 2, '2024-02-01', '16:00:00', 16.00),
  (4, 1, 3, '2024-02-02', '17:00:00', 16.00),
  (4, 1, 4, '2024-02-03', '18:00:00', 16.00),
  (4, 1, 5, '2024-02-04', '19:00:00', 16.00),
  (4, 1, 6, '2024-02-05', '20:00:00', 16.00),
  (4, 1, 7, '2024-02-06', '21:00:00', 16.00),
  (4, 1, 8, '2024-02-07', '22:00:00', 16.00),
  (4, 1, 9, '2024-02-08', '15:00:00', 16.00),
  (4, 1, 10, '2024-02-09', '16:00:00', 16.00),
  (4, 1, 11, '2024-02-10', '17:00:00', 16.00),
  (4, 1, 12, '2024-02-11', '18:00:00', 16.00),
  (4, 1, 13, '2024-02-12', '19:00:00', 16.00),
  (4, 1, 14, '2024-02-13', '20:00:00', 16.00),
  (4, 1, 15, '2024-02-14', '21:00:00', 16.00),
  (4, 1, 16, '2024-02-15', '22:00:00', 16.00);
    
INSERT INTO EROSKETA(prezioa, erosketa_data, descuento, id_erabiltzaile) VALUES
(15.00,'2023-02-10',0,1),
(24.00,'2023-02-11',0.2,1),
(26.00,'2023-02-12',0.3,1),
(15.00,'2023-02-13',0,1),
(15.00,'2023-04-10',0,2),
(15.00,'2023-07-15',0,2),
(13.00,'2023-07-17',0,3),
(17.00,'2023-07-19',0,3),
(10.00,'2023-08-10',0,4),
(10.00,'2023-08-10',0,4),
(10.00,'2023-08-10',0,5),
(18.50, '2023-09-12', 0.1, 5),
(25.00, '2023-09-18', 0.15, 5),
(14.00, '2023-09-20', 0, 6),
(21.00, '2023-09-25', 0.2, 6),
(19.50, '2023-09-30', 0, 6),
(23.00, '2023-10-05', 0.1, 6),
(12.00, '2023-10-10', 0, 7),
(27.50, '2023-10-15', 0.25, 7),
(16.00, '2023-10-20', 0, 8),
(22.00, '2023-10-25', 0.3, 8);

INSERT INTO SARRERA (id_erosketa, prezioa, id_saioa)
VALUES
(1, 15.00, 1),
(2, 10.00, 2),
(3, 10.00, 3),
(4, 10.00, 4),
(5, 10.00, 5),
(6, 10.00, 6),
(7, 10.00, 7),
(8, 10.00, 8),
(9, 10.00, 9),
(10, 10.00, 10),
(11, 15.00, 11),
(12, 15.00, 12),
(13, 15.00, 13),
(14, 15.00, 14),
(15, 15.00, 15),
(16, 15.00, 16),
(17, 15.00, 17),
(18, 20.00, 18),
(19, 15.00, 19),
(20, 20.00, 20);

 
SELECT id_filma,izena FROM filma JOIN saioa using (id_filma)  WHERE id_zinema = 2;

/*KONTSULTA PROBA WEB-ERAKO*/
#select saioa_data from SAIOA where id_zinema=1 AND id_filma=1;/*EZ KENDU*/
/*select hasiera_ordua from SAIOA where id_zinema=4 AND id_filma=12 AND saioa_data='2024-02-23';*/

/*KONTSULTAK*/
/*Iaz diru gehien aportatu duten filmen zerrenda osoa dimentsio desberdinak erabiliz aztertzeko.*/
SELECT F.izena, SUM(E.prezioa) AS diru_gehiena
FROM filma F
INNER JOIN saioa S USING(id_filma)
INNER JOIN sarrera SR USING(id_saioa)
INNER JOIN erosketa E USING(id_erosketa)
WHERE YEAR(E.erosketa_data) = 2023
GROUP BY F.izena
ORDER BY diru_gehiena DESC;

/*Film gehien ikusi dituzten erabiltzaileak */
SELECT E.e_izena AS Erabiltzailea, F.izena AS Filma_izena, COUNT(F.izena) AS izena_kop
FROM filma F
INNER JOIN saioa USING(id_filma)
INNER JOIN sarrera USING(id_saioa)
INNER JOIN erosketa USING(id_erosketa)
INNER JOIN erabiltzaile E USING(id_erabiltzaile)
GROUP BY E.e_izena, F.izena;

/*Bezero gutxien dituen zinema, bezero-kopurua adierazita.
Bezero kantitate txikiena duen zinema zein den jakiteko zinema bakoitzak saldutako sarrera guztien artean kantitate txikiena */
SELECT Z.izena AS Zinema_izena, COUNT(E.id_sarrera) AS Bezero_kopurua
FROM zinema Z
LEFT JOIN saioa S ON Z.id_zinema = S.id_zinema
LEFT JOIN sarrera E ON S.id_saioa = E.id_saioa
GROUP BY Z.izena
ORDER BY Bezero_kopurua ASC;

SELECT Z.izena AS Zinema_izena, COUNT(E.id_sarrera) AS Bezero_kopurua
FROM zinema Z
LEFT JOIN saioa S ON Z.id_zinema = S.id_zinema
LEFT JOIN sarrera E ON S.id_saioa = E.id_saioa
GROUP BY Z.izena
ORDER BY Bezero_kopurua ASC;

/*Areto gehien dituzten zinemak proiektatutako filmen batez besteko iraupena.*/
SELECT A.izena AS Areto_izena, AVG(F.iraupena) AS Batezbesteko_iraupea
FROM zinema Z
INNER JOIN areto A USING(id_zinema)
INNER JOIN saioa S USING(id_areto)
INNER JOIN FILMA F USING (id_filma)
WHERE Z.izena IN (
    SELECT Z.izena
    FROM zinema Z
    INNER JOIN saioa S USING(id_zinema)
    GROUP BY Z.izena
    ORDER BY COUNT(S.id_areto) DESC
)
GROUP BY A.izena;


/*Film genero bakoitzeko, estadistikak. */
SELECT generoa, COUNT(*), AVG(iraupena)
FROM filma
GROUP BY generoa;

select a.izena,hasiera_ordua
from saioa join areto a using(id_areto,id_zinema)
where id_filma=1 and saioa_data="2024-02-01"and id_zinema=1;

select a.izena,s.hasiera_ordua from SAIOA s join areto a using(id_areto,id_zinema) where s.id_filma=1 AND s.saioa_data='2024-02-01' and s.id_zinema=1
