CREATE TABLE ocena (
id INTEGER NOT NULL,
waga INTEGER,
wartość INTEGER NOT NULL,
data_wpisania DATE,
protokół_id INTEGER NOT NULL
);
ALTER TABLE ocena ADD CONSTRAINT ocena_pk PRIMARY
KEY ( id );
CREATE TABLE protokół (
id INTEGER NOT NULL,
nazwa VARCHAR2(45 CHAR) NOT NULL,
data_wprowadzenia DATE,
status VARCHAR2(30 CHAR),
prowadzący_id INTEGER NOT NULL
);
CREATE UNIQUE INDEX protokół__idx ON
protokół (
prowadzący_id
ASC );
ALTER TABLE protokół ADD CONSTRAINT protokół_pk
PRIMARY KEY ( id );
CREATE TABLE prowadzący (
id INTEGER NOT NULL,
imię VARCHAR2(45),
nazwisko VARCHAR2(45 CHAR) NOT NULL,
tytuł VARCHAR2(45 CHAR),
protokół_id INTEGER NOT NULL,
zajęcia_id INTEGER NOT NULL
);
CREATE UNIQUE INDEX prowadzący__idx ON
prowadzący (
zajęcia_id
ASC );
CREATE UNIQUE INDEX prowadzący__idxv1 ON
prowadzący (
protokół_id
ASC );
ALTER TABLE prowadzący ADD CONSTRAINT prowadzący_pk
PRIMARY KEY ( id );
CREATE TABLE przedmiot (
id INTEGER NOT NULL,
nazwa VARCHAR2(45 CHAR) NOT NULL,
czas_trwania VARCHAR2(30 CHAR),
waga INTEGER
);
ALTER TABLE przedmiot ADD CONSTRAINT przedmiot_pk
PRIMARY KEY ( id );
CREATE TABLE student (
id INTEGER NOT NULL,
imię VARCHAR2(45 CHAR),
nazwisko VARCHAR2(45 CHAR) NOT NULL,
klasa VARCHAR2(30 CHAR)
);
ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY
KEY ( id );
CREATE TABLE wniosek (
id INTEGER NOT NULL,
nazwa VARCHAR2(45 CHAR) NOT NULL,
data_zlożenia DATE,
wybory_studenta VARCHAR2(45 CHAR),
student_id INTEGER NOT NULL,
przedmiot_id INTEGER NOT NULL
);
ALTER TABLE wniosek ADD CONSTRAINT wniosek_pk
PRIMARY KEY ( id );
CREATE TABLE zajęcia (
id INTEGER NOT NULL,
nazwa VARCHAR2(45 CHAR) NOT NULL,
typ_zajęć VARCHAR2(45 CHAR),
ilość INTEGER,
przedmiot_id INTEGER NOT NULL,
prowadzący_id INTEGER NOT NULL
);
CREATE UNIQUE INDEX zajęcia__idx ON
zajęcia (
prowadzący_id
ASC );
ALTER TABLE zajęcia ADD CONSTRAINT zajęcia_pk PRIMARY
KEY ( id );
ALTER TABLE ocena
ADD CONSTRAINT ocena_protokół_fk FOREIGN KEY (
protokół_id )
REFERENCES protokół ( id );
ALTER TABLE protokół
ADD CONSTRAINT protokół_prowadzący_fk FOREIGN KEY (
prowadzący_id )
REFERENCES prowadzący ( id );
ALTER TABLE prowadzący
ADD CONSTRAINT prowadzący_protokół_fk FOREIGN KEY (
protokół_id )
REFERENCES protokół ( id );
ALTER TABLE prowadzący
ADD CONSTRAINT prowadzący_zajęcia_fk FOREIGN KEY (
zajęcia_id )
REFERENCES zajęcia ( id );
ALTER TABLE wniosek
ADD CONSTRAINT wniosek_przedmiot_fk FOREIGN KEY (
przedmiot_id )
REFERENCES przedmiot ( id );
ALTER TABLE wniosek
ADD CONSTRAINT wniosek_student_fk FOREIGN KEY (
student_id )
REFERENCES student ( id );
ALTER TABLE zajęcia
ADD CONSTRAINT zajęcia_prowadzący_fk FOREIGN KEY (
prowadzący_id )
REFERENCES prowadzący ( id );
ALTER TABLE zajęcia
ADD CONSTRAINT zajęcia_przedmiot_fk FOREIGN KEY (
przedmiot_id )
REFERENCES przedmiot ( id );
