CREATE DATABASE IF NOT EXISTS da30;

USE da30;

CREATE TABLE cards (
    id INT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE stations (
    id INT,
    name VARCHAR(255) NOT NULL UNIQUE,
    line VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE swipes (
    card_id INT NOT NULL,
    station_id INT NOT NULL,
    type VARCHAR(10, 2) NOT NULL CHECK(type IN ('enter', 'exit', 'deposit')),
    datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL NOT NULL CHECK(amount != 0),
    FOREIGN KEY(card_id) REFERENCES cards(id),
    FOREIGN KEY(station_id) REFERENCES stations(id)
);