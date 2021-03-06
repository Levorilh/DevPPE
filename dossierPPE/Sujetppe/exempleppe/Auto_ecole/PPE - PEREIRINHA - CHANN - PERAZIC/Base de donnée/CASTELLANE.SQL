DROP DATABASE IF EXISTS CASTELLANE;

CREATE DATABASE IF NOT EXISTS CASTELLANE;
USE CASTELLANE;
# -----------------------------------------------------------------------------
#       TABLE : ETABLISSEMENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ETABLISSEMENT
 (
   DEGR� CHAR(30) NOT NULL  ,
   NOM CHAR(50) NULL  ,
   ADRESSE CHAR(50) NULL  
   , PRIMARY KEY (DEGR�) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : MOIS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MOIS
 (
   N�MOIS INTEGER(2) NOT NULL  ,
   ANN�E DATE NULL  
   , PRIMARY KEY (N�MOIS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ETUDIANT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ETUDIANT
 (
   N�_CLIENT INTEGER(10) NOT NULL  ,
   DEGR� CHAR(30) NOT NULL  ,
   NIVEAU_ETUDE CHAR(20) NULL  ,
   REDUCTION CHAR(3) NULL  ,
   NOM_CLIENT CHAR(30) NULL  ,
   PR�NOM_CLIENT CHAR(30) NULL  ,
   ADRESSE_CLIENT CHAR(50) NULL  ,
   DATE_DE_NAISSANCE DATE NULL  ,
   T�L�PHONE INTEGER(10) NULL  ,
   DATE_INSCRIPTION DATE NULL  ,
   MODE_FACTURATION CHAR(30) NULL  
   , PRIMARY KEY (N�_CLIENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ETUDIANT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ETUDIANT_ETABLISSEMENT
     ON ETUDIANT (DEGR� ASC);

# -----------------------------------------------------------------------------
#       TABLE : MOTO
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MOTO
 (
   CODE_MOD�LE INTEGER(10) NOT NULL  ,
   CYLINDRE CHAR(10) NULL  ,
   PUISSANCE CHAR(10) NULL  ,
   NOM_MOD�LE CHAR(50) NULL  ,
   ANN�E_MOD�LE DATE NULL  
   , PRIMARY KEY (CODE_MOD�LE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : EXAM
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EXAM
 (
   ID_EXAM INTEGER(20) NOT NULL  ,
   CODE_TYPE INTEGER(5) NOT NULL  
   , PRIMARY KEY (ID_EXAM) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EXAM
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EXAM_TYPE_EXAM
     ON EXAM (CODE_TYPE ASC);

# -----------------------------------------------------------------------------
#       TABLE : VOITURE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS VOITURE
 (
   CODE_MOD�LE INTEGER(10) NOT NULL  ,
   TYPE_CONSO CHAR(40) NULL  ,
   NOM_MOD�LE CHAR(50) NULL  ,
   ANN�E_MOD�LE DATE NULL  
   , PRIMARY KEY (CODE_MOD�LE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SALARI�
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SALARI�
 (
   N�_CLIENT INTEGER(10) NOT NULL  ,
   NOM_ENTREPRISE CHAR(32) NULL  ,
   NOM_CLIENT CHAR(30) NULL  ,
   PR�NOM_CLIENT CHAR(30) NULL  ,
   ADRESSE_CLIENT CHAR(50) NULL  ,
   DATE_DE_NAISSANCE DATE NULL  ,
   T�L�PHONE INTEGER(10) NULL  ,
   DATE_INSCRIPTION DATE NULL  ,
   MODE_FACTURATION CHAR(30) NULL  
   , PRIMARY KEY (N�_CLIENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : MOD�LE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MOD�LE
 (
   CODE_MOD�LE INTEGER(10) NOT NULL  ,
   NOM_MOD�LE CHAR(50) NULL  ,
   ANN�E_MOD�LE DATE NULL  
   , PRIMARY KEY (CODE_MOD�LE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : V�HICULE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS V�HICULE
 (
   N�V�HICULE INTEGER(10) NOT NULL  ,
   CODE_MOD�LE INTEGER(10) NOT NULL  ,
   N�IMMATRICULATION CHAR(20) NULL  ,
   DATE_ACHAT DATE NULL  ,
   NB_KM_INITIAL INTEGER(8) NULL  
   , PRIMARY KEY (N�V�HICULE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE V�HICULE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_V�HICULE_MOD�LE
     ON V�HICULE (CODE_MOD�LE ASC);

# -----------------------------------------------------------------------------
#       TABLE : CLIENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CLIENT
 (
   N�_CLIENT INTEGER(10) NOT NULL  ,
   NOM_CLIENT CHAR(30) NULL  ,
   PR�NOM_CLIENT CHAR(30) NULL  ,
   ADRESSE_CLIENT CHAR(50) NULL  ,
   DATE_DE_NAISSANCE DATE NULL  ,
   T�L�PHONE INTEGER(10) NULL  ,
   DATE_INSCRIPTION DATE NULL  ,
   MODE_FACTURATION CHAR(30) NULL  
   , PRIMARY KEY (N�_CLIENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : MONITEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MONITEUR
 (
   N�MONITEUR INTEGER(10) NOT NULL  ,
   NOM_MONTEUR CHAR(30) NULL  ,
   DATE_EMBAUCHE DATE NULL  
   , PRIMARY KEY (N�MONITEUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : LE�ON
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS LE�ON
 (
   N�LE�ON INTEGER(2) NOT NULL  ,
   DATE_LE�ON DATE NULL  ,
   HEURE_LE�ON CHAR(5) NULL  ,
   TARIF_HEURE CHAR(5) NULL  
   , PRIMARY KEY (N�LE�ON) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : TYPE_EXAM
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPE_EXAM
 (
   CODE_TYPE INTEGER(5) NOT NULL  ,
   LIBELLE_TYPE CHAR(40) NULL  
   , PRIMARY KEY (CODE_TYPE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ROULER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ROULER
 (
   N�MOIS INTEGER(2) NOT NULL  ,
   N�V�HICULE INTEGER(10) NOT NULL  ,
   N�_KM_PARCOURRUS_DANS_LE_MOIS INTEGER(8) NULL  
   , PRIMARY KEY (N�MOIS,N�V�HICULE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ROULER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ROULER_MOIS
     ON ROULER (N�MOIS ASC);

CREATE  INDEX I_FK_ROULER_V�HICULE
     ON ROULER (N�V�HICULE ASC);

# -----------------------------------------------------------------------------
#       TABLE : EXAM_CODE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EXAM_CODE
 (
   ID_EXAM INTEGER(20) NOT NULL  ,
   N�_CLIENT INTEGER(10) NOT NULL  ,
   DATE_C DATE NULL  ,
   HEURE_C TIME NULL  ,
   RESULTAT_C CHAR(15) NULL  
   , PRIMARY KEY (ID_EXAM,N�_CLIENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EXAM_CODE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EXAM_CODE_EXAM
     ON EXAM_CODE (ID_EXAM ASC);

CREATE  INDEX I_FK_EXAM_CODE_CLIENT
     ON EXAM_CODE (N�_CLIENT ASC);

# -----------------------------------------------------------------------------
#       TABLE : ULTILISER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ULTILISER
 (
   N�LE�ON INTEGER(2) NOT NULL  ,
   N�V�HICULE INTEGER(10) NOT NULL  
   , PRIMARY KEY (N�LE�ON,N�V�HICULE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ULTILISER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ULTILISER_LE�ON
     ON ULTILISER (N�LE�ON ASC);

CREATE  INDEX I_FK_ULTILISER_V�HICULE
     ON ULTILISER (N�V�HICULE ASC);

# -----------------------------------------------------------------------------
#       TABLE : PLANNING
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PLANNING
 (
   N�LE�ON INTEGER(2) NOT NULL  ,
   N�_CLIENT INTEGER(10) NOT NULL  ,
   N�MONITEUR INTEGER(10) NOT NULL  ,
   CODE_MOD�LE INTEGER(10) NOT NULL  ,
   DATE_HEURE_D�BUT DATETIME NULL  ,
   DATE_HEURE_FIN DATETIME NULL  
   , PRIMARY KEY (N�LE�ON,N�_CLIENT,N�MONITEUR,CODE_MOD�LE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PLANNING
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PLANNING_LE�ON
     ON PLANNING (N�LE�ON ASC);

CREATE  INDEX I_FK_PLANNING_CLIENT
     ON PLANNING (N�_CLIENT ASC);

CREATE  INDEX I_FK_PLANNING_MONITEUR
     ON PLANNING (N�MONITEUR ASC);

CREATE  INDEX I_FK_PLANNING_MOD�LE
     ON PLANNING (CODE_MOD�LE ASC);

# -----------------------------------------------------------------------------
#       TABLE : EXAM_PERMIS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EXAM_PERMIS
 (
   N�_CLIENT INTEGER(10) NOT NULL  ,
   ID_EXAM INTEGER(20) NOT NULL  ,
   DATE_P DATE NULL  ,
   HEURE_P TIME NULL  ,
   RESULTAT_P CHAR(15) NULL  
   , PRIMARY KEY (N�_CLIENT,ID_EXAM) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EXAM_PERMIS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EXAM_PERMIS_CLIENT
     ON EXAM_PERMIS (N�_CLIENT ASC);

CREATE  INDEX I_FK_EXAM_PERMIS_EXAM
     ON EXAM_PERMIS (ID_EXAM ASC);

# -----------------------------------------------------------------------------
#       TABLE : H_N�LE�ON_LE�ON
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS H_N�LE�ON_LE�ON
 (
   N�LE�ON INTEGER(2) NOT NULL  ,
   DATE_HISTO DATE NOT NULL  
   , PRIMARY KEY (N�LE�ON,DATE_HISTO) 
 ) 
 comment = "Table d'historisation des modifications de la table LE�ON";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE H_N�LE�ON_LE�ON
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_H_N�LE�ON_LE�ON_LE�ON
     ON H_N�LE�ON_LE�ON (N�LE�ON ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE ETUDIANT 
  ADD FOREIGN KEY FK_ETUDIANT_ETABLISSEMENT (DEGR�)
      REFERENCES ETABLISSEMENT (DEGR�) ;


ALTER TABLE ETUDIANT 
  ADD FOREIGN KEY FK_ETUDIANT_CLIENT (N�_CLIENT)
      REFERENCES CLIENT (N�_CLIENT) ;


ALTER TABLE MOTO 
  ADD FOREIGN KEY FK_MOTO_MOD�LE (CODE_MOD�LE)
      REFERENCES MOD�LE (CODE_MOD�LE) ;


ALTER TABLE EXAM 
  ADD FOREIGN KEY FK_EXAM_TYPE_EXAM (CODE_TYPE)
      REFERENCES TYPE_EXAM (CODE_TYPE) ;


ALTER TABLE VOITURE 
  ADD FOREIGN KEY FK_VOITURE_MOD�LE (CODE_MOD�LE)
      REFERENCES MOD�LE (CODE_MOD�LE) ;


ALTER TABLE SALARI� 
  ADD FOREIGN KEY FK_SALARI�_CLIENT (N�_CLIENT)
      REFERENCES CLIENT (N�_CLIENT) ;


ALTER TABLE V�HICULE 
  ADD FOREIGN KEY FK_V�HICULE_MOD�LE (CODE_MOD�LE)
      REFERENCES MOD�LE (CODE_MOD�LE) ;


ALTER TABLE ROULER 
  ADD FOREIGN KEY FK_ROULER_MOIS (N�MOIS)
      REFERENCES MOIS (N�MOIS) ;


ALTER TABLE ROULER 
  ADD FOREIGN KEY FK_ROULER_V�HICULE (N�V�HICULE)
      REFERENCES V�HICULE (N�V�HICULE) ;


ALTER TABLE EXAM_CODE 
  ADD FOREIGN KEY FK_EXAM_CODE_EXAM (ID_EXAM)
      REFERENCES EXAM (ID_EXAM) ;


ALTER TABLE EXAM_CODE 
  ADD FOREIGN KEY FK_EXAM_CODE_CLIENT (N�_CLIENT)
      REFERENCES CLIENT (N�_CLIENT) ;


ALTER TABLE ULTILISER 
  ADD FOREIGN KEY FK_ULTILISER_LE�ON (N�LE�ON)
      REFERENCES LE�ON (N�LE�ON) ;


ALTER TABLE ULTILISER 
  ADD FOREIGN KEY FK_ULTILISER_V�HICULE (N�V�HICULE)
      REFERENCES V�HICULE (N�V�HICULE) ;


ALTER TABLE PLANNING 
  ADD FOREIGN KEY FK_PLANNING_LE�ON (N�LE�ON)
      REFERENCES LE�ON (N�LE�ON) ;


ALTER TABLE PLANNING 
  ADD FOREIGN KEY FK_PLANNING_CLIENT (N�_CLIENT)
      REFERENCES CLIENT (N�_CLIENT) ;


ALTER TABLE PLANNING 
  ADD FOREIGN KEY FK_PLANNING_MONITEUR (N�MONITEUR)
      REFERENCES MONITEUR (N�MONITEUR) ;


ALTER TABLE PLANNING 
  ADD FOREIGN KEY FK_PLANNING_MOD�LE (CODE_MOD�LE)
      REFERENCES MOD�LE (CODE_MOD�LE) ;


ALTER TABLE EXAM_PERMIS 
  ADD FOREIGN KEY FK_EXAM_PERMIS_CLIENT (N�_CLIENT)
      REFERENCES CLIENT (N�_CLIENT) ;


ALTER TABLE EXAM_PERMIS 
  ADD FOREIGN KEY FK_EXAM_PERMIS_EXAM (ID_EXAM)
      REFERENCES EXAM (ID_EXAM) ;


ALTER TABLE H_N�LE�ON_LE�ON 
  ADD FOREIGN KEY FK_H_N�LE�ON_LE�ON_LE�ON (N�LE�ON)
      REFERENCES LE�ON (N�LE�ON) ;

