--1) vista che mostra tutti i prodotti con i propri allergeni e le proprie informazioni nutrizionali -- 
create or replace view Info_prodotti as
    select nome_prodotto, nome_allergene, componente, quantita_per_100gr, quantita_per_prod, RDA
    from (PRODOTTO join ALLERGENI) 
            join (PRODOTTO join INFORMAZIONI_NUTRIZIONALI)
    where PRODOTTO.nome_prodotto = ALLERGENI.prod_associato 
            and PRODOTTO.nome_prodotto = INFORMAZIONI_NUTRIZIONALI.prod_riferito
    order by nome_prodotto;


--2) vista che mostra quali prodotti contiene il menù standard --
create or replace view Prodotti_in_menu_std as
    select nome_prodotto, grandezza_prodotto, codice_menu, tipo_menu, quantita_prodotto
    from (PRODOTTO join menu_contiene_prod) 
            join (MENU_STANDARD join menu_contiene_prod)
    where menu_contiene_prod.prodotto = PRODOTTO.nome_prodotto 
            and menu_contiene_prod.cod_menu = MENU_STANDARD.codice_menu
    order by codice_menu;


--3) vista che mostra quali prodotti contiene l'offerta --
create or replace view Prodotti_in_offerta as
    select nome_prodotto, grandezza_prodotto, codice_offerta, prezzo_offerta
    from ((OFFERTE join (offerta_contiene_menu join (menu_contiene_prod join PRODOTTO))) 
            join (OFFERTE join (offerta_contiene_prod join PRODOTTO)))
    where menu_contiene_prod.prodotto = PRODOTTO.nome_prodotto 
            and menu_contiene_prod.cod_menu = offerta_contiene_menu.cod_menu_stand 
            and offerta_contiene_menu.cod_offerta = OFFERTE.codice_offerta
            and offerta_contiene_prod.prodotto = PRODOTTO.nome_prodotto
            and offerta_contiene_prod.cod_offerta = OFFERTE.codice_offerta
    order by nome_prodotto; 


--4) vista che mostra quali prodotti sono contenuti nell'ordine --
create or replace view Prodotti_ordine as
    select num_ordine, nome_prodotto, categoria_prod, grandezza_prod, quantita_prodotto 
    from (PRODOTTO join (ordine_contiene_prod join ORDINE))
    where ordine_contiene_prod.cod_ordine = ORDINE.num_ordine
            and ordine_contiene_prod.prodotto = PRODOTTO.nome_prodotto
    order by num_ordine;


--5) vista che mostra quali offerte sono contenuti nell'ordine --
create or replace view Offerte_ordine as
    select num_ordine, codice_offerta, nome_prodotto, grandezza_prod, prezzo_offerta 
    from (Prodotti_in_offerta join (offerte_in_ordine join ORDINE))
    where Prodotti_in_offerta.num_ordine = offerte_in_ordine.ordine
            and offerte_in_ordine.ordine = ORDINE.num_ordine
    order by num_ordine;


--6) vista che mostra quali menù standard sono contenuti nell'ordine --
create or replace view Menu_std_ordine as
    select  num_ordine, codice_menu, tipo_menu, quantita_menu_std, nome_prodotto, grandezza_prod
    from (Prodotti_in_menu_std join (ordine_contiene_menu join ORDINE))
    where Prodotti_in_menu_std.num_ordine = ordine_contiene_menu.ordine 
            and ordine_contiene_menu.ordine = ORDINE.num_ordine
    order by num_ordine;


--7) vista che mostra tutto ciò che si trova nell'ordine --
create or replace view Ordine_completo as
    select  *
    from (Prodotti_ordine full outer join (Offerte_ordine full outer join Menu_std_ordine))
    where Prodotti_ordine.num_ordine = Offerte_ordine.num_ordine 
            and Offerte_ordine.num_ordine = Menu_std_ordine.num_ordine
    order by num_ordine;


-- 8) vista che mostra quale merce è venduta da quale fornitore --
create or replace view Merce_fornita as
    select cod_merce, categoria_merce, partita_iva, ragione_sociale
    from (MERCE join possiede) 
            join (FORNITORE join possiede)
    where MERCE.cod_merce = possiede.merce 
            and FORNITORE.partita_iva = possiede.fornitore_merce
    order by cod_merce;


-- 9) vista che mostra nell'ordine rifornimento quale merce è stata acquistata e da quale fornitore e in quale quantità --
create or replace view Merce_in_ord_rif as
    select cod_ordine_rif, partita_iva, cod_merce, categoria_merce, quantita_prod
    from ((MERCE join ordine_rif_contiene) join ORDINE_RIFORNIMENTO) 
            join ((FORNITORE join rifornisce) join ORDINE_RIFORNIMENTO)
    where ORDINE_RIFORNIMENTO.cod_ordine_rif = ordine_rif_contiene.cod_ord_rif 
            and ORDINE_RIFORNIMENTO.cod_ordine_rif = rifornisce.cod_ordine_rif 
    order by cod_ordine_rif;


--10) vista che mostra la fattura legata all'ordine riferimento --
create or replace view Fatture as
    select cod_ordine_rif, data_rif, stato_ordine, cod_fattura, metodo_pag_rif
    from FATTURA join ORDINE_RIFORNIMENTO
    where FATTURA.ordine_rif = ORDINE_RIFORNIMENTO.cod_ordine_rif
    order by data_rif;


--11) vista che mostra quali turni sono stati effettuati da quali dipendenti --
create or replace view Turni_effettuati as
    select tessera, nome, cognome, ruolo, data_turno, num_cassa 
    from PERSONALE join TURNI
    where PERSONALE.tessera = TURNI.cod_personale
    order by data_turno;  