/* Practica 2 sessio 1 - exercici 1 classe Enunciat */

drop table professors;

drop table departaments;

CREATE TABLE Departaments (
    Id_Departament INT CONSTRAINT pk_Departaments PRIMARY KEY,
    Nom_Departament VARCHAR2(150) CONSTRAINT NN_Departaments_Nom_Depa NOT NULL,
    Ubicacio VARCHAR2(50) CONSTRAINT NN_Departaments_Ubicacio NOT NULL,
    email VARCHAR2(50) CONSTRAINT NN_Departaments_email NOT NULL
);

CREATE TABLE Professors (
    Id_Professor INT CONSTRAINT PK_Professors PRIMARY KEY,
    Nom_complert VARCHAR2(100) CONSTRAINT NN_Professors_Nom_complert NOT NULL,
    Email  VARCHAR2(50) CONSTRAINT NN_Professors_Email NOT NULL,
    Especialitat VARCHAR2(50),
    Telefon VARCHAR2(20) CONSTRAINT NN_Professors_Telefon NOT NULL,
    sou INT,
    Data_naixement DATE ,
    Data_incorporacio Date CONSTRAINT NN_Professors_Data_inc NOT NULL,
    comissio INT,
    Id_Departament INT,
    CONSTRAINT FK_departaments_Id_Departament FOREIGN KEY (Id_Departament) REFERENCES Departaments(Id_Departament)
);

/* Inserts per a la taula "Departaments" */
INSERT INTO Departaments (Id_Departament, Nom_Departament, Ubicacio, Email) 
VALUES (1, 'Departament de Matematiques', 'Edifici A, Pis 2', 'matematiques@tecnocampus.cat');

INSERT INTO Departaments (Id_Departament, Nom_Departament, Ubicacio, Email) 
VALUES (2, 'Departament de Fisica', 'Edifici B, Pis 3', 'fisica@tecnocampus.cat');

INSERT INTO Departaments (Id_Departament, Nom_Departament, Ubicacio, Email) 
VALUES (3, 'Departament de Quimica', 'Edifici C, Pis 1', 'quimica@tecnocampus.cat');

INSERT INTO Departaments (Id_Departament, Nom_Departament, Ubicacio, Email) 
VALUES (4, 'Departament de llengües', 'Edifici D, Piso 4', 'llengues@tecnocampus.cat');

INSERT INTO Departaments (Id_Departament, Nom_Departament, Ubicacio, Email) 
VALUES (5, 'Departament de enginyeria', 'Edifici E, Pis 2', 'enginyeria@tecnocampus.cat');

INSERT INTO Departaments (Id_Departament, Nom_Departament, Ubicacio, Email) 
VALUES (6, 'Departament de arquitectura', 'Edifici C, Pis 1', 'arquitectura@tecnocampus.cat');

/* Inserts per a la taula "Professors" */
INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon,sou, Data_naixement,Data_incorporacio,comissio, Id_Departament)
VALUES (1, 'anna soler', 'asoler@tecnocampus.cat',NULL, '931234567', 25000, TO_DATE('01/01/1980','DD/MM/YYYY'),TO_DATE('01/01/2021','DD/MM/YYYY'),0, 1);

INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon,sou, Data_naixement,Data_incorporacio,comissio, Id_Departament)
VALUES (2, 'david martínez', 'dmartinez@tecnocampus.cat', 'fisica', '932345678', 30000, TO_DATE('05/06/1985','DD/MM/YYYY'),TO_DATE('01/06/2015','DD/MM/YYYY'),NULL,2);

INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon,sou, Data_naixement,Data_incorporacio,comissio, Id_Departament)
VALUES (3, 'júlia garcía', 'jgarcia@tecnocampus.cat', 'angles', '933456789',40000, TO_DATE('10/07/1975','DD/MM/YYYY'),TO_DATE('01/05/2006','DD/MM/YYYY'),NULL,4);

INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon,sou, Data_naixement,Data_incorporacio, comissio,Id_Departament)
VALUES (4, 'carla pérez', 'cperez@tecnocampus.cat', 'programacio', '934567890', null, TO_DATE('01/05/1980','DD/MM/YYYY'),TO_DATE('01/05/1998','DD/MM/YYYY'),NULL,4);

INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon,sou, Data_naixement,Data_incorporacio,comissio, Id_Departament)
VALUES (5, 'miguel torres', 'mtorres@tecnocampus.cat', 'disseny web', '935678901', 35000, TO_DATE('25/02/1983','DD/MM/YYYY'), TO_DATE('05/01/2002','DD/MM/YYYY'),NULL,5);

commit;


/* Comprovació que s’han introduït les dades a cada taula */
Select * from  professors;
Select * from  departaments;


/* Exercicis 

/*1. Insereix un Professor nou Joan Bigues, jbigues@tecnocampus.cat, de programacio, 
telf 937572525, amb un sou de 40000, data naixement 25/02/1985 i amb data d'incorporacio d'avui 
utilitzant la data de sistema*/
INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon,sou, Data_naixement,Data_incorporacio,comissio, Id_Departament)
VALUES (6, 'joan bigues', 'jbigues@tecnocampus.cat', 'programacio', '937572525',40000, TO_DATE('25/02/1985','DD/MM/YYYY'),SYSDATE ,NULL,NULL);
/*2. Actualitza el departament de la Carla Perez al departament 5*/
UPDATE PROFESSORS
SET ID_DEPARTAMENT=5
WHERE NOM_COMPLERT ='carla pérez';

/*3. Elimina el departament 6*/

DELETE FROM DEPARTAMENTS
WHERE ID_DEPARTAMENT=6;

/*4. Afegir una columna per al nombre de fills*/

ALTER TABLE PROFESSORS
ADD N_FILLS INT;

--Expresions aritmetiques i comparacio--

/*5. visualitza nomcomplert,sou i el sou amb un increment de 300 euros per cada professor*/
SELECT NOM_COMPLERT, SOU + 300 FROM PROFESSORS;

/* PER ARREGLAR EL PROBLEMA DEL NULL*/ 
--SELECT NOM_COMPLERT,SOU, SOU + 300, COALESCE(SOU,0) + 300 FROM PROFESSORS;
/*6. visualitza el mateix que a l'exercici anterior pero utilitzant un alies*/

SELECT NOM_COMPLERT AS NOM, SOU AS SOU_NORMAL, SOU+300 AS SOU_INCREMENTAT
FROM PROFESSORS;

/*7. Visualitza en un sol camp el nom_complert i 
la data d'incoporació de professors utilitzant un alies*/

SELECT NOM_COMPLERT || ' ' || DATA_INCORPORACIO AS NOM_CONCATENAT FROM PROFESSORS;

SELECT CONCAT(CONCAT(NOM_COMPLERT, ' '), DATA_INCORPORACIO) AS NOM_CONCATENAT FROM PROFESSORS;

/*8. Visualitza els id_departament que tenen els professors*/

SELECT ID_DEPARTAMENT
FROM PROFESSORS;

/*9. Visualitza els id_departament (sense repeticions) que tenen els professors*/

SELECT  DISTINCT ID_DEPARTAMENT
FROM PROFESSORS;

/*10. visualitza els professors que estan en el departament 1*/

SELECT NOM_COMPLERT, ID_DEPARTAMENT FROM PROFESSORS
WHERE ID_DEPARTAMENT=1;

/*11.  visualitza els professors que es van incorporar entre 
l'any 2000 i l'any 2010*/

SELECT NOM_COMPLERT FROM PROFESSORS
WHERE DATA_INCORPORACIO BETWEEN '01/01/2000' AND ('31/12/2010');

SELECT NOM_COMPLERT FROM PROFESSORS
WHERE TO_CHAR (DATA_INCORPORACIO, 'YYYY') BETWEEN '2000' AND '2010';

SELECT NOM_COMPLERT FROM PROFESSORS
WHERE EXTRACT(YEAR FROM DATA_INCORPORACIO) BETWEEN '2000' AND '2010';

