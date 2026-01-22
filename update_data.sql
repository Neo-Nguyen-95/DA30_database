USE eedi_question_bank;

LOAD DATA LOCAL INFILE 'misconception.csv'
INTO TABLE misconception
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'misconception.csv'
INTO TABLE stg_misconception
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

INSERT INTO misconception (
    MisconceptionId, 
    MisconceptionName
    )
SELECT DISTINCT
    MisconceptionId,
    MisconceptionName
FROM stg_misconception AS src
ON DUPLICATE KEY UPDATE
    MisconceptionId = src.MisconceptionId,
    MisconceptionName = src.MisconceptionName;

TRUNCATE TABLE misconception_staging;