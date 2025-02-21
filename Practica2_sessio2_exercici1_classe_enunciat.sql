drop table assignatures;
drop table cursos;
drop table Jerarquia_Departament;
drop table professors;
drop table departaments;



/*Creacio taules */

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
    id_responsable int,
    CONSTRAINT FK_departaments_Id_Departament FOREIGN KEY (Id_Departament) REFERENCES Departaments(Id_Departament)
);

CREATE TABLE Cursos (
    Id_Curs INT CONSTRAINT PK_cursos PRIMARY KEY,
    Nom_Curs VARCHAR2(100) CONSTRAINT NN_Cursos_Nom_Curs NOT NULL,
    Data_Inici DATE CONSTRAINT NN_Cursos_Data_Inici NOT NULL,
    Data_Fi DATE CONSTRAINT NN_Cursos_Data_Fi NOT NULL
);

CREATE TABLE Assignatures (
    Id_Assignatura INT CONSTRAINT pk_Assignatures PRIMARY KEY,
    Nom_Assignatura VARCHAR2(100) CONSTRAINT NN_Assignatures_Nom_Assig NOT NULL,
    Id_Professor INT,
    Id_Curs INT,
    CONSTRAINT fk_professors_Id_Professor FOREIGN KEY (Id_Professor) REFERENCES Professors(Id_Professor),
    CONSTRAINT fk_cursosId_Curs FOREIGN KEY (Id_Curs) REFERENCES Cursos(Id_Curs)
);

CREATE TABLE Jerarquia_Departament (
    Id_Jerarquia INT CONSTRAINT PK_Jerarquia_Departament PRIMARY KEY,
    Id_Professor INT CONSTRAINT FK_Jerarquia_Departament_Prof REFERENCES Professors(Id_Professor),
    carrec VARCHAR2(150), 
    Id_sub_Jerarquia INT CONSTRAINT  FK_Jerarquia_Sub_Prof REFERENCES Professors(Id_Professor)
);

----DML---

-- Inserts per la taula "Departaments"
INSERT INTO Departaments (Id_Departament, Nom_Departament, Ubicacio, Email) 
VALUES (1, 'Departament de Matematiques', 'Edifici A, Pis 2', 'matematiques@tecnocampus.cat');

INSERT INTO Departaments (Id_Departament, Nom_Departament, Ubicacio, Email) 
VALUES (2, 'Departament de Fisica', 'Edifici A, Pis 2', 'fisica@tecnocampus.cat');

INSERT INTO Departaments (Id_Departament, Nom_Departament, Ubicacio, Email) 
VALUES (3, 'Departament de Quimica', 'Edifici C, Pis 1', 'quimica@tecnocampus.cat');

INSERT INTO Departaments (Id_Departament, Nom_Departament, Ubicacio, Email) 
VALUES (4, 'Departament de llengües', 'Edifici D, Piso 4', 'llengues@tecnocampus.cat');

INSERT INTO Departaments (Id_Departament, Nom_Departament, Ubicacio, Email) 
VALUES (5, 'Departament de enginyeria', 'Edifici E, Pis 2', 'enginyeria@tecnocampus.cat');

INSERT INTO Departaments (Id_Departament, Nom_Departament, Ubicacio, Email) 
VALUES (6, 'Departament de arquitectura', 'Edifici C, Pis 1', 'arquitectura@tecnocampus.cat');


-- Inserts per la taula "Professors"

INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon,sou, Data_naixement,Data_incorporacio, Id_Departament,id_responsable)
VALUES (1, 'Anna Soler', 'asoler@tecnocampus.cat', 'matematiques', '931234567', 25000, TO_DATE('01/01/1980','DD/MM/YYYY'),TO_DATE('01/01/2021','DD/MM/YYYY'), 1,null);

INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon,sou, Data_naixement,Data_incorporacio, Id_Departament,id_responsable)
VALUES (2, 'David Martínez', 'dmartinez@tecnocampus.cat', 'fisica', '932345678', null, TO_DATE('05/06/1985','DD/MM/YYYY'),TO_DATE('01/06/2015','DD/MM/YYYY'),2,null);

INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon,sou, Data_naixement,Data_incorporacio, Id_Departament,id_responsable)
VALUES (3, 'Júlia García', 'jgarcia@tecnocampus.cat', null, '933456789',null, TO_DATE('10/07/1975','DD/MM/YYYY'),TO_DATE('01/05/2006','DD/MM/YYYY'),4,null);

INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon,sou, Data_naixement,Data_incorporacio, Id_Departament,id_responsable)
VALUES (4, 'Carla Pérez', 'cperez@tecnocampus.cat', 'programacio', '934567890', 45000, TO_DATE('01/05/1980','DD/MM/YYYY'),TO_DATE('01/05/1998','DD/MM/YYYY'),4,3);

INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon,sou, Data_naixement,Data_incorporacio, Id_Departament,id_responsable)
VALUES (5, 'Miguel Torres', 'mtorres@tecnocampus.cat', 'disseny web', '935678901', 35000, TO_DATE('25/02/1983','DD/MM/YYYY'), TO_DATE('05/01/2002','DD/MM/YYYY'),5,null);


INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon, sou, Data_naixement, Data_incorporacio, Id_Departament,id_responsable)
VALUES (6, 'Laura Pérez', 'lperez@tecnocampus.cat', 'Informàtica', '936789012', 38000, TO_DATE('15/03/1982','DD/MM/YYYY'), TO_DATE('01/09/2010','DD/MM/YYYY'), 5,5);

INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon, sou, Data_naixement, Data_incorporacio, Id_Departament,id_responsable)
VALUES (7, 'Pablo Gómez', 'pgomez@tecnocampus.cat', 'Matemàtiques', '937890123', 42000, TO_DATE('22/07/1978','DD/MM/YYYY'), TO_DATE('01/07/2005','DD/MM/YYYY'), 4,3);

INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon, sou, Data_naixement, Data_incorporacio, Id_Departament,id_responsable)
VALUES (8, 'Sara Ruiz', 'sruiz@tecnocampus.cat', 'Química', '938901234', 40000, TO_DATE('10/09/1985','DD/MM/YYYY'), TO_DATE('01/09/2012','DD/MM/YYYY'), 3,null);

INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon, sou, Data_naixement, Data_incorporacio, Id_Departament,id_responsable)
VALUES (9, 'Carlos Jiménez', 'cjimenez@tecnocampus.cat', 'Física', '939012345', 39000, TO_DATE('05/05/1980','DD/MM/YYYY'), TO_DATE('01/09/2008','DD/MM/YYYY'), 2,2);

INSERT INTO Professors (Id_Professor, Nom_complert, Email, Especialitat, Telefon, sou, Data_naixement, Data_incorporacio, Id_Departament,id_responsable)
VALUES (10, 'Ana Martí', 'amarti@tecnocampus.cat', 'Enginyeria', '930123456', 41000, TO_DATE('18/11/1977','DD/MM/YYYY'), TO_DATE('01/07/2004','DD/MM/YYYY'), 5,5);

INSERT INTO Cursos (Id_Curs, Nom_Curs, Data_Inici, Data_Fi) 
VALUES (1, 'Introduccio a la Programacio', TO_DATE('01/09/2023','DD/MM/YYYY'), TO_DATE('30/06/2024','DD/MM/YYYY'));

INSERT INTO Cursos (Id_Curs, Nom_Curs, Data_Inici, Data_Fi) 
VALUES (2, 'Disseny Grafic', TO_DATE('01/09/2023','DD/MM/YYYY'), TO_DATE('30/06/2024','DD/MM/YYYY'));

INSERT INTO Cursos (Id_Curs, Nom_Curs, Data_Inici, Data_Fi) 
VALUES (3, 'Llengua Anglesa', TO_DATE('01/09/2023','DD/MM/YYYY'), TO_DATE('30/06/2024','DD/MM/YYYY'));

