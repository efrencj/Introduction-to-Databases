--Pràctica 1 feta per Alex Barroso i Efrén Cayuela
--Creaci� de taules
/*
DROP TABLE CAMPANYES;
DROP TABLLE MONS;
*/
CREATE TABLE MONS(
ID_MON INT CONSTRAINT PK_ID_MON PRIMARY KEY,
N_MON VARCHAR(50)CONSTRAINT NN_MONS_N_MON NOT NULL,
TIPUS VARCHAR(50) CONSTRAINT NN_MONS_TIPUS NOT NULL,
DESCRIPCIO VARCHAR(255)
);

CREATE TABLE CAMPANYES(
ID_CAMP INT CONSTRAINT PK_ID_CAMP PRIMARY KEY,
N_CAMP VARCHAR(50) CONSTRAINT NN_CAMPANYES_N_CAMP NOT NULL,
DURADA INT,
NVL_RECOMENAT INT,
CONSTRAINT CH_CAMPANYES_NVL_RECOMENAT CHECK (NVL_RECOMENAT BETWEEN 1 AND 10),
ID_MON INT,
CONSTRAINT FK_CAMPANYES_ID_MON FOREIGN KEY (ID_MON) REFERENCES MONS(ID_MON)
);

CREATE TABLE AVENTURES(
ID_AVENT INT CONSTRAINT PK_ID_AVENT PRIMARY KEY,
N_AVENT VARCHAR(50) CONSTRAINT NN_AVENURES_N_AVENT NOT NULL,
DIF INT,
CONSTRAINT CH_AVENTURES_DIF CHECK(DIF BETWEEN 10 AND 50),
DESCRIPCIO VARCHAR(255),
ID_MON INT,
CONSTRAINT FK_AVENTURES_ID_MON FOREIGN KEY (ID_MON) REFERENCES MONS(ID_MON),
ID_CAMP INT,
CONSTRAINT FK_AVENTURES_N_CAMP FOREIGN KEY (ID_CAMP) REFERENCES CAMPANYES(ID_CAMP)
);

--afegim 5 mons:
--1
INSERT INTO mons (ID_MON, N_MON, TIPUS, DESCRIPCIO)
VALUES (1, 'ASGARD', 'MITOLOGIA', 'EXPLORA ELS 9 REGNES AMB LES SEVES DEITATS.');
--2
INSERT INTO mons (ID_MON, N_MON, TIPUS, DESCRIPCIO)
VALUES (3, 'Gal�xia Perduda', 'Ci�ncia-ficci�', 'Explora planetes desconeguts i enfronta-te a alien�genes.');
--3
INSERT INTO mons (ID_MON, N_MON, TIPUS, DESCRIPCIO)
VALUES (4, 'Abisme Obscur', 'Terror', 'Sobreviu als horrors que s`amaguen en la foscor.');
--4
INSERT INTO mons (ID_MON, N_MON, TIPUS, DESCRIPCIO)
VALUES (5, 'Regne de Cristall', 'Fantasia', 'Descobreix els secrets dels antics MACGS i les seves runes.');
--5
INSERT INTO mons (ID_MON, N_MON, TIPUS, DESCRIPCIO)
VALUES (6, 'Frontier Techno', 'Cyberpunk', 'Navega per un m�n futurista dominat per corporacions i tecnologia avan�ada.');



--afegim 5 campanyes:
--1
INSERT INTO CAMPANYES (ID_CAMP ,N_CAMP, DURADA, NVL_RECOMENAT, ID_MON)
VALUES (1,'El despertar del drac', 30, 7, 1);
--2
INSERT INTO CAMPANYES (ID_CAMP,N_CAMP, DURADA, NVL_RECOMENAT, ID_MON)
VALUES (2,'La conquesta del rei', 45, 9, 1);
--3
INSERT INTO CAMPANYES (ID_CAMP,N_CAMP, DURADA, NVL_RECOMENAT, ID_MON)
VALUES (3,'Missi� Nova Terra', 60, 8, 3);
--4
INSERT INTO CAMPANYES (ID_CAMP,N_CAMP, DURADA, NVL_RECOMENAT, ID_MON)
VALUES (4,'La casa al final del cam�', 20, 6, 3);
--5
INSERT INTO CAMPANYES (ID_CAMP,N_CAMP, DURADA, NVL_RECOMENAT, ID_MON)
VALUES (5,'Els guardians de la rel�quia', 55, 10, 4);


