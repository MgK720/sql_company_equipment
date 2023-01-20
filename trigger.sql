--1. Archiwizuje dane o pracownikach administracji
SET client_encoding TO 'UTF-8';
CREATE TABLE nowy_pracownik_log(
	id_pracownik integer, 
	imie varchar(20), 
	nazwisko varchar(20),
	kod_bezpieczenstwa integer,
	data timestamp
);
CREATE FUNCTION archiwizuj()
	RETURNS TRIGGER AS $$
BEGIN
	IF new.kod_bezpieczenstwa=4
	THEN INSERT INTO nowy_pracownik_log VALUES (new.id_pracownik, new.imie, new.nazwisko, new.kod_bezpieczenstwa, current_timestamp);
	RAISE NOTICE 'nowy pracownik administracji';
	END IF;
	RETURN NULL;
END
$$ LANGUAGE 'plpgsql'
;

CREATE TRIGGER archiwizuj
	AFTER INSERT OR UPDATE ON pracownik
FOR EACH ROW EXECUTE PROCEDURE archiwizuj()
;

--2. Nie pozwoli na dodanie pomieszczenia o powierzchni równej zero
SET client_encoding TO 'UTF-8';
CREATE FUNCTION sprawdzanie_powierzchni_pomieszczenia()
    RETURNS TRIGGER
AS $$
BEGIN
    IF new.powierzchnia=0 THEN
        RAISE EXCEPTION 'Powierzchnia nie może wynosić 0';
    END IF;
    RETURN new;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER pomieszczenie_sprawdzanie
	BEFORE INSERT OR UPDATE
	ON pomieszczenie
	FOR EACH ROW
		EXECUTE PROCEDURE sprawdzanie_powierzchni_pomieszczenia();
 