INSERT INTO Cursos (Id_Curs, Nom_Curs, Data_Inici, Data_Fi) 
VALUES (4, 'Matematiques Avançades', TO_DATE('01/09/2023','DD/MM/YYYY'), TO_DATE('30/06/2024','DD/MM/YYYY'));

INSERT INTO Cursos (Id_Curs, Nom_Curs, Data_Inici, Data_Fi) 
VALUES (5, 'Fisica', TO_DATE('01/09/2023','DD/MM/YYYY'), TO_DATE('30/06/2024','DD/MM/YYYY'));

-- Inserts para la tabla "Assignatures"
INSERT INTO Assignatures (Id_Assignatura, Nom_Assignatura,  Id_Professor, Id_Curs)
VALUES (1, 'Programacio Orientada a Objectes', 4, 1);

INSERT INTO Assignatures (Id_Assignatura, Nom_Assignatura,  Id_Professor, Id_Curs) 
VALUES (2, 'Dibuix Vectorial', 1, 2);

INSERT INTO Assignatures (Id_Assignatura, Nom_Assignatura,  Id_Professor, Id_Curs)
VALUES (3, 'Literatura anglesa',3, 3);

INSERT INTO Assignatures (Id_Assignatura, Nom_Assignatura, Id_Professor, Id_Curs) 
VALUES (4, 'Calcul Integral',null, 4);

INSERT INTO Assignatures (Id_Assignatura, Nom_Assignatura, Id_Professor, Id_Curs)
VALUES (5, 'Fisica I', 4, 5);

--inserts jerquia
INSERT INTO Jerarquia_Departament (Id_Jerarquia, Id_Professor, Id_sub_Jerarquia, Carrec)
VALUES (1, 1, NULL, 'Director del Departament de Matemàtiques');

INSERT INTO Jerarquia_Departament (Id_Jerarquia, Id_Professor, Id_sub_Jerarquia, Carrec)
VALUES (2, 2, NULL, 'Director de Departament de Física');

INSERT INTO Jerarquia_Departament (Id_Jerarquia, Id_Professor, Id_sub_Jerarquia, Carrec)
VALUES (3, 9, 2, 'Empleat Departament de Física');

INSERT INTO Jerarquia_Departament (Id_Jerarquia, Id_Professor, Id_sub_Jerarquia, Carrec)
VALUES (4, 8, null, 'Director de Departament de Química');

INSERT INTO Jerarquia_Departament (Id_Jerarquia, Id_Professor, Id_sub_Jerarquia, Carrec)
VALUES (5, 3, NULL, 'Director de Departament de llengües');

INSERT INTO Jerarquia_Departament (Id_Jerarquia, Id_Professor, Id_sub_Jerarquia, Carrec)
VALUES (6, 4, 3, 'Empleat Departament de llengües');

INSERT INTO Jerarquia_Departament (Id_Jerarquia, Id_Professor, Id_sub_Jerarquia, Carrec)
VALUES (7, 7, 3, 'Empleat Departament de llengües');

INSERT INTO Jerarquia_Departament (Id_Jerarquia, Id_Professor, Id_sub_Jerarquia, Carrec)
VALUES (8, 10, NULL, 'Director de Departament d’Enginyeria');

INSERT INTO Jerarquia_Departament (Id_Jerarquia, Id_Professor, Id_sub_Jerarquia, Carrec)
VALUES (9, 6, 8, 'Empleat Departament d’Enginyeria');

INSERT INTO Jerarquia_Departament (Id_Jerarquia, Id_Professor, Id_sub_Jerarquia, Carrec)
VALUES (10, 5, 8, 'Empleat Departament d’Enginyeria');


commit;


/* Comprova que s’han introduït les dades a cada taula */
select * from professors;
select * from assignatures;
select * from cursos;
select * from Jerarquia_Departament;
select * from departaments;