/*12. visualitza els professors que estan en el departament 1 i 5*/

SELECT NOM_COMPLERT, ID_DEPARTAMENT FROM PROFESSORS
WHERE ID_DEPARTAMENT=1 OR ID_DEPARTAMENT=5;

SELECT NOM_COMPLERT, ID_DEPARTAMENT FROM PROFESSORS
WHERE ID_DEPARTAMENT IN (1,5);

/*13. visualitza els professors que contenen
els caracters continuos "re" al seu nomcomplert*/

SELECT NOM_COMPLERT FROM PROFESSORS
WHERE NOM_COMPLERT LIKE '%re%';

/*14. visualitza els professors que estan en el departament 1 i 5
pero nomes dels que tenen especialitat programacio*/

SELECT NOM_COMPLERT, ESPECIALITAT FROM PROFESSORS
WHERE ESPECIALITAT='programacio';

/*15. visualitza els professors que tenen un sou mes alt de 30000*/

SELECT NOM_COMPLERT, SOU FROM PROFESSORS
WHERE SOU>30000;

/*17. Afegir una restricció perquè la data de contractació sigui posterior a la data de creació de l'empresa (25/4/1995)*/

ALTER TABLE PROFESSORS
ADD CONSTRAINT CH_DATA_INCORPORACIO_MIN 
CHECK (DATA_INCORPORACIO > TO_DATE('25/4/1995', 'DD/MM/YYYY'));

/*18. Afegir una restricció perquè el salari sigui superior al salari mínim de 10100 euros*/

ALTER TABLE PROFESSORS
ADD CONSTRAINT CH_PROFESSORS_SOU_MIN
CHECK (SOU>10100);

/*19. prova de fer un insert amb un sou inferior a 10100 */
/*
PETA PERQUE NO COMPLEIX LA CONSTRAINT ANTERIOR
INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon,sou, Data_naixement,Data_incorporacio,comissio, Id_Departament)
VALUES (7, 'maria', 'maria@tecnocampus.cat', 'programacio', '937752525',1000, TO_DATE('25/02/1985','DD/MM/YYYY'),SYSDATE ,NULL,5);
*/
/*20. Afegir una restricció perquè la data de contractació sigui superior a la data de naixement */
ALTER TABLE PROFESSORS
ADD CONSTRAINT CH_DATA_CONT_SUP_NAIX
CHECK (DATA_INCORPORACIO>DATA_NAIXEMENT);
/*21. Actualitza el valor de comissio de la taula professors perque sigui el 50% del 
sou nomes pels professors del departament 4*/
UPDATE PROFESSORS
SET COMISSIO=SOU*0.5
WHERE ID_DEPARTAMENT=4;
/*22.  Visualitza els professors amb una especialitat que comença amb la lletra 'd' */
SELECT NOM_COMPLERT, ESPECIALITAT FROM PROFESSORS
WHERE ESPECIALITAT LIKE('d%');
/*23. Visualitza els professors amb el nom complet que no conté la cadena "ar" */
SELECT NOM_COMPLERT FROM PROFESSORS
WHERE NOM_COMPLERT NOT LIKE('%ar%');
/*24. Visualitza els professors amb una especialitat que no sigui "angles" */
SELECT NOM_COMPLERT, ESPECIALITAT FROM PROFESSORS
WHERE ESPECIALITAT != 'angles';
/*25. Visualitza els professors amb un sou superior a 30000 i una comissió establerta */

SELECT NOM_COMPLERT, SOU, COMISSIO FROM PROFESSORS
WHERE SOU>30000 AND COMISSIO IS NOT NULL;

/*26. Visualitza els professors amb un sou inferior o igual a 35000 o una especialitat de "fisica" */

SELECT NOM_COMPLERT, SOU, ESPECIALITAT FROM PROFESSORS
WHERE SOU<=35000 OR ESPECIALITAT = 'fisica';

/*27. Visualitza els professors amb una data d'incorporació anterior a l'1 de gener de 2005 i que no estiguin al departament 3 */

