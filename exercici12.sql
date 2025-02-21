
CREATE TABLE propietari(
    nif       CHAR(9)
	CONSTRAINT PK_propietari PRIMARY KEY,
    nom       VARCHAR2 (30)
CONSTRAINT NN_propietari_nom NOT NULL,
    cognom_1  VARCHAR2 (30) 
CONSTRAINT NN_propietari_cognom1 NOT NULL,
    cognom_2  VARCHAR2 (30)

);


CREATE TABLE cotxe(
    id_cotxe           CHAR(7)
		CONSTRAINT PK_cotxe PRIMARY KEY,
    matricula          VARCHAR2(10)
		CONSTRAINT NN_cotxe_matricula NOT NULL
		CONSTRAINT UN_cotxe_matricula UNIQUE,
    data_matriculacio  DATE,
    places             NUMBER(2),
    servei_public      CHAR(1),
    nif                CHAR(9)
		CONSTRAINT NN_cotxe_nif NOT NULL
		CONSTRAINT FK_cotxe REFERENCES propietari(nif)
);


CREATE TABLE sinistre(
    id_sinistre    CHAR(7)
	CONSTRAINT PK_sinistre PRIMARY KEY,
    data_sinistre  DATE,
    lloc_sinistre  VARCHAR2(100),
    victimes       CHAR(1) DEFAULT 'N',
    informe        VARCHAR2(500)
);

CREATE TABLE involucrar(
    id_cotxe     CHAR(7),
    id_sinistre  CHAR(7),
    	
   CONSTRAINT PK_involucrar PRIMARY KEY(id_cotxe,id_sinistre),
   CONSTRAINT FK1_involucrar FOREIGN KEY(id_cotxe)
        REFERENCES cotxe(id_cotxe),
   CONSTRAINT FK2_involucrar FOREIGN KEY(id_sinistre)
        REFERENCES sinistre(id_sinistre)

);
--d
ALTER TABLE cotxe
MODIFY(DATa_MATRICULACIO CONSTRAINT NN_cotxe_data_matriculacio NOT NULL);
--e
ALTER TABLE cotxe
ADD CONSTRAINT FK_cotxe FOREIGN KEY (nif) REFERENCES propietari (nif) ON DELETE CASCADE;
--g
ALTER TABLE sinistre
ADD CONSTRAINT CH_sinistre_victimes CHECK(victimes='S' or victimes='N');
-- seria equivalent-> CHECK(victimes IN('S','N'));
--h
SELECT *
FROM USER_CONSTRAINTS;
WHERE table_name='SINISTRE';
--esto es para consultar el diccionario de alguna tabla en específico
--i
ALTER TABLE cotxe
MODIFY (places NUMBER(3) DEFAULT 4);
describe cotxe;--para comprobar
--como recordatorio, el number es el length del numero como max
--j
ALTER TABLE cotxe
DROP CONSTRAINT NN_cotxe_matricula;
describe cotxe;
--k
ALTER TABLE sinistre
ADD CONSTRAINT CH_sinistre_lloc_sinistre CHECK(lloc_sinistre IN('Barcelona',
'Mataró', 'Vilassar', 'Badalona', 'Argentona'));
--l DESACTIVAR NO ELIMINAR LA RESTRICCIO ANTERIOR
ALTER TABLE sinistre
DISABLE CONSTRAINT CH_sinistre_lloc_sinistre;
--m
ALTER TABLE sinistre
ADD (tancament_expedient DATE);
DESCRIBE sinistre;
--n
ALTER TABLE sinistre
MODIFY(lloc_sinistre VARCHAR2(30));
--o
ALTER TABLE sinistre
ADD (danys VARCHAR2(30));
describe sinistre;
--p
ALTER TABLE sinistre
SET UNUSED (danys);
describe sinistre;
--q
select*
from user_tab_columns
where table_name='SINISTRE';
-- no es veu, es com si la haguèssim borrat
--r
ALTER TABLE sinistre
DROP UNUSED COLUMNS;
--s no es pot perquè hi ha una clau forana que la referencia, hauria de eliminar
-- les restriccions ooooo...
DROP TABLE sinistre CASCADE CONSTRAINTS PURGE;
--t
RENAME cotxe to cotxes;
--u
COMMENT ON TABLE involucrar
IS '';
select *
from user_tab_comments
where table_name='INVOLUCRAR'