--Ús de AVG, SUM, MIN, MAX, COUNT
--Totes les funcions de grup, ignoren els valors nulls

/*1.Escriu una consulta per calcular la mitjana del sou de tots els professors.*/
select avg(nvl(sou,0)) promig from professors;
/*2.Troba la suma total dels sous de tots els professors del departament 4*/
select sum(sou) suma
from professors
where Id_departament=4;
/*3. Troba la mitjana d'edat dels professors.*/
select data_naixement,
avg(extract(year from sysdate) - extract (year from data_naixement)) as anys
from professors
GROUP BY data_naixement;

select round(¡avg(sysdate-Data_naixement)/365) edat_mitjana
from professors;
/*4. Troba la suma dels sous de tots els professors*/
select sum(sou) suma
from professors;
/*5.Troba la diferència màxima entre les dates d'incorporació i les dates de naixement dels professors*/


select max((data_incorporacio-data_naixement)) as diferencies
from professors
order by 1;


/*6.Troba la desviació estàndard de les edats dels professors.*/
-- la desviació estàndard ens ajuda a entendre si les edats dels professors estan totes a prop d'un valor central (la mitjana) o si estan més disperses
select STDDEV(extract(year from sysdate) - extract (year from data_naixement)) as diferencies from professors;
/*7.Troba el nombre únic de departamen diferents als quals s'han assignat professors.*/
select count(distinct id_departament) from professors;

--GROUP BY (especifiquem columnes que volen agrupar) - HAVING 

/*8. Troba la suma dels sous per departament.*/
select sum(sou), id_departament from professors
group by id_departament
order by 2;

/*9. Troba la suma dels sous per departament i especialitat.*/
select sum(sou), id_departament, especialitat from professors
group by id_departament, especialitat
order by 2;

/*10. Troba els departaments amb un nombre de professors igual o superior a 2.*/
select count(*), id_departament from professors
group by id_departament
having count(*)>=2
order by 2;

/*11 Troba la mitjana del sou per a cada departament que tingui almenys dos professors.*/
select avg(nvl(sou,0)), count(*), id_departament from professors
group by id_departament
having count(*)>=2
order by 2;

/*12 Troba la mitjana del sou per a cada departament que el sou sigui superior a 30000*/
select avg(nvl(sou,0)), count(*), id_departament from professors
group by id_departament
having count(*)>=2 and avg(nvl(sou,0)) >30000
order by 2;

/*13 Mostra el salary maxim mig*/

    
/*14.ROLLUP:Troba la quantitat total d'assignatures per curs i la quantitat total d'assignatures per curs i professor 1.*/
select id_professor, id_curs, count(*) as totalAss
from assignatures
where id_professor=1
group by rollup(id_professor, id_curs);
/*15 CUBE:Calcula la quantitat total d'assignatures per  professor i curs, del professor 1, mostrant totes les combinacions possibles.*/
select id_professor, id_curs, count(*) as totalAss
from assignatures
where id_professor=1
group by cube(id_professor, id_curs);
/*16.GROUPING SETS. Mostra la quantitat total d'assignatures per professor i curs, així com la quantitat total d'assignatures pel professor 1*/
select id_professor, id_curs, count(*) as totalAss
from assignatures
where id_professor=1
group by grouping sets ((id_professor, id_curs), (id_professor));



---JOINS--
select p.id_professor, a.id_assignatura, a.nom_assignatura, p.nom_complert
from professors p
inner join assignatures a
on p.id_professor=a.id_professor;

select p.id_professor, a.id_assignatura, a.nom_assignatura, p.nom_complert
from professors p
left outer join assignatures a
on p.id_professor=a.id_professor;

select p.id_professor, a.id_assignatura, a.nom_assignatura, p.nom_complert
from professors p
right outer join assignatures a
on p.id_professor=a.id_professor;

select p.id_professor, a.id_assignatura, a.nom_assignatura, p.nom_complert
from professors p
full outer join assignatures a
on p.id_professor=a.id_professor;

