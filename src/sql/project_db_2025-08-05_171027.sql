-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project_db
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `publication_id` int NOT NULL,
  `doi` varchar(20) NOT NULL,
  `abstract` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `indexation` varchar(50) NOT NULL,
  `magazine` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL,
  PRIMARY KEY (`publication_id`),
  UNIQUE KEY `doi` (`doi`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES 
(6,'10.5678/mlmed001','Análisis de algoritmos de ML para diagnóstico de enfermedades cardiovasculares.','machine learning, medicina, diagnóstico, cardiovascular','Scopus','Medical AI Journal','Ciencias de la Salud'),
(7,'10.5678/blockchain002','Evaluación del impacto ambiental de diferentes protocolos blockchain.','blockchain, sostenibilidad, medio ambiente, energía','WoS','Sustainable Technology Review','Tecnología Sostenible'),
(8,'10.5678/quantum003','Implementación de algoritmos cuánticos en simuladores actuales.','computación cuántica, algoritmos, simulación','Nature','Quantum Computing Today','Física Computacional'),
(9,'10.5678/cybersec004','Marcos de seguridad para infraestructuras industriales críticas.','ciberseguridad, industria, infraestructura crítica','IEEE','Industrial Security Quarterly','Seguridad Industrial'),
(10,'10.5678/iot005','Arquitecturas IoT escalables para gestión urbana inteligente.','IoT, smart cities, arquitectura, escalabilidad','ACM','Smart Systems Journal','Sistemas Urbanos');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `orcid` varchar(20) DEFAULT NULL,
  `afiliation` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `orcid` (`orcid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES 
(1,'Roberto','Silva','robertos','roberto@universidad.edu','pass123','0000-0001-1111-2222','Universidad Central'),
(2,'Carmen','Torres','carment','carmen@instituto.edu','pass456','0000-0002-2222-3333','Instituto Tecnológico'),
(3,'Diego','Morales','diegom','diego@college.edu','pass789','0000-0003-3333-4444','Colegio Superior'),
(4,'Elena','Castillo','elenac','elena@academy.edu','pass321','0000-0004-4444-5555','Academia Nacional'),
(5,'Gabriel','Herrera','gabrielh','gabriel@university.edu','pass654','0000-0005-5555-6666','Universidad Estatal'),
(6,'Isabella','Jiménez','isabellaj','isabella@tech.edu','pass987','0000-0006-6666-7777','Instituto de Tecnología'),
(7,'Mateo','Vargas','mateov','mateo@school.edu','pass147','0000-0007-7777-8888','Escuela Politécnica'),
(8,'Valentina','Cruz','valentinac','valentina@college.edu','pass258','0000-0008-8888-9999','Colegio Técnico'),
(9,'Sebastián','Rojas','sebastianr','sebastian@university.edu','pass369','0000-0009-9999-0000','Universidad Privada'),
(10,'Camila','Guerrero','camilag','camila@institute.edu','pass000','0000-0010-0000-1111','Instituto de Investigación');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
/*!40000 ALTER TABLE `author` ENABLE KEYS */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `publication_id` int NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `edition` int NOT NULL,
  PRIMARY KEY (`publication_id`),
  UNIQUE KEY `isbn` (`isbn`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'978-1-2345-6789-0','Tecnología',2),(2,'978-1-2345-6790-6','Sistemas',3),(3,'978-1-2345-6791-3','Programación',1),(4,'978-1-2345-6792-0','Hardware',2),(5,'978-1-2345-6793-7','Seguridad',1);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `publication_date` date NOT NULL,
  `author_id` int NOT NULL,
  `type` enum('book','article') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication`
--

/*!40000 ALTER TABLE `publication` DISABLE KEYS */;
INSERT INTO `publication` VALUES 
(1,'Algoritmos y Estructuras de Datos','Manual completo sobre algoritmos fundamentales','2024-01-15',1,'book'),
(2,'Bases de Datos Relacionales','Guía práctica de diseño y administración de BD','2024-02-20',2,'book'),
(3,'Desarrollo Web Full-Stack','Libro sobre tecnologías web modernas','2024-03-25',3,'book'),
(4,'Inteligencia Artificial Aplicada','Fundamentos y aplicaciones de IA','2024-04-10',4,'book'),
(5,'Metodologías Ágiles','Guía completa de Scrum y metodologías ágiles','2024-05-05',5,'book'),
(6,'Machine Learning en Medicina','Aplicaciones de ML en diagnóstico médico','2024-06-10',6,'article'),
(7,'Blockchain y Sostenibilidad','Impacto ambiental de las criptomonedas','2024-07-15',7,'article'),
(8,'Computación Cuántica','Fundamentos teóricos y aplicaciones prácticas','2024-08-20',8,'article'),
(9,'Ciberseguridad Industrial','Protección de sistemas industriales críticos','2024-09-25',9,'article'),
(10,'IoT y Smart Cities','Internet de las cosas en ciudades inteligentes','2024-10-30',10,'article');
/*!40000 ALTER TABLE `publication` ENABLE KEYS */;

--
-- Dumping routines for database 'project_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_article_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_article_list`()
BEGIN
    SELECT
        a.publication_id,
        p.title,
        p.description,
        p.publication_date,
        -- campos específicos de la tabla article
        a.doi,
        a.abstract,
        a.keywords,
        a.indexation,
        a.magazine,
        a.area,
        auth.id           AS author_id,
        auth.first_name,
        auth.last_name,
        auth.username,
        auth.email,
        auth.password,
        auth.orcid,
        auth.afiliation

    FROM article   AS a
    JOIN publication AS p ON a.publication_id = p.id
    JOIN author      AS auth ON p.author_id      = auth.id
    ORDER BY p.publication_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_book_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_book_list`()
BEGIN
    SELECT
        b.isbn,
        b.genre,
        b.edition,
        b.publication_id,

        p.description,
        p.publication_date,
        p.title,

        -- <— aquí recuperas el ID del autor
        p.author_id    AS author_id,

        -- (opcional) si luego quieres usar first/last en tu DTO:
        a.first_name,
        a.last_name
    FROM book       AS b
    JOIN publication AS p ON b.publication_id = p.id
    JOIN author      AS a ON p.author_id      = a.id
    ORDER BY p.publication_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_article` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_article`(
    IN p_title VARCHAR(100),
    IN p_description VARCHAR(100),
    IN p_date DATE,
    IN p_author_id INT,
    IN p_doi VARCHAR(50),
    IN p_abstract TEXT,
    IN p_keywords TEXT,
    IN p_indexation VARCHAR(50),
    IN p_magazine VARCHAR(100),
    IN p_area VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    INSERT INTO publication (
        title,
        description,
        publication_date,
        author_id,
        type
    ) VALUES (
        p_title,
        p_description,
        p_date,
        p_author_id,
        'article'
    );
    SET @new_pub_id = LAST_INSERT_ID();

    INSERT INTO article (
        publication_id,
        doi,
        abstract,
        keywords,
        indexation,
        magazine,
        area
    ) VALUES (
        @new_pub_id,
        p_doi,
        p_abstract,
        p_keywords,
        p_indexation,
        p_magazine,
        p_area
    );
    COMMIT;

    SELECT @new_pub_id AS pub_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_book`(
    IN p_title VARCHAR(100),
    IN p_description VARCHAR(100),
    IN p_date DATE,
    IN p_author_id INT,
    IN p_isbn VARCHAR(20),
    IN p_genre VARCHAR(50),
    IN p_edition INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO publication (
        title,
        description,
        publication_date,
        author_id,
        type
    ) VALUES (
        p_title,
        p_description,
        p_date,
        p_author_id,
        'book'
    );

    SET @new_pub_id = LAST_INSERT_ID();

    INSERT INTO book (
        publication_id,
        isbn,
        genre,
        edition
    ) VALUES (
        @new_pub_id,
        p_isbn,
        p_genre,
        p_edition
    );

    COMMIT;

    SELECT @new_pub_id AS pub_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_article` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_article`(IN p_id INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    DELETE FROM article WHERE publication_id = p_id;
    DELETE FROM publication WHERE id = p_id;

    COMMIT;

    SELECT 1 AS OK;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_book`(IN p_id INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    DELETE FROM book        WHERE publication_id = p_id;
    DELETE FROM publication WHERE id             = p_id;

    COMMIT;

    SELECT 1 AS OK;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_find_article` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_find_article`(IN p_id INT)
BEGIN
    SELECT
        a.publication_id,
        p.title,
        p.description,
        p.publication_date,
        -- campos específicos de la tabla article
        a.doi,
        a.abstract,
        a.keywords,
        a.indexation,
        a.magazine,
        a.area,
        auth.id           AS author_id,
        auth.first_name,
        auth.last_name
    FROM article   AS a
    JOIN publication AS p ON a.publication_id = p.id
    JOIN author      AS auth ON p.author_id      = auth.id
    WHERE a.publication_id = p_id
    ORDER BY p.publication_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_find_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_find_book`(IN p_id INT)
BEGIN
    SELECT
        b.isbn,
        b.genre,
        b.edition,
        b.publication_id,
        p.description,
        p.publication_date,
        p.title,
        p.author_id,
        a.first_name,
        a.last_name
    FROM book AS b
    JOIN publication AS p ON b.publication_id = p.id
    JOIN author AS a      ON p.author_id       = a.id
    WHERE b.publication_id = p_id
    ORDER BY p.publication_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_article` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_article`(
    IN p_id INT,
    IN p_title VARCHAR(100),
    IN p_description VARCHAR(100),
    IN p_date DATE,
    IN p_author_id INT,
    IN p_doi VARCHAR(50),
    IN p_abstract TEXT,
    IN p_keywords TEXT,
    IN p_indexation VARCHAR(50),
    IN p_magazine VARCHAR(100),
    IN p_area VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;

    UPDATE publication
    SET
        title = p_title,
        description = p_description,
        publication_date = p_date,
        author_id = p_author_id
    WHERE id = p_id;

    UPDATE article
    SET
        doi = p_doi,
        abstract = p_abstract,
        keywords = p_keywords,
        indexation = p_indexation,
        magazine = p_magazine,
        area = p_area
    WHERE publication_id = p_id;

    COMMIT;

    SELECT 1 AS OK;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_book`(
    IN p_id            INT,
    IN p_title         VARCHAR(100),
    IN p_description   VARCHAR(100),
    IN p_date          DATE,
    IN p_author_id     INT,
    IN p_isbn          VARCHAR(20),
    IN p_genre         VARCHAR(50),
    IN p_edition       INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Actualiza la tabla publication
    UPDATE publication
    SET
        title            = p_title,
        description      = p_description,
        publication_date = p_date,
        author_id        = p_author_id
    WHERE id = p_id;

    -- Actualiza la tabla book
    UPDATE book
    SET
        isbn    = p_isbn,
        genre   = p_genre,
        edition = p_edition
    WHERE publication_id = p_id;

    COMMIT;

    SELECT 1 AS OK;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-05 17:10:34
