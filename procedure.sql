--le 6 operazioni degli utenti vanno implementate con procedure o funzioni--


--1) procedura che attribuisce un bonus del 20% allo stipendio attuale del dipendente (manager esclusi) che nel mese precedente ha fatto più ordini
--   a parità di ordini si prende il dipendente con più ore lavorative 
--   si seleziona l'addetto che è stato già stipendiato il mese precedente a quello attuale 
--  non ho bisogno di selezionare esplicitamente i dipendenti pioché gli ordini sono effettuati esclusivamente da essi

CREATE OR REPLACE PROCEDURE BonusCassiere
IS
    Cassiere CHAR(6); 

BEGIN
  FOR i IN (  
    SELECT sum(((cast(ora_uscita as date) - cast(ora_ingresso as date)) * 24)), cod_personale
    FROM turni 
    WHERE cod_personale IN (SELECT addetto
                            FROM  ordine ord JOIN personale pr ON ord.addetto = pr.tessera JOIN stipendio ST ON st.codice_personale = pr.tessera
                            WHERE to_char(ADD_MONTHS(SYSDATE, -1), 'MM-YYYY') = to_char(data_ordine,  'MM-YYYY') AND to_char(ADD_MONTHS(SYSDATE, -1), 'MM-YYYY') = to_char(data_stipendio,  'MM-YYYY')
                            GROUP BY addetto 
                            HAVING count(*) = (SELECT max(count(*))
                                               FROM  ordine ord JOIN personale pr ON ord.addetto = pr.tessera JOIN stipendio ST ON st.codice_personale = pr.tessera
                                               WHERE to_char(ADD_MONTHS(SYSDATE, -1), 'MM-YYYY') = to_char(data_ordine,  'MM-YYYY') AND to_char(ADD_MONTHS(SYSDATE, -1), 'MM-YYYY') = to_char(data_stipendio,  'MM-YYYY')
                                               GROUP BY addetto
                                              ))
    GROUP BY cod_personale
   )
   LOOP                                                                                                       

    SELECT cod_personale INTO  Cassiere
    FROM turni
    WHERE cod_personale = i.cod_personale
    GROUP BY cod_personale 
    HAVING sum(((cast(ora_uscita as date) - cast(ora_ingresso as date)) * 24)) IN ( SELECT max(sum(((cast(ora_uscita as date) - cast(ora_ingresso as date)) * 24)))
                                                                                   FROM turni 
                                                                                   WHERE cod_personale = i.cod_personale
                                                                                   GROUP BY cod_personale
                                                                                   );
    
   END LOOP;
        
    UPDATE Stipendio SET Stipendio = ( Stipendio + (Stipendio * 0.2)) Where codice_personale = cassiere;
    UPDATE Stipendio SET data_stipendio = SYSDATE Where codice_personale = cassiere;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Bonus del cassiere ' ||cassiere|| ' inserito con successo allo stipendio');

END;                                                                               
/


--2)procedura che calcola il prezzo totale di un ordine prendendo in input il numero di ordine 
CREATE OR REPLACE PROCEDURE totale_ordine (num_ordine varchar)
IS 
    ordine_preso VARCHAR(10) := num_ordine;
    tot_prodotti NUMBER; 
    tot_mstd     NUMBER;
    tot_offerte  NUMBER;
    tot_ordine   NUMBER; 