select p.id_professor, a.id_assignatura, a.nom_assignatura, p.nom_complert
from professors p
cross join assignatures a;


--NATURAL JOINS --

SELECT nom_complert , nom_assignatura
FROM Professors
NATURAL JOIN Assignatures;
/*Aquesta consulta retornarà totes les columnes de la unió natural entre les taules Professors i Assignatures. 
Utilitza automàticament totes les columnes amb noms coincidents en ambdues taules per a realitzar el join.*/

SELECT *
FROM Professors
NATURAL JOIN Assignatures
WHERE id_departament in(3,4);


SELECT *
FROM Professors p
JOIN Assignatures a USING (Id_Professor);
/*Aquesta consulta utilitza la clàusula USING per indicar la columna comu Id_Professor entre les taules Professors i Assignatures. 
Retorna totes les columnes de les dues taules, però només on les columnes especificades a la clàusula USING coincideixen.*/


SELECT *
FROM Professors
JOIN Assignatures ON Professors.Id_Professor = Assignatures.Id_Professor;
/*Aquesta consulta fa servir la clàusula ON per especificar explícitament la condició de join, 
en aquest cas, que la columna Id_Professor de la taula Professors ha de ser igual a la columna Id_Professor de la taula Assignatures. 
Retorna totes les columnes de les dues taules on aquesta condició es compleix.*/


--OUTER JOINS --

--left join ----totes les files de la taula Professors, inclosos els professors que no tenen cap assignatura

SELECT *
FROM Professors
LEFT OUTER JOIN Assignatures ON Professors.Id_Professor = Assignatures.Id_Professor;

--right join - totes les files de la taula Assignatures, inclosos els registres d'assignatures que no estan associats a cap professor (si n'hi ha)
--Si una assignatura no té un professor associat, les columnes corresponents a la taula Professors seran nules.
SELECT *
FROM Professors
RIGHT OUTER JOIN Assignatures ON Professors.Id_Professor = Assignatures.Id_Professor;

--full outer join
--retornarà totes les files de les taules Professors i Assignatures, mostrant la combinació de totes dues, 
--incloent les files que no tenen una coincidència a l'altra taula
SELECT *
FROM Professors
FULL OUTER JOIN Assignatures ON Professors.Id_Professor = Assignatures.Id_Professor;

--inner join --retornarà totes les files de la taula Professors que tenen una assignatura associada a través de la columna Id_Professor
SELECT *
FROM Professors
INNER JOIN Assignatures ON Professors.Id_Professor = Assignatures.Id_Professor;



--exercicis
/*17. Mostra el nom, lespecialitat i l'assignatura dels professors 3 i 4 Utilitzant USING*/

/*18. Mostra el nom, lespecialitat i l'assignatura dels departaments 1 i 2 Utilitzant USING*/

/*19. Mostra el nombre d'assignatures per a cada departament, incloent aquells que no tenen assignatures. OUTER*/
select d.nom_departament, a.nom_assignatura
from departaments d
left outer join professors p on p.id_departament = d.id_departament
left outer join assignatures a on a.id_professor=p.id_professor;

/*20 Mostra totes les assignatures i tots els professors, incloent els casos on no hi hagi una correspondència entre un professor i una assignatura . OUTER*/
select p.id_professor, a.id_assignatura, a.nom_assignatura, p.nom_complert
from professors p
full outer join assignatures a
on p.id_professor=a.id_professor
order by 1;

/* CROSS JOIN retornarà una combinació de tots els professors amb totes les assignatures disponibles, 
sense tenir en compte cap condició de coincidència entre les dues taules*/
SELECT Professors.Nom_complert AS Professor, Assignatures.Nom_Assignatura AS Assignatura
FROM Professors
CROSS JOIN Assignatures;


/* 21. Fes un join a la tabla "Professors" per trobar els professors que comparteixen el mateix departament*/

/* 22. Realitza un recooregut en arbre, utilitzant  START WITH i CONNECT BY PRIOR per obtenir la jeraquia dels departaments*/
