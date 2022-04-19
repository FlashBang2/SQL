CREATE TABLE autor (
id INTEGER NOT NULL,
imię VARCHAR2(30 CHAR),
nazwisko VARCHAR2(45 CHAR) NOT NULL,
redaktor_id INTEGER NOT NULL
);
ALTER TABLE autor ADD CONSTRAINT autor_pk PRIMARY
KEY ( id );
CREATE TABLE drukarnia (
id INTEGER NOT NULL,
nazwa_drukarni VARCHAR2(75 CHAR) NOT NULL,
miejscowość VARCHAR2(75 CHAR),
książka_id INTEGER NOT NULL
);
ALTER TABLE drukarnia ADD CONSTRAINT drukarnia_pk
PRIMARY KEY ( id );
CREATE TABLE książka (
id INTEGER NOT NULL,
tytuł VARCHAR2(60 CHAR) NOT NULL,
gatunek VARCHAR2(30 CHAR)
);
ALTER TABLE książka ADD CONSTRAINT książka_pk
PRIMARY KEY ( id );
CREATE TABLE publikacja (
id INTEGER NOT NULL,
data_publikacji DATE NOT NULL,
rodzaj_publikacji VARCHAR2(30),
autor_id INTEGER NOT NULL,
książka_id INTEGER NOT NULL
);
ALTER TABLE publikacja ADD CONSTRAINT publikacja_pk
PRIMARY KEY ( id );
CREATE TABLE redaktor (
id INTEGER NOT NULL,
imię VARCHAR2(45 CHAR),
nazwisko VARCHAR2(75 CHAR) NOT NULL,
wydawnictwo_id INTEGER NOT NULL
);
ALTER TABLE redaktor ADD CONSTRAINT redaktor_pk
PRIMARY KEY ( id );
CREATE TABLE umowa (
id INTEGER NOT NULL,
data_zawarcia DATE NOT NULL,
honoraria VARCHAR2(90 CHAR),
autor_id INTEGER NOT NULL,
wydawnictwo_id INTEGER NOT NULL
);
ALTER TABLE umowa ADD CONSTRAINT umowa_pk
PRIMARY KEY ( id );
CREATE TABLE wydawnictwo (
id INTEGER NOT NULL,
nazwa_wydawnictwa VARCHAR2(100 CHAR) NOT NULL,
miejscowość VARCHAR2(75 CHAR)
);
ALTER TABLE wydawnictwo ADD CONSTRAINT
wydawnictwo_pk PRIMARY KEY ( id );
CREATE TABLE zlecenie_wydruku (
id INTEGER NOT NULL,
data_zlecenia DATE NOT NULL,
spodziewany_czas_zakończenia_wydruku DATE,
drukarnia_id INTEGER NOT NULL,
wydawnictwo_id INTEGER NOT NULL
);
ALTER TABLE zlecenie_wydruku ADD CONSTRAINT
zlecenie_wydruku_pk PRIMARY KEY ( id );
ALTER TABLE autor
ADD CONSTRAINT autor_redaktor_fk FOREIGN KEY (
redaktor_id )
REFERENCES redaktor ( id );
ALTER TABLE drukarnia
ADD CONSTRAINT drukarnia_książka_fk FOREIGN KEY (
książka_id )
REFERENCES książka ( id );
ALTER TABLE publikacja
ADD CONSTRAINT publikacja_autor_fk FOREIGN KEY (
autor_id )
REFERENCES autor ( id );
ALTER TABLE publikacja
ADD CONSTRAINT publikacja_książka_fk FOREIGN KEY (
książka_id )
REFERENCES książka ( id );
ALTER TABLE redaktor
ADD CONSTRAINT redaktor_wydawnictwo_fk FOREIGN
KEY ( wydawnictwo_id )
REFERENCES wydawnictwo ( id );
ALTER TABLE umowa
ADD CONSTRAINT umowa_autor_fk FOREIGN KEY (
autor_id )
REFERENCES autor ( id );
ALTER TABLE umowa
ADD CONSTRAINT umowa_wydawnictwo_fk FOREIGN
KEY ( wydawnictwo_id )
REFERENCES wydawnictwo ( id );
ALTER TABLE zlecenie_wydruku
ADD CONSTRAINT zlecenie_wydruku_drukarnia_fk
FOREIGN KEY ( drukarnia_id )
REFERENCES drukarnia ( id );
ALTER TABLE zlecenie_wydruku
ADD CONSTRAINT zlecenie_wydruku_wydawnictwo_fk
FOREIGN KEY ( wydawnictwo_id )
REFERENCES wydawnictwo ( id );