SELECT NOM_COMPLERT, DATA_INCORPORACIO, ID_DEPARTAMENT FROM PROFESSORS
WHERE DATA_INCORPORACIO < TO_DATE('01/01/2005', 'DD/MM/YYYY') AND ID_DEPARTAMENT!=3;

/*28. Visualitza els professors amb una especialitat de "quimica" i una data de naixement registrada */

SELECT NOM_COMPLERT, ESPECIALITAT, DATA_NAIXEMENT FROM PROFESSORS
WHERE ESPECIALITAT='quimica' AND DATA_NAIXEMENT IS NOT NULL;

/*29. Visualitza els professors amb una especialitat de "programacio" i un sou superior a 40000 */

SELECT NOM_COMPLERT, ESPECIALITAT, SOU FROM PROFESSORS
WHERE ESPECIALITAT='programacio' AND SOU>40000;

/*30. Visualitza els professors amb una comissió establerta o una especialitat de "angles" */

SELECT NOM_COMPLERT, COMISSIO, ESPECIALITAT FROM PROFESSORS
WHERE COMISSIO IS NOT NULL OR ESPECIALITAT='angles';

/*31. Visualitza els professors amb una especialitat que no sigui "enginyeria" i una data de naixement registrada i ordenal's per data incorporacio */

SELECT NOM_COMPLERT, ESPECIALITAT, DATA_NAIXEMENT, DATA_INCORPORACIO FROM PROFESSORS
WHERE ESPECIALITAT!='enginyeria' AND DATA_NAIXEMENT IS NOT NULL
ORDER BY DATA_INCORPORACIO;

/* Funcions generals */

/*32. Utilitza la funció NVL per mostrar lespecialitat dels professors, i si algun té a nul, mostrar "No especificat" */

SELECT NOM_COMPLERT, ESPECIALITAT, NVL(ESPECIALITAT, 'No especificat') FROM PROFESSORS;

/*33. Utilitza la funció NVL2 per mostrar el sou incrementat en un 
10% per als professors amb comissió establerta, 
i duplica el sou per als que no en tenen */

-- NVL2(CAMP, SI_NO_NULL, SI_NULL)
SELECT NOM_COMPLERT, SOU, COMISSIO, NVL2 (COMISSIO, SOU*1.1, SOU*2) FROM PROFESSORS;

/*34. Utilitza la funció NULLIF  per mostrar "0" si el sou és igual a la comissió, sinó mostra el sou */

--
SELECT NOM_COMPLERT, SOU, COMISSIO, NULLIF(SOU,COMISSIO) FROM PROFESSORS;

/*35. Utilitza la funció COALESCE per mostrar el sou dels professors, i si algun té un sou nul, possar 20000 */

SELECT NOM_COMPLERT, SOU, COALESCE(SOU,20000) FROM PROFESSORS;

/*36. Utilitza la funció CASE per mostrar "Alt" si el sou del professor és superior a 35000, "Mitjà" 
si és entre 25000 i 35000, i "Baix" si és inferior a 25000 */

SELECT NOM_COMPLERT, SOU,
CASE
    WHEN SOU > 35000 THEN 'Alt'
    WHEN SOU >= 25000 AND SOU <=35000 THEN 'Mitjà'
    WHEN SOU < 25000 THEN 'Baix'
    ELSE 'No informat'
END AS NIVELL_SOU
FROM PROFESSORS;

--Funcions de Conversio i Manipulació de caracters

/*37. Utilitza la funció LOWER per mostrar el nom complet dels professors en minúscules */

SELECT LOWER(NOM_COMPLERT) AS NOM_COMPLERT_MINUSCULE
FROM PROFESSORS;

/*38. Utilitza la funció UPPER per mostrar el nom dels departaments en majúscules */
SELECT UPPER(NOM_COMPLERT) AS NOM_COMPLERT_MAYUSCULE
FROM PROFESSORS;

/*39. Utilitza la funció INITCAP per mostrar el nom complet dels professors amb la primera lletra de cada paraula en majúscula */

