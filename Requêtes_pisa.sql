  USE Education_PISA;

-- Selection de toutes les colonnes contenues dans les 4 tables de la Base de donnee Education_PISA

SELECT*
FROM classement_PISA 
JOIN investissements ON (classement_PISA.id_Pays=investissements.id_Pays AND classement_PISA.id_Année=investissements.id_Année)
JOIN Table_Année  ON (classement_PISA.id_Année=Table_Année.id_Année)
JOIN Table_Pays  ON (classement_PISA.id_Pays=Table_Pays.id_Pays);



  
  -- Selection de quelques colonnes pertinentes dans chacunes des tables existantes.
  
SELECT Table_Pays.Pays,Table_Année.Année,classement_PISA.Discipline,classement_PISA.Moyenne,classement_PISA.Genre,investissements.`Primaire invest`, investissements.`Secondaire invest`,Table_Pays.latitude,Table_Pays.longitude,Table_Pays.ISO3
FROM classement_PISA 
JOIN investissements ON (classement_PISA.id_Pays=investissements.id_Pays AND classement_PISA.id_Année=investissements.id_Année)
JOIN Table_Année  ON (classement_PISA.id_Année=Table_Année.id_Année )
JOIN Table_Pays  ON (classement_PISA.id_Pays=Table_Pays.id_Pays); 
  
  
  -- Classement TOP 10 des pays qui ont obtenu les meilleurs resultats en Mathematiques en 2015 sur toute la polupation etudiee
  
SELECT Table_Pays.Pays,Table_Année.Année,classement_PISA.Discipline,classement_PISA.Moyenne,classement_PISA.Genre
FROM classement_PISA 
JOIN Table_Année  ON (classement_PISA.id_Année=Table_Année.id_Année)
JOIN Table_Pays  ON (classement_PISA.id_Pays=Table_Pays.id_Pays)
WHERE Table_Année.Année = 2015 AND classement_PISA.Genre = 'Globale' AND classement_PISA.Discipline= 'Math'
ORDER BY classement_PISA.Moyenne  DESC
LIMIT 10;

  -- Requete optimisee:

SELECT Pays,Année,Discipline,Moyenne,Genre
FROM classement_PISA AS C
JOIN  Table_Année AS A ON C.id_Année = A.id_Année
JOIN Table_Pays AS P ON C.id_Pays = P.id_Pays 
WHERE A.Année = 2015 AND C.Genre = 'Globale' AND C.Discipline= 'Math'
ORDER BY C.Moyenne DESC
LIMIT 10;
  
  
  -- Classement BOTTOM 10 des pays qui ont obtenu les resultats les plus faibles en Mathematiques en 2015 sur toute la polupation etudiee
  
SELECT Table_Pays.Pays,Table_Année.Année,classement_PISA.Discipline,classement_PISA.Moyenne,classement_PISA.Genre
FROM classement_PISA 
JOIN Table_Année  ON (classement_PISA.id_Année=Table_Année.id_Année)
JOIN Table_Pays  ON (classement_PISA.id_Pays=Table_Pays.id_Pays)
WHERE Table_Année.Année = 2015 AND classement_PISA.Genre = 'Globale' AND classement_PISA.Discipline= 'Math'
ORDER BY classement_PISA.Moyenne  ASC
LIMIT 10;
  
  -- Requete optimisee: Classement TOP 10 des pays en Sciences en 2015 sur toute la polupation etudiee:

SELECT Pays,Année,Discipline,Moyenne,Genre
FROM classement_PISA AS C
JOIN  Table_Année AS A ON C.id_Année = A.id_Année
JOIN Table_Pays AS P ON C.id_Pays = P.id_Pays 
WHERE A.Année = 2015 AND C.Genre = 'Globale' AND C.Discipline= 'Sciences'
ORDER BY C.Moyenne DESC
LIMIT 10;

  -- Requete optimisee: Classement BOTTOM 10 des pays en Sciences en 2015 sur toute la polupation etudiee:

SELECT Pays,Année,Discipline,Moyenne,Genre
FROM classement_PISA AS C
JOIN  Table_Année AS A ON C.id_Année = A.id_Année
JOIN Table_Pays AS P ON C.id_Pays = P.id_Pays 
WHERE A.Année = 2015 AND C.Genre = 'Globale' AND C.Discipline= 'Sciences'
ORDER BY C.Moyenne ASC
LIMIT 10;


  -- Requete optimisee: Classement TOP 10 des pays en Lecture en 2015 sur toute la polupation etudiee:

SELECT Pays,Année,Discipline,Moyenne,Genre
FROM classement_PISA AS C
JOIN  Table_Année AS A ON C.id_Année = A.id_Année
JOIN Table_Pays AS P ON C.id_Pays = P.id_Pays 
WHERE A.Année = 2015 AND C.Genre = 'Globale' AND C.Discipline= 'Lecture'
ORDER BY C.Moyenne DESC
LIMIT 10;

  -- Requete optimisee: Classement BOTTOM 10 des pays en Lecture en 2015 sur toute la polupation etudiee:

