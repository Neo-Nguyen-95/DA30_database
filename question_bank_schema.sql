CREATE DATABASE IF NOT EXISTS eedi_question_bank;

USE eedi_question_bank;

CREATE TABLE IF NOT EXISTS misconception (
    MisconceptionId INT NOT NULL,
    MisconceptionName VARCHAR(511),
    PRIMARY KEY(MisconceptionId)
);

LOAD DATA LOCAL INFILE 'misconception.csv'
INTO TABLE misconception
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE IF NOT EXISTS misconception_staging (
    MisconceptionId INT NOT NULL,
    MisconceptionName VARCHAR(511),
    PRIMARY KEY(MisconceptionId)
);

LOAD DATA LOCAL INFILE 'misconception.csv'
INTO TABLE misconception_staging
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

INSERT INTO misconception (MisconceptionId, MisconceptionName)
SELECT DISTINCT
    MisconceptionId,
    MisconceptionName
FROM misconception_staging AS s
ON DUPLICATE KEY UPDATE
    MisconceptionName = s.MisconceptionName;

TRUNCATE TABLE misconception_staging;
