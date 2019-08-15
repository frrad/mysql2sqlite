/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
-- CHANGE MASTER TO MASTER_LOG_FILE='bin.000088', MASTER_LOG_POS=16192938;
-- SET GLOBAL gtid_slave_pos='0-1-14493171';
DROP TABLE IF EXISTS `scimag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scimag` (
  `ID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `DOI` varchar(200) NOT NULL,
  `DOI2` varchar(100) NOT NULL DEFAULT '',
  `Title` varchar(2000) NOT NULL DEFAULT '',
  `Author` varchar(2000) NOT NULL DEFAULT '',
  `Year` varchar(10) NOT NULL DEFAULT '',
  `Month` varchar(10) NOT NULL DEFAULT '',
  `Day` varchar(10) NOT NULL DEFAULT '',
  `Volume` varchar(45) NOT NULL DEFAULT '',
  `Issue` varchar(95) NOT NULL DEFAULT '',
  `First_page` varchar(45) NOT NULL DEFAULT '',
  `Last_page` varchar(45) NOT NULL DEFAULT '',
  `Journal` varchar(500) NOT NULL DEFAULT '',
  `ISBN` varchar(500) NOT NULL DEFAULT '',
  `ISSNP` varchar(11) NOT NULL DEFAULT '',
  `ISSNE` varchar(10) NOT NULL DEFAULT '',
  `MD5` varchar(32) NOT NULL DEFAULT '',
  `Filesize` int(11) unsigned NOT NULL,
  `TimeAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `JOURNALID` varchar(45) NOT NULL DEFAULT '',
  `AbstractURL` varchar(500) NOT NULL DEFAULT '',
  `Attribute1` varchar(500) NOT NULL DEFAULT '',
  `Attribute2` varchar(1000) NOT NULL DEFAULT '',
  `Attribute3` varchar(2000) NOT NULL DEFAULT '',
  `Attribute4` varchar(10000) NOT NULL DEFAULT '',
  `Attribute5` varchar(256) NOT NULL DEFAULT '',
  `Attribute6` varchar(45) NOT NULL DEFAULT '',
  `visible` char(3) NOT NULL DEFAULT '',
  `PubmedID` varchar(10) NOT NULL DEFAULT '',
  `PMC` varchar(12) NOT NULL DEFAULT '',
  `PII` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `DOIUNIQUE` (`DOI`) USING BTREE,
  KEY `VOLUMEINDEX` (`Volume`) USING BTREE,
  KEY `ISSUEINDEX` (`Issue`) USING BTREE,
  KEY `ISSNPINDEX` (`ISSNP`) USING BTREE,
  KEY `YEARINDEX` (`Year`) USING BTREE,
  KEY `ISSNEINDEX` (`ISSNE`),
  KEY `DOIINDEX` (`DOI`) USING BTREE,
  KEY `JOURNALID` (`JOURNALID`) USING BTREE,
  KEY `DOIINDEX2` (`DOI2`) USING BTREE,
  KEY `PUBMEDINDEX` (`PubmedID`) USING BTREE,
  KEY `MD5` (`MD5`) USING BTREE,
  KEY `VISIBLEID` (`visible`,`ID`) USING BTREE,
  FULLTEXT KEY `FULLTEXT` (`Title`,`Author`)
) ENGINE=MyISAM AUTO_INCREMENT=76501855 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `scimag` WRITE;
/*!40000 ALTER TABLE `scimag` DISABLE KEYS */;


