/* Nom du serveur: VMEDUBDS04\INF4163_1_2021 */

USE /*Ecrire le nom de votre base de données*/;

  /* Création des tables avec contraintres d'intégrité sémantiques (clés primaires, clés secondaires et contraintres de domaines) */

  
  /*Gabriel*/

    CREATE TABLE Hotel(id_hotel SMALLINT IDENTITY (1,1) PRIMARY KEY, 
        adresse VARCHAR (30) NOT NULL, 
        chambre_disponible DECIMAL (30,0), 
        etoiles DECIMAL (5,0), 
        nom_Hotel VARCHAR(30) NOT NULL, 
        telephone CHAR(10),
        CONSTRAINT CK_telephone CHECK (telephone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
        ) ;

    /*Amelie*/

    CREATE TABLE Client(id_client SMALLINT IDENTITY (1,1),
        nom_client VARCHAR(30) NOT NULL, 
        numero_civique SMALLINT,
        rue VARCHAR(30) ,
        ville VARCHAR(30) NOT NULL,
        province VARCHAR(3),
        Client_telephone CHAR(10) NOT NULL, 
        CONSTRAINT PK_idClient PRIMARY KEY (id_client),
        CONSTRAINT CK_numCiviquePositif CHECK (numero_civique>=0),
        CONSTRAINT CK_Client_telephone CHECK (Client_telephone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
        );
    /*Amelie*/
  /* Altération d'une table */
    ALTER TABLE Client
    ADD statut_privilege VARCHAR(6); /*or, argent, bronze*/

     /*Julie*/
    CREATE TABLE TypeChambre(id_typechambre SMALLINT IDENTITY (1,1) PRIMARY KEY,  
        nom_typechambre VARCHAR (25) NOT NULL Unique,
        capacite SMALLINT,
        nbre_lit INT,
        superficie INT, 
        prix DECIMAL(8,2));

    /*Julie*/
    CREATE TABLE Chambre(id_chambre SMALLINT IDENTITY(1,1),
        id_hotel SMALLINT not null,
        numero_chambre SMALLINT NOT NULL, 
        etage Char(3) NOT NULL,
        etat BIT, /*occupe = 1 et non-occupé=0*/
        id_typechambre SMALLINT,
        CONSTRAINT PK_Chambre Primary Key (id_hotel, id_chambre),
        CONSTRAINT FK_idHotel FOREIGN KEY (id_hotel) REFERENCES Hotel,
        CONSTRAINT AK_Chambre Unique (id_hotel, Etage, Numero_chambre),
        CONSTRAINT FK_typeChambre FOREIGN KEY(id_typechambre) REFERENCES TypeChambre (id_typechambre));

    /*Amelie*/

    CREATE TABLE Facture(id_facture SMALLINT IDENTITY (1,1),
        solde DECIMAL(8,2),  
        methode_Paiement VARCHAR(8), /*débit, crédit, comptant*/
        id_client SMALLINT,
        id_Hotel SMALLINT,
        CONSTRAINT PK_idFacture PRIMARY KEY (id_facture),
        CONSTRAINT FK_idClient FOREIGN KEY (id_client) REFERENCES Client(id_client),
        CONSTRAINT FK_idhotelfacture FOREIGN KEY (id_Hotel) REFERENCES Hotel(id_hotel),
        CONSTRAINT CK_soldePositif CHECK (solde>=0));

/*filip*/

	CREATE TABLE Reservation(id_reservation SMALLINT IDENTITY(1,1) PRIMARY KEY,
        date_reserv DATETIME NOT NULL,
	date_arrivee DATETIME NOT NULL,
        date_depart DATETIME NOT NULL,
        nbreAdulte SMALLINT NOT NULL,  
        nbreEnfant SMALLINT,
        id_chambre SMALLINT, 
        id_facture SMALLINT , 
        id_client SMALLINT,
        id_hotel SMALLINT,
        CONSTRAINT FK_Client FOREIGN KEY(id_client) REFERENCES Client(id_client),  
        CONSTRAINT FK_idFacture FOREIGN KEY(id_facture) REFERENCES Facture (id_facture),
        CONSTRAINT FK_idChambre FOREIGN KEY(id_hotel, id_chambre) REFERENCES Chambre(id_hotel, id_chambre),
        CONSTRAINT CK_nbPersonne CHECK (nbreAdulte > 0 AND  nbreAdulte <= 5 AND nbreEnfant <= 5),
        CONSTRAINT CK_date CHECK (date_arrivee > GETDATE() AND date_depart >= date_arrivee));  /* Enregistrements dans les tables. Les tables doivent être chargées d'une centaine d'enregistrements */

/*1ere étape ajouter les hotels, Gabrielle*/
   Insert into Hotel values ('1 rue du Casino', 20, 5, 'Hilton','8191245444')
   Insert into Hotel values ('2 rue du Chateau', 12, 4, 'Chateau hotel','8195345454')

/*2e étape ajouter les clients, Julie et Amélie*/
    Insert into Client values ('Sam Wilson',28, 'Latourelle', 'Maniwaki', 'QC', '8194415849', 'or');
    Insert into Client values ('Bucky Barnes',43, 'Labaie', 'Québec', 'QC', '8197894543', 'argent');
    Insert into Client values ('Scarlet Witch',9, 'Pic', 'Sherbrook', 'SK', '7658794327', 'bronze');
    Insert into Client values ('Tony Stark',675, 'Rechel', 'Gatineau', 'QC', '8760983856', 'or');
    Insert into Client values ('Steve Rogers',219, 'Elan', 'Westview', 'ON', '2738254792', 'bronze');
    Insert into Client values ('Natasha Romanov',80, 'Voie', 'Messines', 'QC', '7364927382', 'or');
    Insert into Client values ('Pepper Pots',73, 'Lemire', 'Bouchette', 'QC', '8194415856', 'argent');
    Insert into Client values ('Carole Denvers',44, 'Bec', 'Gracefield', 'BC', '8194456849', 'bronze');
    Insert into Client values ('Peter Quill',897, 'Champs', 'Kazabazua', 'QC', '8160415849', 'bronze');
    Insert into Client values ('Iam Groot',230, 'Arabie', 'Blue Sea', 'PEI', '8194417209', 'argent');
    Insert into Client values ('Bruce Banner',678, 'Iris', 'Gatineau','QC', '8510415849', 'argent');
    Insert into Client values ('Peter Parker',98, 'Ascension', 'Creek', 'NB', '8510415854', 'bronze');
    Insert into Client values ('Loki Asgard',78, 'Throne', 'Kingdom', 'SK', '8510419999', 'or');
    Insert into Client values ('Caroline Lauzon',3452, 'Chemin Davies', 'Buckingham', 'QC', '8198939586', NULL);
    Insert into Client values ('Collin Smith',69, 'Appleby Priv', 'Ottawa', 'ON', '6137269874', 'argent');
    Insert into Client values ('Denis Auclair',281, 'Clark Hill', 'Shefford', 'QC', '4505392291', 'bronze');
    Insert into Client values ('Robert Robinson',56, 'Summerheaben Cresc', 'Selkirk', 'ON', '9057761850', 'or');
    Insert into Client values ('Helen Kirk',1346, 'Briarwood Dr', 'Brockville', 'ON', '6133425475', 'bronze');
    Insert into Client values ('Robert Stappert',635, 'Clarke Ave', 'Ottawa', 'ON', '6137413551', 'or');
    Insert into Client values ('Gaetan Dumoulin',881, 'Principale', 'St-Joseph-du-Lac', 'QC', '4506234898', 'argent');
    Insert into Client values ('Guy Lafleur',2001, 'Ch. de la Montagne', 'Fer des Ruisseaux', 'QC', '8196236935', 'bronze');
    Insert into Client values ('Jacques Plante',411, 'St-Louis', 'Yamachiche', 'QC', '8192963352', 'bronze');
    Insert into Client values ('Larry Robinson',47, 'Wellington St.', 'Bowmanville', 'ON', '9056239345', 'argent');
    Insert into Client values ('Wayne Gretzki',22, 'Bradbury Cres', 'Paris','ON', '5193020186', 'argent');
    Insert into Client values ('Luc Robitaille',461, 'St-Charles', 'Drummondville', 'QC', '8194743407', 'bronze');
    Insert into Client values ('Brandon Gallagher',8618, '16 Avenue', 'Blairmore', 'AB', '4035628325', 'or');
    
  /*3e étape ajouter les typedechambre, Julie*/
  Insert into TypeChambre values ('Standard',4, 2, 440, 125.49);
  Insert into TypeChambre values ('Deluxe', 4, 2, 525, 150.60);
  Insert into TypeChambre values ('Deluxe King', 2, 1, 525, 175.90);
  Insert into TypeChambre values ('Suite Familiale', 6, 3, 650, 201.99);
  Insert into TypeChambre values ('Suite Executive', 4, 2, 650, 275.95);

  /*4e étape ajouter les factures, Julie et Amélie*/
  /*Amélie*/
    Insert into Facture values (674, 'débit', 1, 1);
    Insert into Facture values (789, 'crédit', 2, 1);
    Insert into Facture values (156, 'débit', 3, 2);
    Insert into Facture values (167, 'comptant', 4, 2);
    Insert into Facture values (156, 'crédit', 5, 1);
    Insert into Facture values (789, 'débit', 6, 2);
    Insert into Facture values (678, 'crédit', 7, 2);
    Insert into Facture values (256, 'débit', 8, 1);
    Insert into Facture values (127, 'débit', 9, 1);
    Insert into Facture values (134, 'crédit', 10, 2);
    Insert into Facture values (267, 'comptant', 11, 2);
    Insert into Facture values (621, 'crédit', 12, 1);
  /*Julie*/
    Insert into Facture values (567, 'débit', 13, 1);
  	Insert into Facture values (275.83, 'débit', 21, 1);
    Insert into Facture values (789.23, 'crédit', 19, 2);
    Insert into Facture values (189.23, 'débit', 14, 1);
    Insert into Facture values (145.23, 'comptant', 20, 1);
    Insert into Facture values (342.87, 'crédit', 15, 2);
    Insert into Facture values (837.23, 'débit', 22, 1);
    Insert into Facture values (870.23, 'crédit', 16, 1);
    Insert into Facture values (234.12, 'débit', 25, 2);
    Insert into Facture values (1490.87, 'débit', 17, 1);
    Insert into Facture values (239.21, 'crédit', 23, 1);
    Insert into Facture values (145.23, 'comptant', 18, 2);
    Insert into Facture values (453.23, 'crédit', 24, 2);
    Insert into Facture values (267.98, 'débit', 19, 122); /*should be an error on this entry there is no ID_HOTEL 122*/

  /*5e étape ajouter des chambres, Julie*/
    Insert into Chambre Values (1, 10, '1', 1, 1);
    Insert into Chambre Values (1, 11, '1', 1, 2);
    Insert into Chambre Values (1, 12, '1', 1, 3);
    Insert into Chambre Values (1, 13, '1', 1, 3);
    Insert into Chambre Values (1, 14, '1', 0, 4);
    Insert into Chambre Values (1, 15, '1', 1, 5);
    Insert into Chambre Values (1, 16, '1', 1, 1);
    Insert into Chambre Values (1, 17, '1', 0, 2);
    Insert into Chambre Values (1, 18, '1', 1, 3);
    Insert into Chambre Values (1, 19, '1', 1, 4);
    Insert into Chambre Values (1, 20, '2', 1, 1);
    Insert into Chambre Values (1, 21, '2', 1, 2);
    Insert into Chambre Values (1, 22, '2', 1, 3);
    Insert into Chambre Values (1, 23, '2', 1, 4);
    Insert into Chambre Values (1, 24, '2', 1, 5);
    Insert into Chambre Values (1, 25, '2', 1, 5);
    Insert into Chambre Values (1, 26, '2', 0, 5);
    Insert into Chambre Values (1, 27, '2', 1, 1);
    Insert into Chambre Values (1, 28, '2', 1, 2);
    Insert into Chambre Values (1, 29, '2', 1, 2);
    Insert into Chambre Values (1, 30, '3', 1, 1);
    Insert into Chambre Values (1, 31, '3', 1, 2);
    Insert into Chambre Values (1, 32, '3', 1, 3);
    Insert into Chambre Values (1, 33, '3', 1, 4);
    Insert into Chambre Values (1, 34, '3', 1, 5);
    Insert into Chambre Values (1, 35, '3', 1, 1);
    Insert into Chambre Values (1, 36, '3', 1, 2);
    Insert into Chambre Values (1, 37, '3', 1, 2);
    Insert into Chambre Values (1, 38, '3', 1, 3);
    Insert into Chambre Values (1, 39, '3', 1, 4);
    Insert into Chambre Values (2, 10, '1', 1, 1);
    Insert into Chambre Values (2, 11, '1', 1, 2);
    Insert into Chambre Values (2, 12, '1', 1, 3);
    Insert into Chambre Values (2, 13, '1', 1, 3);
    Insert into Chambre Values (2, 14, '1', 0, 4);
    Insert into Chambre Values (2, 15, '1', 1, 5);
    Insert into Chambre Values (2, 16, '1', 1, 1);
    Insert into Chambre Values (2, 17, '1', 0, 2);
    Insert into Chambre Values (2, 18, '1', 1, 3);
    Insert into Chambre Values (2, 19, '1', 1, 4);
    Insert into Chambre Values (2, 20, '2', 1, 1);
    Insert into Chambre Values (2, 21, '2', 1, 2);
    Insert into Chambre Values (2, 22, '2', 1, 3);
    Insert into Chambre Values (2, 23, '2', 1, 4);
    Insert into Chambre Values (2, 24, '2', 1, 5);
    Insert into Chambre Values (2, 25, '2', 1, 5);
    Insert into Chambre Values (2, 26, '2', 0, 5);
    Insert into Chambre Values (2, 27, '2', 1, 1);
    Insert into Chambre Values (2, 28, '2', 1, 2);
    Insert into Chambre Values (2, 29, '2', 1, 2);
    Insert into Chambre Values (2, 30, '3', 1, 1);
    Insert into Chambre Values (2, 31, '3', 1, 2);
    Insert into Chambre Values (2, 32, '3', 1, 3);
    Insert into Chambre Values (2, 33, '3', 1, 4);
    Insert into Chambre Values (2, 34, '3', 1, 5);
    Insert into Chambre Values (2, 35, '3', 1, 1);
    Insert into Chambre Values (2, 36, '3', 1, 2);
    Insert into Chambre Values (2, 37, '3', 1, 2);
    Insert into Chambre Values (2, 38, '3', 1, 3);
    Insert into Chambre Values (2, 39, '3', 1, 4);

 
  
    /*Filip - +25 enregistrements* Fonctionne pas - A VOIR*/
   Insert into Reservation values (GETDATE(), '20210325 01:12:00', '20210413 12:00:00', 5, 0, 3, 1, 1, 1);
   Insert into Reservation values (GETDATE(), '20210720 13:00:00' , '20210725 12:00:00' , 3, 0, 6, 1, 5, 1);
   Insert into Reservation values (GETDATE(), '20210518 16:30:00' , '20210519 12:30:00' , 2, 3, 5, 6, 5, 1);
   Insert into Reservation values (GETDATE(), '20210602 09:30:00' , '20210604 18:00:00' , 4, 5, 1, 6, 3, 1);
   Insert into Reservation values ( GETDATE(),'20210410 11:00:00' , '20210416 12:30:00' , 2, 2, 2, 9, 1, 1);
   Insert into Reservation values (GETDATE(), '20210402 09:30:00', '20210410 12:30:00', 2, 3, 34, 3, 3, 2);
   Insert into Reservation values (GETDATE(), '20210911 12:30:00' , '20210915 18:00:00' , 2, 1, 9, 1, 1, 1);
   Insert into Reservation values (GETDATE(), '20210819 17:30:00', '20210821 18:00:00', 2, 0, 3, 2, 2, 1);
   Insert into Reservation values ( GETDATE(),'20210428 11:00:00' , '20210430 18:00:00' , 3, 1, 14, 6, 12, 1);
   Insert into Reservation values ( GETDATE(),'20210522 10:00:00' , '20210524 12:00:00' , 4, 2, 8, 2, 1, 1);
   Insert into Reservation values (GETDATE(), '20210530 19:00:00' , '20210601 15:00:00' , 2, 5, 3, 5, 2, 1);
   Insert into Reservation values (GETDATE(), '20210902 14:00:00' , '20210910 15:30:00' , 4, 4, 12, 7, 5, 1);
   Insert into Reservation values (GETDATE(), '20210625 09:30:00' , '20210627 12:30:00' , 3, 2, 23, 11, 14, 1);
   Insert into Reservation values (GETDATE(), '20211110 12:30:00' , '20211112 18:30:00' , 4, 5, 5, 6, 4, 1);
   Insert into Reservation values (GETDATE(), '20211028 11:30:00' , '20211030 12:30:00' , 1, 1, 3, 7, 2, 1);
   Insert into Reservation values (GETDATE(), '20210814 11:30:00' , '20210818 18:00:00' , 3, 2, 5, 9, 12, 1);
   Insert into Reservation values (GETDATE(), '20211210 12:00:00' , '20211214 18:00:00' , 5, 4, 5, 8, 1, 1);
   Insert into Reservation values (GETDATE(), '20210902 13:00:00' , '20210910 15:00:00' , 2, 3, 9, 5, 8, 1);
   Insert into Reservation values (GETDATE(), '20211105 16:00:00' , '20211110 12:00:00' , 3, 1, 1, 12, 6, 1);
   Insert into Reservation values (GETDATE(), '20210413 11:30:00' , '20210415 18:30:00' , 2, 3, 7, 10, 13, 1);
   Insert into Reservation values ( GETDATE(),'20211120 10:00:00' , '20211122 18:30:00' , 4, 2, 6, 1, 5, 1);
   Insert into Reservation values (GETDATE(), '20210908 15:30:00' , '20210910 12:30:00' , 2, 1, 4, 2, 3, 1);
   Insert into Reservation values (GETDATE(), '20210402 09:30:00', '20210410 12:30:00', 2, 2, 3, 4, 4, 1);
   Insert into Reservation values (GETDATE(), '20210501 09:30:00', '20210508 12:30:00', 2, 2, 5, 4, 3, 1);
   Insert into Reservation values (GETDATE(), '20210611 08:30:00', '20210710 12:30:00', 1, 2, 9, 1, 5, 1);

 
  /*Gabriel*/
  /* Création de l'index */
   CREATE UNIQUE INDEX Idx_nomEtoile
   ON Hotel(Adresse,etoiles)

  /*Filip*/
  /* Création des vues */
  /* CREATE VIEW () */
  CREATE VIEW infoResgistration 
  AS SELECT Reservation.date_arrivee, Reservation.date_depart, Client.nom_client, Client.Client_telephone, Facture.solde, Facture.methode_Paiement, Chambre.numero_chambre
  FROM Reservation, Client, Facture, Chambre
  WHERE Reservation.id_client = Client.id_client
  AND Reservation.id_facture = Facture.id_facture
  AND Reservation.id_chambre = Chambre.id_chambre;

  SELECT * FROM infoResgistration; 

  /*Julie*/
  /* Faire une prise d'écran de la représentation graphique du schéma relationnel */

  /* 20 requêtes complexes, originales et parfaitement distinctes les unes des autres (jointures internes, jointures externes, requêtes imbriquées, utilisation du GROUP BY et HAVING, ect)*/
  /*Amelie - 5 requêtes*/
  
SELECT nom_client 
  FROM Client 
  WHERE id_client IN 
    (SELECT id_client 
    FROM Facture 
    WHERE solde> 180); /*Retourner le nom des clients pour lesquels le montant d'une facture est plus grand que 150*/
  
SELECT id_facture AS facture_bronze_quebec
  FROM Facture
  WHERE id_facture IN
   (SELECT id_client
    FROM Client
    WHERE statut_privilege='bronze' AND province='QC')/* Retourne les factures pour lesquels le client a un statut privilege bronze et dont la province est le Québec*/ 

SELECT SUM(solde) AS solde_total, AVG(solde) AS solde_moyenne, MAX(solde) AS solde_max, MIN(solde) AS solde_min 
  FROM Facture; /*Trouver le total, la moyenne, le maximum et le minimum parmi les soldes de toutes les factures.*/
  
SELECT id_hotel, etage, numero_chambre AS chambres_disponibles
  FROM Chambre
  WHERE etat=0
  GROUP BY id_hotel, etage, numero_chambre; /*Regroupe les chambres disponibles par hotel, étage et numéro de chambre*/ 
  
/*regroupe les types de chambre, les nombre de chambre qui ont un solde moyen plus grand que 1000 avec tout les prix plus grand que 170*/
SELECT t.nom_typechambre AS TYPE_CHAMBRE, count(c.id_chambre) AS NOMBRE_CHAMBRE, AVG(t.solde) AS SOLDE_MOYEN
  FROM Chambre c, TypeChambre t
  WHERE t.prix >170
  GROUP BY t.nom_typechambre
  HAVING SOLDE_MOYEN <1000; 

  /*Gabriel - 5 requêtes*/
  SELECT adresse FROM Hotel;
  SELECT * FROM Hotel WHERE nom_hotel = 'Hilton' ;
  SELECT telephone FROM Hotel WHERE nom_hotel = 'Hilton';
  SELECT nom_Hotel FROM Hotel;

  SELECT *
  FROM Hotel
  WHERE etoiles > 3 
  ORDER BY etoiles DESC ;


  /*Filip - 5 requêtes*/
  SELECT date_arrivee FROM Reservation;
  SELECT nbreAdulte FROM Reservation;
  SELECT * FROM Reservation WHERE nbreEnfant > 2;
  SELECT * FROM Reservation ORDER BY date_arrivee, date_depart;
  SELECT colname FROM Reservation WHERE EXISTS (SELECT colname FROM tablename WHERE condition);
  SELECT count(*) FROM Reservation WHERE nbreAdulte = 5 AND nbreEnfant = 5;


  /*Julie - 5 requêtes*/
/*Requête pour démontrer les numéros de chambre et leur étage ainsi que leur disponibilité ou non*/
Select hotel.nom_Hotel, Chambre.Numero_chambre, Chambre.Etage, Chambre.etat
From
Hotel
JOIN Chambre on Hotel.id_hotel=Chambre.id_hotel;

/*- Julie - Requête pour démontrer le nombre de chambre disponible dans un hotel*/
Select ho.nom_hotel, Count(ch.numero_chambre) as Nbr_chambre_disponible
From 
Hotel ho,
Chambre ch
where ho.id_hotel=ch.id_hotel
and 
Etat=0 /*0 = disponible et 1= nondisponible*/
Group by ho.nom_Hotel

/* - Julie - Requête pour démontrer le type de chambre disponible et leur prix dans un hotel spécifique*/
Select ch.id_hotel, ho.nom_hotel, ch.numero_chambre, ch.etage, tc.nom_typechambre, tc.prix, ch.etat
From
Chambre ch,
TypeChambre tc,
Hotel ho
where ch.id_typechambre=tc.id_typechambre
and ho.id_hotel=ch.id_hotel

/*- Julie - Requête qui démontre quelle sont les chambre dont le prix est plus élevé que 150.60 avec l'hotel, leur numéro et l'étage*/
Select ch.id_hotel, ch.numero_chambre, ch.etage, tc.nom_typechambre, tc.prix
from TypeChambre tc,
chambre ch
where
ch.id_typechambre=tc.id_typechambre
and 
tc.prix > 150.60
Order by tc.prix, id_hotel, ch.numero_chambre ASC


/*- Julie - Requête qui démontre les clients qui ont fait une réservation dont le solde est plus de 160$ avec leur date d'arrivée et de départ ainsi que l'hôtel dans lequel ils ont réservé*/
Select c.id_client, c.nom_client, F.id_facture, f.id_Hotel, ho.nom_Hotel, f.solde, r.id_reservation, r.date_arrivee, r.date_depart
From Facture f,
Client c,
Hotel ho,
Reservation R
Where f.id_client IN (Select id_client from facture where solde>160)
and
f.id_client=c.id_client
and f.id_Hotel=ho.id_hotel
and f.id_facture=r.id_facture

/*-Julie - Requête qui démontre le revenus net d'un hôtel dont l'ID est 1*/
Select Hotel.nom_Hotel, (Select SUM(solde) from facture where id_hotel=1) as Revenu_net
from Hotel
Where id_Hotel=1;

/* 6 exemples de déclencheurs, procédures stockées et curseurs */
/* Amélie */
/*TRIGGER - Protège l'enregistrement de la table client lors de la suppression de id_client dans la table facture*/
CREATE TRIGGER Trig_DelCascade ON Client
FOR DELETE
AS
DELETE id_client
FROM Facture, deleted
WHERE Facture.id_client = deleted.id_client;

/*PROCÉDURE STOCKÉES - Soumet les id et le solde des factures liées à un client suite à l'exécution de la procédure avec le nom du client */
CREATE PROCEDURE PS_FacturesClient
@nom varchar(30) AS
SELECT id_facture, solde
FROM Facture f INNER JOIN Client c
ON f.id_client=c.id_client
WHERE c.nom_client= @nom
ORDER BY id_facture
GO 

EXEC PS_FacturesClient 'Sam Wilson'

/* Gabriel TRIGGER - Protège l'enregistrement de la table chambre lors de la suppression d'un hotel dans la table hotel*/
CREATE TRIGGER Trig_DelCascadeHotel ON Hotel
FOR DELETE
AS
DELETE id_hotel
FROM chambre, deleted
WHERE Chambre.id_hotel = deleted.id_hotel;

/*Filip*/
/*TRIGGER - Lorsque une chambre est ajouté à la base de donnée pour un hôtel, diminuer le nombre de chambres disponibles pour cet hôtel*/
CREATE TRIGGER Chambre_dispo ON Chambre
AFTER INSERT
AS
DECALRE @id_hotel DECIMAL
SELECT @id_hotel = inserted.id_hotel
FROM inserted
UPDATE Hotel
SET Hotel.chambre_disponible = Hotel.chambre_disponible - 1
WHERE Hotel.id_hotel = @id_hotel;


/* Julie */
/* CURSOR - En se basant sur la table réservation, les chambres qui sont présentement occupé selon les dates d'arrivée et les dates de départ leur état sera mis=1 (1 étant occupé)) */

DECLARE @id_chambre INT 
DECLARE CursorE CURSOR
FOR
  Select id_chambre
  From Chambre
  Where id_chambre IN (Select id_chambre from Reservation where date_arrivee <= getdate() and date_depart >= getdate())
OPEN CursorE
  FETCH NEXT from CursorE into @id_chambre
  While @@FETCH_STATUS=0
  BEGIN
    update Chambre
    set etat=1
    where id_chambre=@id_chambre
  FETCH NEXT from CursorE into @id_chambre
END
Close CursorE
Deallocate CursorE

/* Julie */
/* Procédure qui vérifie les chambres libre dans un hôtel en particulier ainsi que le type de chambre, le numéro et l'étage de celle-ci*/
CREATE Procedure HOTELCHAMBRELibre
@NomHOTEL Varchar(30) as
Select id_chambre, numero_chambre, etage, etat, (Select nom_typechambre from TypeChambre where chambre.id_typechambre=TypeChambre.id_typechambre) as TypeChambre
from Chambre inner join Hotel
ON Chambre.id_hotel = Hotel.id_hotel
where HOTEL.nom_Hotel = @NomHOTEL and chambre.etat=0
ORDER BY chambre.numero_chambre
GO

Exec HotelchambreLibre 'Chateau Hotel';
