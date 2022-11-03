--vanno implementati con i trigger i 9 vincoli di integrità dinamici--
-- ne ho fatti 11 --

--1) trigger che controllre che per ordine_contiene_menu il numero id menu standard da poter ordinare non superi un massimo di 10 --
--corretto--
CREATE OR REPLACE TRIGGER Check_menu
BEFORE INSERT ON Ordine_contiene_menu
FOR EACH ROW
DECLARE 
    check_ordine    EXCEPTION;
BEGIN
    IF :new.quantita_menu_std > 10
        THEN RAISE check_ordine;
    END IF;
EXCEPTION
    WHEN check_ordine
        THEN RAISE_APPLICATION_ERROR(-20001, 'Numero massimo di menù raggiunito');
END;
/

--2) trigger che non permette al dipendente di effettuare un turno di lavoro che va oltre le 8 ore --
--corretto--
CREATE OR REPLACE TRIGGER Check_turno
BEFORE INSERT ON TURNI
FOR EACH ROW 
DECLARE 
    durata_turno NUMBER := (cast(:new.ora_uscita as date)- cast(:new.ora_ingresso as date)) *24 *60;
    check_turno  EXCEPTION;
BEGIN
    IF durata_turno > 480
        THEN RAISE check_turno;
    END IF;
EXCEPTION
    WHEN check_turno
        THEN RAISE_APPLICATION_ERROR(-20002, 'Massimo ore di lavoro superate');
END;  
/                                            


--3) trigger che controlli che ogni stipendio insertio, per ogni tipo di mansione non sia al di sotto di una soglia base --
--  stabiliamo che i dipendenti hanno uno stipendio base di 1200 e i manager di 1600                                     --                                                         
--corretto--

CREATE OR REPLACE TRIGGER check_stipendio
BEFORE INSERT ON STIPENDIO
FOR EACH ROW
DECLARE 
    ruoloim         VARCHAR(10); 
    stip_base       NUMBER(6,2):= (:new.stipendio); 
    check_stipendio EXCEPTION; 
BEGIN 
    SELECT ruolo INTO ruoloim 
    FROM personale PR 
    WHERE PR.tessera = :new.codice_personale; 
    IF stip_base < 1200.00 AND ruoloim = 'Dipendente'
        THEN RAISE check_stipendio;
    ELSIF stip_base < 1600.00 AND ruoloim = 'Manager'
        THEN RAISE check_stipendio;
    END IF;
EXCEPTION 
    WHEN check_stipendio 
        THEN RAISE_APPLICATION_ERROR(-20003, 'Stipendio troppo basso per questo ruolo'); 
END;
/

--4) trigger di controllo, ovvero prima dell'inserimento dell'offerta nell'ordine verificare che sia legata ad un cliente iscritto --
--   i clienti normali non hanno accesso alle offerte  
-- corretto--
CREATE OR REPLACE TRIGGER Accesso_offerta
BEFORE INSERT ON ordine_contiene_offerte 
FOR EACH ROW
DECLARE
    email         VARCHAR(25);
    offerte       CHAR(5);
    check_accesso EXCEPTION;
BEGIN
    SELECT cliente, codice_offerta INTO email, offerte
    FROM ordine NATURAL JOIN offerte
    WHERE num_ordine = :new.ordine AND codice_offerta = :new.offerta; 


    IF email IS NULL AND offerte IS NOT NULL
        THEN RAISE check_accesso;
    END IF;
EXCEPTION
    WHEN check_accesso 
        THEN RAISE_APPLICATION_ERROR(-20004, 'Il cliente non è iscritto');
END;                                                                        
/

--5) trigger che controlla se un prodotto in magazzino è scaduto--
--      es.data_scadenza  < SYSDATE                              --
-- corretto -- 

CREATE OR REPLACE TRIGGER Check_Magazzino
BEFORE INSERT ON Lotto
FOR EACH ROW
DECLARE 
    check_scadenza   EXCEPTION;
BEGIN
    IF :new.scadenza_lotto < SYSDATE
        THEN RAISE check_scadenza;
    END IF;
EXCEPTION
    WHEN check_scadenza
        THEN RAISE_APPLICATION_ERROR(-20005, 'Prodotto inserito scaduto');
END;
/


--6) trigger che controlli che l'offerta inserita nell'ordine sia valida -- 
--corretto--

CREATE OR REPLACE TRIGGER Check_offerta_valida
    BEFORE INSERT ON ordine_contiene_offerte
    FOR EACH ROW
    DECLARE
        dataord         DATE;
        inizio          DATE;
        fine            DATE;
        check_offerta   EXCEPTION;
        contatore       NUMBER := 0;
        
    BEGIN
        
        SELECT count(*) INTO contatore
        FROM ordine 
        WHERE num_ordine = :new.ordine;
        
    IF (contatore > 0) THEN   
    	SELECT data_ordine, data_inizio, data_fine INTO dataord, inizio, fine
        FROM ordine NATURAL JOIN offerte
        WHERE num_ordine = :new.ordine AND codice_offerta = :new.offerta; 
        
        IF dataord NOT BETWEEN inizio AND fine
            THEN RAISE check_offerta;
        END IF;
    END IF;
        
    EXCEPTION
        WHEN check_offerta
            THEN RAISE_APPLICATION_ERROR(-20006, 'Offerta scaduta o non disponibile');
    END;