/*!40000 ALTER TABLE `scimag` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `md5_all_upd` BEFORE UPDATE ON `scimag` FOR EACH ROW BEGIN


IF
NEW.`DOI`!=OLD.`DOI` OR 
NEW.`DOI2`!=OLD.`DOI2` OR 
NEW.`Title`!=OLD.`Title` OR 
NEW.`Author`!=OLD.`Author` OR 
NEW.`Year`!=OLD.`Year` OR 
NEW.`Month`!=OLD.`Month` OR 
NEW.`Day`!=OLD.`Day` OR 
NEW.`Volume`!=OLD.`Volume` OR 
NEW.`Issue`!=OLD.`Issue` OR 
NEW.`First_page`!=OLD.`First_page` OR 
NEW.`Last_page`!=OLD.`Last_page` OR 
NEW.`Journal`!=OLD.`Journal` OR 
NEW.`ISBN`!=OLD.`ISBN` OR 
NEW.`ISSNP`!=OLD.`ISSNP` OR 
NEW.`ISSNE`!=OLD.`ISSNE` OR 
NEW.`Filesize`!=OLD.`Filesize` OR 
NEW.`JOURNALID`!=OLD.`JOURNALID` OR 
NEW.`AbstractURL`!=OLD.`AbstractURL` OR 
NEW.`Attribute1`!=OLD.`Attribute1` OR 
NEW.`Attribute2`!=OLD.`Attribute2` OR 
NEW.`Attribute3`!=OLD.`Attribute3` OR 
NEW.`Attribute4`!=OLD.`Attribute4` OR 
NEW.`Attribute5`!=OLD.`Attribute5` OR 
NEW.`Attribute6`!=OLD.`Attribute6` OR 
NEW.`visible`!=OLD.`visible` OR 
NEW.`PubmedID`!=OLD.`PubmedID` OR 
NEW.`PMC`!=OLD.`PMC` OR 
NEW.`PII`!=OLD.`PII` THEN
INSERT INTO 
`libgen_scimag`.`scimag_edited`
(
`DOI`,
`DOI2`,
`Title`,
`Author`,
`Year`,
`Month`,
`Day`,
`Volume`,
`Issue`,
`First_page`,
`Last_page`,
`Journal`,
`ISBN`,
`ISSNP`,
`ISSNE`,
`MD5`,
`Filesize`,
`TimeAdded`,
`JOURNALID`,
`AbstractURL`,
`Attribute1`,
`Attribute2`,
`Attribute3`,
`Attribute4`,
`Attribute5`,
`Attribute6`,
`visible`,
`PubmedID`,
`PMC`,
`PII`
)
VALUES
(
OLD.`DOI`,
OLD.`DOI2`,
OLD.`Title`,
OLD.`Author`,
OLD.`Year`,
OLD.`Month`,
OLD.`Day`,
OLD.`Volume`,
OLD.`Issue`,
OLD.`First_page`,
OLD.`Last_page`,
OLD.`Journal`,
OLD.`ISBN`,
OLD.`ISSNP`,
OLD.`ISSNE`,
OLD.`MD5`,
OLD.`Filesize`,
NOW(),
OLD.`JOURNALID`,
OLD.`AbstractURL`,
OLD.`Attribute1`,
OLD.`Attribute2`,
OLD.`Attribute3`,
OLD.`Attribute4`,
OLD.`Attribute5`,
OLD.`Attribute6`,
OLD.`visible`,
OLD.`PubmedID`,
OLD.`PMC`,
OLD.`PII`
);
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
DROP TABLE IF EXISTS `scimag_edited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scimag_edited` (
  `ID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `DOI` varchar(200) DEFAULT NULL,
  `Title` varchar(2000) NOT NULL DEFAULT '',
  `Author` varchar(2000) NOT NULL DEFAULT '',
  `Year` varchar(10) NOT NULL DEFAULT '',
  `Month` varchar(10) NOT NULL DEFAULT '',
  `Day` varchar(10) NOT NULL DEFAULT '',
  `Volume` varchar(45) NOT NULL DEFAULT '',
  `Issue` varchar(95) NOT NULL DEFAULT '',
  `First_page` varchar(45) NOT NULL DEFAULT '',
  `Last_page` varchar(45) NOT NULL DEFAULT '',
  `Journal` varchar(500) NOT NULL DEFAULT '',
  `ISBN` varchar(500) NOT NULL DEFAULT '',
  `ISSNP` varchar(11) NOT NULL DEFAULT '',
  `ISSNE` varchar(10) NOT NULL DEFAULT '',
  `MD5` varchar(32) NOT NULL DEFAULT '',
  `Filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `TimeAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `JOURNALID` varchar(45) NOT NULL DEFAULT '',
  `AbstractURL` varchar(500) NOT NULL DEFAULT '',
  `Attribute1` varchar(500) NOT NULL DEFAULT '',
  `Attribute2` varchar(1000) NOT NULL DEFAULT '',
  `Attribute3` varchar(2000) NOT NULL DEFAULT '',
  `Attribute4` varchar(2000) NOT NULL DEFAULT '',
  `Attribute5` varchar(256) NOT NULL DEFAULT '',
  `Attribute6` varchar(45) NOT NULL DEFAULT '',
  `Attribute7` varchar(500) NOT NULL DEFAULT '',
  `PII` varchar(45) NOT NULL DEFAULT '',
  `PMCID` varchar(15) NOT NULL DEFAULT '',

