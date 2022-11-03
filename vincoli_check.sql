--con una select che ha il vincolo not exists nella clausola where si possono vedere le tuple che non rispettano la regola --  

--1) vincoli legati al personale --
alter table PERSONALE 
    add constraint CHK_personale1 check not exists (ruolo = 'dipendnte'and  'manager'),
    add constraint CHK_personale2 check (regexp_like(codice_fiscale, '[A-Z]{6}[0-9]{2}[A-Z][0-9]{3}[A-Z]'));


--2) vincoli legati allo stipendio --
alter table STIPENDIO
    add constraint CHK_stipendio1 check not exists (stipendio base < 1200.00),
    add constraint CHK_stipendio2 check not exists (stipendio_totale < stipendio_base);


--3) vincoli legati all'ordine --
alter table ORDINE 
    add constraint CHK_ordine1 check (metodo_pagamento in ('con carta', 'in contanti')),
    add constraint CHK_ordine2 check (metodo_ordine in ('drive', 'cassa', 'totem')),
    add constraint CHK_ordine3 check (metodo_ritiro in ('da portare', 'da mangiare'));


--4) vincoli legati al menu standard --
alter table MENU_STANDARD 
    add constraint CHK_menustd1 check (tipo_menu in ('menù famiglia', 'menù doppio', 'menù singolo'));
    add constraint CHK_menustd2 check (prezzo_menu > 0);


--5) vincoli legati al prodotto --
alter table PRODOTTO 
    add constraint CHK_prodotto1 check (categoria_prod in ('panini', 'bibite', 'extra', 'dolci')),
    add constraint CHK_prodotto2 check (grandezza_prod in ('piccolo', 'medio', 'grande', 'standard'));
    add constraint CHK_prodotto3 check (prezzo_prodotto > 0);


--6) vincoli legati alle informazioni nutrizionali -- 
alter table INFORMAZIONI_NUTRIZIONALI
    add constraint CHK_info_nut1 check (componente in ('carboidrati', 'calorie (kcal)', 'grassi', 'fibre', 'proteine', 'sale', 'zuccheri'));


--7) vincoli legati agli allergeni -- 
alter table ALLERGENI
    add constraint CHK_allergeni1 check (nome_allergene in ('glutine', 'sesamo', 'uova', 'senape', 'latte'));


--8) vincoli legati alla merce --
alter table MERCE 
    add constraint CHK_merce1 check (categoria_merce in ('imballaggi', 'acqua', 'cocacola', 'pane', 'carne', 'pollo', 'lattuga', 'pomodoro', 'formaggio', 'salse', 'dolce'));
    add constraint CHK_merce2 check (scorta_min < scorta_max);
    add constraint CHK_merce3 check (prezzo_unitario > 0);

--9) vincoli legati al magazzino --
alter table MAGAZZINO
    add constraint CHK_magazzino1 check (categoria_prod_mag in ('imballaggi', 'acqua', 'cocacola', 'pane', 'carne', 'pollo', 'lattuga', 'pomodoro', 'formaggio', 'salse', 'dolce'));


--10) vicnoli legati alla fattura --
alter table FATTURA
    add constraint CHK_fattura1 check (metodo_pag_rif in ('con carta', 'in contanti')),
    add constraint CHK_fattura2 check (codice fattura);


--11) vincoli legati all'ordine di rifornimento del magazzino -- 
alter table ORDINE_RIFORNIMENTO
    add constraint CHK_ord_rif1 check (stato_ordine in ('spedito', 'consegnato'));


--12) vincoli legati ai turni --
alter table TURNI
    add constraint CHK_turni1 check not exists (cassa = 00 where (ruolo <> 'manager'));
    add constraint CHK_turni2 check (ora_ingresso < ora_uscita);


--13) vincoli legati  alle offerte--
alter table OFFERTE
    add constraint CHK_offerte1 check (data_inizio < data_fine);

