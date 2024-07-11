/*
Navicat MySQL Data Transfer

Source Server         : 1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : pdcs

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2024-07-11 09:49:18
*/
CREATE DATABASE PDCS;
USE PDCS;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`
(
    `AdminID`     INT(11) NOT NULL AUTO_INCREMENT,
    `AdminName`   VARCHAR(255) NOT NULL,
    `AdminNumber` VARCHAR(255) NOT NULL,
    `AdminPsd`    VARCHAR(255) NOT NULL,
    PRIMARY KEY (`AdminID`),
    UNIQUE KEY `AdminNumber` (`AdminNumber`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin`
VALUES ('1', 'Alice', 'admin@1234.com', '1234 ');
INSERT INTO `admin`
VALUES ('2', 'Bob', 'admin@1213.com', '1211 ');

-- ----------------------------
-- Table structure for awards
-- ----------------------------
DROP TABLE IF EXISTS `awards`;
CREATE TABLE `awards`
(
    `AwardID`       INT(11) NOT NULL AUTO_INCREMENT,
    `WorkID`        INT(11) NOT NULL,
    `AwardName`     VARCHAR(255) NOT NULL,
    `CompetitionID` INT(11) NOT NULL,
    `Winner1ID`     INT(11) NOT NULL,
    `Winner2ID`     INT(11) NOT NULL,
    `Winner3ID`     INT(11) NOT NULL,
    `Winner4ID`     INT(11) NOT NULL,
    PRIMARY KEY (`AwardID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of awards
-- ----------------------------

-- ----------------------------
-- Table structure for competitions
-- ----------------------------
DROP TABLE IF EXISTS `competitions`;
CREATE TABLE `competitions`
(
    `CompetitionID`          INT(11) NOT NULL AUTO_INCREMENT,
    `CompetitionName`        VARCHAR(255) NOT NULL,
    `CompetitionDate`        DATE         NOT NULL,
    `RegistrationDeadline`   DATE         NOT NULL,
    `CompetitionTypeID`      INT(11) DEFAULT NULL,
    `CompetitionTypeName`    VARCHAR(255) DEFAULT NULL,
    `CompetitionDescription` TEXT         NOT NULL,
    `MaxParticipants`        INT(11) DEFAULT NULL,
    `Theme`                  VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`CompetitionID`),
    KEY                      `fk_competition_type` (`CompetitionTypeID`),
    CONSTRAINT `fk_competition_type` FOREIGN KEY (`CompetitionTypeID`) REFERENCES `competitiontypes` (`CompetitionTypeID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competitions
-- ----------------------------

-- ----------------------------
-- Table structure for competitiontypes
-- ----------------------------
DROP TABLE IF EXISTS `competitiontypes`;
CREATE TABLE `competitiontypes`
(
    `CompetitionTypeID` INT(11) NOT NULL AUTO_INCREMENT,
    `TypeName`          VARCHAR(255) NOT NULL,
    PRIMARY KEY (`CompetitionTypeID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competitiontypes
-- ----------------------------

-- ----------------------------
-- Table structure for judges
-- ----------------------------
DROP TABLE IF EXISTS `judges`;
CREATE TABLE `judges`
(
    `JudgeID`      INT(11) NOT NULL AUTO_INCREMENT,
    `JudgesName`   VARCHAR(255) NOT NULL,
    `JudgesNumber` VARCHAR(255) NOT NULL,
    `JudgesPsd`    VARCHAR(255) NOT NULL,
    PRIMARY KEY (`JudgeID`),
    UNIQUE KEY `JudgesNumber` (`JudgesNumber`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of judges
-- ----------------------------
INSERT INTO `judges`
VALUES ('1 ', 'Jhon', '1224.com', '1234 ');
INSERT INTO `judges`
VALUES ('2 ', 'Mike', '1432.com', '9879 ');

-- ----------------------------
-- Table structure for participant
-- ----------------------------
DROP TABLE IF EXISTS `participant`;
CREATE TABLE `participant`
(
    `participant_id`      INT(11) NOT NULL AUTO_INCREMENT,
    `participant_name`    VARCHAR(255) NOT NULL,
    `participant_number`  VARCHAR(50)  NOT NULL,
    `participant_psd`     VARCHAR(50)  NOT NULL,
    `participant_address` VARCHAR(255) NOT NULL,
    `enter`               INT(11) DEFAULT NULL,
    PRIMARY KEY (`participant_id`)
) ENGINE=INNODB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of participant
-- ----------------------------
INSERT INTO `participant`
VALUES ('1 ', 'Jim', '3415.com', '1234 ', '二仙桥', '0 ');
INSERT INTO `participant`
VALUES ('2 ', 'Kiko', '2456.com', '1111 ', '成华大道', '0 ');
INSERT INTO `participant`
VALUES ('4 ', '朱杨华', '1267.com', '7890 ', '绍兴', '0 ');
INSERT INTO `participant`
VALUES ('5 ', 'Lili', '9868.com', '6521 ', '天海市', '0 ');

-- ----------------------------
-- Table structure for teams
-- ----------------------------
DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams`
(
    `TeamID`        INT(11) NOT NULL AUTO_INCREMENT,
    `TeamName`      VARCHAR(255) NOT NULL,
    `CaptainID`     INT(11) NOT NULL,
    `Member1ID`     INT(11) DEFAULT NULL,
    `Member2ID`     INT(11) DEFAULT NULL,
    `Member3ID`     INT(11) DEFAULT NULL,
    `CompetitionID` INT(11) DEFAULT NULL,
    PRIMARY KEY (`TeamID`),
    KEY             `CaptainID` (`CaptainID`),
    KEY             `Member1ID` (`Member1ID`),
    KEY             `Member2ID` (`Member2ID`),
    KEY             `Member3ID` (`Member3ID`),
    CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`CaptainID`) REFERENCES `participant` (`participant_id`),
    CONSTRAINT `teams_ibfk_2` FOREIGN KEY (`Member1ID`) REFERENCES `participant` (`participant_id`),
    CONSTRAINT `teams_ibfk_3` FOREIGN KEY (`Member2ID`) REFERENCES `participant` (`participant_id`),
    CONSTRAINT `teams_ibfk_4` FOREIGN KEY (`Member3ID`) REFERENCES `participant` (`participant_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teams
-- ----------------------------

-- ----------------------------
-- Table structure for works
-- ----------------------------
DROP TABLE IF EXISTS `works`;
CREATE TABLE `works`
(
    `WorkID`        INT(11) NOT NULL AUTO_INCREMENT,
    `WorkName`      VARCHAR(255) NOT NULL,
    `CompetitionID` INT(11) NOT NULL,
    `TeamID`        INT(11) NOT NULL,
    `Likes`         INT(11) DEFAULT '' 0 '',
    `Comments`      TEXT,
    `ImageURL`      VARCHAR(255) DEFAULT NULL,
    `Score`         INT(11) DEFAULT NULL,
    PRIMARY KEY (`WorkID`),
    KEY             `CompetitionID` (`CompetitionID`),
    KEY             `TeamID` (`TeamID`),
    CONSTRAINT `works_ibfk_1` FOREIGN KEY (`CompetitionID`) REFERENCES `competitions` (`CompetitionID`),
    CONSTRAINT `works_ibfk_2` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of works
-- ----------------------------
