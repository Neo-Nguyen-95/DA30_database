CREATE DATABASE IF NOT EXISTS da30v2;

USE da30v2;

CREATE TABLE collections (
    id INT,
    title VARCHAR(255),
    accession_number VARCHAR(255) NOT NULL UNIQUE,
    aquired VARCHAR(255),
    PRIMARY KEY(id)
)