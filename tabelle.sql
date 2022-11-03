--drop inseriti per far compilare correttamente-- 
--RICORDA :                                                                                   --
--drop table NOME cascade constraint => se la tabella ha attributi che fanno da chiave esterna  --
--drop table NOME => se la tabella non ha attributi che sono chiave esterna                     --

        --tabelle delle entità--
/*1*/    
    drop table PERSONALE cascade constraint;
/*2*/    
    drop table STIPENDIO; 
/*3*/    
    drop table TURNI;
/*4*/    
    drop table CLIENTE_ISCRITTO cascade constraint; 
/*5*/    
    drop table OFFERTE cascade constraint; 
/*6*/    
    drop table MENU_STANDARD cascade constraint; 
/*7*/    
    drop table MAGAZZINO cascade constraint;
/*8*/    
    drop table PRODOTTO cascade constraint; 
/*9*/   
    drop table INFORMAZIONI_NUTRIZIONALI; 
/*10*/   
    drop table ORDINE cascade constraint; 
/*11*/   
    drop table FORNITORE cascade constraint;
/*12*/   
    drop table MERCE cascade constraint;
/*13*/   
    drop table ORDINE_RIFORNIMENTO cascade constraint; 
/*14*/   
    drop table LOTTO cascade constraint;
/*15*/
    drop table FATTURA;

        --tabelle di transizione--
/*16*/   
    drop table menu_contiene_prod;
/*17*/   
    drop table ordine_contiene_menu;
/*18*/   
    drop table ordine_contiene_prod;
/*19*/   
    drop table offerta_contiene_menu;
/*20*/   
    drop table offerta_contiene_prod;
/*21*/   
    drop table ordine_contiene_offerte;
/*22*/   
    drop table prodotto_composto_da; 
/*23*/
    drop table fornitore_fornisce_merce;


--definizione delle tabelle legate alle entità --

--1)
--informazioni sui dati del personale--
create table PERSONALE (
    tessera            char(6) primary key,
    nome               varchar(15) not null,
    cognome            varchar(15) not null,
    codice_fiscale     char(16) unique not null,
    data_di_nascita    date not null,
    ruolo              varchar(10) not null, -- ha valori : "manager", "dipendente"
    data_assunzione    date not null,
    --vincoli
    constraint CHK_personale1 check (initcap(ruolo) in ('Dipendente', 'Manager')),
    constraint CHK_personale2 check (regexp_like(codice_fiscale, '[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z][0-9]{3}[A-Z]'))
);

--2) 
--informazioni sullo stipendio--
create table STIPENDIO (
    codice_busta_paga  char(6) primary key,
    stipendio          number(6,2) not null, --number(6,2) = 6 cifre totali, 2 numeri dopo la virgola--
    codice_personale   char(6) not null,
    data_stipendio     date not null,
    --chiavi
    constraint FK_stipendio foreign key (codice_personale) references PERSONALE(tessera) on delete cascade,
    --vincoli
    constraint CHK_stipendio check (stipendio >= 1200.00)
);

--3) 
--informazioni sui turni--
create table TURNI (
    cod_personale     char(6) not null,
    data_turno        date not null, 
    ora_ingresso      timestamp not null, 
    ora_uscita        timestamp not null,
    num_cassa         char(2) not null,
    --chiavi
    constraint PK_turni primary key(cod_personale, data_turno),
    constraint FK_turni foreign key (cod_personale) references PERSONALE(tessera) on delete cascade
);


--4) 
--informazioni sui clienti iscritti--
create table CLIENTE_ISCRITTO (
    e_mail            varchar(25) primary key, 
    password_cliente  char(8) not null,
    tessera_cliente   char(6) unique not null
);


--5) 
--informazioni sulle offerte--
create table OFFERTE (
    codice_offerta    char(5) primary key,
    data_inizio       date not null, 
    data_fine         date not null, 
    prezzo_offerta    number(4,2) not null
);


--6) 
--informazioni sui menù prestabiliti--
create table MENU_STANDARD (
    codice_menu       char(4) primary key,
    tipo_menu         varchar(15) not null, --assume valori : "menù famiglia" "menù singolo" "menù doppio"--
    prezzo_menu       number(4,2) not null,
    --vincoli
    constraint CHK_menustd1 check (tipo_menu in ('menu famiglia', 'menu doppio', 'menu singolo'))
);


--7) 
--informazioni sulla merce in magazzino--
create table MAGAZZINO (
    cod_area             char(3) primary key, 
    categoria_area       varchar(20) not null,  --ha valori : 'carni', 'imballaggi', 'bibite', etc--
    tipo_conservazione   char(2) not null,      --ha valori : 00 per frigorifero, 01 per per scaffale-- 
    --vincoli
    constraint CHK_magazzino1 check (categoria_area in ('uova','frutta', 'bibite', 'carni', 'pane', 'ortaggi', 'formaggi', 'verdure', 'dolci', 'latticini', 'prodotti da forno')),
    constraint CHK_magazzino2 check (tipo_conservazione in ('00', '01'))
);


