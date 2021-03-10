/* Nom du serveur: VMEDUBDS04\INF4163_1_2021 */
/* Se fichier est à remettre pour le 23 mars */

/* Création base de données */
CREATE DATABASE SGH

/* Utiliser la base de donnée SGH pour les prochaines commandes */
USE SGH

  /* Création des tables */
    CREATE TABLE Hotel(ID_Hotel, 
        Adresse, 
        Chambre_Disponible, 
        étoiles, 
        Nom_Hotel, 
        Téléphone, 
        Horaire)
    CREATE TABLE Client(id_client SMALLINT IDENTITY (1,1) PRIMARY KEY,
        nom_Client VARCHAR(30), 
        numeroCivique SMALLINT,
        rue VARCHAR(30) ,
        ville VARCHAR(30) NOT NULL,
        province CHAR(3),
        téléphone CHAR(9), 
        statut BIT, /*Le client est actif = 1(il loue une chambre ou doit payer une facture), 
                      le client est inactif = 0 (il n'a pas de chambre louée et toutes ses factures sont payées*/
        id_réservation SMALLINT IDENTITY (1,1) FOREIGN KEY)
    CREATE TABLE Reservation(ID_Réservation, 
        Hre_arrivée, 
        Hre_départ, 
        NbreAdulte, 
        NbreEnfant, 
        ID_chambre, 
        ID_Facturation)
    CREATE TABLE Chambre(Chambre, 
        État, 
        ID_type, 
        Nom_type, 
        Nbre_lit, 
        Superficie, 
        Prix)
    CREATE TABLE Employe(ID_Employé, 
        Nom_Employé, 
        Salaire, 
        Titre,  
        ID_Departement)
    CREATE TABLE Facture(ID_Facture, 
        Solde,  
        Méthode_Paiement, 
        ID_Client)

  
  /* Enregistrements dans les tables. Les tables doivent être chargées d'une centaine d'enregistrements */
  
  
  /* Création de l'index */
    CREATE INDEX ()
  
  /* Création des vues */
    CREATE VIEW ()
  
  /* Altération d'une table */
    ALTER TABLE ()
  
  /* Faire une prise d'écran de la représentation graphique du schéma relationnel */
  
  
