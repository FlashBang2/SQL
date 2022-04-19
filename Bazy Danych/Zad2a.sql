CREATE TABLE lekarz (
id INTEGER NOT NULL,
imie VARCHAR2(30 CHAR),
nazwisko VARCHAR2(30 CHAR) NOT NULL
);
ALTER TABLE lekarz ADD CONSTRAINT lekarz_pk PRIMARY
KEY ( id );
CREATE TABLE pacjent (
id INTEGER NOT NULL,
imie VARCHAR2(30 CHAR),
nazwisko VARCHAR2(30 CHAR) NOT NULL
);
ALTER TABLE pacjent ADD CONSTRAINT pacjent_pk
PRIMARY KEY ( id );
CREATE TABLE przychodnia (
id INTEGER NOT NULL,
nazwa_przychodni VARCHAR2(30 CHAR),
adres_przychodni VARCHAR2(45 CHAR) NOT NULL
);
ALTER TABLE przychodnia ADD CONSTRAINT
przychodnia_pk PRIMARY KEY ( id );
CREATE TABLE recepta (
id_recepty INTEGER NOT NULL,
nazwa_recepty VARCHAR2(45 CHAR) NOT NULL,
skład VARCHAR2(100 CHAR),
lekarz_id INTEGER NOT NULL,
pacjent_id INTEGER NOT NULL
);
ALTER TABLE recepta ADD CONSTRAINT recepta_pk
PRIMARY KEY ( id_recepty );
CREATE TABLE rejestracja (
pacjent_id INTEGER NOT NULL,
przychodnia_id INTEGER NOT NULL,
data_rejestracji DATE NOT NULL,
typ_rejestracji VARCHAR2(30 CHAR)
);
ALTER TABLE rejestracja ADD CONSTRAINT rejestracja_pk
PRIMARY KEY ( pacjent_id,
przychodnia_id );
CREATE TABLE umowa (
id INTEGER NOT NULL,
data_zawarcia DATE NOT NULL,
wynagrodzenie VARCHAR2(45 CHAR),
przychodnia_id INTEGER NOT NULL,
lekarz_id INTEGER NOT NULL
);
ALTER TABLE umowa ADD CONSTRAINT umowa_pk
PRIMARY KEY ( id );
CREATE TABLE wizyta (
id_wizyty INTEGER NOT NULL,
pacjent_id INTEGER NOT NULL,
lekarz_id INTEGER NOT NULL,
termin_wizyty DATE NOT NULL,
status VARCHAR2(30 CHAR) NOT NULL
);
ALTER TABLE wizyta
ADD CONSTRAINT wizyta_pk PRIMARY KEY ( lekarz_id,
id_wizyty,
pacjent_id );
ALTER TABLE recepta
ADD CONSTRAINT recepta_lekarz_fk FOREIGN KEY (
lekarz_id )
REFERENCES lekarz ( id );
ALTER TABLE recepta
ADD CONSTRAINT recepta_pacjent_fk FOREIGN KEY (
pacjent_id )
REFERENCES pacjent ( id );
ALTER TABLE rejestracja
ADD CONSTRAINT rejestracja_pacjent_fk FOREIGN KEY (
pacjent_id )
REFERENCES pacjent ( id );
ALTER TABLE rejestracja
ADD CONSTRAINT rejestracja_przychodnia_fk FOREIGN
KEY ( przychodnia_id )
REFERENCES przychodnia ( id );
ALTER TABLE umowa
ADD CONSTRAINT umowa_lekarz_fk FOREIGN KEY (
lekarz_id )
REFERENCES lekarz ( id );
ALTER TABLE umowa
ADD CONSTRAINT umowa_przychodnia_fk FOREIGN KEY
( przychodnia_id )
REFERENCES przychodnia ( id );
ALTER TABLE wizyta
ADD CONSTRAINT wizyta_lekarz_fk FOREIGN KEY (
lekarz_id )
REFERENCES lekarz ( id );
ALTER TABLE wizyta
ADD CONSTRAINT wizyta_pacjent_fk FOREIGN KEY (
pacjent_id )
REFERENCES pacjent ( id );