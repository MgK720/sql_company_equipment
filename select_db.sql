--1.Wyświetlenie informacji o sprzęcie z informacją w którym znajduje się pomieszczeniu.
SELECT sprzet.id_sprzetu, sprzet.marka, sprzet.nazwa, pomieszczenie.numer, pomieszczenie.numer_budynku 
FROM sprzet INNER JOIN pomieszczenie ON sprzet.id_pomieszczenia=pomieszczenie.id_pomieszczenia;

--2.Wyświetlenie informacji o pracowniku z informacją jaki ma kod bezpieczeństwa i nazwę "stanowiska"
SELECT pracownik.id_pracownik, pracownik.imie, pracownik.nazwisko, pracownik.kod_bezpieczenstwa, stopien_bezpieczenstwa.nazwa 
FROM pracownik, stopien_bezpieczenstwa WHERE pracownik.kod_bezpieczenstwa=stopien_bezpieczenstwa.kod_bezpieczenstwa;

--3.Wyświetlanie ilu pracowników ma dany kod bezpieczeństwa
SELECT kod_bezpieczenstwa, count(*) FROM pracownik GROUP by  kod_bezpieczenstwa order by kod_bezpieczenstwa;

--4.Wyświetlanie który pracownik ma jaki sprzęt (wiele - wielu) 
SELECT pracownik.imie, pracownik.nazwisko, sprzet.id_sprzetu, sprzet.marka, sprzet.nazwa 
	FROM  ((pracownik INNER join sprzet_pracownik 
	ON pracownik.id_pracownik=sprzet_pracownik.id_pracownik
	) INNER JOIN sprzet 
	ON sprzet_pracownik.id_sprzetu=sprzet.id_sprzetu);


--5.Wyświetlanie ilu pracowników ma dany kod bezpieczeństwa (z uwzględnieniem wszystkich mozliwych kodów a nie tylko tych przydzielonych - zastosowanie FULL JOIN)
SELECT stopien_bezpieczenstwa.kod_bezpieczenstwa, count(pracownik.kod_bezpieczenstwa) as liczba_osob 
FROM pracownik FULL JOIN stopien_bezpieczenstwa ON pracownik.kod_bezpieczenstwa=stopien_bezpieczenstwa.kod_bezpieczenstwa 
GROUP BY stopien_bezpieczenstwa.kod_bezpieczenstwa order by kod_bezpieczenstwa;


--6.Wyświetlanie powierzchni budynku (suma powierzchni pomieszczeń w danym budynku)
SELECT numer_budynku, sum(powierzchnia) as calkowita_powierzchnia from pomieszczenie GROUP by numer_budynku;

--7.Wyświetlanie pracowników, których nazwisko rozpoczyna się na literę "P"
SELECT * from pracownik WHERE nazwisko LIKE 'P%';

--8.Wyświetlenie pracowników którzy nie mają przydzielonego sprzętu
SELECT imie, nazwisko FROM pracownik P
   WHERE NOT EXISTS (
   SELECT *
     FROM sprzet S INNER JOIN sprzet_pracownik SP
     ON  P.id_pracownik=SP.id_pracownik
     AND S.id_sprzetu=SP.id_sprzetu
)
;


--9.Wyświetlenie pracowników którzy mają przydzielony sprzęt
SELECT imie, nazwisko FROM pracownik P
   WHERE EXISTS (
   SELECT *
     FROM sprzet S INNER JOIN sprzet_pracownik SP
     ON  P.id_pracownik=SP.id_pracownik
     AND S.id_sprzetu=SP.id_sprzetu
)
;

--10.Wyświetlanie jakie kody bezpieczeństwa nie są przypisane do żadnych pracowników
SELECT kod_bezpieczenstwa, nazwa FROM stopien_bezpieczenstwa
  WHERE kod_bezpieczenstwa NOT IN (
    SELECT kod_bezpieczenstwa FROM pracownik
    )
      ORDER BY nazwa
;


--11.Wyświetlenie sprzętów, które posiadają marke
Select * from sprzet where marka is not null ;

--12.Użycie perspektywy (wyswietlenie pracowników którzy mają kod_bezpieczenstwa równy 4 [administracja])
SELECT * from administracja;

--13.Usuwanie pracownika z tabeli
DELETE FROM pracownik WHERE id_pracownik=2;

--14.Dodanie i aktualizaja danych pracownika
INSERT INTO pracownik (id_pracownik, imie, nazwisko, kod_bezpieczenstwa) VALUES (2, 'Tomasz', 'Piontek', 2);
UPDATE pracownik SET nazwisko='Piątek' where id_pracownik=2;

