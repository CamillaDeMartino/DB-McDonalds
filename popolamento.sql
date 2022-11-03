--POPOLAMENTO PERSONALE

insert into PERSONALE values ('000001', 'Mario',     'Rossi',      'RSSMRA84P17F839U', TO_DATE('17-09-1984', 'DD-MM-YYYY'), 'Manager',    TO_DATE('15-05-2015','DD-MM-YYYY'));
insert into PERSONALE values ('000002', 'Luca',      'Del Bianco', 'DLBLCU88D11F839H', TO_DATE('11-04-1988', 'DD-MM-YYYY'), 'Dipendente', TO_DATE('02-08-2018','DD-MM-YYYY'));
insert into PERSONALE values ('000003', 'Lorenzo',   'Cagnacci',   'CGNLNZ74T02H501R', TO_DATE('02-12-1974', 'DD-MM-YYYY'), 'Dipendente', TO_DATE('01-12-2018','DD-MM-YYYY'));
insert into PERSONALE values ('000004', 'Anna',      'Giacomini',  'GCMNNA98R53F205K', TO_DATE('13-10-1998', 'DD-MM-YYYY'), 'Dipendente', TO_DATE('26-04-2017','DD-MM-YYYY'));
insert into PERSONALE values ('000005', 'Rossella',  'Mariani',    'MRNRSL88T70F839K', TO_DATE('30-12-1988', 'DD-MM-YYYY'), 'Manager',    TO_DATE('28-01-2016','DD-MM-YYYY'));
insert into PERSONALE values ('000006', 'Carmine',   'Esposito',   'SPSCMN84E21F839Y', TO_DATE('21-05-1984', 'DD-MM-YYYY'), 'Dipendente', TO_DATE('28-06-2019','DD-MM-YYYY'));
insert into PERSONALE values ('000007', 'Carmine',   'Tranchese',  'TRNCMN77A10F205E', TO_DATE('10-01-2001', 'DD-MM-YYYY'), 'Dipendente', TO_DATE('11-11-2021','DD-MM-YYYY'));
insert into PERSONALE values ('000008', 'Attilio',   'Bianchi',    'BNCTTL90M21D612X', TO_DATE('21-08-1990', 'DD-MM-YYYY'), 'Dipendente', TO_DATE('30-09-2015','DD-MM-YYYY'));
insert into PERSONALE values ('000009', 'Giancarlo', 'De Martino', 'DMRGCR91C22F839H', TO_DATE('22-03-1991', 'DD-MM-YYYY'), 'Dipendente', TO_DATE('24-10-2019','DD-MM-YYYY'));
insert into PERSONALE values ('000010', 'Leonardo',  'Coppola',    'CPPLRD84P17F839H', TO_DATE('17-09-1984', 'DD-MM-YYYY'), 'Dipendente', TO_DATE('29-10-2016','DD-MM-YYYY'));
insert into PERSONALE values ('000011', 'Camilla',   'Giorgi',     'GRGCLL94S51F839Y', TO_DATE('11-11-1994', 'DD-MM-YYYY'), 'Manager',    TO_DATE('10-03-2018','DD-MM-YYYY'));
insert into PERSONALE values ('000012', 'Flavia',    'Ambrosiani', 'MBRFLV91D57F839A', TO_DATE('17-04-1991', 'DD-MM-YYYY'), 'Dipendente', TO_DATE('14-01-2020','DD-MM-YYYY'));
insert into PERSONALE values ('000013', 'Luca',      'Esposito',   'SPSLCU85E31F839D', TO_DATE('31-05-1985', 'DD-MM-YYYY'), 'Dipendente', TO_DATE('05-05-2018','DD-MM-YYYY'));
insert into PERSONALE values ('000014', 'Noemi',     'Capirola',   'CPRNMO96P46F839O', TO_DATE('06-09-1996', 'DD-MM-YYYY'), 'Dipendente', TO_DATE('18-08-2020','DD-MM-YYYY'));
insert into PERSONALE values ('000015', 'Vincenzo',  'De Gregorio','DGRVCN93R13F839S', TO_DATE('13-10-1993', 'DD-MM-YYYY'), 'Dipendente', TO_DATE('15-07-2017','DD-MM-YYYY'));


--POPOLAMENTO STIPENDIO

insert into STIPENDIO values ('0A24Z4', 1600.00, '000001', TO_DATE('02-08-2022', 'DD-MM-YYYY'));
insert into STIPENDIO values ('0A36S7', 1200.00, '000002', TO_DATE('02-09-2022', 'DD-MM-YYYY'));
insert into STIPENDIO values ('0A28S5', 1200.00, '000003', TO_DATE('02-07-2022', 'DD-MM-YYYY'));
insert into STIPENDIO values ('0A99B7', 1200.00, '000004', TO_DATE('02-08-2022', 'DD-MM-YYYY'));
insert into STIPENDIO values ('0A81M1', 1600.00, '000005', TO_DATE('02-08-2022', 'DD-MM-YYYY'));
insert into STIPENDIO values ('0A27B9', 1200.00, '000006', TO_DATE('02-09-2022', 'DD-MM-YYYY'));
insert into STIPENDIO values ('0A88H2', 1200.00, '000007', TO_DATE('02-07-2022', 'DD-MM-YYYY'));
insert into STIPENDIO values ('0A36L6', 1200.00, '000008', TO_DATE('02-08-2022', 'DD-MM-YYYY'));
insert into STIPENDIO values ('0A68O9', 1200.00, '000009', TO_DATE('02-09-2022', 'DD-MM-YYYY'));
insert into STIPENDIO values ('0A80K3', 1200.00, '000010', TO_DATE('02-08-2022', 'DD-MM-YYYY'));
insert into STIPENDIO values ('0A57K5', 1600.00, '000011', TO_DATE('02-08-2022', 'DD-MM-YYYY'));
insert into STIPENDIO values ('0A34K8', 1200.00, '000012', TO_DATE('02-09-2022', 'DD-MM-YYYY'));
insert into STIPENDIO values ('0A71V9', 1200.00, '000013', TO_DATE('02-07-2022', 'DD-MM-YYYY'));
insert into STIPENDIO values ('0A28S1', 1200.00, '000014', TO_DATE('02-09-2022', 'DD-MM-YYYY'));
insert into STIPENDIO values ('0A96U3', 1200.00, '000015', TO_DATE('02-08-2022', 'DD-MM-YYYY'));


