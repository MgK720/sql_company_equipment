INSERT INTO budynek (numer_budynku, funkcja) VALUES (1, 'pracowniczy');
INSERT INTO budynek (numer_budynku, funkcja) VALUES (2, 'magazynowy');
INSERT INTO budynek (numer_budynku, funkcja) VALUES (3, 'administracyjny');
INSERT INTO budynek (numer_budynku, funkcja) VALUES (4, 'tymczasowy');
INSERT INTO budynek (numer_budynku, funkcja) VALUES (5, 'hala');
INSERT INTO budynek (numer_budynku, funkcja) VALUES (6, 'opieka_medyczna');
INSERT INTO budynek (numer_budynku, funkcja) VALUES (7, 'edukacyjny');
INSERT INTO budynek (numer_budynku, funkcja) VALUES (8, 'produkcyjny');
INSERT INTO budynek (numer_budynku, funkcja) VALUES (9, 'mieszkalne');
INSERT INTO budynek (numer_budynku) VALUES (10);

INSERT INTO stopien_bezpieczenstwa (kod_bezpieczenstwa, nazwa) VALUES (1, 'gość');
INSERT INTO stopien_bezpieczenstwa (kod_bezpieczenstwa, nazwa) VALUES (2, 'pracownik');
INSERT INTO stopien_bezpieczenstwa (kod_bezpieczenstwa, nazwa) VALUES (3, 'pielegniarka');
INSERT INTO stopien_bezpieczenstwa (kod_bezpieczenstwa, nazwa) VALUES (4, 'administracja');
INSERT INTO stopien_bezpieczenstwa (kod_bezpieczenstwa, nazwa) VALUES (5, 'szef');
INSERT INTO stopien_bezpieczenstwa (kod_bezpieczenstwa, nazwa) VALUES (6, 'wlasciciel');

INSERT INTO pomieszczenie (id_pomieszczenia, numer, powierzchnia, numer_budynku, kod_bezpieczenstwa) VALUES (111, 1, 30, 1, 2);
INSERT INTO pomieszczenie (id_pomieszczenia, numer, powierzchnia, numer_budynku, kod_bezpieczenstwa) VALUES (222, 3, 10, 7, 2);
INSERT INTO pomieszczenie (id_pomieszczenia, numer, powierzchnia, numer_budynku, kod_bezpieczenstwa) VALUES (333, 7, 15, 3, 4);
INSERT INTO pomieszczenie (id_pomieszczenia, numer, powierzchnia, numer_budynku, kod_bezpieczenstwa) VALUES (444, 8, 38, 9, 1);
INSERT INTO pomieszczenie (id_pomieszczenia, numer, powierzchnia, numer_budynku, kod_bezpieczenstwa) VALUES (555, 9, 40, 2, 2);
INSERT INTO pomieszczenie (id_pomieszczenia, numer, powierzchnia, numer_budynku, kod_bezpieczenstwa) VALUES (666, 12, 20, 6, 3);
INSERT INTO pomieszczenie (id_pomieszczenia, numer, powierzchnia, numer_budynku, kod_bezpieczenstwa) VALUES (777, 14, 50, 5, 2);
INSERT INTO pomieszczenie (id_pomieszczenia, numer, powierzchnia, numer_budynku, kod_bezpieczenstwa) VALUES (888, 21, 60, 5, 2);
-- 4 administracja
-- 3 pielegniarka
-- 2 pracownik
-- 1 mieszkaniec

