CREATE TABLE biblioteka (
id_biblioteki INTEGER NOT NULL,
nazwa_biblioteki VARCHAR2(60 CHAR),
adres_biblioteki VARCHAR2(60 CHAR),
godziny_otwarcia DATE
);
ALTER TABLE biblioteka ADD CONSTRAINT biblioteka_pk PRIMARY KEY (
id_biblioteki );
CREATE TABLE klient (
id_klienta INTEGER NOT NULL,
imie VARCHAR2(30 CHAR),
nazwisko VARCHAR2(45 CHAR),
adres_zamieszkania VARCHAR2(45 CHAR)
);
ALTER TABLE klient ADD CONSTRAINT klient_pk PRIMARY KEY ( id_klienta );
CREATE TABLE ksiazka (
id_ksiazki INTEGER NOT NULL,
nazwa VARCHAR2(90 CHAR),
autor VARCHAR2(60 CHAR),
ilosc INTEGER,
biblioteka_id_biblioteki INTEGER NOT NULL
);
ALTER TABLE ksiazka ADD CONSTRAINT ksiazka_pk PRIMARY KEY ( id_ksiazki );
CREATE TABLE pracownik (
id_pracownika INTEGER NOT NULL,
imie VARCHAR2(30 CHAR),
nazwisko VARCHAR2(45 CHAR),
stanowisko VARCHAR2(30 CHAR),
biblioteka_id_biblioteki INTEGER NOT NULL
);
ALTER TABLE pracownik ADD CONSTRAINT pracownik_pk PRIMARY KEY (
id_pracownika );
CREATE TABLE wypozyczona (
ksiazka_id_ksiazki INTEGER NOT NULL,
zamowienie_id_zamowienia INTEGER NOT NULL,
ilosc INTEGER,
od_kiedy DATE,
do_kiedy DATE
);
ALTER TABLE wypozyczona ADD CONSTRAINT wypozyczona_pk PRIMARY KEY (
zamowienie_id_zamowienia,
ksiazka_id_ksiazki );
CREATE TABLE zamowienie (
klient_id_klienta INTEGER NOT NULL,
id_zamowienia INTEGER NOT NULL,
data_zlozenia DATE,
zrealizowane VARCHAR2(3 CHAR) NOT NULL,
adres_dostawy VARCHAR2(45 CHAR)
);
ALTER TABLE zamowienie ADD CONSTRAINT zamowienie_pk PRIMARY KEY (
id_zamowienia );
ALTER TABLE ksiazka
ADD CONSTRAINT ksiazka_biblioteka_fk FOREIGN KEY ( biblioteka_id_biblioteki )
REFERENCES biblioteka ( id_biblioteki );
ALTER TABLE pracownik
ADD CONSTRAINT pracownik_biblioteka_fk FOREIGN KEY ( biblioteka_id_biblioteki
)
REFERENCES biblioteka ( id_biblioteki );
ALTER TABLE wypozyczona
ADD CONSTRAINT wypozyczona_ksiazka_fk FOREIGN KEY ( ksiazka_id_ksiazki )
REFERENCES ksiazka ( id_ksiazki );
ALTER TABLE wypozyczona
ADD CONSTRAINT wypozyczona_zamowienie_fk FOREIGN KEY (
zamowienie_id_zamowienia )
REFERENCES zamowienie ( id_zamowienia );
ALTER TABLE zamowienie
ADD CONSTRAINT zamowienie_klient_fk FOREIGN KEY ( klient_id_klienta )
REFERENCES klient ( id_klienta );