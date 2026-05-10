-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: d&d
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `action`
--

DROP TABLE IF EXISTS `action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action` (
  `id` int NOT NULL AUTO_INCREMENT,
  `effect` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  `monster_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKb2f7lmj83kjqugialkk494t71` (`monster_id`),
  CONSTRAINT `FKb2f7lmj83kjqugialkk494t71` FOREIGN KEY (`monster_id`) REFERENCES `monster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action`
--

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` VALUES (1,'effettua un attacco morso ed uno picca d\'ossa.','Multiattacco',2),(2,'+4 per colpire, portata 1.5m. 1d6 +2 danni perforanti più 1d6 danni da veleno.','Morso',2),(3,'+4 per colpire, portata 3m. 1d10+2 danni perforanti.','Picca d\'ossa',2),(4,'+4 per colpire, gittata 18m. 3d6+2 danni da veleno','Sputo velenoso',2),(5,'+6 per colpire, portata 1,5m. 2d8+4 danni contundenti','Randello pesante',3),(6,'+6 per colpire, portata 1,5m, gittata 9/36m. 2d6+4 danni perforanti','Giavellotto',3),(7,'effettua due attacchi squarcio','Multiattacco',4),(8,'+6 per colpire, portata 1,5m. 1d10+6 danni taglienti, più 1d6 danni da fuoco','Squarcio',4),(9,'tiro salvezza su destrezza CD 13, cono di 4,5m. 7d6 danni da fuoco. successo: dimezzati.','Soffio di fuoco(ricarica 5-6)',4),(10,'+3 per colpire, portata 1,5m gittata, 6/18m. 1d6 danni perforanti.','Lancia',5),(11,'Effettua due attacchi usando spadone o balestra pesante in qualsiasi combinazione.','Multiattacco',6),(12,'+5 per colpire, portata 1,5m. 2d6 +3 danni taglienti  più 1d8 danni radiosi.','Spadone',6),(13,'+2 per colpire, gittata 20/120m. 2d10 danni perforanti più 1d8 danni radiosi.','Balestra pesante. ',6),(14,'attivazione: viene colpito da un tiro per colpire in mischia mentre tiene in mano un arma. esito: +2ca contro quel colpo.','REAZIONE parata',6),(15,'effettua due attacchi usando Giavellotto o Spada lunga in qualsiasi combinazione.','Multiattacco',7),(16,'+6 per colpire, portata 1,5m, gittata 9/36m. 3d6+4 danni perforanti.','Giavellotto',7),(17,'+6 per colpire, portata 1,5m. 2d10+4 danni taglienti.','Spada lunga',7),(18,'+4 per colpire, portata 1,5m, gittata 6/18m.','Pugnale',1),(19,'+3 per colpire, portata 1,5m. 1d8 +1 danni perforanti.','Stocco',8),(21,'effettua due attacchi pugnale avvelenato.','Multiattacco',9),(22,'+5 per colpire, portata 1,5m, gittata 6/18m. 1d4 + 3 danni perforanti più 1d6 danni da veleno','Pugnale Avvelenato',9),(23,'effettua azione di disimpegno, nascondersi o scatto come azione bonus','Azione bonus azione scaltra',9),(24,'+2 per colpire, portata 1,5m. 1d4 danni contundenti.','Randello',10),(25,'+4 per colpire, portata 1,5m. 1d10 +2 danni taglienti','Squarcio',11),(26,'tiro salvezza su destrezza cd 11, linea retta lunga 6m larga 1,5m. 4d8 danni da acido. successo: danni dimezzati','Soffio di acido (ricarica 5-6)',11),(27,'effettua tre attacchi radiosità celestiale.','Multiattacco',12),(28,'+7 per colpire, portata 1,5m, gittata 18m. 4d8 danni radiosi.','Radiosità celestiale',12),(29,'tocca un altra creatura che recupera 2d8+4 pf','Tocco guaritore',12),(30,'+3 per colpire, portata 1,5m. 1d4+1 danni taglienti +1 necrotico.','Falcetto rituale',13),(31,'effettua due attacchi Artiglio.','Multiattacco',14),(32,'+5 per colpire, portata 1,5m. 1d10 +3 danni taglienti.','Artiglio',14),(33,'tiro salvezza su costituzione cd 13, una creatura che è in grado di vedere entro 36m. 5d6 danni necrotici. successo: dimezzati.','Sguardo marcescente',14),(34,'tiro salvezza su sagezza cd 14, una creatura che è in grado di vedere entro 36m. fallimento: apprende magicamente un fatto o un segreto relativo al bersaglio.','Azione bonus intuizione innaturare (ricarica 6)',14),(35,'+3 per colpire, portata 1,5m. colpito 1d8 +1 danni perforanti','Scimitarra',15),(36,'+3 per colpire, gittata 24/96m. 1d8 +1 danni perforanti.','Balestra leggera',15),(37,'+5 per colpire, portata 1,5m. 1d8+3 danni perforanti.','Stocco',16),(38,'+5 per colpire, gittata 24/96m. 1d8 +3 danni perforanti.','Balestra leggera',16),(39,'+2 ca contro un attacco.','REAZIONE parata',16),(40,'+5 per colpire (vantaggio se il bersaglio è afferrato da lui), portata 1,5m. 1d8 +3 danni perforanti o 2d8+3 se è afferrato da lui, più 1d8 danni da acido.','Morso',17),(41,'+5 per colpire, portata 1,5m1d8 +3 danni contundenti più 1d8 danni da acido. se è di taglia grande o inferiore è afferrato(cd 13 con svantaggio).','Pseudopode',17),(42,'assume la forma di un oggetto medio o piccolo, mantenendo le proprie statistiche di gioco, o torna alla sua forma normale.\r\n','Azione bonus Mutaforma',17),(43,'Effettua due attacchi, con Scimitarra o Arco corto in qualsiasi combinazione.','Multiattacco',18),(44,'+4 per colpire, portata 1,5m. 1d6+ 2 danni taglienti più 1d4 danni taglienti se il tiro è stato effettuato con vantaggio.','Scimitarra',18),(45,'+4 per colpire, gittata 24/96m. 1d6 +2 danni perforanti, più 1d4 danni perforanti se il tiro è stato effettuato con vantaggio.','Arco corto',18),(46,'effettua azione di Disimpegno o Nascondersi.','Azione bonus: fuga agile',18),(47,'se sta per essere colpito sceglie un alleato a 1,5m da lui di taglia piccola o media e si scambia di posto facendo colpire l\'alleato.','REAZIONE sviare attacco',18),(48,'effettua tre attacchi Deflagrazione caotica. ne può sostituire uno con Ordine sinistro se disponibile.','Multiattacco',19),(49,'+4 per colpire, portata 1,5m, gittata 18m. 2d6 danni. tira 1d4 per determinare il tipo di danno:1 acido, 2 freddo, 3 fuoco, 4 fulmine.','Deflagrazione caotica',19),(50,'Tiro salvezza su sagezza cd13, una creatura che è in grado di vedere entro 18m. il bersaglio è affascinato fino al termine del suo turno. Finchè è affascinato è incapacitato','Ordine sinistro (ricarica 5-6)',19),(51,'+4 per colpire, portata 1,5m. 2d6+2 danni taglienti.','Fendente salmastro',20),(52,'effettua azione di disimpegno.','Azione bonus: scivoloso',20),(53,'+6 per colpire, portata 3m. 1d12 +4 danni taglienti più 2d6 danni necrotici.','Falcione abissale',21),(54,'+6 per colpire, portata 1,5m. 4d6 +4 danni perforanti. Se il bersaglio è di taglia grande o inferiore e il minotauro si è mosso di 3m o più in linea retta verso di esso prima del colpo, subisce 3d6 danni perforanti extra e cade a terra prono.','Trafiggere (ricarica 5-6)',21),(55,'Effettua 2 attacchi usando Mazza Oscura o Dardo fatidico in qualsiasi combinazione.','Multiattacco',22),(56,'+4 per colpire, portata 1,5m. 1d6 +2 danni contundenti più 1d6 danni necrotici.','Mazza oscura',22),(57,'+4 per colpire, gittata 36m. 1d12+2 danni necrotici, il tiro per colpire successivo effettuato contro il bersaglio dispone di vantaggio fino al termine del turno successivo di Narthus.','Dardo fatidico',22),(58,'+5 per colpire, portata 1,5m. 1d8 +3 danni perforanti più 2d6 danni da veleno.','Morso',23),(59,'tiro salvezza su destrezza  cd 13, una creatura che il ragno è in grado di vedere entro 18m. il bersaglio è trattenuto finche la ragnatela non viene distrutta (ca 10 pf 5 vulnerabilità danni da fuoco, immunità ai danni psichici e da veleno).','Ragnatela(ricarica 5-6)',23),(60,'+1 per colpire, portata 1,5m. 1 danno da fuoco.','Morso',24),(61,'+4 per colpire, portata 1,5m. 1d4+2 danni perforanti, il bersaglio è avvelenato fino all\'inizio del turno successivo del millepiedi.','Morso',25),(62,'+4 per colpire, portata 1,5m. 1d8 +2 danni taglienti.','Fendente',26),(63,'+4 per colpire, portata 3m.2d6 +2 danni contundenti. se il bersaglio è di taglia media o inferiore è afferrato (cd 12 per sfugire)','presa',27),(64,'+4 per colpire, portata 3m, gittata 6/18m (vantaggio se il bersaglio è afferrato da lui). 3d4 +2 danni contundenti.','martello leggero',27),(65,'usa Tentacoli paralizzanti ed effettua un attacco Morso.','Multiattacco',28),(66,'+4 per colpire, portata 1,5m. 2d4 +2 danni perforanti più 1d6 danni da veleno.','Morso',28),(67,'tiro salvezza su costituzione  cd 12, una creatura che è in grado di vedere entro 3m. il bersaglio viene avvelenato per 1 minuto e ripete il tiro salvezza alla fine di ogni suo turno.','Tentacoli paralizzanti',28),(68,'+3 per colpire, portata 1,5m. 1d8 +1 danni contundenti.','Schianto',29),(69,'effettua due attacchi, usando Spada necrotica o Arco necrotico in qualsiasi combinazione. può sostituire un attacco con un utilizzo di Sorso di vita.','Multiattacco',30),(70,'+4 per colpire, portata 1,5m. 1d8 +2 danni taglienti più 1d8 danni necrotici.','Spada necrotica',30),(71,'+4 per colpire, gittata 45/180m. 1d8+2 danni perforanti più 1d8 danni necrotici.','Arco necrotico',30),(72,'tiro salvezza su costituzione CD 13, una creatura entro 1,5m. 1d8+2 danni necrotici, e l\'utilizzatore si cura di u numero di pf pari ai danni necrotici subiti dal bersaglio.','Sorso di vita (ricarica 5-6)',30),(73,'Effettua due attacchi usando Spada corta e fionda in qualsiasi combinazione.','Multiattacco',31),(74,'+4 per colpire, portata 1,5m. 1d6+2 danni perforanti.','Spada corta',31),(75,'+4 per colpire, gittata 9/36m. 1d4+2 danni contundenti.','Fionda',31),(76,'+5 per colpire, portata 1,5m. 1d6+3 si avvinghia al bersaglio. finche è avvinghiato non può ripetere l\'attacco e il bersaglio subisce 2d4 danni necrotici all\'inizio di ogni turno dell\'uccello stigeo. Può staccarsi da solo utilizzando 1,5m di movimento. il bersaglio o un alleato possono staccarlo utilizzando un azione.','Proboscide',32),(77,'+4 per colpire, portata 1,5m. 1d6+2 danni taglienti più 1d4 danni taglienti se il tiro per colpire è stato effettuato con vantaggio.','Scimitarra',33),(78,'+4 per colpire, gittata 24/96m 1d6 +2 danni perforanti più 1d4 danni perforanti se il tiro per colpire è stato effettuato con vantaggio.','Arco corto',33),(79,'+2 per colpire, portata 1,5m. 1d4 danni taglienti più 1d4 danni da fuoco.','Artiglio',34),(80,'Tiro salvezza su costituzione: CD 10, tutte le creature in un cono di 4,5m. 2d4 danni da fuoco, e la velocità del bersaglio è ridotta di 3m. fino al termine del turno successivo del mephit. successo: danni dimezzati. trovarsi sotto acqua non conferisce alcuna resistenza contro questi danni da fuoco.','Soffio di vapore(ricarica 6)',34),(81,'+6 al tiro per colpire, portata 1,5m. 1d4 +4 danni perforanti.','Arco da battaglia',35),(82,'+6 al tiro per colpire, gittata 12/48m. 1 danno perforante, e il bersaglio è affascinato fino all\'inizio del turno successivo dello spiritello.','Arco ammaliante',35),(83,'tiro salvezza su carisma CD 10, una creatura entro 1,5m che lo spiritello è in grado di vedere. (celestiali, immondi e non morti falliscono in automatico la prova). Lo spiritello conosce le emozioni del bersaglio.','Vista del cuore',35),(84,'è invisibile per 1 minuto. l\'effetto termina immediatamente quando lo spiritello effettua un tiro per colpire o infligge danni, o se lo spiritello è incapacitato.','Invisibilità ',35),(85,'+5 per colpire, portata 1,5m. 1d6 +3 danni perforanti.','Spada corta',36),(86,'+5 per colpire, gittata 24/96m. 1d6 +3 danni perforanti.','Arco corto',36),(87,'+4 per colpire, portata 1,5m. 1d6+2 danni perforanti.','Squarcio',37),(88,'+3 per colpire, gittata 45/180m. 1d10+1 danni perforanti.','Arco d\'ossa',37),(89,'+3 per colpire, portata 1,5m. 2d10+1 danni taglienti.','Spada lunga',38),(90,'+3 per colpire, gittata 45/180m. 1d8 +1 danni perforanti più 3d4 danni da veleno.','Arco lungo',38),(91,'+3 per colpire, portata 1,5m. 2d8 +1 danni da acido.','Pseudopode',39),(92,'+6 al tiro per colpire, portata 1,5m. 2d8 +4 danni contundenti.','Schianto ',40),(93,'+4 per colpire, portata 1,5m. 3d6 +2 danni da acido.','Pseudopode',41),(94,'Il cubo si muove fino alla sua velocità massima senza provocare attacchi di opportunità. Il cubo occupa il suo spazio per intero e può contenere una creatura di taglia grande fino a quattro creature di taglia media o piccola contemporaneamente. Il cubo può muoversi nello spazio di creature di taglia Grande o inferiore se, al suo interno, ha spazio sufficente a contenerle. tiro salvezza su destrezza CD 12 tutte le creature nel cui spazio il cubo entra per la prima volta durante questo movimento. fallimento: 3d6 danni da acido e il bersaglio è avviluppato. un bersaglio avviluppato è trattenuto, ha copertura totale, non può lanciare incantesimi e subisce 3d6 danni da acido all\'inizio di ogni turno del cubo. Quando il cubo si muove, il bersaglio avviluppato si muove insieme a esso. Un bersaglio avviluppato può tentare di sfuggire usando un azione per effettuare una prova di Forza (Atletica) con CD 12. Se la prova viene superata, il bersaglio sfugge ed entra nello spazio libero più vicino. Successo: danni dimezzati, e il bersaglio si sposta in uno spazio libero entro 1,5m dal cubo. Se non c\'è alcuno spazio libero, il bersaglio fallisce la prova.','Avviluppare',41),(95,'effettua due attacchi con Squarcio.','Multiattacco',42),(96,'+7 al tiro per colpire, portata 1,5m. 2d8 +5 danni taglienti.','Squarcio',42),(98,'Il Drago d’Oro Antico può usare la sua Presenza Spaventosa. Poi effettuare tre attacchi: uno con il morso e due con gli artigli.','Multiattacco',44),(99,'Attacco con arma da mischia: +17 a colpire, portata 3 m, un bersaglio.\r\nColpisce: 17 (2d6 + 10) danni taglienti.','Artiglio',44),(100,'Attacco con arma da mischia: +17 a colpire, portata 6 m, un bersaglio.\r\nColpisce: 19 (2d8 + 10) danni contundenti.','Coda',44),(101,'Attacco con arma da mischia: +17 a colpire, portata 4,5 m, un bersaglio.\r\nColpisce: 21 (2d10 + 10) danni perforanti.','Morso',44),(102,'Ogni creatura scelta dal drago, che si trovi entro 36 metri da esso e consapevole della sua presenza, deve riuscire un tiro salvezza di Saggezza CD 24 o restare spaventata per 1 minuto. Una creatura può ripetere il tiro salvezza al termine di ciascun suo turno, terminando l’effetto se lo riesce. Se il tiro salvezza della creatura ha successo o l’effetto ha termine per essa, la creatura è immune alla Presenza Spaventosa del drago per le successive 24 ore.','Presenza Spaventosa',44),(103,'Il drago usa una delle seguenti armi a soffio:','Arma a Soffio (Ricarica 5-6)',44),(104,'Il drago esala fuoco in un cono di 27 metri. Ogni creatura nell’area deve effettuare un tiro salvezza di Destrezza CD 24, subendo 71(13d10) danni da fuoco se fallisce il tiro salvezza, o la metà di questi danni se lo riesce.','Soffio Infuocato',44),(105,'Il drago esala del gas in un cono di 27 metri. Ogni creatura in quell’area deve riuscire un tiro salvezza di Forza CD 24 o avere svantaggio ai tiri di attacco basati sulla Forza, prove di Forza, e tiri salvezza di Forza per 1 minuto. Una creatura può ripetere il tiro salvezza al termine di ciascun suo turno, terminando l’effetto su di sé in caso di successo.','Soffio Indebolente',44),(106,'Il drago può trasformarsi magicamente in un umanoide o bestia il cui grado di sfida sia pari o inferiore al proprio, o tornare alla sua vera forma. Alla morte ritorna alla sua vera forma. Qualsiasi equipaggiamento stia indossando o trasportando viene assorbito o trasportato nella nuova forma (a scelta del drago).\r\nNella nuova forma, il drago mantiene il suo allineamento, punti ferita, Dadi Vita, la facoltà di parlare, le competenze, la Resistenza Leggendaria, le azioni da tana, e i punteggi di Intelligenza, Saggezza e Carisma, oltre a questa azione. Le sue statistiche e capacità vengono altrimenti rimpiazzate da quelle della nuova forma, eccetto i privilegi di classe o azioni leggendarie della nuova forma.','Mutare Forma',44);
/*!40000 ALTER TABLE `action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonus_action`
--

DROP TABLE IF EXISTS `bonus_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonus_action` (
  `id` int NOT NULL AUTO_INCREMENT,
  `effect` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  `monster_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK30njfoh20lfe8u2j1eq5jnb2g` (`monster_id`),
  CONSTRAINT `FK30njfoh20lfe8u2j1eq5jnb2g` FOREIGN KEY (`monster_id`) REFERENCES `monster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus_action`
--

LOCK TABLES `bonus_action` WRITE;
/*!40000 ALTER TABLE `bonus_action` DISABLE KEYS */;
INSERT INTO `bonus_action` VALUES (1,'effettua l\'azione di Disimpegno o Nascondersi.','Fuga agile',33),(3,'subito dopo aver inflitto danni a una creatura a cui rimane la metà o meno dei sui pf, lo gnoll si muove fino a metà della sua velocità ed effettua un attacco squarcio.','Furia(1/giorno)',37);
/*!40000 ALTER TABLE `bonus_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legend_action`
--

DROP TABLE IF EXISTS `legend_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legend_action` (
  `id` int NOT NULL AUTO_INCREMENT,
  `effect` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  `monster_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKaka1kdo7pgf47q8gtkiivnclw` (`monster_id`),
  CONSTRAINT `FKaka1kdo7pgf47q8gtkiivnclw` FOREIGN KEY (`monster_id`) REFERENCES `monster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legend_action`
--

LOCK TABLES `legend_action` WRITE;
/*!40000 ALTER TABLE `legend_action` DISABLE KEYS */;
INSERT INTO `legend_action` VALUES (1,'Il drago può effettuare 3 azioni leggendarie, scelte tra le opzioni seguenti. Può usare solo un’opzione leggendaria alla volta e solo al termine del turno di un’altra creatura. Il drago recupera le azioni leggendarie spese all’inizio del proprio turno.','Numero',44),(2,'Il drago batte le ali. Ogni creatura entro 4,5 metri dal drago deve riuscire un tiro salvezza di Destrezza CD 25 o subire 17 (2d6 + 10) danni contundenti e venir gettato prono. Il drago può poi volare fino a metà della sua velocità di volo.','Attacco di Ala (Costa 2 Azioni)',44),(3,'Il drago effettua un attacco di coda','Attacco di Coda',44),(4,'Il drago effettua una prova di Saggezza (Percezione).','Individuare',44);
/*!40000 ALTER TABLE `legend_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monster`
--

DROP TABLE IF EXISTS `monster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monster` (
  `id` int NOT NULL AUTO_INCREMENT,
  `armor_class` int NOT NULL,
  `charisma` int NOT NULL,
  `constitution` int NOT NULL,
  `dexterity` int NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `immunity` longtext,
  `intelligence` int NOT NULL,
  `level` double NOT NULL,
  `life_point` int NOT NULL,
  `moviment` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `resistence` longtext,
  `saving_throw` varchar(100) DEFAULT NULL,
  `sense` longtext,
  `skills` longtext,
  `strength` int NOT NULL,
  `wisdom` int NOT NULL,
  `vulnerability` longtext,
  `initiative` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `monster_chk_1` CHECK ((`armor_class` >= 1)),
  CONSTRAINT `monster_chk_2` CHECK (((`charisma` >= -(5)) and (`charisma` <= 10))),
  CONSTRAINT `monster_chk_3` CHECK (((`constitution` >= -(5)) and (`constitution` <= 10))),
  CONSTRAINT `monster_chk_4` CHECK (((`dexterity` >= -(5)) and (`dexterity` <= 10))),
  CONSTRAINT `monster_chk_5` CHECK (((`intelligence` >= -(5)) and (`intelligence` <= 10))),
  CONSTRAINT `monster_chk_6` CHECK ((`life_point` >= 1)),
  CONSTRAINT `monster_chk_7` CHECK (((`strength` >= -(5)) and (`strength` <= 10))),
  CONSTRAINT `monster_chk_8` CHECK (((`wisdom` >= -(5)) and (`wisdom` <= 10))),
  CONSTRAINT `monster_chk_9` CHECK (((`initiative` <= 15) and (`initiative` >= -(5))))
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monster`
--

LOCK TABLES `monster` WRITE;
/*!40000 ALTER TABLE `monster` DISABLE KEYS */;
INSERT INTO `monster` VALUES (1,14,-1,-1,2,'coboldo_guerriero.jpg','',-1,0.125,7,'9m','Coboldo guerriero','','','scurovisione 18m','',-2,-2,'',2),(2,15,-1,2,1,'lucertoloide_guardiano.jpg','',0,1,32,'9m, nuoto 9m','Lucertoloide Guardiano','','','','Furtività +5, Sopravvivenza +5',2,1,'',1),(3,11,-2,3,-1,'ogre.png','',-3,2,68,'12m','Ogre','','','scurovisione 18m','',4,-2,'',-1),(4,17,2,3,0,'drago_rosso_cucciolo.jpg','fuoco',1,4,75,'9m, scalata 9m, volo 18m','Drago rosso cucciolo','','destrezza +2, sagezza +2','scurovisione 18m, vista cieca 3m','furtività +2, percezione +4',4,0,'',2),(5,16,0,1,1,'guardia.jpg','',0,0.125,11,'9m','Guardia','','','','percezione +2',1,0,'',1),(6,18,2,2,0,'cavaliere.jpg','spaventato',0,4,52,'9m','Cavaliere','','costituzione +4, sagezza+2','','',3,0,'',0),(7,18,1,3,2,'capitano_delle_guardie.jpg','',1,4,75,'9m','Capitano delle Guardie','','','','Atletica +6, Percezione +4',4,2,'',4),(8,15,3,0,1,'nobile.jpg','',1,0.125,9,'9m','Nobile','','','','Inganno +5, Intuizione +4, Persuasione +5',0,2,'',1),(9,13,3,0,3,'jako.jpg','',1,1,22,'9m','Jacko','','','','Furtività +5, Percezione +6',0,2,'',3),(10,10,0,0,0,'','',0,0,4,'9m','popolano','','','','',0,0,'',0),(11,16,1,1,1,'drago_di_rame_cucciolo.jpg','',2,1,22,'9m, scalata 9m, volo 18m','Drago di Rame cucciolo','','destrezza +3','Scurovisione 18m, vista cieca 3m','Furtività +3, Percezione +4',2,0,'',3),(12,12,2,2,2,'curato.jpg','affascinato e spaventato',2,6,97,'9m','Curato','','inteligenza +5, sagezza +7, carisma +5','','Persuasione +5, religione +5',-1,4,'',2),(13,12,0,0,1,'cultista.jpg','',0,0.125,9,'9m','Cultista','','sagezza +2','','Inganno +2, Religione +2',0,0,'',1),(14,15,-1,3,3,'niothic.jpg','',1,2,45,'9m','Nothic','','','vista pura 36m','Arcano +4, Furtività +5, Intuizione +4, Percezione +4',2,0,'',3),(15,12,0,1,1,'','',0,0.125,11,'9m','Bandito ','','','','',0,0,'',1),(16,14,2,2,3,'pral.jpg','',2,1,52,'9m','Pral','','destrezza +5','','Atletica +4, Inganno +4',2,0,'',3),(17,12,-1,2,1,'mimic.jpg','acido, prono',-3,2,58,'6m','Mimic','','','scurovisione 18m','Iniziativa +3, Furtività +5',3,1,'',3),(18,17,0,0,2,'goblin_capo.jpg','',0,1,21,'9m','Goblin capo','','','Scurovisione 18m','Furtività +6',0,-1,'',2),(19,13,2,1,2,'ivlis.jpg','',0,2,49,'9m','Ivlis','','','','Inganno +4, persuasione +4',0,2,'',2),(20,12,0,1,0,'Kuo_Toa_Predone.jpg','',0,0.5,22,'9m, nuoto 9m','Kuo-Toa Predone','','','Scurovisione 36m, vista pure 9m','Percezione +4',2,0,'',0),(21,14,-1,3,0,'minotauro_di_baphomet.jpg','',-2,3,85,'12m','Minotauro di Baphomet','','','Scurovisione 18m','Percezione +7, Sopravvivenza +7',4,3,'',0),(22,13,0,1,0,'Narthus.jpg','',0,1,22,'9m','Narthus','','','','Medicina +4, Religione +2',2,1,'',0),(23,14,-3,1,3,'ragno_gigante.jpg','',-4,1,26,'9m, scalata 9m, ','Ragno gigante ','','','Scurovisione 18m','Furtività +7, Percezione +4',2,0,'',3),(24,13,-4,1,0,'Scarabeo_fuoco_gigante.jpg','',-5,0,4,'9m, scalata 9m, ','Scarabeo di fuoco gigante','fuoco','','vista cieca 9m','',-1,-2,'',0),(25,14,-4,1,2,'millepiede_gigante.jpg','',-5,0.25,9,'9m, scalata 9m, ','Millepiede Gigante','','','vista cieca 9m','',-3,-2,'',2),(26,17,-5,0,2,'spada_volante_animata.jpg','psichico, veleno, affascinato, assordato, avvelenato, indebolimento, paralizzato, pietrificato, spaventato.',-5,0.25,14,'1.5m, volo 15m (fluttuante)','Spada volante Animata','','','vista cieca 18m','',1,-3,'',4),(27,14,-1,1,2,'bugbear_guerriero.jpg','',-1,1,33,'9m','Bugbear Guerriero','','','scurovisione 18m','Furtività +6, sopravvivenza +2',2,0,'',2),(28,13,-3,3,1,'Vermeiena.jpg','',-5,2,51,'9m','Vermeiena','','','scurovisione 18m','Percezione +5',2,1,'',1),(29,8,-3,3,-2,'zombie.jpg','veleno, avvelenato, indebolimento',-4,0.25,15,'9m','zombie','','sagezza +0','scurovisione 18m','',1,-2,'',-2),(30,14,2,3,2,'wight_succhiavita.jpg','veleno, avvelenato, indebolimento',0,3,82,'9m','Wight succhiavita','necrotico','','Scurovisione 18m','Furtività +4, Percezione +3',2,1,'',4),(31,13,0,1,2,'vinx.jpg','',0,0.25,11,'9m','Vinx','','','','Furtività +6, Percezione +5, Sopravvivenza +5',0,1,'',2),(32,13,-2,0,3,'uccello_stigeo.jpg','',-4,0.125,5,'3m, volo 12m','Uccello Stigeo','','','Scurovisione 18m','',-3,-1,'',3),(33,15,-1,0,2,'goblin_guerriero.jpg','',0,0.25,10,'9m','Goblin Guerriero','','','Scurovisione 18m','Furtività +6',-1,-1,'',2),(34,10,1,0,0,'mephit_del_vapore.jpg','fuoco, veleno, avvelenato, indebolimento',0,0.25,17,'9m, volo 9m','Mephit del vapore','','','Scurovisione 18m','Furtività +2',-3,0,'',0),(35,15,0,0,4,'spiritello_schermagliatore.jpg','',2,0.25,10,'3m, volo 12m','Spiritello Schermagliatore','','','','Furtività +8, Percezione +3',-4,1,'',4),(36,14,-3,2,3,'scheletro.jpg','veleno, avvelenato, indebolimento',-2,0.25,13,'9m','Scheletro','','','Scurovisione 18m','',0,-1,'danni contundenti',3),(37,15,-2,0,1,'gnoll_guerriero.jpg','',-2,0.5,27,'9m','Gnoll Guerriero','','','scurovisione 18m','',2,0,'',1),(38,18,-1,1,1,'hobgoblin_guerriero.jpg','',0,0.5,11,'9m','Hobgoblin Guerriero','','','Scurovisione 18m','',1,0,'',3),(39,9,-4,3,-2,'massa_di_melma_grigia.jpg','accecato, affascinato, afferrato, assordato, indebolimento, prono, spaventato, trattenuto.',-5,0.5,19,'3m, scalata 3m','Massa di melma grigia','acido, freddo, fuoco','','vista cieca 18m','Furtività +2',1,-2,'',-2),(40,8,-3,4,-2,'zombie_ogre.jpg','veleno, avvelenato, indebolimento',-4,2,85,'9m','Zombie Ogre','','Sagezza +0','Scurovisione 18m','',4,-2,'',-2),(41,6,-5,5,-4,'cubo_di_gelatina.jpg','acido, accecato, affascinato, assordato, indebolimento, prono, spaventato',5,2,63,'4.5m','Cubo di Gelatina','','','vista cieca 18m','',2,-2,'',-4),(42,13,-2,3,1,'orsogufo.jpg','',-4,3,59,'12m, scalata 12m','Orsogufo','','','Scurovisione 18m','Percezione +5',5,1,'',1),(44,22,9,9,2,'drago_d\'oro_antico.jpg','Fuoco',4,24,546,'12 m, nuoto 12 m, volo 24 m','Drago d\'oro antico','','Destrezza +9, Costituzione +16, Saggezza +10, Carisma +16','Scurovisione 36 m, vista cieca 18 m, Percezione passiva 27','Furtività +9, Intuizione +10, Percezione +17, Persuasione +16',10,3,'',2);
/*!40000 ALTER TABLE `monster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reactions`
--

DROP TABLE IF EXISTS `reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `effect` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  `monster_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp232dac0m2drp6sdg2lotxbbh` (`monster_id`),
  CONSTRAINT `FKp232dac0m2drp6sdg2lotxbbh` FOREIGN KEY (`monster_id`) REFERENCES `monster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reactions`
--

LOCK TABLES `reactions` WRITE;
/*!40000 ALTER TABLE `reactions` DISABLE KEYS */;
INSERT INTO `reactions` VALUES (1,'Attivazione: viene colpito da un tiro per colpire n mischia mentre tiene un arma in mano. Esito: aggiunge 2 alla sua CA contro quell\'attacco.','Parata',8),(3,'Attivazione: viene colpito da un tiro per colpire in mischia mentre tiene in mano un\'arma. Esito: aggiunge 2 alla sua CA contro quell\'attacco.','Parata',16),(4,'Attivazione: una creatura che è in grado di vedere effettua un tiro per colpire contro di lui. Esitp: sceglie un alleato di taglia piccola o media entro 1,5m da sé. Lui ed il suo alleato si scambiano di posto facendo colpire il suo alleato.','Sviare attacco',18),(5,'Attivazione: viene colpito da un tiro per colpire in mischia mentre tiene in mano un\'arma. Esito: aggiunge 2 alla sua CA contro quell\'attacco.','Parata',6);
/*!40000 ALTER TABLE `reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK7tjfd3wunlpu0di6qpu5asgen` (`role_id`),
  CONSTRAINT `FK7tjfd3wunlpu0di6qpu5asgen` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhvai2k29vlwpt9wod4sw4ghmn` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell`
--

DROP TABLE IF EXISTS `spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cast_method` varchar(255) NOT NULL,
  `cast_range` varchar(255) NOT NULL,
  `components` longtext,
  `duration` varchar(255) NOT NULL,
  `effect` longtext NOT NULL,
  `level` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `upgrade` longtext,
  `school` varchar(255) NOT NULL,
  `materials` longtext,
  PRIMARY KEY (`id`),
  CONSTRAINT `spell_chk_1` CHECK ((`level` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spell`
--

LOCK TABLES `spell` WRITE;
/*!40000 ALTER TABLE `spell` DISABLE KEYS */;
INSERT INTO `spell` VALUES (1,'Azione','9m','V,S','istantanea','Sussurrando agli spiriti della natura, l\'incantatore crea uno degli effetti seguenti entro gittata.\r\nSensore atmosferico: L\'incantatore crea un Minuscolo e innocuo effetto sensoriale che predice il tempo atmosferico nel luogo in cui si trova per le successive 24 ore. L\'effetto potrebbe manifestarsi come una sfera dorata in caso di cieli tersi, una nuvola in caso di pioggia, fiocchi di neve in caso di nevicate e così via. Questo effetto permane per 1 round.\r\nFioritura: L\'incantatore fa istantaneamente sbocciare un fiore, aprire un baccello o schiudere un germoglio. \r\nEffetto sensoriale: L\'incantatore crea un effetto sensoriale innocuo, come la caduta di foglie, delle fate spettrali danzanti, una brezza leggera, il rumore di un piccolo animale o il debole odore di una puzzola. L\'effetto deve poter essere contenuto in un cubo con spigolo di 1,5 metri.\r\nTrucchetto col fuoco: L\'incantatore accende o spegne una candela, una torcia o un fuoco da campo.',0,'Artificio Druidico ','','Trasmutazione',''),(2,'azione','18 metri','V, S ','istantanea','Un bagliore simile a una fiamma discende su una creatura entro gittata che l\'incantatore è in grado di vedere. Il bersaglio deve superare un tiro salvezza su Destrezza, altrimenti subisce 1d8 danni radiosi. Per questo tiro salvezza, il bersaglio non trae beneficio dalla mezza copertura o dai tre quarti di copertura. ',0,'Fiamma Sacra','I danni aumentano di 1d8 quando l\'incantatore raggiunge il 5° livello (2d8), l\'11° livello (3d8) e il 17° livello (4d8)','Invocazione',''),(3,' azione','contatto ','V, S','concentrazione, fino a l minuto','L\'incantatore tocca una creatura consenziente e sceglie un\'abilità. Fino al termine dell\'incantesimo, la creatura aggiunge 1d4 a qualsiasi prova di caratteristica effettuata utilizzando l\'abilità scelta.',0,'Guida','','Divinazione',''),(4,'Azione','contatto',' V, M','1 ora','L\'incantatore tocca un oggetto di taglia Grande o inferiore che non sia stato indossato o trasportato da altri. Fino al termine dell\'incantesimo, l\'oggetto proietta luce intensa entro un raggio di 6 metri e luce fioca per altri 6 metri. L\'incantatore può scegliere il colore di luce che desidera. Coprire l\'oggetto con qualcosa di opaco blocca la luce. L\'incantesimo termina se l\'incantatore lo lancia di nuovo. ',0,'Luce','','Invocazione','una lucciola o del muschio fosforescente.'),(5,'azione','9 metri',' V, S ','1 minuto','Una mano spettrale fluttuante compare in un punto a scelta dell\'incantatore situato entro gittata. La mano permane per la durata dell\'incantesimo e svanisce se si  trova a più di 9 metri dall\'incantatore o se quest\'ultimo lancia nuovamente l\'incantesimo. Quando lancia l\'incantesimo, l\'incantatore può usare la mano per maneggiare un oggetto, aprire una porta o un contenitore che non siano chiusi a chiave, riporre o estrarre un oggetto da un contenitore aperto o versare il contenuto di una fiala.\r\nCome azione di Magia nei suoi turni successivi, l\'incantatore può controllare nuovamente la mano. Come parte di quell\'azione, può muoverla fino a 9 metri. La mano non può attaccare, attivare oggetti magici o trasportare più di S chili.',0,'Mano Magica','',' Evocazione',''),(6,'azione','36 metri',' S, M','1 round','L\'incantatore indica una creatura entro gittata e sussurra un messaggio. Solo il bersaglio sente il messaggio e può sussurrare una risposta che unicamente l\'incantatore può sentire. L\'incantatore può lanciare questo incantesimo attraverso oggetti solidi se il bersaglio gli è noto e sa che si trova oltre la barriera. Tuttavia, l\'incantesimo viene bloccato da silenzio magico, una sottile lamina di piombo o 30 centimetri di pietra, metallo o legno',0,'Messaggio','','Trasmutazione','un filo di rame'),(7,'azione',' 18 metri',' V, S','istantanea','Un raggio gelido di luce bianco-azzurra sfreccia verso una creatura entro gittata, contro cui l\'incantatore effettua un attacco a distanza con incantesimo. Se il colpo va a segno,\r\nil bersaglio subisce 1d8 danni da freddo e la sua velocità è ridotta di 3 metri fino all\'inizio del turno successivo dell\'incantatore. ',0,'Raggio di gelo','I danni aumentano di 1d8 quando l\'incantatore raggiunge il 5° livello (2d8), l\'11° livello (3d8) e il 17° livello (4d8).','Invocazione',''),(8,'azione','18 metri',' V, S','istantanea','L\'incantatore prende di mira una creatura entro gittata che è in grado di vedere, dopodiché si sente il singolo lugubre rintocco di una campana entro 3 metri da essa. Il bersaglio deve superare un tiro salvezza su Saggezza, altrimenti subisce 1d8 danni necrotici. Invece, se al bersaglio mancano punti ferita, subisce  1d12 danni necrotici. ',0,'Rintocco dei morti','I danni dell\'incantesimo aumentano di un dado quando l\'incantatore raggiunge il 5° livello (2d8 o 2d12), l\'11° livello (3d8 o 3d12) e il 17° livello (4d8 o 4d12). ',' Necromanzia',''),(9,'Azione','4,5 metri','V, S','istantanea','L\'incantatore sceglie una creatura entro gittata con 0 punti ferita ma che è ancora in vita, facendola diventare stabile.',0,'Salvare i morenti','La gittata raddoppia quando l\'incantatore raggiunge il 5° livello (9 metri), l\'11° livello (18 metri) e il 17° livello (36 metri). ','Necromanzia',''),(10,'azione','contatto','V, S','istantanea','Un fulmine si sprigiona dall\'incantatore verso una creatura da lui toccata. Con questo incantesimo, l\'incantatore effettua un attacco in mischia contro il bersaglio. Se il colpo va a segno, il bersaglio subisce 1d8 danni da fulmine e non può effettuare attacchi di opportunità fino all\'inizio del proprio turno successivo. ',0,'Stretta folgorante','I danni aumentano di 1d8 quando l\'incantatore raggiunge il 5° livello (2d8), 1\'11° livello (3d8) e il 17° livello (4d8). ','Invocazione',''),(11,'azione','9 metri','V','fino a 1 minuto','L\'incantatore genera una meraviglia minore entro gittata, oltre a uno degli effetti elencati di seguito. Se l\'incantatore lancia questo incantesimo più volte, può tenere attivi contemporaneamente fino a tre dei suoi effetti dalla durata di 1 minuto. Mano invisibile. L\'incantatore fa in modo che una porta o una finestra non chiusa a chiave si spalanchi o si chiuda di colpo da sola. Occhi alterati. L\'incantatore altera l\'aspetto dei suoi occhi per 1 minuto. Suono spettrale. L\'incantatore crea un suono improvviso che ha origine da un punto entro gittata a sua scelta, come un rombo di tuono, il verso di un corvo o un mormorio sinistro. Tremiti. L\'incantatore genera un tremito innocuo sul terreno per 1 minuto. Trucchetto col fuoco. L\'incantatore fa in modo che una fiamma tremi, si intensifichi, si affievolisca o cambi colore per 1 minuto. Voce tonante. La voce dell\'incantatore rimbomba con potenza tre volte superiore rispetto al normale per 1 minuto. Per la durata dell\'incantesimo, dispone di vantaggio alle prove di Carisma (Intimidire). ',0,'Taumaturgia','','Trasmutazione',''),(12,'azione','3 metri','S, M','concentrazione, fino a 1 minuto','\'incantatore emana magicamente un sentimento di amicizia verso una creatura che è in grado di vedere entro gittata. Il bersaglio deve superare un tiro salvezza su Saggezza, altrimenti rimane affascinato per la durata dell\'incantesimo. Il bersaglio supera automaticamente il tiro se non è un umanoide, se l\'incantatore sta combattendo contro di esso o se l\'incantatore ha lanciato questo incantesimo sul bersaglio nelle ultime 24 ore. L\'incantesimo termina in anticipo se il bersaglio subisce danni o se l\'incantatore effettua un tiro per colpire, infligge danni o costringe qualcuno a effettuare un tiro salvezza. Al termine dell\'incantesimo, il bersaglio capirà di essere stato affascinato dall\'incantatore. ',0,'Amicizia','','Ammaliamento','un po\' di trucco'),(13,'azione',' incantatore',' S, M','istantanea','Guidato da un lampo di intuizione magica, l\'incantatore effettua un attacco con l\'arma utilizzata per lanciare l\'incantesimo. Per determinare il tiro per colpire e il tiro per i danni, l\'incantatore utilizza la sua caratteristica da incantatore invece che la Forza o la Destrezza. Se l\'attacco infligge danni, possono essere danni radiosi o danni normali inflitti dall\'arma (a scelta dell\'incantatore). ',0,'Colpo accurato','A prescindere dal tipo di danni che l\'incantatore sceglie (danni radiosi o danni normali dell\'arma), l\'attacco infligge danni radiosi extra quando l\'incantatore raggiunge il 5 ° livello (1d6), l\'11° livello (2d6) e il 17° livello (3d6). ','Divinazione','un\'arma nel cui uso l\'incantatore ha competenza e ha un valore di 1 mr o più.'),(14,'azione','36 metri ','V, S','istantanea','L\'incantatore scaglia una scintilla di fuoco verso una creatura o un oggetto situato entro gittata, effettuando un attacco a distanza con incantesimo contro il bersaglio. Se il colpo va a segno, il bersaglio subisce 1d10 danni da fuoco. Un oggetto infiammabile colpito da questo incantesimo prende fuoco se non indossato o trasportato in quel momento. ',0,'Dardo di fuoco','I danni aumentano di 1d10 quando l\'incantatore raggiunge il 5° livello (2d10), l\'11° livello (3d10) e il 17° livello (4d10)','Invocazione',''),(15,'azione','9 metri','V, S',' istantanea','L\'incantatore esercita il suo controllo sugli elementi, creando uno dei seguenti effetti entro gittata. Richiamo del fuoco. Nell\'area di un cubo con spigolo di 1,5 metri, l\'incantatore crea una piccola nube di braci non incandescenti, colorate e che emettono fumo e un odore particolare. L\'incantatore sceglie il colore e l\'odore delle braci, che si possono usare per accendere candele, torce o lampade in quell\'area. L\'odore del fumo permane per 1 minuto. Richiamo dell\'acqua. L\'incantatore crea uno spruzzo d\'acqua fresca nebulizzata che inumidisce leggermente le creature e gli oggetti all\'interno di un cubo con spigolo di 1,5 metri. In alternativa, crea 1 coppa di acqua pulita da riversare all\'interno di un contenitore aperto o su una superficie; l\'acqua evapora dopo 1 minuto. Richiamo dell\'aria. Nell\'area di un cubo con spigolo di 1,5 metri, l\'incantatore crea una brezza in grado di far svolazzare i tessuti, sollevare la polvere, far oscillare le foglie e chiudere porte e persiane aperte. Se le porte e le persiane sono tenute aperte da qualcuno, l\'incantesimo non ha effetto su di esse. Richiamo della terra. L\'incantatore crea un sottile velo di polvere o sabbia che ricopre le superfici di un\'area di 1,5 metri per lato, oppure fa comparire una singola parola scritta nella sua calligrafia su un lembo di terra o un letto di sabbia. Scolpire elementi. L\'incantatore fa in modo che un elemento a sua scelta tra terra, sabbia, fuoco, fumo, nebbia o acqua (in una quantità tale da poter essere contenuto in un cubo con spigolo di 30 centimetri) assuma una forma rozza (come quella di una creatura) per 1 ora. ',0,'Elementalismo','','Trasmutazione',''),(16,'azione',' 18 metri','V, S','istantanea','L\'incantatore crea una bolla di acido in un punto entro gittata, dove la bolla esplode in una sfera del raggio di 1,5 metri. Ogni creatura all\'interno della sfera deve superare un tiro salvezza su Destrezza, altrimenti subisce 1d6 danni da acido. ',0,'Fiotto acido','I danni aumentano di 1d6 quando l\'incantatore raggiunge il 5° livello (2d6), l\'11° livello (3d6) e il 17° livello (4d6). ','Invocazione',''),(17,'azione','9 metri','S, M','1 minuto','L\'incantatore crea un suono o un\'immagine di un oggetto entro gittata che permane per la durata dell\'incantesimo. Di seguito sono descritti gli effetti di ciascuno di essi. L\'illusione termina se l\'incantatore lancia nuovamente l\'incantesimo. Se una creatura effettua l\'azione di Studio per esaminare il suono o l\'immagine, può determinare che si tratta di un\'illusione superando una prova di Intelligenza (Indagare) contro la CD del tiro salvezza sull\'incantesimo. Se una creatura riconosce l\'illusione per ciò che è, l\'illusione risulta attenuata per quella creatura. Suono. Se l\'incantatore crea un suono, la sua intensità può variare da quella di un sussurro a quella di un urlo. Può trattarsi della voce dell\'incantatore o di altri, del ruggito di un leone, di un rullo di tamburi o di un qualsiasi altro suono a sua scelta. Il suono può echeggiare ininterrottamente per tutta la durata dell\'incantesimo, oppure l\'incantatore può emettere dei suoni separati in momenti diversi prima che l\'incantesimo termini. Immagine. Se l\'incantatore crea l\'immagine di un oggetto (come per esempio una sedia, una serie di impronte nel fango o uno scrigno), quell\'oggetto non deve essere più grande di un cubo con spigolo di 1,5 metri. L\'illusione non può emettere suoni, luci, odori o qualsiasi altro effetto sensoriale e può essere rivelata da un\'interazione fisica, poiché gli oggetti possono attraversarla. ',0,'Illusione minore','','Illusione','un ciuffo di lana'),(18,'azione',' incantatore','V, S','concentrazione, fino a l minuto','Ogni volta che una creatura effettua un tiro per colpire contro l\'incantatore prima del termine dell\'incantesimo, l\'attaccante sottrae 1d4 dal tiro per colpire.',0,'Interdizione alle lame','','Abiurazione',''),(19,'azione','36 metri ',' V, S, M','concentrazione, fino a 1 minuto','L\'incantatore crea fino a quattro luci delle dimensioni di una torcia, facendole apparire come lanterne, torce o globi luminosi che fluttuano per la durata dell\'incantesimo entro la sua gittata. In alternativa, l\'incantatore può fondere le quattro luci in un\'unica forma luminosa di taglia Media di aspetto simile a quello umano. Qualunque sia la forma scelta, ogni luce proietta luce fioca entro un raggio di 3 metri. Come azione bonus, l\'incantatore può muovere le luci per un massimo di 18 metri fino a un punto entro gittata. Ogni luce deve trovarsi entro 6 metri da un\'altra luce creata da questo incantesimo. Se una delle luci supera la gittata dell\'incantesimo, svanisce. ',0,'Luci danzanti','','Illusione','un frammento di fosforo'),(20,'azione','3 metri','V, S','1 ora','L\'incantatore crea un effetto magico entro gittata, scegliendolo tra quelli illustrati di seguito. Se l\'incantatore lancia questo incantesimo più volte, può tenere attivi fino a tre dei suoi effetti non istantanei contemporaneamente. Effetto sensoriale. L\'incantatore crea un effetto sensoriale innocuo e istantaneo, come una pioggia di scintille, una folata di vento, una tenue melodia musicale o uno strano odore. Trucchetto col fuoco. L\'incantatore accende o spegne istantaneamente una candela, una torcia o un piccolo fuoco da campo. Pulire o sporcare. L\'incantatore pulisce o sporca istantaneamente un oggetto non più grande di un cubo con spigolo di 30 centimetri. Lieve sensazione. L\'incantatore riscalda, raffredda o condisce materiale non vivente del volume massimo di un cubo con spigolo di 30 centimetri per 1 ora. Segno magico. L\'incantatore fa comparire un colore, un piccolo segno o. un simbolo su un oggetto o una superficie per 1 ora. Creazione minore. L\'incantatore crea un monile non magico o un\'immagine illusoria che può stare nel palmo della sua mano e che permane fino al termine del suo turno successivo. Un monile non può infliggere danni e non ha valore monetario. ',0,'Prestidigitazione','','Trasmutazione',''),(21,'1 minuto','contatto ','V, S, M','istantanea','Questo incantesimo ripara una singola crepa o uno squarcio in un oggetto toccato dall\'incantatore, come l\'anello spezzato di una catena, due metà di una chiave spezzata, un mantello strappato o un otre forato. Se le dimensioni della crepa o dello squarcio non superano i 30 centimetri, l\'incantatore ripara l\'oggetto senza lasciare traccia del danno precedente. Questo incantesimo può riparare un oggetto magico solo fisicamente, senza ripristinare la magia in esso contenuta.',0,'Riparare','','Trasmutazione','due calamite.'),(22,'azione','Incantatore','S','istantanea','Ogni creatura entro un\'emanazione del raggio di 1,5 metri, di cui l\'incantatore è punto di origine, deve superare un tiro salvezza su Costituzione, altrimenti subisce 1d6 danni da tuono. Il rombo fragoroso dell\'incantesimo è udibile fino a 30 metri di distanza.',0,'Rombo di tuono','I danni aumentano di 1d6 quando l\'incantatore raggiunge il 5 ° livello (2d6), l\'11° livello (3d6) e il 17° livello (4d6). ','Invocazione',''),(23,'azione','18 metri','V','1 round','L\'incantatore tenta di spezzare temporaneamente la mente di una creatura entro gittata che è in grado di vedere. La creatura deve superare un tiro salvezza su Intelligenza o subire 1d6 danni psichici e sottrarre 1d4 al tiro salvezza successivo che effettua prima del termine del turno successivo dell\'incantatore. ',0,'Scheggia della mente','I danni aumentano di 1d6 quando l\'incantatore raggiunge il 5 ° livello (2d6), l\'11° livello (3d6) e il 17° livello (4d6). ','Ammaliamento',''),(24,'azione','9 metri','V, S','istantanea','L\'incantatore spruzza una nebbia tossica contro una creatura entro gittata, effettuando un attacco a distanza con incantesimo contro il bersaglio. Se il colpo va a segno, il bersaglio subisce 1d12 danni da veleno. ',0,'Spruzzo velenoso',' I danni aumentano di 1d12 quando l\'incantatore raggiunge il 5 ° livello (2d12), l\'11° livello (3d12) e il 17° livello (4d12).',' Necromanzia',''),(25,'azione','36 metri ','V, S','istantanea','L\'incantatore proietta energia stregonesca verso una creatura o un oggetto entro gittata, effettuando un tiro per colpire a distanza contro il bersaglio. Se il colpo va a segno, il bersaglio subisce 1d8 danni di un tipo a scelta tra: acido, freddo, fuoco, fulmine, psichici, tuono o veleno. Se l\'incantatore ottiene il risultato 8 su un d8, può tirare un altro d8 e aggiungere il risultato ai danni. Quando lancia l\'incantesimo, l\'incantatore può aggiungere ai danni dell\'incantesimo un numero di d8 pari al suo modificatore di caratteristica da incantatore. ',0,'Stregoneria esplosiva','I danni di questo incantesimo aumentano di 1d8 quando l\'incantatore raggiunge il 5 ° livello (2d8), l\'11° livello (3d8) e il 17° livello (4d8). ','Invocazione',''),(26,'azione','contatto ','V, S','istantanea','Incanalando un flusso di gelo sepolcrale, l\'incantatore effettua un attacco con incantesimo in mischia contro un bersaglio a portata. Se il colpo va a segno, il bersaglio subisce 1d10 danni necrotici e non può recuperare punti ferita fino al termine del turno successivo dell\'incantatore.',0,'Tocco gelido','I danni aumentano di 1d10 quando l\'incantatore raggiunge il 5° livello (2d10), I \'11° livello (3d10) e il 17° livello (4d10).','Necromanzia',''),(27,'azione','Incantatore',' V, M','istantanea','Dall\'incantatore fuoriesce una radiosità bruciante in un\'emanazione di 1,5 metri. Ogni creatura a sua scelta che è in grado di vedere deve superare un tiro salvezza su Costituzione, altrimenti subisce 1d6 danni radiosi. ',0,'Parola radiosa','I danni aumentano di 1d6 quando l\'incantatore raggiunge il 5 ° livello (2d6), l\'11° livello (3d6) e il 17° livello (4d6)','Invocazione','un gettone di esplosione solare'),(28,'azione','contatto ','V, S','concentrazione, fino a 1 minuto','L\'incantatore tocca una creatura consenziente e sceglie un tipo di danno: acido, contundente, freddo, fulmine, fuoco, necrotico, perforante, radioso, tagliente, tuono, veleno. Quando una creatura subisce danni del tipo scelto prima del termine dell\'incantesimo, riduce il totale dei danni subiti di 1d4. Una creatura può beneficiare di questo incantesimo solo una volta per turno. ',0,'Resistenza','','Abiurazione',''),(29,'Azione o rituale','Incantatore','V, S','concentrazione, fino a 10 minuti','Per la durata dell\'incantesimo, l\'incantatore percepisce la presenza di effetti magici entro 9 metri da sé. Se percepisce tali effetti, può eseguire un azione di Magia per vedere una debole aura attorno a ogni creatura o oggetto visibile nell\'area che contenga magia e apprende di che scuola di magia si tratta, se ne esiste una. L\'incantesimo viene bloccato da 30 cm di pietra, terriccio o legno, 2,5 centimetri di metallo o una sottile lamina di piombo. ',1,'Individuazione del magico','','Divinazione',''),(30,'azione','36 metri ','V, S','istantanea','L\'incantatore crea tre dardi lucenti di· forza magica. Ogni dardo colpisce una creatura a scelta dell\'incantatore, situata entro gittata e che è in grado di vedere. Un dardo infligge 1d4 + 1 danni da forza al suo bersaglio. Tutti i dardi colpiscono simultaneamente e l\'incantatore può dirigerli per colpire una o più creature. ',1,'Dardo incantato','L\'incantesimo crea un dardo aggiuntivo per ogni slot di livello superiore al 1°. ','Invocazione',''),(31,'reazione','Incantatore','V, S','1 round','Una barriera impercettibile di forza magica protegge l\'incantatore. Fino all\'inizio del suo turno successivo, l\'incantatore ottiene un bonus di +5 alla CA da applicare anche all\'attacco innescante e non subisce danni da dardo incantato. si attiva con una reazione, che l\'incantatore effettua quando è colpito da un tiro per colpire o bersagliato dall\'incantesimo dardo incantato.',1,'Scudo','','Abiurazione','una pergamena con una preghiera'),(32,'Azione','contatto ','V, S','istantanea','Una creatura toccata dall\'incantatore recupera un numero di punti ferita pari a 2d8 più il modificatore di caratteristica da incantatore dell\'incantatore. ',1,'Cura ferite','La guarigione aumenta di 2d8 per ogni slot di livello superiore al 1°.','Abiurazione',''),(33,'azione bonus','18 metri','V','istantanea','Una creatura scelta dall\'incantatore entro gittata e che egli è in grado di vedere recupera un ammontare di punti ferita pari a 2d4 più il modificatore di caratteristica da incantatore dell\'incantatore.',1,'Parola guaritrice','La guarigione aumenta di 2d4 per ogni slot di livello superiore al 1 °.','Abiurazione',''),(34,'azione','36 metri ','V, S','1 round','L\'incantatore scaglia un lampo di luce verso una creatura entro gittata, effettuando un attacco a distanza con incantesimo contro il bersaglio. Se il colpo va a segno, esso subisce 4d6 danni radiosi, e il successivo tiro per colpire effettuato contro il bersaglio prima del termine del turno successivo dell\'incantatore dispone di vantaggio.',1,'Dardo tracciante','I danni aumentano di 1d6 per ogni slot di livello superiore al 1°.','Invocazione',''),(35,'Azione o rituale','3 metri','V, S','istantanea','L\'incantatore rimuove veleno e marciume da cibi e bevande non magici situati in una sfera del raggio di 1,5 metri centrata su un punto entro gittata. ',1,'Purificare cibo e bevande','','Trasmutazione','');
/*!40000 ALTER TABLE `spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trait`
--

DROP TABLE IF EXISTS `trait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trait` (
  `id` int NOT NULL AUTO_INCREMENT,
  `effect` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  `monster_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcepamiahu4xe9f3l2vcb928rj` (`monster_id`),
  CONSTRAINT `FKcepamiahu4xe9f3l2vcb928rj` FOREIGN KEY (`monster_id`) REFERENCES `monster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trait`
--

LOCK TABLES `trait` WRITE;
/*!40000 ALTER TABLE `trait` DISABLE KEYS */;
INSERT INTO `trait` VALUES (1,'può trattenere il respiro per 15 minuti.','Apnea',2),(2,'dispone di vantaggio al tiro per colpire se almeno un alleato è in mischia con il bersaglio e non è incapacitato','Tattiche di branco',1),(3,'finché è esposto alla luce del sole subisce svantaggio alle prove di caratteristica e ai tiri per colpire.','Sensibile al sole',1),(4,'Impiega 1 minuto per camuffarsi da un altro umanoide di peso e altezza simili. se è camuffato per riconoscerlo serve una prova di indagare cd 13.','camuffamento rapido',9),(5,'ha +2 su un abilità a scelta del dm e dispone vantaggio ogni volta che effettua una prova caratteristica usando quell\'abilità','Addestramento',10),(6,'dispone vantaggio ai tiri salvezza contro incantesimi e altri effetti magici','Resistenza alla magia',12),(7,'effettua un rituale della durata di 8ore, toccando una creatura morta da massimo 7 giorni, facendola tornare in vita con 1 punto ferita, se non è morta di vecchiaia.','Resuscitare i morti (1/giorno)',12),(8,'Aderisce a qualsiasi cosa lo tocchi. una creatura Enorme o inferiore attaccata a lui viene Afferrata (cd13 per sfuggire con svantaggio).','Adesivo (solo forma oggetto)',17),(9,'respira in aria e in acqua.','Anfibio',20),(10,'finché è esposto alla luce del sole, subisce svantaggio alle prove di caratteristica e ai tiri per colpire.','Sensibile al sole',20),(11,'può scalare superfici difficili, compresi soffitti senza una prova di caratteristica.','Movimenti del ragno',23),(12,'ingnora le restrizioni di movimento causate dalle ragnatele e conosce l\'ubicazione esatta di ogni altra creatura a contatto con la stessa ragnatela.','Arrampicatele',23),(13,'proietta luce intensa in un raggio di 3m e fioca per altri 3m.','illuminazione',24),(14,'non ha bisogno di movimento extra per spostare una creatura che sta afferrando.','Rapimento',27),(15,'Può scalare le superfici difficili, compresi i soffitti, senza effettuare una prova di caratteristica.','Movimenti del ragno',28),(16,'Se i danni riducono lo zombie a 0pf, fa un tiro salvezza su costituzione (CD pari a 5 più i danni subiti), a meno che non si tratti di danni radiosi, o di un colpo critico. in caso di successo scende a 1 pf.','Tempra dei non morti',29),(17,'Finché è esposto alla luce del sole, subisce svantaggio alle prove di caratteristica e ai tiri per colpire.','Sensibilità al sole',30),(18,'i tiri per colpire contro di lui subiscono svantaggio, a meno che non sia incapacitato.','Forma sfocata',34),(19,'quando muore esplode. tiro salvezza su destrezza CD 10, tutte le creature in un emanazione di 1,5m, di cui il mephit è il punto di origine. 2d4 danni da fuoco. successo: danni dimezzati.','Esplosione mortale',34),(20,'dispone di vantaggio a un tiro per colpire contro una creatura se almeno uno dei suoi alleati si trova entro 1,5m dalla creatura e l\'alleato non è incapacitato.','Tattiche del branco',38),(21,'può muoversi attraverso uno spazio stretto fino a 2,5cm senza consumare movimento extra per farlo.','Amorfo',39),(22,'ogni volta che una creatura colpisce la melma con un attacco in mischia, quella creatura subisce 2 danni da acido.','Forma corrosiva',39),(23,'se i danni riducono lo zombie a 0 pf, esso effettua un tiro salvezza su costituzione con cd pari a 5 + danni subiti, a meno che non si tratti di danni radiosi o di un colpo critico. in caso di successo, scende invece a 1 pf.','Tempra dei non morti',40),(24,'Il drago può respirare aria e acqua.','Anfibio',44);
/*!40000 ALTER TABLE `trait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'{noop}Admin','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'd&d'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-06 19:17:59