BEGIN
    --trovare il prezzo totale dei prodotti in ordine
    SELECT sum(pr.prezzo_prodotto * or_con_pr.quantita_prodotto) INTO tot_prodotti
    FROM ordine ord JOIN ordine_contiene_prod or_con_pr ON ord.num_ordine = or_con_pr.cod_ordine
                    JOIN prodotto pr ON or_con_pr.prodotto = pr.cod_barre_prodotto
    WHERE ord.num_ordine = ordine_preso;

    --trovare il prezzo totale dei menu standard in ordine
    SELECT sum(mstd.prezzo_menu * or_con_mstd.quantita_menu_std) INTO tot_mstd
    FROM ordine ord JOIN ordine_contiene_menu or_con_mstd ON ord.num_ordine = or_con_mstd.cod_ordine
                    JOIN menu_standard mstd ON or_con_mstd.cod_menu = mstd.codice_menu
    WHERE ord.num_ordine = ordine_preso;
    
    --trovare il prezzo totale delle offerte in ordine
    SELECT sum(oft.prezzo_offerta) INTO tot_offerte
    FROM ordine ord JOIN ordine_contiene_offerte or_con_oft ON ord.num_ordine = or_con_oft.ordine
                    JOIN offerte oft ON or_con_oft.offerta = oft.codice_offerta
    WHERE ord.num_ordine = ordine_preso;


    --trovare il prezzo totale dell'ordine
    IF (tot_prodotti IS NULL)
        THEN tot_prodotti := 0;
    END IF;

    IF (tot_mstd IS NULL)
        THEN tot_prodotti := 0;
    END IF;

    IF (tot_offerte IS NULL)
        THEN tot_prodotti := 0;
    END IF;

    tot_ordine := tot_prodotti + tot_mstd + tot_offerte;
    
    DBMS_OUTPUT.PUT_LINE ('Il prezzo totale dei prodotti in ordine ammonta a : ' || tot_prodotti);
    DBMS_OUTPUT.PUT_LINE('Il prezzo totale dei menu standard in ordine ammonta a : ' || tot_mstd); 
    DBMS_OUTPUT.PUT_LINE ('Il prezzo totale delle offerte in questo ordine ammonta a : ' || tot_offerte); 
    DBMS_OUTPUT.PUT_LINE('Il prezzo totale di questo ordine ammonta a : ' || tot_ordine); 

END;
/


--3) Trovare il menu meno venduto ed applicare a quello con l'offerta più alta un ulteriore sconto del 50%--
--   La nuova offerta sarà valida a partire dalla data attuale fino al mese successivo --
CREATE OR REPLACE PROCEDURE OffertaProdotto
IS
     menu    CHAR(4);
     offerta CHAR(5);
BEGIN
    SELECT cod_menu INTO menu
    FROM ordine_contiene_menu 
    GROUP BY cod_menu
    HAVING count(*) = (SELECT min(count(*))
                       FROM ordine_contiene_menu
                       GROUP BY cod_menu
                      )
    FETCH FIRST 1 ROW ONLY;
   
   
    SELECT codice_offerta INTO offerta
    FROM Offerte offr JOIN offerta_contiene_menu trans ON trans.cod_offerta = offr.codice_offerta JOIN menu_standard menu ON trans.cod_menu_std = menu.codice_menu
    WHERE codice_menu = menu AND prezzo_offerta = ( SELECT max(prezzo_offerta)
                                                    FROM Offerte offr JOIN offerta_contiene_menu trans ON trans.cod_offerta = offr.codice_offerta 
                                                                      JOIN menu_standard menu ON trans.cod_menu_std = menu.codice_menu
                                                    WHERE codice_menu = menu
                                                  );
    
    UPDATE offerte SET prezzo_offerta = prezzo_offerta * 0.5 where codice_offerta = offerta;
    COMMIT;
    
    UPDATE offerte SET data_inizio = SYSDATE where codice_offerta = offerta;
    COMMIT;
    
    UPDATE offerte SET data_fine = ADD_MONTHS(SYSDATE,1) where codice_offerta = offerta;
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('è stata applicata al menu ' ||menu|| ' uno sconto del 50% sull offerta ' ||offerta); 

EXCEPTION
    WHEN NO_DATA_FOUND
        THEN RAISE_APPLICATION_ERROR(-20001, 'Non è stato venduto nessun menu');

END;
/

--4) procedura che trova il fornitore che vende quella merce al prezzo più basso e fa un ordine rifornimento di quella merce verso quel fornitore
--   prende in input la merce da ordinare
CREATE OR REPLACE PROCEDURE crea_ordine (merce varchar)
IS
    merce_da_ordinare  VARCHAR(20) := merce;
    fornitore_trovato  CHAR(11);
    cod_area_mag_prec  CHAR(3);
    ord_rif_prec       NUMBER(7); 
    nuovo_ordine_rif   NUMBER(7);
    num_track_prec     NUMBER(12);
    nuovo_num_tracking NUMBER(12);

