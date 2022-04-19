CREATE TABLE korporacja
(
id INTEGER NOT NULL,
nazwa VARCHAR2(45 CHAR) NOT NULL,
adres VARCHAR2(45 CHAR),
nr_telefonu VARCHAR2(45 CHAR)
);
ALTER TABLE korporacja ADD CONSTRAINT korporacja_pk
PRIMARY KEY ( id );
CREATE TABLE pracownik
(
id INTEGER NOT NULL,
nazwisko_imię VARCHAR2(60 CHAR) NOT NULL,
stanowisko VARCHAR2(45 CHAR),
nr_telefonu VARCHAR2(45 CHAR),
zakład_id INTEGER NOT NULL
);
ALTER TABLE pracownik ADD CONSTRAINT pracownik_pk
PRIMARY KEY ( id );
CREATE TABLE samochód
(
id INTEGER NOT NULL,
nazwa_samochodu VARCHAR2(45 CHAR) NOT NULL,
typ VARCHAR2(45 CHAR),
data_produkcji DATE
);
ALTER TABLE samochód ADD CONSTRAINT samochód_pk
PRIMARY KEY ( id );
CREATE TABLE wniosek
(
id INTEGER NOT NULL,
data_złożenia DATE NOT NULL,
data_finalizacji DATE NOT NULL,
pracownik_id INTEGER NOT NULL,
z_na_samochód_id INTEGER NOT NULL
);
ALTER TABLE wniosek ADD CONSTRAINT wniosek_pk PRIMARY
KEY ( id );
CREATE TABLE zakład
(
id INTEGER NOT NULL,
nazwa VARCHAR2(45 CHAR) NOT NULL,
adress VARCHAR2(45 CHAR),
nr_telefonu VARCHAR2(45 CHAR),
korporacja_id INTEGER NOT NULL
);
ALTER TABLE zakład ADD CONSTRAINT zakład_pk PRIMARY KEY
( id );
CREATE TABLE zapotrzebowania_na_samochód
(
id INTEGER NOT NULL,
data_zapotrzebwania DATE NOT NULL,
data_zwrotu DATE NOT NULL,
ilość INTEGER,
typ_samochodu VARCHAR2(45 CHAR),
samochód_id INTEGER NOT NULL
);
ALTER TABLE zapotrzebowania_na_samochód ADD CONSTRAINT
zapotrzebowania_na_samochód_pk PRIMARY KEY ( id );
ALTER TABLE pracownik
ADD CONSTRAINT pracownik_zakład_fk FOREIGN KEY (
zakład_id )
REFERENCES zakład ( id );
ALTER TABLE wniosek
ADD CONSTRAINT w_z_na_samochód_fk FOREIGN KEY (
z_na_samochód_id )
REFERENCES zapotrzebowania_na_samochód ( id );
ALTER TABLE wniosek
ADD CONSTRAINT wniosek_pracownik_fk FOREIGN KEY (
pracownik_id )
REFERENCES pracownik ( id );
ALTER TABLE zapotrzebowania_na_samochód
ADD CONSTRAINT z_na_samochód_fk FOREIGN KEY (
samochód_id )
REFERENCES samochód ( id );
ALTER TABLE zakład
ADD CONSTRAINT zakład_korporacja_fk FOREIGN KEY (
korporacja_id )
REFERENCES korporacja ( id );