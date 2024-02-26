use db_zinema1;
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
SELECT A.izena AS Areto_izena, AVG(F.iraupena) AS Batazbesteko_iraupena
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
SELECT generoa, COUNT(*)AS kantitatea, AVG(iraupena) as Iraupena
FROM filma
GROUP BY generoa;