BEGIN
-- trovare il fornitore che vende quella merce al prezzo più basso 
    
    SELECT partita_iva INTO fornitore_trovato 
    FROM fornitore fo JOIN fornitore_fornisce_merce f_m ON fo.partita_iva = f_m.fornitore
                      JOIN merce me ON f_m.merce = me.nome_merce
    WHERE me.nome_merce = merce_da_ordinare AND prezzo_unitario = ( SELECT min(prezzo_unitario)
                                                                    FROM fornitore fo JOIN fornitore_fornisce_merce f_m ON fo.partita_iva = f_m.fornitore
                                                                                      JOIN merce me ON f_m.merce = me.nome_merce 
                                                                    WHERE me.nome_merce = merce_da_ordinare AND  data_prezzo = ( SELECT data_prezzo  
                                                                                                                                 FROM fornitore fo JOIN fornitore_fornisce_merce f_m ON fo.partita_iva = f_m.fornitore
                                                                                                                                                   JOIN merce me ON f_m.merce = me.nome_merce 
                                                                                                                                 WHERE me.nome_merce = merce_da_ordinare 
                                                                                                                                 ORDER BY f_m.data_prezzo DESC
                                                                                                                                 FETCH FIRST 1 ROW only
                                                                                                                                )
                                                                    GROUP BY nome_merce
                                                                  );

    DBMS_OUTPUT.PUT_LINE ('Il fornitore che vende questa merce al prezzo più basso è : ' || fornitore_trovato);


--selezionare la chiave dell'ultimo ordine rifornimento, servirà perché la chiave del nuovo ordine rifornimento sarà questo trovato + 1
--allo stesso modo facciamo con il numero tracking

    SELECT cod_ordine_rif, num_tracking INTO ord_rif_prec, num_track_prec
    FROM ordine_rifornimento
    ORDER BY data_rif, num_tracking DESC
    FETCH FIRST 1 ROW only;

    DBMS_OUTPUT.PUT_LINE ('Il precedente ordine rifornimento aveva codice : ' || ord_rif_prec);
    DBMS_OUTPUT.PUT_LINE ('Il precedente num_tracking era : ' || num_track_prec);


--nuovo codice ordine rifornimento
    nuovo_ordine_rif := ord_rif_prec + 1;
    DBMS_OUTPUT.PUT_LINE ('Il nuovo cod_ordine_rif sarà : ' || nuovo_ordine_rif);
--nuovo numero tracking 
    nuovo_num_tracking := num_track_prec +1;
    DBMS_OUTPUT.PUT_LINE ('Il nuovo num_tracking sarà : ' || nuovo_num_tracking);


--selezionare il codice_area_mag legato all'ultimo ordine fatto di quella merce
    SELECT ord_rif.codice_area_mag INTO cod_area_mag_prec
    FROM ordine_rifornimento ord_rif JOIN lotto lo ON ord_rif.cod_ordine_rif = lo.ordine_rif
                                     JOIN merce me ON lo.merce_contenuta = me.nome_merce
    WHERE me.nome_merce = merce_da_ordinare 
    ORDER BY ord_rif.data_rif DESC
    FETCH FIRST 1 ROW only;
    
    DBMS_OUTPUT.PUT_LINE ('Il cod_area_mag di questa merce è : ' || cod_area_mag_prec);


--inserire in ordine_rifornimento un nuovo ordine presso quel fornitore trovato
   INSERT INTO ordine_rifornimento VALUES (nuovo_ordine_rif, cod_area_mag_prec, nuovo_num_tracking, SYSDATE, fornitore_trovato); 

   DBMS_OUTPUT.PUT_LINE('Un nuovo ordine verso il fornitore ' || fornitore_trovato || ' è stato effettuato per la merce ' || merce_da_ordinare || chr(13)); 

END;
/


