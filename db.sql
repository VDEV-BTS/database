CREATE TABLE SECTEUR(
   id_secteur VARCHAR(50),
   libelle VARCHAR(50),
   PRIMARY KEY(id_secteur)
);

CREATE TABLE PORT(
   id_port VARCHAR(50),
   nom_port VARCHAR(50),
   PRIMARY KEY(id_port)
);

CREATE TABLE CATEGORIE(
   id_categorie VARCHAR(50),
   nom VARCHAR(50),
   PRIMARY KEY(id_categorie)
);

CREATE TABLE PERIODE(
   id_periode VARCHAR(50),
   date_debut DATE,
   date_fin VARCHAR(50),
   PRIMARY KEY(id_periode)
);

CREATE TABLE BATEAU(
   id_bateau VARCHAR(50),
   nom VARCHAR(50),
   longueur DECIMAL(15,2),
   largeur DECIMAL(15,2),
   vitesse INT,
   PRIMARY KEY(id_bateau)
);

CREATE TABLE EQUIPEMENT(
   id_equipement VARCHAR(50),
   nom_equipement VARCHAR(50),
   PRIMARY KEY(id_equipement)
);

CREATE TABLE LAISON(
   code INT,
   distance DECIMAL(15,2),
   id_port VARCHAR(50) NOT NULL,
   id_port_1 VARCHAR(50) NOT NULL,
   id_secteur VARCHAR(50) NOT NULL,
   PRIMARY KEY(code),
   FOREIGN KEY(id_port) REFERENCES PORT(id_port),
   FOREIGN KEY(id_port_1) REFERENCES PORT(id_port),
   FOREIGN KEY(id_secteur) REFERENCES SECTEUR(id_secteur)
);

CREATE TABLE TYPE(
   id_categorie VARCHAR(50),
   id_type VARCHAR(50),
   nom VARCHAR(50),
   PRIMARY KEY(id_categorie, id_type),
   FOREIGN KEY(id_categorie) REFERENCES CATEGORIE(id_categorie)
);

CREATE TABLE TRAVERSEE(
   id_traverse VARCHAR(50),
   date_ DATE,
   heure TIME,
   id_bateau VARCHAR(50) NOT NULL,
   code INT NOT NULL,
   PRIMARY KEY(id_traverse),
   FOREIGN KEY(id_bateau) REFERENCES BATEAU(id_bateau),
   FOREIGN KEY(code) REFERENCES LAISON(code)
);

CREATE TABLE Tarif(
   id_tarif VARCHAR(50),
   prix VARCHAR(50),
   code INT NOT NULL,
   id_categorie VARCHAR(50) NOT NULL,
   id_type VARCHAR(50) NOT NULL,
   id_periode VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_tarif),
   FOREIGN KEY(code) REFERENCES LAISON(code),
   FOREIGN KEY(id_categorie, id_type) REFERENCES TYPE(id_categorie, id_type),
   FOREIGN KEY(id_periode) REFERENCES PERIODE(id_periode)
);

CREATE TABLE RESERVATION(
   id_resa INT,
   nom VARCHAR(50),
   adresse VARCHAR(50),
   cp VARCHAR(50),
   ville VARCHAR(50),
   id_traverse VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_resa),
   FOREIGN KEY(id_traverse) REFERENCES TRAVERSEE(id_traverse)
);

CREATE TABLE Possede(
   id_bateau VARCHAR(50),
   id_equipement VARCHAR(50),
   PRIMARY KEY(id_bateau, id_equipement),
   FOREIGN KEY(id_bateau) REFERENCES BATEAU(id_bateau),
   FOREIGN KEY(id_equipement) REFERENCES EQUIPEMENT(id_equipement)
);

CREATE TABLE Accepte(
   id_categorie VARCHAR(50),
   id_bateau VARCHAR(50),
   capacite_max INT,
   PRIMARY KEY(id_categorie, id_bateau),
   FOREIGN KEY(id_categorie) REFERENCES CATEGORIE(id_categorie),
   FOREIGN KEY(id_bateau) REFERENCES BATEAU(id_bateau)
);

CREATE TABLE Reserve(
   id_categorie VARCHAR(50),
   id_type VARCHAR(50),
   id_resa INT,
   nombre VARCHAR(50),
   PRIMARY KEY(id_categorie, id_type, id_resa),
   FOREIGN KEY(id_categorie, id_type) REFERENCES TYPE(id_categorie, id_type),
   FOREIGN KEY(id_resa) REFERENCES RESERVATION(id_resa)
);
