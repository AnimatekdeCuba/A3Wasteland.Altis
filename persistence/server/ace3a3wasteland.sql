CREATE DATABASE  IF NOT EXISTS `a3wasteland` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `a3wasteland`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: a3wasteland
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `adminlog`
--

DROP TABLE IF EXISTS `adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminlog` (
  `ServerID` int unsigned NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PlayerName` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PlayerUID` varchar(32) NOT NULL,
  `BattlEyeGUID` varchar(32) DEFAULT NULL,
  `ActionType` varchar(128) NOT NULL,
  `ActionValue` varchar(1024) NOT NULL,
  KEY `fk_AdminLog_ServerInstance_idx` (`ServerID`),
  CONSTRAINT `fk_AdminLog_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlog`
--

LOCK TABLES `adminlog` WRITE;
/*!40000 ALTER TABLE `adminlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antihacklog`
--

DROP TABLE IF EXISTS `antihacklog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `antihacklog` (
  `EntryID` int unsigned NOT NULL AUTO_INCREMENT,
  `ServerID` int unsigned NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PlayerName` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PlayerUID` varchar(32) NOT NULL,
  `BattlEyeGUID` varchar(32) DEFAULT NULL,
  `HackType` varchar(128) NOT NULL,
  `HackValue` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `KickOnJoin` tinyint unsigned NOT NULL DEFAULT '1',
  `AdminNote` varchar(4096) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`EntryID`),
  KEY `fk_AntihackLog_ServerInstance_idx` (`ServerID`),
  KEY `idx_AntihackLog_kickOnJoin` (`PlayerUID`,`KickOnJoin` DESC),
  CONSTRAINT `fk_AntihackLog_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antihacklog`
--

LOCK TABLES `antihacklog` WRITE;
/*!40000 ALTER TABLE `antihacklog` DISABLE KEYS */;
/*!40000 ALTER TABLE `antihacklog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banktransferlog`
--

DROP TABLE IF EXISTS `banktransferlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banktransferlog` (
  `ServerID` int unsigned NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SenderName` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SenderUID` varchar(32) NOT NULL,
  `SenderSide` varchar(32) DEFAULT NULL,
  `RecipientName` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `RecipientUID` varchar(32) NOT NULL,
  `RecipientSide` varchar(32) DEFAULT NULL,
  `Amount` float NOT NULL,
  `Fee` float NOT NULL,
  KEY `fk_BankTransfers_ServerInstance_idx` (`ServerID`),
  CONSTRAINT `fk_BankTransfers_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banktransferlog`
--

LOCK TABLES `banktransferlog` WRITE;
/*!40000 ALTER TABLE `banktransferlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `banktransferlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbinfo`
--

DROP TABLE IF EXISTS `dbinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbinfo` (
  `Name` varchar(128) NOT NULL,
  `Value` varchar(1024) NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbinfo`
--

LOCK TABLES `dbinfo` WRITE;
/*!40000 ALTER TABLE `dbinfo` DISABLE KEYS */;
INSERT INTO `dbinfo` VALUES ('Version','2.07');
/*!40000 ALTER TABLE `dbinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerinfo`
--

DROP TABLE IF EXISTS `playerinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerinfo` (
  `UID` varchar(32) NOT NULL,
  `BattlEyeGUID` varchar(32) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Name` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LastSide` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerinfo`
--

LOCK TABLES `playerinfo` WRITE;
/*!40000 ALTER TABLE `playerinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playersave`
--

DROP TABLE IF EXISTS `playersave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playersave` (
  `PlayerUID` varchar(32) NOT NULL,
  `MapID` int unsigned NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `LastModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastServerID` int unsigned DEFAULT NULL,
  `Position` varchar(256) NOT NULL DEFAULT '[]',
  `Direction` float NOT NULL DEFAULT '0',
  `Damage` float NOT NULL DEFAULT '0',
  `HitPoints` varchar(1024) NOT NULL DEFAULT '[]',
  `Hunger` float NOT NULL DEFAULT '0',
  `Thirst` float NOT NULL DEFAULT '0',
  `Money` int unsigned NOT NULL DEFAULT '0',
  `CurrentWeapon` varchar(128) NOT NULL DEFAULT '""',
  `Stance` varchar(128) NOT NULL DEFAULT '""',
  `Headgear` varchar(128) NOT NULL DEFAULT '""',
  `Goggles` varchar(128) NOT NULL DEFAULT '""',
  `Uniform` varchar(128) NOT NULL DEFAULT '""',
  `Vest` varchar(128) NOT NULL DEFAULT '""',
  `Backpack` varchar(128) NOT NULL DEFAULT '""',
  `UniformWeapons` varchar(1024) NOT NULL DEFAULT '[]',
  `UniformItems` varchar(4096) NOT NULL DEFAULT '[]',
  `UniformMagazines` varchar(4096) NOT NULL DEFAULT '[]',
  `VestWeapons` varchar(1024) NOT NULL DEFAULT '[]',
  `VestItems` varchar(4096) NOT NULL DEFAULT '[]',
  `VestMagazines` varchar(4096) NOT NULL DEFAULT '[]',
  `BackpackWeapons` varchar(2048) NOT NULL DEFAULT '[]',
  `BackpackItems` varchar(4096) NOT NULL DEFAULT '[]',
  `BackpackMagazines` varchar(4096) NOT NULL DEFAULT '[]',
  `PrimaryWeapon` varchar(128) NOT NULL DEFAULT '""',
  `SecondaryWeapon` varchar(128) NOT NULL DEFAULT '""',
  `HandgunWeapon` varchar(128) NOT NULL DEFAULT '""',
  `PrimaryWeaponItems` varchar(512) NOT NULL DEFAULT '[]',
  `SecondaryWeaponItems` varchar(512) NOT NULL DEFAULT '[]',
  `HandgunItems` varchar(512) NOT NULL DEFAULT '[]',
  `AssignedItems` varchar(512) NOT NULL DEFAULT '[]',
  `LoadedMagazines` varchar(1024) NOT NULL DEFAULT '[]',
  `WastelandItems` varchar(1024) NOT NULL DEFAULT '[]',
  `UniformTexture` varchar(1024) NOT NULL DEFAULT '[]',
  `BackpackTexture` varchar(1024) NOT NULL DEFAULT '[]',
  `BackPackOnChest` varchar(128) NOT NULL DEFAULT '[]',
  `BackpackOnChestItem` varchar(1024) NOT NULL DEFAULT '[]',
  `BackpackOnChestMags` varchar(1024) NOT NULL DEFAULT '[]',
  `ACEPain` float NOT NULL DEFAULT '0',
  `ACEPainSuppress` float NOT NULL DEFAULT '0',
  `ACEPainMedication` varchar(1024) NOT NULL DEFAULT '[]',
  `ACEbloodVolume` float NOT NULL DEFAULT '6',
  `ACEBloodPressure` varchar(1024) NOT NULL DEFAULT '[]',
  `ACEBloodLoss` float NOT NULL DEFAULT '0',
  `ACEhemorrhage` float NOT NULL DEFAULT '0',
  `ACEtourniquets` varchar(1024) NOT NULL DEFAULT '[]',
  `ACEFractures` varchar(1024) NOT NULL DEFAULT '[]',
  `ACEopenWounds` varchar(1024) NOT NULL DEFAULT '[]',
  `ACEbandagedWounds` varchar(1024) NOT NULL DEFAULT '[]',
  `ACEheartRate` float NOT NULL DEFAULT '0',
  `ACEbodyPartStatus` varchar(1024) NOT NULL DEFAULT '[]',
  `ActualPlayerSide` varchar(128) NOT NULL DEFAULT '""',
  `ACE_EarPlug` varchar(128) NOT NULL DEFAULT '""',
  UNIQUE KEY `idx_PlayerSave_uniquePlayerMap` (`PlayerUID`,`MapID`),
  KEY `fk_PlayerSave_ServerMap_idx` (`MapID`),
  KEY `fk_PlayerSave_ServerInstance_idx` (`LastServerID`),
  KEY `idx_PlayerSave_crossMap` (`PlayerUID`,`LastModified` DESC),
  CONSTRAINT `fk_PlayerSave_PlayerInfo` FOREIGN KEY (`PlayerUID`) REFERENCES `playerinfo` (`UID`),
  CONSTRAINT `fk_PlayerSave_ServerInstance` FOREIGN KEY (`LastServerID`) REFERENCES `serverinstance` (`ID`),
  CONSTRAINT `fk_PlayerSave_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playersave`
--

LOCK TABLES `playersave` WRITE;
/*!40000 ALTER TABLE `playersave` DISABLE KEYS */;
/*!40000 ALTER TABLE `playersave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstats`
--

DROP TABLE IF EXISTS `playerstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerstats` (
  `PlayerUID` varchar(32) NOT NULL,
  `LastModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PlayerKills` int unsigned NOT NULL DEFAULT '0',
  `AIKills` int unsigned NOT NULL DEFAULT '0',
  `TeamKills` int unsigned NOT NULL DEFAULT '0',
  `DeathCount` int unsigned NOT NULL DEFAULT '0',
  `ReviveCount` int unsigned NOT NULL DEFAULT '0',
  `CaptureCount` int unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_PlayerStats_uniquePlayer` (`PlayerUID`),
  CONSTRAINT `fk_PlayerStats_PlayerInfo` FOREIGN KEY (`PlayerUID`) REFERENCES `playerinfo` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstats`
--

LOCK TABLES `playerstats` WRITE;
/*!40000 ALTER TABLE `playerstats` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstatsmap`
--

DROP TABLE IF EXISTS `playerstatsmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerstatsmap` (
  `PlayerUID` varchar(32) NOT NULL,
  `ServerID` int unsigned NOT NULL,
  `MapID` int unsigned NOT NULL,
  `LastModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PlayerKills` int unsigned NOT NULL DEFAULT '0',
  `AIKills` int unsigned NOT NULL DEFAULT '0',
  `TeamKills` int unsigned NOT NULL DEFAULT '0',
  `DeathCount` int unsigned NOT NULL DEFAULT '0',
  `ReviveCount` int unsigned NOT NULL DEFAULT '0',
  `CaptureCount` int unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_PlayerStatsMap_uniquePlayer` (`PlayerUID`,`ServerID`,`MapID`),
  KEY `fk_PlayerStatsMap_ServerMap_idx` (`MapID`),
  KEY `fk_PlayerStatsMap_ServerInstance_idx` (`ServerID`),
  CONSTRAINT `fk_PlayerStatsMap_PlayerStats` FOREIGN KEY (`PlayerUID`) REFERENCES `playerstats` (`PlayerUID`),
  CONSTRAINT `fk_PlayerStatsMap_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`),
  CONSTRAINT `fk_PlayerStatsMap_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstatsmap`
--

LOCK TABLES `playerstatsmap` WRITE;
/*!40000 ALTER TABLE `playerstatsmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerstatsmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstatus`
--

DROP TABLE IF EXISTS `playerstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerstatus` (
  `PlayerUID` varchar(32) NOT NULL,
  `MapID` int unsigned NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `LastModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `BankMoney` int unsigned NOT NULL DEFAULT '0',
  `Bounty` int unsigned NOT NULL DEFAULT '0',
  `BountyKills` varchar(8192) NOT NULL DEFAULT '[]',
  UNIQUE KEY `idx_PlayerStatus_uniquePlayerMap` (`PlayerUID`,`MapID`),
  KEY `fk_PlayerStatus_PlayerInfo_idx` (`PlayerUID`),
  KEY `fk_PlayerStatus_ServerMap_idx` (`MapID`),
  KEY `idx_PlayerStatus_crossMap` (`PlayerUID`,`LastModified`),
  CONSTRAINT `fk_PlayerStatus_PlayerInfo` FOREIGN KEY (`PlayerUID`) REFERENCES `playerinfo` (`UID`),
  CONSTRAINT `fk_PlayerStatus_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstatus`
--

LOCK TABLES `playerstatus` WRITE;
/*!40000 ALTER TABLE `playerstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstorage`
--

DROP TABLE IF EXISTS `playerstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerstorage` (
  `PlayerUID` varchar(32) NOT NULL,
  `MapID` int unsigned NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `LastModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Weapons` varchar(4096) NOT NULL DEFAULT '[]',
  `Magazines` varchar(4096) NOT NULL DEFAULT '[]',
  `Items` varchar(4096) NOT NULL DEFAULT '[]',
  `Backpacks` varchar(4096) NOT NULL DEFAULT '[]',
  UNIQUE KEY `idx_PlayerStorage_uniquePlayerMap` (`PlayerUID`,`MapID`),
  KEY `fk_PlayerStorage_ServerMap_idx` (`MapID`),
  CONSTRAINT `fk_PlayerStorage_PlayerInfo` FOREIGN KEY (`PlayerUID`) REFERENCES `playerinfo` (`UID`),
  CONSTRAINT `fk_PlayerStorage_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstorage`
--

LOCK TABLES `playerstorage` WRITE;
/*!40000 ALTER TABLE `playerstorage` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serverinstance`
--

DROP TABLE IF EXISTS `serverinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serverinstance` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `WarchestMoneyBLUFOR` float NOT NULL DEFAULT '0',
  `WarchestMoneyOPFOR` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serverinstance`
--

LOCK TABLES `serverinstance` WRITE;
/*!40000 ALTER TABLE `serverinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `serverinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servermap`
--

DROP TABLE IF EXISTS `servermap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servermap` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `WorldName` varchar(128) NOT NULL,
  `Environment` varchar(128) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `idx_ServerMap_uniqueWorldEnv` (`WorldName`,`Environment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servermap`
--

LOCK TABLES `servermap` WRITE;
/*!40000 ALTER TABLE `servermap` DISABLE KEYS */;
/*!40000 ALTER TABLE `servermap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servermines`
--

DROP TABLE IF EXISTS `servermines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servermines` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ServerID` int unsigned NOT NULL,
  `MapID` int unsigned NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `LastInteraction` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OwnerUID` varchar(32) NOT NULL DEFAULT '""',
  `Class` varchar(128) NOT NULL DEFAULT 'nil',
  `Position` varchar(256) NOT NULL DEFAULT 'nil',
  `Direction` varchar(256) NOT NULL DEFAULT '[]',
  `Damage` float NOT NULL DEFAULT '0',
  `Variables` varchar(4096) NOT NULL DEFAULT '[]',
  PRIMARY KEY (`ID`),
  KEY `fk_ServerMines_ServerInstance_idx` (`ServerID`),
  KEY `fk_ServerMines_ServerMap_idx` (`MapID`),
  CONSTRAINT `fk_ServerMines_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`),
  CONSTRAINT `fk_ServerMines_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servermines`
--

LOCK TABLES `servermines` WRITE;
/*!40000 ALTER TABLE `servermines` DISABLE KEYS */;
/*!40000 ALTER TABLE `servermines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serverobjects`
--

DROP TABLE IF EXISTS `serverobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serverobjects` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ServerID` int unsigned NOT NULL,
  `MapID` int unsigned NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `LastInteraction` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OwnerUID` varchar(32) NOT NULL DEFAULT '""',
  `Class` varchar(128) NOT NULL DEFAULT 'nil',
  `Position` varchar(256) NOT NULL DEFAULT 'nil',
  `Direction` varchar(256) NOT NULL DEFAULT '[]',
  `Locked` tinyint unsigned NOT NULL DEFAULT '0',
  `Deployable` tinyint unsigned NOT NULL DEFAULT '0',
  `Damage` float NOT NULL DEFAULT '0',
  `AllowDamage` tinyint unsigned NOT NULL DEFAULT '1',
  `Variables` varchar(4096) NOT NULL DEFAULT '[]',
  `Weapons` varchar(4096) NOT NULL DEFAULT '[]',
  `Magazines` varchar(4096) NOT NULL DEFAULT '[]',
  `Items` varchar(4096) NOT NULL DEFAULT '[]',
  `Backpacks` varchar(4096) NOT NULL DEFAULT '[]',
  `TurretMagazines` varchar(4096) NOT NULL DEFAULT '[]',
  `AmmoCargo` float NOT NULL DEFAULT '0',
  `FuelCargo` float NOT NULL DEFAULT '0',
  `RepairCargo` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_ServerObjects_ServerInstance_idx` (`ServerID`),
  KEY `fk_ServerObjects_ServerMap_idx` (`MapID`),
  CONSTRAINT `fk_ServerObjects_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`),
  CONSTRAINT `fk_ServerObjects_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serverobjects`
--

LOCK TABLES `serverobjects` WRITE;
/*!40000 ALTER TABLE `serverobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `serverobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servertime`
--

DROP TABLE IF EXISTS `servertime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servertime` (
  `ServerID` int unsigned NOT NULL,
  `MapID` int unsigned NOT NULL,
  `DayTime` float DEFAULT NULL,
  `Fog` float DEFAULT NULL,
  `Overcast` float DEFAULT NULL,
  `Rain` float DEFAULT NULL,
  `Wind` varchar(128) DEFAULT NULL,
  UNIQUE KEY `idx_ServerTime_uniqueServerMap` (`ServerID`,`MapID`),
  KEY `fk_ServerTime_ServerInstance_idx` (`ServerID`),
  KEY `fk_ServerTime_ServerMap_idx` (`MapID`),
  CONSTRAINT `fk_ServerTime_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`),
  CONSTRAINT `fk_ServerTime_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servertime`
--

LOCK TABLES `servertime` WRITE;
/*!40000 ALTER TABLE `servertime` DISABLE KEYS */;
/*!40000 ALTER TABLE `servertime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servervehicles`
--

DROP TABLE IF EXISTS `servervehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servervehicles` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ServerID` int unsigned NOT NULL,
  `MapID` int unsigned NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `LastUsed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OwnerUID` varchar(32) NOT NULL DEFAULT '""',
  `Parked` tinyint unsigned NOT NULL DEFAULT '0',
  `LockState` tinyint unsigned NOT NULL DEFAULT '1',
  `Class` varchar(128) NOT NULL DEFAULT 'nil',
  `Position` varchar(256) NOT NULL DEFAULT 'nil',
  `Direction` varchar(256) NOT NULL DEFAULT '[]',
  `Velocity` varchar(256) NOT NULL DEFAULT '[]',
  `Flying` tinyint(1) NOT NULL DEFAULT '0',
  `Damage` float NOT NULL DEFAULT '0',
  `Fuel` float NOT NULL DEFAULT '0',
  `HitPoints` varchar(4096) NOT NULL DEFAULT '[]',
  `AnimPhases` varchar(4096) NOT NULL DEFAULT '[]',
  `Variables` varchar(4096) NOT NULL DEFAULT '[]',
  `Textures` varchar(4096) NOT NULL DEFAULT '[]',
  `Weapons` varchar(4096) NOT NULL DEFAULT '[]',
  `Magazines` varchar(4096) NOT NULL DEFAULT '[]',
  `Items` varchar(4096) NOT NULL DEFAULT '[]',
  `Backpacks` varchar(4096) NOT NULL DEFAULT '[]',
  `TurretMagazines` varchar(4096) NOT NULL DEFAULT '[]',
  `TurretMagazines2` varchar(4096) NOT NULL DEFAULT '[]',
  `TurretMagazines3` varchar(4096) NOT NULL DEFAULT '[]',
  `AmmoCargo` float NOT NULL DEFAULT '0',
  `FuelCargo` float NOT NULL DEFAULT '0',
  `RepairCargo` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_ServerVehicles_ServerInstance_idx` (`ServerID`),
  KEY `fk_ServerVehicles_ServerMap_idx` (`MapID`),
  KEY `idx_ServerVehicles_parkedOwners` (`OwnerUID`,`Parked` DESC),
  CONSTRAINT `fk_ServerVehicles_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`),
  CONSTRAINT `fk_ServerVehicles_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servervehicles`
--

LOCK TABLES `servervehicles` WRITE;
/*!40000 ALTER TABLE `servervehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `servervehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-16  1:34:33