--5) procedura che calcola la giacenza della merce
CREATE OR REPLACE PROCEDURE calcolo_giacenza (nome_merce in varchar)
IS 
    merce                VARCHAR(20) := nome_merce;
    tot_merce_acquistata NUMBER; 
    tot_merce_prod       NUMBER;
    tot_merce_mstd       NUMBER;
    tot_merce_off_prod   NUMBER;
    tot_merce_off_mstd   NUMBER;
    tot_merce_venduta    NUMBER;
    tot_merce_mag        NUMBER;
    giacenza             NUMBER;  

BEGIN
--controllo che sia effettivamente la merce di cui si vuole calcolare la giacenza
    DBMS_OUTPUT.PUT_LINE ('La merce di cui si sta per calcolare la giacenza è : ' || nome_merce );

--trovare la quantità totale di una merce acquistata
    SELECT sum(lo.quantita_merce) INTO tot_merce_acquistata
    FROM merce me JOIN lotto lo ON me.nome_merce = lo.merce_contenuta
                  JOIN ordine_rifornimento ord_rif ON lo.ordine_rif = ord_rif.cod_ordine_rif
    WHERE me.nome_merce = merce;
    
--trovare il totale di pezzi venduti di quel prodotto, e quindi di quella merce specifica presente nel prodotto
    SELECT sum(pr_comp.quantita_merce * or_con_pr.quantita_prodotto) INTO tot_merce_prod
    FROM merce me JOIN prodotto_composto_da pr_comp ON me.nome_merce = pr_comp.componente 
                  JOIN prodotto pr ON pr_comp.prodotto = pr.cod_barre_prodotto 
                  JOIN ordine_contiene_prod or_con_pr ON pr.cod_barre_prodotto = or_con_pr.prodotto
                  JOIN ordine ord ON or_con_pr.cod_ordine = ord.num_ordine
    WHERE me.nome_merce = merce;

--trovare il totale di pezzi venduti dei prodotti presenti nei menu strandard, e quindi di quella specifica merce contenuta nel prodotto
    SELECT sum(or_con_mstd.quantita_menu_std * (m_con_pr.quantita_prodotto * pr_comp.quantita_merce)) INTO tot_merce_mstd
    FROM merce me JOIN prodotto_composto_da pr_comp ON me.nome_merce = pr_comp.componente
                  JOIN prodotto pr ON pr_comp.prodotto = pr.cod_barre_prodotto
                  JOIN menu_contiene_prod m_con_pr ON pr.cod_barre_prodotto = m_con_pr.prodotto
                  JOIN menu_standard mstd ON m_con_pr.cod_menu = mstd.codice_menu
                  JOIN ordine_contiene_menu or_con_mstd on mstd.codice_menu = or_con_mstd.cod_menu
                  JOIN ordine ord ON or_con_mstd.cod_ordine = ord.num_ordine
    WHERE me.nome_merce = merce; 

--trovare il totale di pezzi venduti di quella merce presenti nelle offerte
    --a) pezzi legati ai prodotti presenti nei menu standard 
    SELECT sum(of_con_pr.quantita_prodotto * pr_comp.quantita_merce) INTO tot_merce_off_prod
    FROM merce me JOIN prodotto_composto_da pr_comp ON me.nome_merce = pr_comp.componente
                  JOIN prodotto pr ON pr_comp.prodotto = pr.cod_barre_prodotto
                  JOIN offerta_contiene_prod of_con_pr ON pr.cod_barre_prodotto = of_con_pr.prodotto
                  JOIN offerte oft ON of_con_pr.cod_offerta = oft.codice_offerta
                  JOIN ordine_contiene_offerte or_con_of ON oft.codice_offerta = or_con_of.offerta
                  JOIN ordine ord ON or_con_of.ordine = ord.num_ordine
    WHERE me.nome_merce = merce;

    --b) pezzi legati ai singoli prodotti 
    SELECT sum(of_con_mstd.quantita_menu_std * (m_con_pr.quantita_prodotto * pr_comp.quantita_merce)) INTO tot_merce_off_mstd
    FROM merce me JOIN prodotto_composto_da pr_comp ON me.nome_merce = pr_comp.componente
                  JOIN prodotto pr ON pr_comp.prodotto = pr.cod_barre_prodotto
                  JOIN menu_contiene_prod m_con_pr ON pr.cod_barre_prodotto = m_con_pr.prodotto
                  JOIN menu_standard mstd ON m_con_pr.cod_menu = mstd.codice_menu 
                  JOIN offerta_contiene_menu of_con_mstd ON mstd.codice_menu = of_con_mstd.cod_menu_std
                  JOIN offerte oft ON of_con_mstd.cod_offerta = oft.codice_offerta
                  JOIN ordine_contiene_offerte or_con_of on oft.codice_offerta = or_con_of.offerta
                  JOIN ordine ord ON or_con_of.ordine = ord.num_ordine
    WHERE me.nome_merce = merce;