/


--7)trigger che controlla che nello stesso mese dello stesso anno non si possano inserire per lo stesso dipendente 2 stipendi --
--  n.b il mese dicembre è escluso da questo controllo perché avviene l'assegnazione della tredicesima quindi considerato come doppio stipendio --
--coretto--
CREATE OR REPLACE TRIGGER Check_doppio_stipendio
BEFORE INSERT ON Stipendio
FOR EACH ROW
DECLARE 
    ggstipendio     DATE := (:new.data_stipendio);
    contatore       NUMBER;
    check_doppio    EXCEPTION;
    tredicesima_ricevuta    EXCEPTION;
BEGIN
    SELECT count(*)  INTO contatore
    FROM stipendio
    WHERE codice_personale = :new.codice_personale AND to_char(ggstipendio, 'MM-YYYY') = to_char(data_stipendio, 'MM-YYYY');

    IF contatore >= 2 and to_char(ggstipendio, 'MM') = '12'
        THEN RAISE tredicesima_ricevuta;
    ELSIF contatore = 1 and to_char(ggstipendio, 'MM') <> '12'
        THEN RAISE check_doppio;
    END IF;

EXCEPTION
    WHEN check_doppio
        THEN RAISE_APPLICATION_ERROR(-20007, 'Stipendio già inserito per questo mese');
    WHEN tredicesima_ricevuta
        THEN RAISE_APPLICATION_ERROR(-20008, '----');
END;
/


--8)trigger che controlla l'età del dipendente assunto in modo che sia compresa tra i 18 e i 50 anni--
--corretto--
CREATE OR REPLACE TRIGGER Check_eta 
BEFORE INSERT ON Personale 
FOR EACH ROW 
DECLARE 
    eta NUMBER := FLOOR((SYSDATE - :new.data_di_nascita)/365);
    check_eta EXCEPTION;
BEGIN
    IF eta NOT BETWEEN 18 AND 50
        THEN RAISE check_eta;
    END IF;

EXCEPTION
    WHEN check_eta
        THEN RAISE_APPLICATION_ERROR(-20008, 'Età del dipendete non rientra nei criteri di assunzione');

END;
/


--9)trigger che segnala il numero massimo di dipendenti assumibili--
--corretto--
CREATE OR REPLACE TRIGGER Check_Max
BEFORE INSERT ON Personale 
FOR EACH ROW 
DECLARE 
    num_pers  NUMBER;
    check_max EXCEPTION;
BEGIN
    SELECT count(*)INTO num_pers 
    FROM Personale;
    IF num_pers >= 30
        THEN RAISE check_max;
    END IF;
EXCEPTION
    WHEN check_max
        THEN RAISE_APPLICATION_ERROR(-20009, 'Numero massimo di Personale raggiunto');
END;
/


--10) Controlla che non si può inserire un nuovo turno se il precedente non è terminato ancora  --
--    Chiaramente questo trigger è valido solo per i turni che terminano dopo la mezzanotte --
--    Se infatti assumiamo che la persona x abbia un turno che inizi alle 8pm del giorno 14/09 e termini alle ore 4am del giorno 15/09,
--    Non potrà essere inserito per la persona x un turno che inizi il 15/09 alle ore 2am poiché non si è ancora concluso---
--    Questo è dovuto al fatto che la tabella turni ha come chiave cod_personale, data_turno pertanto il trigger non ha ragione di esistere
--corretto--
CREATE OR REPLACE TRIGGER Check_Ultimo_Turno
BEFORE INSERT ON Turni
FOR EACH ROW
DECLARE
    fine_turno      turni.ora_uscita%Type;
    check_ultimo    EXCEPTION;
BEGIN  
    SELECT max(ora_uscita) INTO fine_turno
    FROM turni
    WHERE cod_personale = :new.cod_personale;

    IF fine_turno > :new.ora_ingresso
        THEN RAISE check_ultimo;
    END IF;
EXCEPTION
    WHEN check_ultimo
        THEN RAISE_APPLICATION_ERROR(-20010, 'Turno precedente non ancora concluso');
END;
/



--11) La cassa numero 0 è una cassa riservata esclusivamente al Manager  --
--corretto--
CREATE OR REPLACE TRIGGER Check_cassa
BEFORE INSERT ON Turni
FOR EACH ROW
DECLARE 
    ruoloim         varchar(10);
    cassa           char(2) := (:new.num_cassa);
    check_cassa     EXCEPTION;
BEGIN
    SELECT ruolo INTO ruoloim
    FROM personale PR
    where PR.tessera = :new.cod_personale;

    IF cassa <> '0' and ruoloim = 'Manager' 
        THEN RAISE check_cassa;
       ELSIF cassa = '0' and ruoloim <> 'Manager'
        THEN RAISE check_cassa; 
    END IF;
EXCEPTION
    WHEN check_cassa
        THEN RAISE_APPLICATION_ERROR(-20011, 'ERRORE, NUMERO CASSA SBAGLIATO');
END;