--8)
--informazioni sui prodotti offerti--
create table PRODOTTO (
    cod_barre_prodotto char(13) primary key, 
    nome_prodotto      varchar(25) not null, 
    prezzo_prodotto    number(4,2) not null,  
    grandezza_prod     varchar(10) not null, -- ha valori : "piccolo", "medio", "grande", "standard"
    categoria_prod     varchar(7) not null, --ha valori : "panini", "bibite", "extra", "dolci"--
    --vincoli
    constraint CHK_prodotto1 check (categoria_prod in ('panini', 'bibite', 'extra', 'dolci')),
    constraint CHK_prodotto2 check (grandezza_prod in ('piccolo', 'medio', 'grande', 'standard'))
);

--9)
--informazioni nutrizionali dei prodotti-- 
create table INFORMAZIONI_NUTRIZIONALI (
    prod_riferito       char(13) not null,
    componente          varchar(15) not null, --ha valori : "carboidrati", "calorie (kcal)", "grassi", "fibre", "proteine", "sale", "zuccheri"--
    quantita_per_100g   number(5,2) not null,
    quantita_per_prod   number(5,2) not null,
    RDA                 char(3),
    --chiavi
    constraint PK_info_nut primary key (componente, prod_riferito),
    constraint FK_info_nut foreign key (prod_riferito) references PRODOTTO(cod_barre_prodotto) on delete cascade,
    --vincoli
    constraint CHK_info_nut1 check (componente in ('carboidrati', 'calorie (kcal)', 'grassi', 'fibre', 'proteine', 'sale', 'zuccheri'))
);


--10)
--informazioni sull'ordine effettuato--
create table ORDINE (
    num_ordine        char(6) primary key,
    addetto           char(6) not null, 
    cliente           varchar(25),
    metodo_pagamento  varchar(16) not null, --ha valori :  "carta di credito", "contanti"--
    metodo_ordine     varchar(6) not null, --ha valori :  "drive", "cassa", "totem"--
    metodo_ritiro     varchar(12) not null, --ha valori :  "da portare", "da mangiare"--
    data_ordine       date not null,
    ora_ordine        timestamp not null,
    --chiavi
    constraint FK_ordine1 foreign key (addetto) references PERSONALE(tessera) on delete cascade,
    constraint FK_ordine2 foreign key (cliente) references CLIENTE_ISCRITTO(e_mail) on delete cascade,
    --vincoli
    constraint CHK_ordine1 check (metodo_pagamento in ('Carta di Credito', 'Contanti')),
    constraint CHK_ordine2 check (metodo_ordine in ('drive', 'cassa', 'totem')),
    constraint CHK_ordine3 check (metodo_ritiro in ('da portare', 'da mangiare'))

);


--11)
--informazioni sui fornitori italiani--
--coca cola italia è un fornitore anche di acqua--
create table FORNITORE (
    partita_iva             char(11) primary key, 
    e_mail_fornitore        varchar(36) not null,
    ragione_sociale         varchar(30) not null, 
    num_telefono            char(13) not null,    --compreso il +39 prima--
    via                     varchar(30) not null,
    citta                   varchar(25) not null,
    CAP                     char(5) not null
);


--12)
--informazioni sulla merce che si acquista--
create table MERCE (
    nome_merce              varchar(15) primary key,
    categoria_merce         varchar(20) not null, --ha valori : "frutta", "acqua", "carne", "pollo", uguali a quelli usati per la categoria_prod in magazzino--
    
    --vincoli
    constraint CHK_merce1 check (categoria_merce in ('frutta', 'formaggi', 'bibite', 'pane', 'carne', 'pollo', 'verdure', 'ortaggi', 'dolce', 'latticini', 'uova', 'prodotti da forno'))
);


--13)
--informazioni sull'ordine che rifornisce il magazzino--
create table ORDINE_RIFORNIMENTO (
    cod_ordine_rif          number(7) primary key, 
    codice_area_mag         char(3) not null, 
    num_tracking            number(12) unique not null,
    data_rif                date not null,
    rif_fornitore           char(11) not null, 
   
    --chiavi
    constraint FK_ord_rif1 foreign key (codice_area_mag) references MAGAZZINO(cod_area) on delete cascade,
    constraint FK_ord_rif2 foreign key (rif_fornitore) references FORNITORE(partita_iva) on delete cascade
);


--14)
--informazioni legate ai lotti di merce ordinati--
create table LOTTO (
    cod_lotto        char(5) primary key, 
    merce_contenuta  varchar(15) not null,
    quantita_merce   number(3) not null, 
    scadenza_lotto   date not null,
    unita_di_misura  varchar(10) not null,
    ordine_rif       number(7) not null,
    
    --chiavi
    constraint FK_lotto1 foreign key (merce_contenuta) references MERCE(nome_merce) on delete cascade,
    constraint FK_lotto2 foreign key (ordine_rif) references ORDINE_RIFORNIMENTO(cod_ordine_rif) on delete cascade
);

