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