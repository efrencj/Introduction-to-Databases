

CREATE TABLE DEPARTAMENTS(
ID_DEPARTAMENT INT CONSTRAINT PK_ID_DEPART PRIMARY KEY,
NOM_DEPART VARCHAR(100)  CONSTRAINT NN_NOM_DEPART NOT NULL,
UBICACIO VARCHAR(100),
EMAIL VARCHAR(100)
);
CREATE TABLE PROFESSORS(
ID_PROF INT CONSTRAINT PK_ID_PROF PRIMARY KEY,
NOM_PROF VARCHAR(100) CONSTRAINT NN_NOM_PROF NOT NULL,
CORREU VARCHAR(100),
ESPECIAL VARCHAR(100),
TELEFON INT,
ID_DEPARTAMENT INT,
CONSTRAINT FK_ID_DEPARTAMENT FOREIGN KEY (ID_DEPARTAMENT)--ESTA TABLA
REFERENCES DEPARTAMENTS (ID_DEPARTAMENT)--OTRA TABLA
);

--DML

SELECT * FROM DEPARTAMENTS;

SELECT ID_DEPARTAMENT, EMAIL FROM DEPARTAMENTS;

--INSERIR DADES

INSERT INTO departaments (id_departament, NOM_DEPART, ubicacio, email)
values (1,'Fisica','TCM2','fis@..');

INSERT INTO departaments
values (2,'Mates', 'TMC3','mat@..');

INSERT INTO departaments (id_departament,nom_depart)
values(3,'informatica');

--DROP TABLE PROFESSORS;
--DROP TABLE DEPARTAMENTS;

select *from PROFESSORS;
ALTER TABLE PROFESSORS
ADD DATA_NAIXEMENT DATE;

INSERT INTO PROFESSORS
VALUES (1, 'pep marti', 'pp@te', 'progr', 7222, 1, '12/04/84');

INSERT INTO PROFESSORS
VALUES (2,'maria', 'gg@te', 'fid', 5555, 1, to_date('19/05/84', 'DD/MM/YYYY'));