--afegim 5 aventures:
--1
INSERT INTO AVENTURES (ID_AVENT, N_AVENT, DIF, DESCRIPCIO, ID_MON, ID_CAMP)
VALUES (1,'Bosc Encantat', 20, 'Travessa el bosc encantat ple de perills desconeguts.', 1, 1);
--2
INSERT INTO AVENTURES (ID_AVENT, N_AVENT, DIF, DESCRIPCIO, ID_MON, ID_CAMP)
VALUES (2,'Cova dels Secrets', 25, 'Explora la cova que amaga secrets antics i perillsos.', 1, 1);
--3
INSERT INTO AVENTURES (ID_AVENT, N_AVENT, DIF, DESCRIPCIO, ID_MON, ID_CAMP)
VALUES (3,'Torre sense fi', 30, 'Puja la torre defensada per monstres per trobar el tresor perdut.', 3, 3);
--4
INSERT INTO AVENTURES (ID_AVENT, N_AVENT, DIF, DESCRIPCIO, ID_MON, ID_CAMP)
VALUES (4,'Estaci� Espacial Alpha', 35, 'Recupera el control de l�estaci� espacial abans que sigui massa tard.', 4, 3);
--5
INSERT INTO AVENTURES (ID_AVENT, N_AVENT, DIF, DESCRIPCIO, ID_MON, ID_CAMP)
VALUES (5,'Cementiri oblidat', 40, 'Sobreviu una nit al cementiri mentre resols els misteris que cont�.', 5, 4);
--ELIMINACI� DE UN MON
/*
Seria aix�:
DELETE FROM MONS
WHERE ID_MON =1;
Per� en aquest cas no es pot perqu� aquest mon t� un ID utilitzat com a clau forana en altra campanya o aventura.
*/
--en aquest cas s� que es pot ja que el mon 6 no t� cap campanya ni aventura, per tant es pot eliminar per no ser utilizar cap dels seus atributs com a FK
DELETE FROM MONS
WHERE ID_MON =6;

--Adicci� nova fila a mons de la seva web oficial
ALTER TABLE MONS
ADD(URL VARCHAR(255));
--ACTUALITZAR UN DELS MONS POSANT-LI UNA URL
UPDATE MONS
SET URL = 'https://www.salvat.com/dungeons-dragons-284'
WHERE ID_MON = 1;
--ELIMINACI� TAULA AVENTURES
/*
ES POSIBLE JA QUE NO EXISTEIX ALTRE TAULA DEPENDENT DE ALGUNA DE LES CARACTER�STIQUES DE LA TAULA AVENTURES (CAP TAULA T� UN FK PROVINENT DE AVENTURES)
LA MILLOR SOLUCI� ES:
DROP TABLE AVENTURES;
*/

--MOSTRAR TOTES LES CAMPANYES AMB NIVELL IGUAL O SUPERIOR A 5
SELECT *
FROM CAMPANYES
WHERE NVL_RECOMENAT >=5;

--MODIFICACI� DE DEL NOM DE LA CAMPANYA AMB RESTRICCI� DE CLAU �NICA
ALTER TABLE CAMPANYES
ADD CONSTRAINT UK_CAMPANYES_NOM UNIQUE (N_CAMP);

--ADICCI� AFEGIR VALORACIO
ALTER TABLE AVENTURES
ADD(VALORACIO FLOAT DEFAULT 0);

--ELIMINACI� DE TOTS EL REGISTRES DE AVENTURES
DELETE FROM AVENTURES;




