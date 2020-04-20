/*
 Navicat Premium Data Transfer

 Source Server         : a3wasteland
 Source Server Type    : MySQL
 Source Server Version : 100316
 Source Host           : localhost:3306
 Source Schema         : a3wasteland

 Target Server Type    : MySQL
 Target Server Version : 100316
 File Encoding         : 65001

 Date: 03/11/2019 05:25:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adminlog
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog`  (
  `ServerID` int(10) UNSIGNED NOT NULL,
  `Time` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `PlayerName` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PlayerUID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `BattlEyeGUID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ActionType` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ActionValue` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `fk_AdminLog_ServerInstance_idx`(`ServerID`) USING BTREE,
  CONSTRAINT `fk_AdminLog_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for antihacklog
-- ----------------------------
DROP TABLE IF EXISTS `antihacklog`;
CREATE TABLE `antihacklog`  (
  `EntryID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ServerID` int(10) UNSIGNED NOT NULL,
  `Time` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `PlayerName` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PlayerUID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `BattlEyeGUID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `HackType` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `HackValue` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `KickOnJoin` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `AdminNote` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`EntryID`) USING BTREE,
  INDEX `fk_AntihackLog_ServerInstance_idx`(`ServerID`) USING BTREE,
  INDEX `idx_AntihackLog_kickOnJoin`(`PlayerUID`, `KickOnJoin`) USING BTREE,
  CONSTRAINT `fk_AntihackLog_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for banktransferlog
-- ----------------------------
DROP TABLE IF EXISTS `banktransferlog`;
CREATE TABLE `banktransferlog`  (
  `ServerID` int(10) UNSIGNED NOT NULL,
  `Time` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `SenderName` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SenderUID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `SenderSide` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `RecipientName` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RecipientUID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `RecipientSide` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Amount` float NOT NULL,
  `Fee` float NOT NULL,
  INDEX `fk_BankTransfers_ServerInstance_idx`(`ServerID`) USING BTREE,
  CONSTRAINT `fk_BankTransfers_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dbinfo
-- ----------------------------
DROP TABLE IF EXISTS `dbinfo`;
CREATE TABLE `dbinfo`  (
  `Name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Value` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`Name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for playerinfo
-- ----------------------------
DROP TABLE IF EXISTS `playerinfo`;
CREATE TABLE `playerinfo`  (
  `UID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `BattlEyeGUID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CreationDate` timestamp(0) NULL DEFAULT current_timestamp(0),
  `Name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LastSide` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for playersave
-- ----------------------------
DROP TABLE IF EXISTS `playersave`;
CREATE TABLE `playersave`  (
  `PlayerUID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `MapID` int(10) UNSIGNED NOT NULL,
  `CreationDate` timestamp(0) NULL DEFAULT NULL,
  `LastModified` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `LastServerID` int(10) UNSIGNED NULL DEFAULT NULL,
  `Position` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Direction` float NOT NULL DEFAULT 0,
  `Damage` float NOT NULL DEFAULT 0,
  `HitPoints` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Hunger` float NOT NULL DEFAULT 100,
  `Thirst` float NOT NULL DEFAULT 100,
  `Money` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `CurrentWeapon` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `Stance` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `Headgear` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `Goggles` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `Uniform` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `Vest` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `Backpack` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `UniformWeapons` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `UniformItems` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `UniformMagazines` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `VestWeapons` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `VestItems` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `VestMagazines` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `BackpackWeapons` varchar(2048) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `BackpackItems` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `BackpackMagazines` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `PrimaryWeapon` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `SecondaryWeapon` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `HandgunWeapon` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `PrimaryWeaponItems` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `SecondaryWeaponItems` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `HandgunItems` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `AssignedItems` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `LoadedMagazines` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `WastelandItems` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `UniformTexture` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `BackpackTexture` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `BackPackOnChest` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `BackpackOnChestItem` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `BackpackOnChestMags` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `ACEPain` float NOT NULL DEFAULT 0,
  `ACEbloodVolume` float NOT NULL DEFAULT 100,
  `ACEBloodLoss` float NOT NULL DEFAULT 0,
  `ACEtourniquets` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `ACEopenWounds` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `ACEheartRate` float NOT NULL DEFAULT 80,
  `ACEbodyPartStatus` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  UNIQUE INDEX `idx_PlayerSave_uniquePlayerMap`(`PlayerUID`, `MapID`) USING BTREE,
  INDEX `fk_PlayerSave_ServerMap_idx`(`MapID`) USING BTREE,
  INDEX `fk_PlayerSave_ServerInstance_idx`(`LastServerID`) USING BTREE,
  INDEX `idx_PlayerSave_crossMap`(`PlayerUID`, `LastModified`) USING BTREE,
  CONSTRAINT `fk_PlayerSave_PlayerInfo` FOREIGN KEY (`PlayerUID`) REFERENCES `playerinfo` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerSave_ServerInstance` FOREIGN KEY (`LastServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerSave_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for playerstats
-- ----------------------------
DROP TABLE IF EXISTS `playerstats`;
CREATE TABLE `playerstats`  (
  `PlayerUID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `LastModified` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `PlayerKills` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `AIKills` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `TeamKills` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `DeathCount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ReviveCount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `CaptureCount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  UNIQUE INDEX `idx_PlayerStats_uniquePlayer`(`PlayerUID`) USING BTREE,
  CONSTRAINT `fk_PlayerStats_PlayerInfo` FOREIGN KEY (`PlayerUID`) REFERENCES `playerinfo` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for playerstatsmap
-- ----------------------------
DROP TABLE IF EXISTS `playerstatsmap`;
CREATE TABLE `playerstatsmap`  (
  `PlayerUID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ServerID` int(10) UNSIGNED NOT NULL,
  `MapID` int(10) UNSIGNED NOT NULL,
  `LastModified` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `PlayerKills` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `AIKills` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `TeamKills` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `DeathCount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ReviveCount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `CaptureCount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  UNIQUE INDEX `idx_PlayerStatsMap_uniquePlayer`(`PlayerUID`, `ServerID`, `MapID`) USING BTREE,
  INDEX `fk_PlayerStatsMap_ServerMap_idx`(`MapID`) USING BTREE,
  INDEX `fk_PlayerStatsMap_ServerInstance_idx`(`ServerID`) USING BTREE,
  CONSTRAINT `fk_PlayerStatsMap_PlayerStats` FOREIGN KEY (`PlayerUID`) REFERENCES `playerstats` (`PlayerUID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerStatsMap_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerStatsMap_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for playerstatus
-- ----------------------------
DROP TABLE IF EXISTS `playerstatus`;
CREATE TABLE `playerstatus`  (
  `PlayerUID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `MapID` int(10) UNSIGNED NOT NULL,
  `CreationDate` timestamp(0) NULL DEFAULT NULL,
  `LastModified` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `BankMoney` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Bounty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `BountyKills` varchar(8192) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  UNIQUE INDEX `idx_PlayerStatus_uniquePlayerMap`(`PlayerUID`, `MapID`) USING BTREE,
  INDEX `fk_PlayerStatus_PlayerInfo_idx`(`PlayerUID`) USING BTREE,
  INDEX `fk_PlayerStatus_ServerMap_idx`(`MapID`) USING BTREE,
  INDEX `idx_PlayerStatus_crossMap`(`PlayerUID`, `LastModified`) USING BTREE,
  CONSTRAINT `fk_PlayerStatus_PlayerInfo` FOREIGN KEY (`PlayerUID`) REFERENCES `playerinfo` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerStatus_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for playerstorage
-- ----------------------------
DROP TABLE IF EXISTS `playerstorage`;
CREATE TABLE `playerstorage`  (
  `PlayerUID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `MapID` int(10) UNSIGNED NOT NULL,
  `CreationDate` timestamp(0) NULL DEFAULT NULL,
  `LastModified` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `Weapons` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Magazines` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Items` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Backpacks` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  UNIQUE INDEX `idx_PlayerStorage_uniquePlayerMap`(`PlayerUID`, `MapID`) USING BTREE,
  INDEX `fk_PlayerStorage_ServerMap_idx`(`MapID`) USING BTREE,
  CONSTRAINT `fk_PlayerStorage_PlayerInfo` FOREIGN KEY (`PlayerUID`) REFERENCES `playerinfo` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayerStorage_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for serverinstance
-- ----------------------------
DROP TABLE IF EXISTS `serverinstance`;
CREATE TABLE `serverinstance`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `WarchestMoneyBLUFOR` float NOT NULL DEFAULT 0,
  `WarchestMoneyOPFOR` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for servermap
-- ----------------------------
DROP TABLE IF EXISTS `servermap`;
CREATE TABLE `servermap`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `WorldName` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Environment` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `idx_ServerMap_uniqueWorldEnv`(`WorldName`, `Environment`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for servermines
-- ----------------------------
DROP TABLE IF EXISTS `servermines`;
CREATE TABLE `servermines`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ServerID` int(10) UNSIGNED NOT NULL,
  `MapID` int(10) UNSIGNED NOT NULL,
  `CreationDate` timestamp(0) NULL DEFAULT NULL,
  `LastInteraction` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `OwnerUID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `Class` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'nil',
  `Position` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'nil',
  `Direction` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Damage` float NOT NULL DEFAULT 0,
  `Variables` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_ServerMines_ServerInstance_idx`(`ServerID`) USING BTREE,
  INDEX `fk_ServerMines_ServerMap_idx`(`MapID`) USING BTREE,
  CONSTRAINT `fk_ServerMines_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServerMines_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for serverobjects
-- ----------------------------
DROP TABLE IF EXISTS `serverobjects`;
CREATE TABLE `serverobjects`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ServerID` int(10) UNSIGNED NOT NULL,
  `MapID` int(10) UNSIGNED NOT NULL,
  `CreationDate` timestamp(0) NULL DEFAULT NULL,
  `LastInteraction` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `OwnerUID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `Class` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'nil',
  `Position` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'nil',
  `Direction` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Locked` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Deployable` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Damage` float NOT NULL DEFAULT 0,
  `AllowDamage` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `Variables` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Weapons` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Magazines` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Items` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Backpacks` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `TurretMagazines` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `AmmoCargo` float NOT NULL DEFAULT 0,
  `FuelCargo` float NOT NULL DEFAULT 0,
  `RepairCargo` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_ServerObjects_ServerInstance_idx`(`ServerID`) USING BTREE,
  INDEX `fk_ServerObjects_ServerMap_idx`(`MapID`) USING BTREE,
  CONSTRAINT `fk_ServerObjects_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServerObjects_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for servertime
-- ----------------------------
DROP TABLE IF EXISTS `servertime`;
CREATE TABLE `servertime`  (
  `ServerID` int(10) UNSIGNED NOT NULL,
  `MapID` int(10) UNSIGNED NOT NULL,
  `DayTime` float NULL DEFAULT NULL,
  `Fog` float NULL DEFAULT NULL,
  `Overcast` float NULL DEFAULT NULL,
  `Rain` float NULL DEFAULT NULL,
  `Wind` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  UNIQUE INDEX `idx_ServerTime_uniqueServerMap`(`ServerID`, `MapID`) USING BTREE,
  INDEX `fk_ServerTime_ServerInstance_idx`(`ServerID`) USING BTREE,
  INDEX `fk_ServerTime_ServerMap_idx`(`MapID`) USING BTREE,
  CONSTRAINT `fk_ServerTime_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServerTime_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for servervehicles
-- ----------------------------
DROP TABLE IF EXISTS `servervehicles`;
CREATE TABLE `servervehicles`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ServerID` int(10) UNSIGNED NOT NULL,
  `MapID` int(10) UNSIGNED NOT NULL,
  `CreationDate` timestamp(0) NULL DEFAULT NULL,
  `LastUsed` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `OwnerUID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '\"\"',
  `Parked` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `LockState` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `Class` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'nil',
  `Position` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'nil',
  `Direction` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Velocity` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Flying` tinyint(1) NOT NULL DEFAULT 0,
  `Damage` float NOT NULL DEFAULT 0,
  `Fuel` float NOT NULL DEFAULT 0,
  `HitPoints` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `AnimPhases` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Variables` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Textures` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Weapons` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Magazines` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Items` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `Backpacks` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `TurretMagazines` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `TurretMagazines2` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `TurretMagazines3` varchar(4096) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '[]',
  `AmmoCargo` float NOT NULL DEFAULT 0,
  `FuelCargo` float NOT NULL DEFAULT 0,
  `RepairCargo` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_ServerVehicles_ServerInstance_idx`(`ServerID`) USING BTREE,
  INDEX `fk_ServerVehicles_ServerMap_idx`(`MapID`) USING BTREE,
  INDEX `idx_ServerVehicles_parkedOwners`(`OwnerUID`, `Parked`) USING BTREE,
  CONSTRAINT `fk_ServerVehicles_ServerInstance` FOREIGN KEY (`ServerID`) REFERENCES `serverinstance` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServerVehicles_ServerMap` FOREIGN KEY (`MapID`) REFERENCES `servermap` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