--15)
--informazioni riguardanti le fatture degli ordini di rifornimento-- 
create table FATTURA (
    cod_fattura             char(14) primary key, 
    data_fattura            date not null,
    ordine_rif              number(7) not null,
    metodo_pag_rif          varchar(8) not null, --ha valori : "con carta", "in contanti"--
    
    --chiavi
    constraint FK_fattura foreign key (ordine_rif) references ORDINE_RIFORNIMENTO(cod_ordine_rif) on delete cascade,
   --vincoli
    constraint CHK_fattura check (metodo_pag_rif in ('carta', 'contanti'))
);



--definizione delle tabelle di transizione--

--16)
--informazioni sui prodotti contenuti nei menu standard--
create table menu_contiene_prod (
    cod_menu               char(4) not null,
    prodotto               char(13) not null,
    quantita_prodotto      number(2) not null,
    --chiavi
    constraint PK_menu_cont_prod primary key (prodotto, cod_menu),
    constraint FK_menu_cont_prod1 foreign key (prodotto) references PRODOTTO(cod_barre_prodotto) on delete cascade,
    constraint FK_menu_cont_prod2 foreign key (cod_menu) references MENU_STANDARD(codice_menu) on delete cascade
);


--17)
--informazioni sui menu standard contenuti negli ordini--
create table ordine_contiene_menu (
    cod_ordine           char(6) not null,
    cod_menu             char(4) not null,
    quantita_menu_std    number(2) not null, 
    --chiavi
    constraint PK_ord_cont_menu primary key (cod_ordine, cod_menu),
    constraint FK_ord_cont_menu1 foreign key (cod_ordine) references ORDINE(num_ordine) on delete cascade,
    constraint FK_ord_cont_menu2 foreign key (cod_menu) references MENU_STANDARD(codice_menu) on delete cascade
);


--18)
--informazioni sui prodotti contenuti nei menu--
create table ordine_contiene_prod (
    cod_ordine             char(6) not null,
    prodotto               char(13) not null,
    quantita_prodotto      number(2) not null, 
    --chiavi
    constraint PK_ord_con_prod primary key (cod_ordine, prodotto),
    constraint FK_ord_con_prod1 foreign key (cod_ordine) references ORDINE(num_ordine) on delete cascade,
    constraint FK_ord_con_prod2 foreign key (prodotto) references PRODOTTO(cod_barre_prodotto) on delete cascade
);


--19)
--informazioni sui menu contenuti nelle offerte--
create table offerta_contiene_menu (
    cod_offerta        char(5) not null,
    cod_menu_std       char(4) not null,
    quantita_menu_std  number (1) not null,
    --chiavi
    constraint PK_offerta_cont_menu primary key (cod_offerta, cod_menu_std),
    constraint FK_offerta_cont_menu1 foreign key (cod_offerta) references OFFERTE(codice_offerta) on delete cascade,
    constraint FK_offerta_cont_menu2 foreign key (cod_menu_std) references MENU_STANDARD(codice_menu) on delete cascade
);


--20)
--informazioni sui prodotti contenuti nelle offerte--
create table offerta_contiene_prod (
    cod_offerta            char(5) not null,
    prodotto               char(13) not null,
    quantita_prodotto      number(1) not null, 
    --chiavi
    constraint PK_offerta_cont_prod primary key (prodotto, cod_offerta),
    constraint FK_offerta_cont_prod1 foreign key (prodotto) references PRODOTTO(cod_barre_prodotto) on delete cascade,
    constraint FK_offerta_cont_prod2 foreign key (cod_offerta) references OFFERTE(codice_offerta) on delete cascade
);


--21)
--informazioni sulle offerte presenti in un ordine--
create table ordine_contiene_offerte (
    ordine            char(6) not null,
    offerta           char(5) not null,
    --chiavi
    constraint PK_offerta_ordine primary key (ordine, offerta),
    constraint FK_offerta_ordine1 foreign key (ordine) references ORDINE(num_ordine) on delete cascade,
    constraint FK_offerta_ordine2 foreign key (offerta) references OFFERTE(codice_offerta) on delete cascade 
);


--22)
--informazioni sulla merce di cui è composto un prodotto, componenti del prodotto-- 
create table prodotto_composto_da (
    componente      varchar(15) not null,
    prodotto        char(13) not null,
    quantita_merce  number not null,

    --chiavi
    constraint PK_prod_merce primary key (componente, prodotto),
    constraint FK_prod_comp1 foreign key (componente) references MERCE(nome_merce) on delete cascade,
    constraint FK_prod_comp2 foreign key (prodotto) references PRODOTTO(cod_barre_prodotto) on delete cascade
);


--23) 
--informazioni su quali merci sono fornite da quali fornitori
create table fornitore_fornisce_merce (
    merce               varchar(15) not null,
    prezzo_unitario     number(4,2) not null,
    fornitore           char(11) not null,
    data_prezzo         date not null,

    --chiavi
    constraint PK_forni_merce primary key (merce, fornitore),
    constraint FK_forni_merce1 foreign key (merce) references MERCE(nome_merce) on delete cascade,
    constraint FK_forni_merce2 foreign key (fornitore) references FORNITORE(partita_iva) on delete cascade
);