SELECT NOM_COMPLERT, INITCAP(NOM_COMPLERT) AS NOM_COMPLERT_CAPITALIZED
FROM PROFESSORS;

/*40. Utilitza la funció CONCAT per mostrar el correu electrònic i el telèfon concatenats per a cada professor */

SELECT NOM_COMPLERT, EMAIL || ', ' || TELEFON AS CORREU_ELECTRONIC_TELEFON
FROM PROFESSORS;


/*41. Utilitza la funció SUBSTR per mostrar els primers 3 caràcters del nom complet dels professors */

SELECT NOM_COMPLERT, SUBSTR(NOM_COMPLERT, 1, 3) AS PRIMERS_TRES_CARACTERS
FROM PROFESSORS;


/*42. Utilitza la funció LENGTH per mostrar la longitud del nom complet dels professors */

SELECT NOM_COMPLERT, LENGTH(NOM_COMPLERT) AS NOM_COMPLERT_LENGTH
FROM PROFESSORS;

/*43. Utilitza la funció INSTR per mostrar la posició de la primera 'a' en el nom complet dels professors */

SELECT NOM_COMPLERT, INSTR(NOM_COMPLERT, 'a') AS POSICIO_PRIMERA_A
FROM PROFESSORS;

/*44. Utilitza la funció LPAD per omplir amb zeros a l'esquerra l'ID de departament fins a tenir una longitud de 5 caràcters */

SELECT NOM_COMPLERT, LPAD(ID_DEPARTAMENT, 5, '0') AS ID_DEPARTAMENT_PAD
FROM PROFESSORS;

/*45. Utilitza la funció RPAD per omplir amb espais a la dreta el nom del departament fins a tenir una longitud de 20 caràcters */

SELECT ID_DEPARTAMENT, RPAD(NOM_DEPARTAMENT, 20) AS NOM_DEPARTAMENT_PAD
FROM DEPARTAMENTS;

/*46. Utilitza la funció TRIM per eliminar els espais en blanc al principi i al final del nom complet dels professors */

SELECT TRIM(NOM_COMPLERT) AS NOM_COMPLERT_TRIM
FROM PROFESSORS;

/*47. Utilitza la funció REPLACE per substituir la lletra 'a' per 'x' en el nom complet dels professors */

SELECT REPLACE(NOM_COMPLERT, 'a', 'x') AS NOM_COMPLERT_MODIFICAT
FROM PROFESSORS;

--funcions de data

/*48. Mostra els noms complets dels empleats del departament 4 i el nombre de setmanes durant les quals han treballat*/

SELECT 
    Nom_complert, ID_DEPARTAMENT,
    ROUND((SYSDATE - Data_incorporacio) / 7) AS SETMANES_TREBALLADES
FROM 
    Professors
WHERE 
    Id_Departament = 4;

/*49. Utilitzant NEXT_DAY per trobar el proper dilluns a partir d'avui*/

SELECT NEXT_DAY(SYSDATE, 'MONDAY') AS PROPER_DILLUNS
FROM DUAL;

/*50.  l'últim dia del mes d'incorporació dels professors del departament 2*/

SELECT TO_CHAR(LAST_DAY(Data_incorporacio), 'DD-MON-YYYY') AS ULTIM_DIA_MES_INCORPORACIO
FROM Professors
WHERE Id_Departament = 2;


/*51. Afegeix 3 mesos a la data actual */

SELECT SYSDATE AS DATA_ACTUAL,
       ADD_MONTHS(SYSDATE, 3) AS DATA_AMB_3_MESOS
FROM DUAL;

/*52. Calcula el nombre de mesos entre la data de naixement i la data d'incorporacio ordenat per mesos descentent */

SELECT 
    MONTHS_BETWEEN(Data_incorporacio, Data_naixement) AS MESOS_ENTRE_NAIX_I_INCORP,
    Data_incorporacio,
    Data_naixement
FROM 
    Professors
ORDER BY    
    MESOS_ENTRE_NAIX_I_INCORP DESC;


