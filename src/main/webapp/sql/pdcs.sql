--创建数据库
CREATE DATABASE PDCS charset = utf8;
USE PDCS;
--创建管理员表
CREATE TABLE admin(
    AdminID INT(11) NOT NULL AUTO_INCREMENT,
    AdminName VARCHAR(255) NOT NULL,
    AdminNumber VARCHAR(255) NOT NULL,
    AdminPsd VARCHAR(255) NOT NULL,
    PRIMARY KEY (AdminID),
    UNIQUE KEY AdminNumber (AdminNumber)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
--创建奖状表
CREATE TABLE awards(
    AwardID INT(11) NOT NULL AUTO_INCREMENT,
    WorkID INT(11) NOT NULL,
    AwardName VARCHAR(255) NOT NULL,
    CompetitionID INT(11) NOT NULL,
    Winner1ID INT(11) NOT NULL,
    Winner2ID INT(11) NOT NULL,
    Winner3ID INT(11) NOT NULL,
    Winner4ID INT(11) NOT NULL,
    AwardImageURL varchar(255) DEFAULT NULL,
    PRIMARY KEY (AwardID)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
--创建竞赛表
CREATE TABLE competitions(
    CompetitionID INT(11) NOT NULL AUTO_INCREMENT,
    CompetitionName VARCHAR(255) NOT NULL,
    CompetitionDate DATE NOT NULL,
    RegistrationDeadline DATE NOT NULL,
    CompetitionTypeID INT(11) DEFAULT NULL,
    CompetitionTypeName VARCHAR(255) DEFAULT NULL,
    CompetitionDescription TEXT NOT NULL,
    MaxParticipants INT(11) DEFAULT NULL,
    Theme VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (CompetitionID),
    KEY fk_competition_type (CompetitionTypeID),
    CONSTRAINT fk_competition_type FOREIGN KEY (CompetitionTypeID) REFERENCES competitiontypes (CompetitionTypeID)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
--创建竞赛类型表
CREATE TABLE competitiontypes(
    CompetitionTypeID INT(11) NOT NULL AUTO_INCREMENT,
    TypeName VARCHAR(255) NOT NULL,
    PRIMARY KEY (CompetitionTypeID)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
--创建评委表
CREATE TABLE judges(
    JudgeID INT(11) NOT NULL AUTO_INCREMENT,
    JudgesName VARCHAR(255) NOT NULL,
    JudgesNumber VARCHAR(255) NOT NULL,
    JudgesPsd VARCHAR(255) NOT NULL,
    PRIMARY KEY (JudgeID),
    UNIQUE KEY JudgesNumber (JudgesNumber)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
--创建参赛人员表
CREATE TABLE participant(
    participant_id INT(11) NOT NULL AUTO_INCREMENT,
    participant_name VARCHAR(255) NOT NULL,
    participant_number  VARCHAR(50)  NOT NULL,
    participant_psd  VARCHAR(50)  NOT NULL,
    participant_address VARCHAR(255) NOT NULL,
    enter INT(11) DEFAULT NULL,
    PRIMARY KEY (participant_id)
) ENGINE=INNODB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
--创建队伍表
CREATE TABLE teams(
    TeamID INT(11) NOT NULL AUTO_INCREMENT,
    TeamName VARCHAR(255) NOT NULL,
    CaptainID INT(11) NOT NULL,
    Member1ID INT(11) DEFAULT NULL,
    Member2ID INT(11) DEFAULT NULL,
    Member3ID INT(11) DEFAULT NULL,
    CompetitionID INT(11) DEFAULT NULL,
    PRIMARY KEY (TeamID),
    KEY CaptainID (CaptainID),
    KEY Member1ID (Member1ID),
    KEY Member2ID (Member2ID),
    KEY Member3ID (Member3ID),
    CONSTRAINT teams_ibfk_1 FOREIGN KEY (CaptainID) REFERENCES participant (participant_id),
    CONSTRAINT teams_ibfk_2 FOREIGN KEY (Member1ID) REFERENCES participant (participant_id),
    CONSTRAINT teams_ibfk_3 FOREIGN KEY (Member2ID) REFERENCES participant (participant_id),
    CONSTRAINT teams_ibfk_4 FOREIGN KEY (Member3ID) REFERENCES participant (participant_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
--创建作品表
CREATE TABLE works(
    WorkID INT(11) NOT NULL AUTO_INCREMENT,
    WorkName VARCHAR(255) NOT NULL,
    CompetitionID INT(11) NOT NULL,
    TeamID INT(11) NOT NULL,
    Likes INT(11) DEFAULT '' 0 '',
    Comments TEXT,
    ImageURL VARCHAR(255) DEFAULT NULL,
    Score INT(11) DEFAULT NULL,
    PRIMARY KEY (WorkID),
    KEY CompetitionID (CompetitionID),
    KEY TeamID (TeamID),
    CONSTRAINT works_ibfk_1 FOREIGN KEY (CompetitionID) REFERENCES competitions (CompetitionID),
    CONSTRAINT works_ibfk_2 FOREIGN KEY (TeamID) REFERENCES teams (TeamID)
) ENGINE=INNODB DEFAULT CHARSET=utf8;