--POPOLAMENTO TURNI

insert into TURNI values ('000001', TO_DATE('02-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('02-08-2022 09:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('02-08-2022 17:00:00', 'DD-MM-YYYY HH24:MI:SS'), 00);
insert into TURNI values ('000002', TO_DATE('02-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('02-08-2022 06:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('02-08-2022 11:00:00', 'DD-MM-YYYY HH24:MI:SS'), 01);
insert into TURNI values ('000003', TO_DATE('02-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('02-08-2022 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('02-08-2022 22:00:00', 'DD-MM-YYYY HH24:MI:SS'), 02);
insert into TURNI values ('000004', TO_DATE('02-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('02-08-2022 18:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('02-08-2022 23:00:00', 'DD-MM-YYYY HH24:MI:SS'), 01);
insert into TURNI values ('000005', TO_DATE('03-09-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('03-09-2022 09:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('03-09-2022 16:00:00', 'DD-MM-YYYY HH24:MI:SS'), 00);
insert into TURNI values ('000006', TO_DATE('03-09-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('03-09-2022 06:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('03-09-2022 12:00:00', 'DD-MM-YYYY HH24:MI:SS'), 01);
insert into TURNI values ('000007', TO_DATE('03-09-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('03-09-2022 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('03-09-2022 21:00:00', 'DD-MM-YYYY HH24:MI:SS'), 02);
insert into TURNI values ('000008', TO_DATE('03-09-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('03-09-2022 20:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('04-09-2022 02:00:00', 'DD-MM-YYYY HH24:MI:SS'), 01);
insert into TURNI values ('000009', TO_DATE('04-07-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('04-07-2022 08:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('04-07-2022 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), 02);
insert into TURNI values ('000010', TO_DATE('04-07-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('04-07-2022 07:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('04-07-2022 13:00:00', 'DD-MM-YYYY HH24:MI:SS'), 01);
insert into TURNI values ('000011', TO_DATE('04-07-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('04-07-2022 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('04-07-2022 20:00:00', 'DD-MM-YYYY HH24:MI:SS'), 00);
insert into TURNI values ('000012', TO_DATE('04-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('04-08-2022 16:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('04-08-2022 20:00:00', 'DD-MM-YYYY HH24:MI:SS'), 01);
insert into TURNI values ('000013', TO_DATE('05-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('05-08-2022 11:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('05-08-2022 15:00:00', 'DD-MM-YYYY HH24:MI:SS'), 02);
insert into TURNI values ('000014', TO_DATE('05-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('05-08-2022 06:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('05-08-2022 12:00:00', 'DD-MM-YYYY HH24:MI:SS'), 01);
insert into TURNI values ('000015', TO_DATE('05-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('05-08-2022 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('05-08-2022 18:00:00', 'DD-MM-YYYY HH24:MI:SS'), 02);
insert into TURNI values ('000015', TO_DATE('06-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('06-08-2022 08:00:00', 'DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('06-08-2022 11:00:00', 'DD-MM-YYYY HH24:MI:SS'), 02);

--POPOLAMENTO CLIENTE_ISCRITTO

insert into CLIENTE_ISCRITTO values('mariabianchi@gmail.com', 'bianchi0', '255144');
insert into CLIENTE_ISCRITTO values('flaviotucci@gmail.com',  'tuccifla', '351117');
insert into CLIENTE_ISCRITTO values('mattybiondo@gmail.com',  'biondo01', '885471');
insert into CLIENTE_ISCRITTO values('iolandafra@gmail.com',   'iolefra8', '112006');
insert into CLIENTE_ISCRITTO values('andretop@gmail.com',     'olivatop', '112588');
insert into CLIENTE_ISCRITTO values('lorivans@gmail.com',     'Lorenzo7', '171123');
insert into CLIENTE_ISCRITTO values('wallthe@gmail.com',      'offset07', '152283');
insert into CLIENTE_ISCRITTO values('camdema@gmail.com',      'cademas5', '153277');
insert into CLIENTE_ISCRITTO values('coppcarm@gmail.com',     'santuari', '566320');
insert into CLIENTE_ISCRITTO values('pasticcino82@gmail.com', 'icecream', '884100');
insert into CLIENTE_ISCRITTO values('jobesty@gmail.com',      'traps118', '522014');
insert into CLIENTE_ISCRITTO values('fragolina97@gmail.com',  'cassetta', '311801');
insert into CLIENTE_ISCRITTO values('polyval@gmail.com',      'matlab22', '052501');
insert into CLIENTE_ISCRITTO values('laurakkg@gmail.com',     'lauretta', '162104');
insert into CLIENTE_ISCRITTO values('kekkoboss@gmail.com',    'stellina', '130801');

--POPOLAMENTO OFFERTE
insert into OFFERTE values('G2501', TO_DATE('01-08-2022', 'DD-MM-YYYY'), TO_DATE('01-09-2022', 'DD-MM-YYYY'), 7.99 );
insert into OFFERTE values('G7456', TO_DATE('28-08-2022', 'DD-MM-YYYY'), TO_DATE('31-08-2022', 'DD-MM-YYYY'), 14.99);
insert into OFFERTE values('G6523', TO_DATE('04-08-2022', 'DD-MM-YYYY'), TO_DATE('14-08-2022', 'DD-MM-YYYY'), 15.99);
insert into OFFERTE values('G9124', TO_DATE('17-09-2022', 'DD-MM-YYYY'), TO_DATE('30-09-2022', 'DD-MM-YYYY'), 5.99 );
insert into OFFERTE values('G5300', TO_DATE('17-08-2022', 'DD-MM-YYYY'), TO_DATE('18-08-2022', 'DD-MM-YYYY'), 20.00);
insert into OFFERTE values('G1446', TO_DATE('03-09-2022', 'DD-MM-YYYY'), TO_DATE('11-09-2022', 'DD-MM-YYYY'), 30.99);
insert into OFFERTE values('G9145', TO_DATE('15-08-2022', 'DD-MM-YYYY'), TO_DATE('15-09-2022', 'DD-MM-YYYY'), 30.00);
insert into OFFERTE values('G3548', TO_DATE('14-08-2022', 'DD-MM-YYYY'), TO_DATE('24-08-2022', 'DD-MM-YYYY'), 40.00);
insert into OFFERTE values('G1005', TO_DATE('16-08-2022', 'DD-MM-YYYY'), TO_DATE('30-08-2022', 'DD-MM-YYYY'), 6.20 );
insert into OFFERTE values('G3444', TO_DATE('07-08-2022', 'DD-MM-YYYY'), TO_DATE('07-09-2022', 'DD-MM-YYYY'), 26.99);
insert into OFFERTE values('G6999', TO_DATE('14-08-2022', 'DD-MM-YYYY'), TO_DATE('19-08-2022', 'DD-MM-YYYY'), 12.90);
insert into OFFERTE values('G7836', TO_DATE('30-07-2022', 'DD-MM-YYYY'), TO_DATE('30-08-2022', 'DD-MM-YYYY'), 69.99);
insert into OFFERTE values('G7415', TO_DATE('21-08-2022', 'DD-MM-YYYY'), TO_DATE('21-09-2022', 'DD-MM-YYYY'), 20.50);
insert into OFFERTE values('G8520', TO_DATE('22-09-2022', 'DD-MM-YYYY'), TO_DATE('27-09-2022', 'DD-MM-YYYY'), 17.50);
insert into OFFERTE values('G7410', TO_DATE('04-08-2022', 'DD-MM-YYYY'), TO_DATE('04-09-2022', 'DD-MM-YYYY'), 8.99 );
insert into OFFERTE values('G2502', TO_DATE('06-09-2022', 'DD-MM-YYYY'), TO_DATE('07-09-2022', 'DD-MM-YYYY'), 7.99 );
insert into OFFERTE values('G7457', TO_DATE('30-08-2022', 'DD-MM-YYYY'), TO_DATE('30-09-2022', 'DD-MM-YYYY'), 3.99 );
insert into OFFERTE values('G6524', TO_DATE('22-08-2022', 'DD-MM-YYYY'), TO_DATE('01-09-2022', 'DD-MM-YYYY'), 7.99 );
insert into OFFERTE values('G5301', TO_DATE('11-07-2022', 'DD-MM-YYYY'), TO_DATE('11-08-2022', 'DD-MM-YYYY'), 10.00);
insert into OFFERTE values('G1447', TO_DATE('03-09-2022', 'DD-MM-YYYY'), TO_DATE('04-09-2022', 'DD-MM-YYYY'), 2.99 );
insert into OFFERTE values('G9146', TO_DATE('31-08-2022', 'DD-MM-YYYY'), TO_DATE('15-09-2022', 'DD-MM-YYYY'), 14.00);
insert into OFFERTE values('G3549', TO_DATE('14-09-2022', 'DD-MM-YYYY'), TO_DATE('20-09-2022', 'DD-MM-YYYY'), 30.50);
insert into OFFERTE values('G6910', TO_DATE('25-08-2022', 'DD-MM-YYYY'), TO_DATE('26-08-2022', 'DD-MM-YYYY'), 1.00 );
insert into OFFERTE values('G8521', TO_DATE('02-09-2022', 'DD-MM-YYYY'), TO_DATE('07-09-2022', 'DD-MM-YYYY'), 3.00 );


--POPOLAMENTO ORDINE
insert into ORDINE values ('111111', '000002', 'mariabianchi@gmail.com', 'Carta di Credito', 'cassa', 'da mangiare', TO_DATE('10-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('10-08-2022 15:34','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111112', '000013', 'lorivans@gmail.com',     'Contanti',         'cassa', 'da mangiare', TO_DATE('30-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('30-08-2022 11:50','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111113', '000004', 'wallthe@gmail.com',      'Contanti',         'totem', 'da portare',  TO_DATE('06-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('06-08-2022 13:30','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111114', '000006', 'mattybiondo@gmail.com',  'Carta di Credito', 'drive', 'da portare',  TO_DATE('04-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('04-08-2022 23:45','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111115', '000007', 'camdema@gmail.com',      'Contanti',         'drive', 'da portare',  TO_DATE('17-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('17-08-2022 14:20','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111116', '000008', 'laurakkg@gmail.com',     'Contanti',         'cassa', 'da mangiare', TO_DATE('11-09-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('11-09-2022 12:40','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111117', '000009', 'coppcarm@gmail.com',     'Carta di Credito', 'cassa', 'da mangiare', TO_DATE('05-09-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('05-09-2022 20:26','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111118', '000010', 'kekkoboss@gmail.com',    'Carta di Credito', 'cassa', 'da mangiare', TO_DATE('23-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('23-08-2022 14:15','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111119', '000002', 'flaviotucci@gmail.com',  'Carta di Credito', 'drive', 'da portare',  TO_DATE('17-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('17-08-2022 16:24','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111120', '000013', 'jobesty@gmail.com',      'Carta di Credito', 'totem', 'da portare',  TO_DATE('06-09-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('06-09-2022 21:15','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111121', '000014', 'iolandafra@gmail.com',   'Carta di Credito', 'cassa', 'da mangiare', TO_DATE('18-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('18-08-2022 14:27','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111122', '000015', 'polyval@gmail.com',      'Contanti',         'cassa', 'da mangiare', TO_DATE('25-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('25-08-2022 11:34','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111123', '000004', 'fragolina97@gmail.com',  'Carta di Credito', 'totem', 'da portare',  TO_DATE('26-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('26-08-2022 22:53','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111124', '000009', 'andretop@gmail.com',     'Contanti',         'totem', 'da mangiare', TO_DATE('24-09-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('24-09-2022 19:17','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111125', '000009', 'pasticcino82@gmail.com', 'Carta di Credito', 'cassa', 'da mangiare', TO_DATE('10-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('10-08-2022 23:18','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111126', '000002', NULL,                     'Carta di Credito', 'drive', 'da portare',  TO_DATE('11-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('11-08-2022 15:34','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111127', '000013', 'lorivans@gmail.com',     'Contanti',         'cassa', 'da mangiare', TO_DATE('30-09-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('30-09-2022 11:50','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111128', '000010', 'kekkoboss@gmail.com',    'Carta di Credito', 'cassa', 'da mangiare', TO_DATE('31-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('31-08-2022 14:15','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111129', '000002', 'flaviotucci@gmail.com',  'Carta di Credito', 'drive', 'da portare',  TO_DATE('17-09-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('17-09-2022 16:24','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111130', '000013', NULL,                     'Carta di Credito', 'totem', 'da portare',  TO_DATE('04-09-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('04-09-2022 21:15','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111131', '000015', NULL,                     'Contanti',         'cassa', 'da mangiare', TO_DATE('02-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('02-08-2022 11:34','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111132', '000004', 'fragolina97@gmail.com',  'Carta di Credito', 'totem', 'da portare',  TO_DATE('26-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('26-08-2022 22:53','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111133', '000006', 'andretop@gmail.com',     'Contanti',         'drive', 'da portare',  TO_DATE('04-09-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('04-09-2022 19:17','DD-MM-YYYY HH24:MI'));
insert into ORDINE values ('111134', '000007', NULL,                     'Carta di Credito', 'cassa', 'da mangiare', TO_DATE('15-08-2022', 'DD-MM-YYYY'), TO_TIMESTAMP('15-08-2022 23:18','DD-MM-YYYY HH24:MI'));

--POPOLAMENTO MENU_STANDARD
insert into MENU_STANDARD values('7654', 'menu famiglia', 14.99);
insert into MENU_STANDARD values('2456', 'menu singolo',  7.99 );
insert into MENU_STANDARD values('4125', 'menu singolo',  7.99 );
insert into MENU_STANDARD values('6988', 'menu doppio',   11.99);
insert into MENU_STANDARD values('3226', 'menu famiglia', 14.99);
insert into MENU_STANDARD values('1002', 'menu doppio',   11.99);
insert into MENU_STANDARD values('3659', 'menu singolo',  7.99 );
insert into MENU_STANDARD values('3911', 'menu singolo',  7.99 );
insert into MENU_STANDARD values('0221', 'menu doppio',   11.99);
insert into MENU_STANDARD values('4103', 'menu famiglia', 14.99);
insert into MENU_STANDARD values('8014', 'menu famiglia', 14.99);
insert into MENU_STANDARD values('6589', 'menu singolo',  7.99 );
insert into MENU_STANDARD values('0054', 'menu doppio',   11.99);
insert into MENU_STANDARD values('9778', 'menu singolo',  7.99 );
insert into MENU_STANDARD values('3030', 'menu doppio',  11.99 );


--POPOLAMENTO MAGAZZINO
insert into MAGAZZINO values('001', 'uova',              '00');
insert into MAGAZZINO values('002', 'bibite',            '00');
insert into MAGAZZINO values('003', 'carni',             '00');
insert into MAGAZZINO values('004', 'pane',              '01');
insert into MAGAZZINO values('005', 'ortaggi',           '00');
insert into MAGAZZINO values('006', 'formaggi',          '00');
insert into MAGAZZINO values('007', 'verdure',           '00');
insert into MAGAZZINO values('008', 'dolci',             '00');
insert into MAGAZZINO values('009', 'carni',             '00');
insert into MAGAZZINO values('010', 'carni',             '00');
insert into MAGAZZINO values('011', 'frutta',            '00');
insert into MAGAZZINO values('012', 'pane',              '01');
insert into MAGAZZINO values('013', 'bibite',            '00');
insert into MAGAZZINO values('014', 'ortaggi',           '00');
insert into MAGAZZINO values('015', 'formaggi',          '00');
insert into MAGAZZINO values('016', 'latticini',         '00');
insert into MAGAZZINO values('017', 'prodotti da forno', '01');


--POPOLAMENTO PRODOTTO
insert into PRODOTTO values('8032089000017', 'bigmac',         6.50, 'standard', 'panini' );
insert into PRODOTTO values('8032089000028', 'mcchicken',      5.60, 'standard', 'panini' );
insert into PRODOTTO values('8032089000039', 'crispymcbacon',  5.90, 'standard', 'panini' );
insert into PRODOTTO values('8032089000040', 'mcwrap',         6.30, 'standard', 'panini' );
insert into PRODOTTO values('8032089000051', 'cheeseburger',   1.70, 'standard', 'panini' );
insert into PRODOTTO values('8032089000062', 'insalata mista', 5.60, 'standard', 'panini' );
insert into PRODOTTO values('8032089000073', 'patatine',       2.00, 'piccolo',  'extra'  );
insert into PRODOTTO values('8032089000084', 'patatine',       2.85, 'medio',    'extra'  );
insert into PRODOTTO values('8032089000095', 'mcnuggets',      6.20, 'standard', 'extra'  );
insert into PRODOTTO values('8032089000106', 'coca-cola',      2.70, 'medio',    'bibite' );
insert into PRODOTTO values('8032089000117', 'coca-cola',      3.10, 'grande',   'bibite' );
insert into PRODOTTO values('8032089000128', 'mcflurry',       3.90, 'standard', 'dolci'  );
insert into PRODOTTO values('8032089000139', 'cono',           1.30, 'standard', 'dolci'  );
insert into PRODOTTO values('8032089000140', 'milkshake',      1.40, 'standard', 'dolci'  );
insert into PRODOTTO values('8032089000151', 'espresso',       1.00, 'standard', 'extra'  );



--POPOLAMENTO INFORMAZIONI_NUTRIZIONALI non riesco ad inserire per lo stesso prodotto più componenti
insert into INFORMAZIONI_NUTRIZIONALI values('8032089000017', 'carboidrati',    19.00,  42.00,  '16%');
insert into INFORMAZIONI_NUTRIZIONALI values('8032089000017', 'calorie (kcal)', 232.00, 509.00, '25%');
insert into INFORMAZIONI_NUTRIZIONALI values('8032089000017', 'grassi',         12.00,  26.00,  '37%');
insert into INFORMAZIONI_NUTRIZIONALI values('8032089000017', 'fibre',          1.40,   3.10,    NULL);
insert into INFORMAZIONI_NUTRIZIONALI values('8032089000017', 'proteine',       12.00,  27.00,  '53%');
insert into INFORMAZIONI_NUTRIZIONALI values('8032089000017', 'sale',           1.00,   2.30,   '38%');
insert into INFORMAZIONI_NUTRIZIONALI values('8032089000017', 'zuccheri',       4.00,   9.10,   '10%');
insert into INFORMAZIONI_NUTRIZIONALI values('8032089000028', 'carboidrati',    24.00,  46.00,  '18%');
insert into INFORMAZIONI_NUTRIZIONALI values('8032089000028', 'calorie (kcal)', 230.00, 446.00, '22%');
insert into INFORMAZIONI_NUTRIZIONALI values('8032089000028', 'grassi',         10.30,  19.00,  '27%');
insert into INFORMAZIONI_NUTRIZIONALI values('8032089000028', 'fibre',          1.30,   2.50,    NULL);
insert into INFORMAZIONI_NUTRIZIONALI values('8032089000028', 'proteine',       11.00,  21.00,  '42%');
insert into INFORMAZIONI_NUTRIZIONALI values('8032089000028', 'sale',           1.39,   2.30,   '32%');
insert into INFORMAZIONI_NUTRIZIONALI values('8032089000028', 'zuccheri',       3.30,   6.40,   '7%' );
insert into INFORMAZIONI_NUTRIZIONALI values('8032089000128', 'carboidrati',    28.00,  45.00,  '17%');


--POPOLAMENTO FORNITORE
insert into FORNITORE values('00709150155', 'ottolinaregione@gmail.com',            'Ottolina',                     '+393885647275', 'Via Decemviri',         'Milano',                '20137');
insert into FORNITORE values('01797570205', 'info@italiaalimentari.it',             'Italia Alimentari',            '+390524930311', 'Via Europa',            'Gazoldo degli Oppoliti','46040');
insert into FORNITORE values('00208950139', 'info@fratelliberetta.com',             'Salumificio Fratelli Beretta', '+390290985510', 'Via Fratelli Bandiera', 'Trezzo sull Adda',      '20056');
insert into FORNITORE values('05799340962', 'servizio@bonduelle.com',               'Bonduelle Italia',             '+390354252411', 'Via Trento',            'San Paolo d Argon',     '24060');
insert into FORNITORE values('04119190371', 'privacy@granarolo.it',                 'Granarolo',                    '+390514162722', 'Via Cadriano',          'Bologna',               '40127');
insert into FORNITORE values('02654810361', 'granterre@consumercare.it',            'Parmareggio',                  '+390522245711', 'Via P.Togliatti',       'Montecavolo',           '42020');
insert into FORNITORE values('02522130406', 'info@mtcamadori.it',                   'Amadori',                      '+393435548977', 'Via Del Rio',           'San Vittore',           '47522');
insert into FORNITORE values('02562260360', 'info@inalca.it',                       'Inalca',                       '+390597551112', 'Via Spilamberto',       'Castelvetro',           '41014');
insert into FORNITORE values('04337740379', 'QSR.contact@grupobimbo.com',           'Bimbo',                        '+393387844145', 'Via Aldo Moro',         'Bomporto',              '41030');
insert into FORNITORE values('00248390676', 'luca.strappelli@amadori.it',           'Amadori',                      '+393885807011', 'Strada Provinciale',    'Mosciano',              '64023');
insert into FORNITORE values('01296041211', 'info@fresystem.com',                   'Cupiello',                     '+393475109973', 'Zona Industriale',      'Caivano',               '80023');
insert into FORNITORE values('00590481206', 'info@pizzoli.it',                      'Pizzoli',                      '+390983969441', 'Via Zenzalino Nord',    'Budrio',                '40054');
insert into FORNITORE values('01502650383', 'info@macefruit.com',                   'Macè',                         '+39056841244',  'Sant Agostino',         'Molino Albergati',      '44042');
insert into FORNITORE values('00124290214', 'info@vog-products.it',                 'Vog Products',                 '+390471592311', 'Via Nobel',             'Laives',                '39055');
insert into FORNITORE values('02837980966', 'journeyitalia@coca-cola.com',          'Coca-cola Italia',             '+390298294288', 'Viale T Edison',        'San Giovanni',          '20099');
insert into FORNITORE values('02246470161', 'servizioconsumatori@sabortofrutta.it', 'Sab Ortofrutta',               '+390354491480', 'Via Cesare Battisti',   'Telgate',               '24060');
insert into FORNITORE values('03341930174', 'marketing@centralelatte-brescia.it',   'Centrale del latte di Brescia','+390302440300', 'Via Lamarmora',         'Brescia',               '25124');


--POPOLAMENTO MERCE
insert into MERCE values('Mele',         'frutta'            );
insert into MERCE values('Caffè',        'bibite'            );
insert into MERCE values('Coca-Cola',    'bibite'            );
insert into MERCE values('Prosciutto',   'carne'             );
insert into MERCE values('Bacon',        'carne'             );
insert into MERCE values('Insalata',     'verdure'           );
insert into MERCE values('Latte',        'latticini'         );
insert into MERCE values('Frutta',       'frutta'            );
insert into MERCE values('Formaggio',    'formaggi'          );
insert into MERCE values('Pollo',        'pollo'             );
insert into MERCE values('Carne Bovina', 'carne'             );
insert into MERCE values('Pane',         'pane'              );
insert into MERCE values('Cornetto',     'prodotti da forno' );
insert into MERCE values('Patate',       'ortaggi'           );
insert into MERCE values('Uova',         'uova'              );


--POPOLAMENTO ORDINE_RIFORNIMENTO
insert into ORDINE_RIFORNIMENTO values(0000001, '011', '000000000001', TO_DATE('02-09-2022','DD-MM-YYYY'), '00124290214');
insert into ORDINE_RIFORNIMENTO values(0000002, '002', '000000000002', TO_DATE('02-09-2022','DD-MM-YYYY'), '00709150155');
insert into ORDINE_RIFORNIMENTO values(0000003, '003', '000000000003', TO_DATE('02-09-2022','DD-MM-YYYY'), '01797570205');
insert into ORDINE_RIFORNIMENTO values(0000004, '012', '000000000004', TO_DATE('02-09-2022','DD-MM-YYYY'), '04337740379');
insert into ORDINE_RIFORNIMENTO values(0000005, '005', '000000000005', TO_DATE('02-09-2022','DD-MM-YYYY'), '00590481206');
insert into ORDINE_RIFORNIMENTO values(0000006, '006', '000000000006', TO_DATE('02-09-2022','DD-MM-YYYY'), '02654810361');
insert into ORDINE_RIFORNIMENTO values(0000007, '007', '000000000007', TO_DATE('02-09-2022','DD-MM-YYYY'), '05799340962');
insert into ORDINE_RIFORNIMENTO values(0000008, '017', '000000000008', TO_DATE('02-09-2022','DD-MM-YYYY'), '01296041211');
insert into ORDINE_RIFORNIMENTO values(0000009, '009', '000000000009', TO_DATE('02-09-2022','DD-MM-YYYY'), '00208950139');
insert into ORDINE_RIFORNIMENTO values(0000010, '010', '000000000010', TO_DATE('02-09-2022','DD-MM-YYYY'), '00248390676');
insert into ORDINE_RIFORNIMENTO values(0000011, '001', '000000000011', TO_DATE('02-09-2022','DD-MM-YYYY'), '02522130406');
insert into ORDINE_RIFORNIMENTO values(0000013, '013', '000000000013', TO_DATE('02-09-2022','DD-MM-YYYY'), '02837980966');
insert into ORDINE_RIFORNIMENTO values(0000014, '016', '000000000014', TO_DATE('02-09-2022','DD-MM-YYYY'), '04119190371');
insert into ORDINE_RIFORNIMENTO values(0000015, '011', '000000000015', TO_DATE('02-09-2022','DD-MM-YYYY'), '01502650383');
insert into ORDINE_RIFORNIMENTO values(0000016, '010', '000000000016', TO_DATE('02-09-2022','DD-MM-YYYY'), '02562260360');



--POPOLAMENTO LOTT0
insert into LOTTO values('L0109', 'Mele',         100,  TO_DATE('15-10-2022','DD-MM-YYYY'), '25kg',  0000001);
insert into LOTTO values('L0209', 'Caffè',        100,  TO_DATE('15-09-2024','DD-MM-YYYY'), '50kg',  0000002);
insert into LOTTO values('L0309', 'Coca-Cola',    500,  TO_DATE('15-05-2024','DD-MM-YYYY'), '250l',  0000013);
insert into LOTTO values('L0409', 'Prosciutto',   50,   TO_DATE('09-02-2023','DD-MM-YYYY'), '500kg', 0000003);
insert into LOTTO values('L0509', 'Bacon',        300,  TO_DATE('04-10-2022','DD-MM-YYYY'), '5kg',   0000009);
insert into LOTTO values('L0609', 'Insalata',     500,  TO_DATE('30-10-2022','DD-MM-YYYY'), '125kg', 0000007);
insert into LOTTO values('L0709', 'Latte',        100,  TO_DATE('04-12-2022','DD-MM-YYYY'), '150l',  0000014);
insert into LOTTO values('L0809', 'Frutta',       300,  TO_DATE('30-09-2022','DD-MM-YYYY'), '500kg', 0000015);
insert into LOTTO values('L0909', 'Formaggio',    680,  TO_DATE('15-12-2022','DD-MM-YYYY'), '140kg', 0000006);
insert into LOTTO values('L0108', 'Pollo',        300,  TO_DATE('01-01-2023','DD-MM-YYYY'), '500kg', 0000010);
insert into LOTTO values('L0208', 'Carne Bovina', 300,  TO_DATE('05-12-2022','DD-MM-YYYY'), '900kg', 0000016);
insert into LOTTO values('L0308', 'Pane',         800,  TO_DATE('30-09-2022','DD-MM-YYYY'), '80kg',  0000004);
insert into LOTTO values('L0408', 'Cornetto',     100,  TO_DATE('15-11-2022','DD-MM-YYYY'), '5kg',   0000008);
insert into LOTTO values('L0508', 'Patate',       998,  TO_DATE('15-05-2024','DD-MM-YYYY'), '2000kg',0000005);
insert into LOTTO values('L0608', 'Uova',         180,  TO_DATE('04-10-2022','DD-MM-YYYY'), '200kg', 0000011);
insert into LOTTO values('L0708', 'Bacon',        300,  TO_DATE('04-10-2022','DD-MM-YYYY'), '5kg',   0000009);
insert into LOTTO values('L0808', 'Bacon',        300,  TO_DATE('04-10-2022','DD-MM-YYYY'), '5kg',   0000009);
insert into LOTTO values('L0908', 'Pane',         800,  TO_DATE('30-09-2022','DD-MM-YYYY'), '80kg',  0000004);



--POPOLAMENTO FATTURA
insert into FATTURA values('Mc-Dns-2022-01', TO_DATE('04-09-2022','DD-MM-YYYY'), 0000001, 'carta'   );
insert into FATTURA values('Mc-Dns-2022-02', TO_DATE('04-09-2022','DD-MM-YYYY'), 0000002, 'contanti');
insert into FATTURA values('Mc-Dns-2022-03', TO_DATE('04-09-2022','DD-MM-YYYY'), 0000003, 'carta'   );
insert into FATTURA values('Mc-Dns-2022-04', TO_DATE('04-09-2022','DD-MM-YYYY'), 0000004, 'contanti');
insert into FATTURA values('Mc-Dns-2022-05', TO_DATE('04-09-2022','DD-MM-YYYY'), 0000005, 'carta'   );
insert into FATTURA values('Mc-Dns-2022-06', TO_DATE('04-09-2022','DD-MM-YYYY'), 0000006, 'contanti');
insert into FATTURA values('Mc-Dns-2022-07', TO_DATE('04-09-2022','DD-MM-YYYY'), 0000007, 'carta'   );
insert into FATTURA values('Mc-Dns-2022-08', TO_DATE('04-09-2022','DD-MM-YYYY'), 0000008, 'contanti');
insert into FATTURA values('Mc-Dns-2022-09', TO_DATE('04-09-2022','DD-MM-YYYY'), 0000009, 'carta'   );
insert into FATTURA values('Mc-Dns-2022-10', TO_DATE('04-09-2022','DD-MM-YYYY'), 0000010, 'carta'   );
insert into FATTURA values('Mc-Dns-2022-11', TO_DATE('04-09-2022','DD-MM-YYYY'), 0000011, 'contanti');
insert into FATTURA values('Mc-Dns-2022-13', TO_DATE('04-09-2022','DD-MM-YYYY'), 0000013, 'carta'   );
insert into FATTURA values('Mc-Dns-2022-14', TO_DATE('04-09-2022','DD-MM-YYYY'), 0000014, 'carta'   );
insert into FATTURA values('Mc-Dns-2022-15', TO_DATE('04-09-2022','DD-MM-YYYY'), 0000015, 'carta'   );
insert into FATTURA values('Mc-Dns-2022-16', TO_DATE('04-09-2022','DD-MM-YYYY'), 0000016, 'contanti');


--POPOLAMENTO menu_contiene_prod  
insert into menu_contiene_prod values('7654', '8032089000028', 1);
insert into menu_contiene_prod values('7654', '8032089000117', 2);
insert into menu_contiene_prod values('7654', '8032089000017', 2);
insert into menu_contiene_prod values('7654', '8032089000084', 3);
insert into menu_contiene_prod values('2456', '8032089000039', 1);
insert into menu_contiene_prod values('2456', '8032089000106', 1);
insert into menu_contiene_prod values('2456', '8032089000073', 1);
insert into menu_contiene_prod values('6988', '8032089000051', 2);
insert into menu_contiene_prod values('6988', '8032089000117', 2);
insert into menu_contiene_prod values('6988', '8032089000084', 2);
insert into menu_contiene_prod values('8014', '8032089000040', 1);
insert into menu_contiene_prod values('8014', '8032089000017', 1);
insert into menu_contiene_prod values('8014', '8032089000028', 1);
insert into menu_contiene_prod values('8014', '8032089000106', 3);
insert into menu_contiene_prod values('9778', '8032089000140', 1);


--POPOLAMENTO ordine_contiene_menu
insert into ordine_contiene_menu values('111111', '7654', 1);
insert into ordine_contiene_menu values('111112', '7654', 2);
insert into ordine_contiene_menu values('111113', '7654', 3);
insert into ordine_contiene_menu values('111114', '7654', 1);
insert into ordine_contiene_menu values('111115', '2456', 3);
insert into ordine_contiene_menu values('111116', '2456', 7);
insert into ordine_contiene_menu values('111117', '2456', 5);
insert into ordine_contiene_menu values('111118', '6988', 2);
insert into ordine_contiene_menu values('111119', '6988', 1);
insert into ordine_contiene_menu values('111120', '6988', 3);
insert into ordine_contiene_menu values('111121', '8014', 2);
insert into ordine_contiene_menu values('111122', '8014', 3);
insert into ordine_contiene_menu values('111123', '8014', 1);
insert into ordine_contiene_menu values('111124', '9778', 5);
insert into ordine_contiene_menu values('111125', '9778', 3);


--POPOLAMENTO ordine_contiene_prod
insert into ordine_contiene_prod values('111126', '8032089000017', 4);
insert into ordine_contiene_prod values('111127', '8032089000028', 2);
insert into ordine_contiene_prod values('111128', '8032089000039', 3);
insert into ordine_contiene_prod values('111129', '8032089000040', 1);
insert into ordine_contiene_prod values('111130', '8032089000051', 3);
insert into ordine_contiene_prod values('111131', '8032089000062', 1);
insert into ordine_contiene_prod values('111132', '8032089000073', 5);
insert into ordine_contiene_prod values('111133', '8032089000084', 7);
insert into ordine_contiene_prod values('111134', '8032089000095', 8);
insert into ordine_contiene_prod values('111120', '8032089000106', 3);
insert into ordine_contiene_prod values('111121', '8032089000117', 2);
insert into ordine_contiene_prod values('111122', '8032089000128', 3);
insert into ordine_contiene_prod values('111123', '8032089000139', 1);
insert into ordine_contiene_prod values('111124', '8032089000140', 6);
insert into ordine_contiene_prod values('111125', '8032089000151', 3);


--POPOLAMENTO offerta_contiene_menu
insert into offerta_contiene_menu values('G2501', '7654', 1);
insert into offerta_contiene_menu values('G7456', '7654', 2);
insert into offerta_contiene_menu values('G6523', '7654', 3);
insert into offerta_contiene_menu values('G7410', '7654', 1);
insert into offerta_contiene_menu values('G5300', '2456', 3);
insert into offerta_contiene_menu values('G1446', '2456', 7);
insert into offerta_contiene_menu values('G9145', '2456', 5);
insert into offerta_contiene_menu values('G3548', '6988', 4);
insert into offerta_contiene_menu values('G1005', '6988', 1);
insert into offerta_contiene_menu values('G3444', '6988', 3);
insert into offerta_contiene_menu values('G6999', '8014', 1);
insert into offerta_contiene_menu values('G7836', '8014', 5);
insert into offerta_contiene_menu values('G7415', '8014', 2);
insert into offerta_contiene_menu values('G8520', '9778', 3);
insert into offerta_contiene_menu values('G5301', '9778', 2);



--POPOLAMENYO offerta_contiene_prod
insert into offerta_contiene_prod values('G2502', '8032089000017', 2);
insert into offerta_contiene_prod values('G7457', '8032089000028', 1);
insert into offerta_contiene_prod values('G6524', '8032089000039', 2);
insert into offerta_contiene_prod values('G9124', '8032089000040', 1);
insert into offerta_contiene_prod values('G8521', '8032089000051', 3);
insert into offerta_contiene_prod values('G1447', '8032089000062', 1);
insert into offerta_contiene_prod values('G6910', '8032089000073', 1);
insert into offerta_contiene_prod values('G9146', '8032089000084', 7);
insert into offerta_contiene_prod values('G3549', '8032089000095', 8);
insert into offerta_contiene_prod values('G3444', '8032089000106', 2);
insert into offerta_contiene_prod values('G6999', '8032089000117', 1);
insert into offerta_contiene_prod values('G7836', '8032089000128', 3);
insert into offerta_contiene_prod values('G7415', '8032089000139', 1);
insert into offerta_contiene_prod values('G8520', '8032089000140', 1);
insert into offerta_contiene_prod values('G5301', '8032089000151', 2);


--POPOLAMENTO ordine_contiene_offerte
insert into ordine_contiene_offerte values('111111', 'G2501');
insert into ordine_contiene_offerte values('111112', 'G7456');
insert into ordine_contiene_offerte values('111113', 'G6523');
insert into ordine_contiene_offerte values('111114', 'G7410');
insert into ordine_contiene_offerte values('111115', 'G5300');
insert into ordine_contiene_offerte values('111116', 'G1446');
insert into ordine_contiene_offerte values('111117', 'G9145');
insert into ordine_contiene_offerte values('111118', 'G3548');
insert into ordine_contiene_offerte values('111119', 'G1005');
insert into ordine_contiene_offerte values('111120', 'G3444');
insert into ordine_contiene_offerte values('111121', 'G6999');
insert into ordine_contiene_offerte values('111122', 'G7836');
insert into ordine_contiene_offerte values('111123', 'G7415');
insert into ordine_contiene_offerte values('111124', 'G8520');
insert into ordine_contiene_offerte values('111125', 'G5301');
insert into ordine_contiene_offerte values('111127', 'G7457');
insert into ordine_contiene_offerte values('111128', 'G6524');
insert into ordine_contiene_offerte values('111129', 'G9124');
insert into ordine_contiene_offerte values('111132', 'G6910');
insert into ordine_contiene_offerte values('111133', 'G9146');


--POPOLAMENTO prodotto_composto_da
insert into prodotto_composto_da values('Bacon',        '8032089000017', 3 );
insert into prodotto_composto_da values('Carne Bovina', '8032089000017', 2 );
insert into prodotto_composto_da values('Formaggio',    '8032089000017', 2 );
insert into prodotto_composto_da values('Insalata',     '8032089000017', 3 );
insert into prodotto_composto_da values('Pane',         '8032089000017', 3 );
insert into prodotto_composto_da values('Pollo',        '8032089000028', 2 );
insert into prodotto_composto_da values('Insalata',     '8032089000028', 4 );
insert into prodotto_composto_da values('Carne Bovina', '8032089000039', 1 );
insert into prodotto_composto_da values('Formaggio',    '8032089000039', 2 );
insert into prodotto_composto_da values('Bacon',        '8032089000039', 5 );
insert into prodotto_composto_da values('Pollo',        '8032089000040', 6 );
insert into prodotto_composto_da values('Formaggio',    '8032089000040', 1 );
insert into prodotto_composto_da values('Insalata',     '8032089000040', 5 );
insert into prodotto_composto_da values('Patate',       '8032089000073', 25);
insert into prodotto_composto_da values('Pollo',        '8032089000095', 6 );
insert into prodotto_composto_da values('Latte',        '8032089000128', 1 );
insert into prodotto_composto_da values('Latte',        '8032089000140', 2 );
insert into prodotto_composto_da values('Caffè',        '8032089000151', 1 );


--POPOLAMENTO fornitore_fornisce_merce
insert into fornitore_fornisce_merce values ('Mele',         1.70,  '00124290214', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Caffè',        0.99,  '00709150155', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Coca-Cola',    0.90,  '02837980966', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Prosciutto',   10.00, '01797570205', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Bacon',        3.49,  '00208950139', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Insalata',     2.28,  '05799340962', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Latte',        0.50,  '04119190371', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Frutta',       2.50,  '01502650383', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Formaggio',    6.90,  '02654810361', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Pollo',        3.00,  '00248390676', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Carne Bovina', 3.50,  '02562260360', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Pane',         2.65,  '04337740379', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Cornetto',     2.65,  '01296041211', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Patate',       2.49,  '00590481206', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Uova',         0.25,  '02522130406', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Bacon',        3.00,  '01797570205', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Insalata',     2.00,  '02246470161', TO_DATE('07-09-2022','DD-MM-YYYY'));
insert into fornitore_fornisce_merce values ('Latte',        1.00,  '03341930174', TO_DATE('07-09-2022','DD-MM-YYYY'));