--controlli per garantire di trovare i valori necessari al calcolo della giacenza
    IF (tot_merce_prod IS NULL)
        THEN tot_merce_prod := 0;
    END IF;

    IF (tot_merce_mstd IS NULL)
        THEN tot_merce_mstd := 0;
    END IF;

    IF (tot_merce_off_prod IS NULL)
        THEN tot_merce_off_prod := 0;
    END IF;

    IF (tot_merce_off_mstd IS NULL)
        THEN tot_merce_off_mstd := 0;
    END IF;


    DBMS_OUTPUT.PUT_LINE ('Il totale dei pezzi acquistati di questa merce è : ' || tot_merce_acquistata );
    DBMS_OUTPUT.PUT_LINE ('Il totale dei pezzi venduti di questa merce presente nei prodotti è : ' || tot_merce_prod);
    DBMS_OUTPUT.PUT_LINE ('Il totale dei pezzi venduti di questa merce presente nei menu standard è : ' || tot_merce_mstd);
    DBMS_OUTPUT.PUT_LINE ('Il totale dei pezzi venduti di questa merce presente nelle offerte contenenti un prodotto è : ' || tot_merce_off_prod);
    DBMS_OUTPUT.PUT_LINE ('Il totale dei pezzi venduti di questa merce nelle offerte contenenti menu standard è : ' || tot_merce_off_mstd);


--trovare il totale dei pezzi venduti di quella merce
    tot_merce_venduta := tot_merce_prod + tot_merce_mstd + tot_merce_off_prod + tot_merce_off_mstd;
    DBMS_OUTPUT.PUT_LINE ('Il totale dei pezzi venduti di questa merce è : ' || tot_merce_venduta);

--trovare il totale dei prodotti in magazzino 
    tot_merce_mag := tot_merce_acquistata + 10;
    DBMS_OUTPUT.PUT_LINE ('Il totale di pezzi presenti in magazzino dopo il più recente ordine rifornimento, sommati ai 10 pezzi sempre presenti, è : ' || tot_merce_mag);

--trovare la giacenza
    giacenza := tot_merce_mag - tot_merce_venduta;
    DBMS_OUTPUT.PUT_LINE ('La giacenza attuale di questa merce è : ' || giacenza || chr(13));
       

--controllo sulla giacenza per effettuare un ordine di rifornimento, quando necessario 
    IF (giacenza < 10)
        THEN DBMS_OUTPUT.PUT_LINE ('Hai meno pezzi della soglia minima garantita'); 
        
        --richiama la procedura per generare un nuovo ordine di quella merce al fornitore che la vende al prezzo più basso
        crea_ordine (merce);

    END IF;
END;
/


--6)procedura che scorre i nomi della merce e ne calcola la giacenza tramite la procedura del calcolo della giacenza
CREATE OR REPLACE PROCEDURE trova_merce 
IS 
    merce_trovata VARCHAR(20); 

    CURSOR merce IS
        SELECT nome_merce 
        FROM merce; 

BEGIN 
    OPEN merce;
    LOOP 
        FETCH merce INTO merce_trovata;
        DBMS_OUTPUT.PUT_LINE('Merce trovata : ' || merce_trovata);
        calcolo_giacenza(merce_trovata); 
        exit WHEN merce%notfound;
    END LOOP; 
    CLOSE merce; 
    