INSERT INTO sprzet (id_sprzetu, marka, nazwa, id_pomieszczenia) VALUES (1, 'Bosch', 'wiertarka', 777);
INSERT INTO sprzet (id_sprzetu, marka, nazwa, id_pomieszczenia) VALUES (2, 'Bosch', 'wkretarka', 777);
INSERT INTO sprzet (id_sprzetu, marka, nazwa, id_pomieszczenia) VALUES (3, 'Bosch', 'mlot', 888);
INSERT INTO sprzet (id_sprzetu, marka, nazwa, id_pomieszczenia) VALUES (4, 'MANA', 'frezarka', 888);
INSERT INTO sprzet (id_sprzetu, marka, nazwa, id_pomieszczenia) VALUES (5, 'HP', 'laptop', 222);
INSERT INTO sprzet (id_sprzetu, marka, nazwa, id_pomieszczenia) VALUES (6, 'DELL', 'PC', 666);
INSERT INTO sprzet (id_sprzetu, marka, nazwa, id_pomieszczenia) VALUES (7, 'DELL', 'laptop', 333);
INSERT INTO sprzet (id_sprzetu, marka, nazwa, id_pomieszczenia) VALUES (8, 'BERNARDO', 'szlifierka', 888);
INSERT INTO sprzet (id_sprzetu, nazwa, id_pomieszczenia) VALUES (9, 'pralka', 222);


INSERT INTO pracownik (id_pracownik, imie, nazwisko, kod_bezpieczenstwa) VALUES (1, 'Andrzej', 'Domek', 4);
INSERT INTO pracownik (id_pracownik, imie, nazwisko, kod_bezpieczenstwa) VALUES (2, 'Tomasz', 'Domek', 2);
INSERT INTO pracownik (id_pracownik, imie, nazwisko, kod_bezpieczenstwa) VALUES (3, 'Florian', 'Piotrowski', 2);
INSERT INTO pracownik (id_pracownik, imie, nazwisko, kod_bezpieczenstwa) VALUES (4, 'Denis', 'Stepien', 2);
INSERT INTO pracownik (id_pracownik, imie, nazwisko, kod_bezpieczenstwa) VALUES (5, 'Marian', 'Marciniak', 2);
INSERT INTO pracownik (id_pracownik, imie, nazwisko, kod_bezpieczenstwa) VALUES (6, 'Karol', 'Lis', 2);
INSERT INTO pracownik (id_pracownik, imie, nazwisko, kod_bezpieczenstwa) VALUES (7, 'Monika', 'Polak', 3);
INSERT INTO pracownik (id_pracownik, imie, nazwisko, kod_bezpieczenstwa) VALUES (8, 'Julia', 'Kowalska', 3);
INSERT INTO pracownik (id_pracownik, imie, nazwisko, kod_bezpieczenstwa) VALUES (9, 'Konrad', 'Sobczak', 2);
INSERT INTO pracownik (id_pracownik, imie, nazwisko, kod_bezpieczenstwa) VALUES (10, 'Mariusz', 'Sobczak', 2);
INSERT INTO pracownik (id_pracownik, imie, nazwisko, kod_bezpieczenstwa) VALUES (11, 'Kryspin', 'Chmielewski', 4);


INSERT INTO sprzet_pracownik (id_sprzetu, id_pracownik) VALUES (1, 3);
INSERT INTO sprzet_pracownik (id_sprzetu, id_pracownik) VALUES (1, 4);
INSERT INTO sprzet_pracownik (id_sprzetu, id_pracownik) VALUES (2, 5);
INSERT INTO sprzet_pracownik (id_sprzetu, id_pracownik) VALUES (3, 3);
INSERT INTO sprzet_pracownik (id_sprzetu, id_pracownik) VALUES (4, 6);
INSERT INTO sprzet_pracownik (id_sprzetu, id_pracownik) VALUES (5, 8);
INSERT INTO sprzet_pracownik (id_sprzetu, id_pracownik) VALUES (6, 7);
INSERT INTO sprzet_pracownik (id_sprzetu, id_pracownik) VALUES (6, 8);
INSERT INTO sprzet_pracownik (id_sprzetu, id_pracownik) VALUES (7, 1);
INSERT INTO sprzet_pracownik (id_sprzetu, id_pracownik) VALUES (8, 4);