SELECT Pays,Année,Discipline,Moyenne,Genre
FROM classement_PISA AS C
JOIN  Table_Année AS A ON C.id_Année = A.id_Année
JOIN Table_Pays AS P ON C.id_Pays = P.id_Pays 
WHERE A.Année = 2015 AND C.Genre = 'Globale' AND C.Discipline= 'Lecture'
ORDER BY C.Moyenne ASC
LIMIT 10;    

-- Requete donnant pour un pays donne le pourcentage d'investissement sur PIB par annee et la moyenne par discipline

SELECT Table_Pays.Pays,Table_Année.Année,classement_PISA.Discipline,classement_PISA.Moyenne,investissements.`Primaire invest`, investissements.`Secondaire invest`
FROM classement_PISA 
INNER JOIN investissements ON (classement_PISA.id_Pays=investissements.id_Pays AND classement_PISA.id_Année=investissements.id_Année)
INNER JOIN Table_Année  ON (classement_PISA.id_Année=Table_Année.id_Année)
INNER JOIN Table_Pays  ON (classement_PISA.id_Pays=Table_Pays.id_Pays)
WHERE classement_PISA.Genre = 'Globale' AND Table_Pays.ISO3 = 'AUS'
ORDER BY Table_Année.Année DESC;
  
 -- Dataframes pour comparaisons des resultat en mathematiques par annee:
 -- Resultat math en 2009
SELECT Table_Pays.Pays,Table_Année.Année,classement_PISA.Discipline,classement_PISA.Moyenne,investissements.`Primaire invest`, investissements.`Secondaire invest`
FROM classement_PISA 
INNER JOIN investissements ON (classement_PISA.id_Pays=investissements.id_Pays AND classement_PISA.id_Année=investissements.id_Année)
INNER JOIN Table_Année  ON (classement_PISA.id_Année=Table_Année.id_Année)
INNER JOIN Table_Pays  ON (classement_PISA.id_Pays=Table_Pays.id_Pays)
WHERE classement_PISA.Genre = 'Globale' AND classement_PISA.Discipline= 'Math' AND Table_Année.Année = 2009 
ORDER BY classement_PISA.Moyenne DESC;

 -- Resultat math en 2012
SELECT Table_Pays.Pays,Table_Année.Année,classement_PISA.Discipline,classement_PISA.Moyenne,investissements.`Primaire invest`, investissements.`Secondaire invest`
FROM classement_PISA 
INNER JOIN investissements ON (classement_PISA.id_Pays=investissements.id_Pays AND classement_PISA.id_Année=investissements.id_Année)
INNER JOIN Table_Année  ON (classement_PISA.id_Année=Table_Année.id_Année)
INNER JOIN Table_Pays  ON (classement_PISA.id_Pays=Table_Pays.id_Pays)
WHERE classement_PISA.Genre = 'Globale' AND classement_PISA.Discipline= 'Math' AND Table_Année.Année = 2012 
ORDER BY classement_PISA.Moyenne DESC;

 -- Resultat math en 2015
SELECT Table_Pays.Pays,Table_Année.Année,classement_PISA.Discipline,classement_PISA.Moyenne,investissements.`Primaire invest`, investissements.`Secondaire invest`
FROM classement_PISA 
INNER JOIN investissements ON (classement_PISA.id_Pays=investissements.id_Pays AND classement_PISA.id_Année=investissements.id_Année)
INNER JOIN Table_Année  ON (classement_PISA.id_Année=Table_Année.id_Année)
INNER JOIN Table_Pays  ON (classement_PISA.id_Pays=Table_Pays.id_Pays)
WHERE classement_PISA.Genre = 'Globale' AND classement_PISA.Discipline= 'Math' AND Table_Année.Année = 2015 
ORDER BY classement_PISA.Moyenne DESC;


-- Pour un pays donne, obtenir la liste des moyennes par discipline et le niveau dinvestissement pour cet annee la. 
-- Afin d'evaluer la progression par matiere en rapport avec l'investissement dans l'education
SELECT Table_Pays.Pays,Table_Année.Année,classement_PISA.Discipline,classement_PISA.Moyenne,investissements.`Primaire invest`, investissements.`Secondaire invest`
FROM classement_PISA 
INNER JOIN investissements ON (classement_PISA.id_Pays=investissements.id_Pays AND classement_PISA.id_Année=investissements.id_Année)
INNER JOIN Table_Année  ON (classement_PISA.id_Année=Table_Année.id_Année)
INNER JOIN Table_Pays  ON (classement_PISA.id_Pays=Table_Pays.id_Pays)
WHERE classement_PISA.Genre = 'Globale'  AND Table_Pays.ISO3 = 'AUS'
ORDER BY classement_PISA.Discipline;