END; 
/



--7) procedura che cerca il dipendente che ha venduto il menu che ha il prezzo più alto e tra questi selezionare chi è stato assunto prima. Promuoverlo quindi a manager--
--   il numero massimo di manager è 3, se questo numero è stato raggiunto verificare che, tra i manager già presenti, vi sia uno che abbia effettuato --
--   un numero di ore minore rispetto al prossimo candidato a manager --
--   se questa condizione è verificata solo se il candidato è stato assunto prima di tale manager --

CREATE OR REPLACE PROCEDURE Promozione
IS
    cassiere  CHAR(6);
    dataM     DATE;
    dataC     DATE;
    oreM      NUMBER;
    oreC      NUMBER;
    contatore NUMBER := 0;

BEGIN 

    --cerco il cassiere che ha venduto un numero maggiore del prodotto più caro e selezionare in caso di un risultato multiplo quello assunto più lontano nel tempo--
    SELECT addetto INTO cassiere
    FROM ordine ord JOIN ordine_contiene_menu or_con_mstd ON ord.num_ordine = or_con_mstd.cod_ordine
                    JOIN menu_standard mstd ON or_con_mstd.cod_menu = mstd.codice_menu
                    JOIN personale pr ON pr.tessera = ord.addetto
    GROUP BY addetto, data_assunzione
    HAVING sum(quantita_menu_std) = ( SELECT max(sum(quantita_menu_std))
                                      FROM ordine ord JOIN ordine_contiene_menu or_con_mstd ON ord.num_ordine = or_con_mstd.cod_ordine
                                                      JOIN menu_standard mstd ON or_con_mstd.cod_menu = mstd.codice_menu
                                      WHERE prezzo_menu = (SELECT max(prezzo_menu)
                                                           FROM menu_standard
                                                           )
                                      GROUP BY addetto
                                    )
    ORDER BY data_assunzione
    FETCH FIRST 1 ROW ONLY;


    SELECT count(*) INTO contatore
    FROM personale 
    WHERE ruolo = 'Manager';

 
    IF contatore >= 3 THEN   
        
        --seleziono la data di assunzione e le ore effettuate del manager che presenza un minore ore di lavoro rispetto agli altri già presenti--
        SELECT data_assunzione, sum(((cast(ora_uscita as date) - cast(ora_ingresso as date)) * 24)) INTO dataM, oreM
        FROM personale pr  join turni tu on  pr.tessera = tu.cod_personale
        WHERE ruolo = 'Manager'
        GROUP BY data_assunzione
        HAVING sum(((cast(ora_uscita as date) - cast(ora_ingresso as date)) * 24)) = ( SELECT min(sum(((cast(ora_uscita as date) - cast(ora_ingresso as date)) * 24))) 
                                                                                       FROM personale pr  join turni tu on  pr.tessera = tu.cod_personale
                                                                                       WHERE ruolo = 'Manager' 
                                                                                       GROUP BY cod_personale
                                                                                    );

        --seleziono la data di assunzione e le ore di lavoro del nostro candidato  a manager--
        SELECT sum(((cast(ora_uscita as date) - cast(ora_ingresso as date)) * 24)), data_assunzione INTO oreC, dataC
        FROM personale pr JOIN turni tu ON  pr.tessera = tu.cod_personale
        WHERE tessera = cassiere
        GROUP BY tessera, data_assunzione;
    
    
        IF oreC > oreM AND dataC < dataM THEN                                                       
            UPDATE personale SET ruolo = 'Manager' WHERE tessera = cassiere;
            DBMS_OUTPUT.PUT_LINE('Il dipendete: ' ||cassiere|| ' è stato promosso a MANAGER');
        ELSE 
            DBMS_OUTPUT.PUT_LINE('Il dipendete non rispecchia i criteri');
        END IF;
    ELSE
        UPDATE personale SET ruolo = 'Manager' WHERE tessera = cassiere;
        DBMS_OUTPUT.PUT_LINE('Il dipendete: ' ||cassiere|| ' è stato promosso a MANAGER');
    END IF;

END;