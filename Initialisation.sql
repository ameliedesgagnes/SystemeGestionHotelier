/* Nom du serveur: VMEDUBDS04\INF4163_1_2021 */
/* Se fichier est à remettre pour le 23 mars */

/* Création base de données */
CREATE DATABASE SGH

/* Utiliser la base de donnée SGH pour les prochaines commandes */
USE SGH

  /* Création des tables */
  CREATE TABLE Client(id_client SMALLINT IDENTITY (1,1) PRIMARY KEY,
                      nom_Client VARCHAR(30), 
                      numeroCivique SMALLINT,
                      rue VARCHAR(30) ,
                      ville VARCHAR(30) NOT NULL,
                      province(3),
                      téléphone CHAR(9), 
                      status BIT, /*Le client est actif 1(il loue une chambre ou doit payer une facture, n'a pas de chambre louée et toutes ses factures sont payées*/
                      id_réservation SMALLINT IDENTITY (1,1) FOREIGN KEY)
  CREATE TABLE Reservation()
  CREATE TABLE Chambre()
  CREATE TABLE Employe()
  CREATE TABLE Facture()
  CREATE TABLE Hotel()
  
  /* Enregistrements dans les tables. Les tables doivent être chargées d'une centaine d'enregistrements */
  
  
  /* Création de l'index */
  CREATE INDEX ()
  
  /* Création des vues */
  CREATE VIEW ()
  
  /* Altération d'une table */
  ALTER TABLE ()
  
  /* Faire une prise d'écran de la représentation graphique du schéma relationnel */
  
  
