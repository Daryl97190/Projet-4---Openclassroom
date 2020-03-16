-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: Base de données EXPRESS FOOD
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `adresse` (
  `adresse_id` int(10) NOT NULL AUTO_INCREMENT,
  `numéro_rue` int(10) unsigned NOT NULL,
  `rue` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `code_Postal` int(16) unsigned NOT NULL,
  `etage` int(11) DEFAULT NULL,
  `batiment` varchar(255) DEFAULT NULL,
  `digicode` varchar(10) DEFAULT NULL,
  `client_id` int(16) unsigned NOT NULL,
  PRIMARY KEY (`adresse_id`),
  KEY `fk_adresse_client1_idx` (`client_id`),
  CONSTRAINT `fk_adresse_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (1,35,'Charles de Gaulle','Paris',75019,2,'Blandine','3434',1),(2,121,'Louis Pasteur','Créteil',94000,6,'2289','25',2),(3,12,'Victor Hugo','Paris',75008,3,'Carine','LIVIO',3),(4,67,'Jean Jaures','Argenteuil',95100,9,'3326','23',4),(5,73,'Jean Moulin','Nanterre',92000,2,NULL,'22',5);
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `client` (
  `client_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(255) NOT NULL,
  `prenom_client` varchar(255) NOT NULL,
  `numéro_tel_client` varchar(20) NOT NULL,
  `mot_de_passe_client` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'LIVIO','Daryl','0629565428','ferrari'),(2,'DURAND','Fabrice','0000000001','maison'),(3,'MARTIN','Louis','0000000002','Rouge'),(4,'ROUX','Bernard','0000000003','TABLE'),(5,'PETIT','Thomas','0000000004','12345');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commande` (
  `commande_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_commande` date DEFAULT NULL,
  `statut_commande` varchar(32) NOT NULL,
  `heure_commande` time(6) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `livreur_id` int(11) NOT NULL,
  `panier_id` int(11) NOT NULL,
  `adresse_livraison` int(10) NOT NULL,
  PRIMARY KEY (`commande_id`),
  KEY `fk_commande_client1_idx` (`client_id`),
  KEY `fk_commande_livreur1_idx` (`livreur_id`),
  KEY `fk_commande_panier1_idx` (`panier_id`),
  KEY `fk_commande_adresse1_idx` (`adresse_livraison`),
  CONSTRAINT `fk_commande_adresse1` FOREIGN KEY (`adresse_livraison`) REFERENCES `adresse` (`adresse_id`),
  CONSTRAINT `fk_commande_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  CONSTRAINT `fk_commande_livreur1` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`livreur_id`),
  CONSTRAINT `fk_commande_panier1` FOREIGN KEY (`panier_id`) REFERENCES `panier` (`panier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (5,'2018-01-12','1 EN COURS','14:00:00.000000',1,5,3,1),(6,'2019-01-01','2 EN ATTENTE','11:59:00.000000',2,4,4,2),(7,'2019-02-03','3 COMPLETEE','14:14:00.000000',3,3,2,3),(8,'2019-04-22','4 ANNULEE','12:22:00.000000',4,2,1,4),(9,'2019-05-22','1 EN COURS','22:00:00.000000',5,1,5,5);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande_has_plat`
--

DROP TABLE IF EXISTS `commande_has_plat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commande_has_plat` (
  `numero_commande_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plat_et_dessert_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`numero_commande_id`,`plat_et_dessert_id`),
  KEY `fk_commande_has_plat_plat1_idx` (`plat_et_dessert_id`),
  KEY `fk_commande_has_plat_commande1_idx` (`numero_commande_id`),
  CONSTRAINT `fk_commande_has_plat_commande1` FOREIGN KEY (`numero_commande_id`) REFERENCES `commande` (`commande_id`),
  CONSTRAINT `fk_commande_has_plat_plat1` FOREIGN KEY (`plat_et_dessert_id`) REFERENCES `plat_et_dessert` (`plat_et_dessert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande_has_plat`
--

LOCK TABLES `commande_has_plat` WRITE;
/*!40000 ALTER TABLE `commande_has_plat` DISABLE KEYS */;
INSERT INTO `commande_has_plat` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `commande_has_plat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facture`
--

DROP TABLE IF EXISTS `facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `facture` (
  `numero_facture_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_facture` date DEFAULT NULL,
  `montant_facture` decimal(8,2) DEFAULT NULL,
  `commande_id` int(10) unsigned NOT NULL,
  `adresse_facture` int(10) NOT NULL,
  PRIMARY KEY (`numero_facture_id`),
  KEY `fk_facture_commande1_idx` (`commande_id`),
  KEY `fk_facture_adresse1_idx` (`adresse_facture`),
  CONSTRAINT `fk_facture_adresse1` FOREIGN KEY (`adresse_facture`) REFERENCES `adresse` (`adresse_id`),
  CONSTRAINT `fk_facture_commande1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`commande_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facture`
--

LOCK TABLES `facture` WRITE;
/*!40000 ALTER TABLE `facture` DISABLE KEYS */;
INSERT INTO `facture` VALUES (1,'2019-01-13',14.00,5,1),(2,'2019-01-02',28.00,6,2),(3,'2019-02-04',14.00,7,3),(4,'2019-04-22',26.50,8,4),(5,'2019-05-23',55.00,9,0);
/*!40000 ALTER TABLE `facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `livreur` (
  `livreur_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_livreur` varchar(255) NOT NULL,
  `prenom_livreur` varchar(255) NOT NULL,
  `telephone_livreur` varchar(20) NOT NULL,
  `statut_livreur` varchar(32) NOT NULL,
  `longitude` decimal(8,6) unsigned DEFAULT NULL,
  `latitude` decimal(8,6) unsigned DEFAULT NULL,
  PRIMARY KEY (`livreur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livreur`
--

LOCK TABLES `livreur` WRITE;
/*!40000 ALTER TABLE `livreur` DISABLE KEYS */;
INSERT INTO `livreur` VALUES (1,'BERTRAND','DELANOE','1111111111','1 EN LIVRAISON',2.348800,48.853478),(2,'VUILLIERME','Matthieu','0222222222','2 LIBRE',2.466700,48.783335),(3,'LANDAIS','Rafael','0333333333','3 INDISPONIBLE',2.353400,48.891982),(4,'KEITA','Mori','04444444444','3 INDISPONIBLE',2.250000,48.852222),(5,'MENDESS','Kevins','0555555555','1 EN LIVRAISON',2.206750,48.222000);
/*!40000 ALTER TABLE `livreur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panier`
--

DROP TABLE IF EXISTS `panier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `panier` (
  `panier_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_panier` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`panier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panier`
--

LOCK TABLES `panier` WRITE;
/*!40000 ALTER TABLE `panier` DISABLE KEYS */;
INSERT INTO `panier` VALUES (1,'Panier Livio Daryl 1'),(2,'Panier Durand Fabrice 1'),(3,'Panier Martin Louis 1'),(4,'Panier Roux Bernard 1'),(5,'Panier Petit Thomas');
/*!40000 ALTER TABLE `panier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panier_has_plat_et_dessert`
--

DROP TABLE IF EXISTS `panier_has_plat_et_dessert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `panier_has_plat_et_dessert` (
  `panier_id` int(11) NOT NULL AUTO_INCREMENT,
  `plat_et_dessert_id` int(10) unsigned NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`panier_id`,`plat_et_dessert_id`),
  KEY `fk_panier_has_plat_et_dessert_plat_et_dessert1_idx` (`plat_et_dessert_id`),
  KEY `fk_panier_has_plat_et_dessert_panier1_idx` (`panier_id`),
  CONSTRAINT `fk_panier_has_plat_et_dessert_panier1` FOREIGN KEY (`panier_id`) REFERENCES `panier` (`panier_id`),
  CONSTRAINT `fk_panier_has_plat_et_dessert_plat_et_dessert1` FOREIGN KEY (`plat_et_dessert_id`) REFERENCES `plat_et_dessert` (`plat_et_dessert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panier_has_plat_et_dessert`
--

LOCK TABLES `panier_has_plat_et_dessert` WRITE;
/*!40000 ALTER TABLE `panier_has_plat_et_dessert` DISABLE KEYS */;
INSERT INTO `panier_has_plat_et_dessert` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,2),(5,5,1);
/*!40000 ALTER TABLE `panier_has_plat_et_dessert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plat_et_dessert`
--

DROP TABLE IF EXISTS `plat_et_dessert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `plat_et_dessert` (
  `plat_et_dessert_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prix_unitaire` decimal(3,2) NOT NULL,
  `type_plat` varchar(32) NOT NULL,
  `photo` blob,
  PRIMARY KEY (`plat_et_dessert_id`),
  UNIQUE KEY `nom_plat_UNIQUE` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plat_et_dessert`
--

LOCK TABLES `plat_et_dessert` WRITE;
/*!40000 ALTER TABLE `plat_et_dessert` DISABLE KEYS */;
INSERT INTO `plat_et_dessert` VALUES (1,'Pates à la carbonnara',8.50,'1',NULL),(2,'Riz Cantonnais',8.50,'1',NULL),(3,'Tiramisu',5.50,'2',NULL),(4,'Salade de fruit',5.50,'2',NULL),(5,'Steack Frites',8.50,'1',NULL),(6,'Pizza',8.50,'1',NULL),(7,'Gateau au chocolat',5.50,'2',NULL),(8,'Fondant au caramel',5.50,'2',NULL);
/*!40000 ALTER TABLE `plat_et_dessert` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-03 19:28:00
