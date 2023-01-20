CREATE TABLE budynek
(
    numer_budynku       serial,
    funkcja             varchar(20),     
    CONSTRAINT          budynek_pk          PRIMARY KEY(numer_budynku)
);
CREATE TABLE stopien_bezpieczenstwa
(
    kod_bezpieczenstwa  int                 NOT NULL,
    nazwa               varchar(20)         NOT NULL,
    CONSTRAINT          stopien_bezp_pk     PRIMARY KEY(kod_bezpieczenstwa)
);

CREATE TABLE pomieszczenie
(
    id_pomieszczenia    serial,
    numer               integer             NOT NULL,
    powierzchnia        integer             NOT NULL,
    numer_budynku       integer             NOT NULL,
    kod_bezpieczenstwa  integer             NOT NULL,
    CONSTRAINT          pomieszczenie_pk    PRIMARY KEY(id_pomieszczenia),
    CONSTRAINT          pomieszczenie_numer_fk  FOREIGN KEY(numer_budynku)
                                                    REFERENCES budynek(numer_budynku),
    CONSTRAINT          pomieszczenie_kod_fk    FOREIGN KEY(kod_bezpieczenstwa)
                                                REFERENCES stopien_bezpieczenstwa(kod_bezpieczenstwa)
);

CREATE TABLE sprzet
(
    id_sprzetu          serial,
    marka               varchar(20),
    nazwa               varchar(20)         NOT NULL,
    id_pomieszczenia    integer             NOT NULL,
    CONSTRAINT          sprzet_pk           PRIMARY KEY(id_sprzetu),
    CONSTRAINT          sprzet_fk           FOREIGN KEY(id_pomieszczenia)
                                                REFERENCES pomieszczenie(id_pomieszczenia)
);

CREATE TABLE pracownik
(
    id_pracownik        serial,
    imie                varchar(20),
    nazwisko            varchar(20),
    kod_bezpieczenstwa  integer             NOT NULL,
    CONSTRAINT          pracownik_pk        PRIMARY KEY(id_pracownik),
    CONSTRAINT          pracownik_fk        FOREIGN KEY(kod_bezpieczenstwa)
                                                REFERENCES stopien_bezpieczenstwa(kod_bezpieczenstwa)
);

CREATE TABLE sprzet_pracownik
(
    id_sprzetu          integer,
    id_pracownik        integer,
    CONSTRAINT          sprzet_pracownik_pk PRIMARY KEY(id_sprzetu, id_pracownik),
    CONSTRAINT		sprzet_pracownik_pracownik_fk FOREIGN KEY(id_pracownik)
				REFERENCES pracownik(id_pracownik) ON DELETE CASCADE,
    CONSTRAINT 		sprzet_pracownik_sprzet_fk FOREIGN KEY(id_sprzetu)
				REFERENCES sprzet(id_sprzetu) ON DELETE CASCADE
);


CREATE VIEW administracja AS
SELECT imie, nazwisko
FROM pracownik
WHERE kod_bezpieczenstwa = 4;
