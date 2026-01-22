DROP DATABASE eedi_question_bank;

CREATE DATABASE IF NOT EXISTS eedi_question_bank;

USE eedi_question_bank;

-- -----------------------------------------
-- Table: misconception & its staging table
-- -----------------------------------------
CREATE TABLE IF NOT EXISTS misconception (
    misconception_id INT NOT NULL,
    misconception_name VARCHAR(511),
    PRIMARY KEY(misconception_id)
);

CREATE TABLE IF NOT EXISTS stg_misconception (
    misconception_id INT NOT NULL,
    misconception_name VARCHAR(511),
    PRIMARY KEY(misconception_id)
);

-- -----------------------------------------
-- Table: construct & its staging table
-- -----------------------------------------
CREATE TABLE IF NOT EXISTS construct (
    construct_id INT NOT NULL,
    construct_name TEXT,
    PRIMARY KEY(construct_id)
);

CREATE TABLE IF NOT EXISTS stg_construct (
    construct_id INT NOT NULL,
    construct_name TEXT,
    PRIMARY KEY(construct_id)
);

-- -----------------------------------------
-- Table: topic & its staging table
-- -----------------------------------------
CREATE TABLE IF NOT EXISTS topic (
    topic_id INT NOT NULL,
    topic_name TEXT,
    PRIMARY KEY(topic_id)
);

CREATE TABLE IF NOT EXISTS stg_topic (
    topic_id INT NOT NULL,
    topic_name TEXT,
    PRIMARY KEY(topic_id)
);

-- -----------------------------------------
-- Table: question & its staging table
-- -----------------------------------------
CREATE TABLE IF NOT EXISTS question (
    question_id INT NOT NULL,
    question_text TEXT,
    PRIMARY KEY(question_id)
);

CREATE TABLE IF NOT EXISTS stg_question (
    question_id INT NOT NULL,
    question_text TEXT,
    PRIMARY KEY(question_id)
);

-- -----------------------------------------
-- Table: question_construct_topic
-- -----------------------------------------

CREATE TABLE IF NOT EXISTS question_construct_topic (
    question_id INT NOT NULL,
    topic_id INT NOT NULL,
    construct_id INT NOT NULL,
    PRIMARY KEY (question_id),
    CONSTRAINT fk_qct_question
        FOREIGN KEY (question_id) REFERENCES question(question_id),
    CONSTRAINT fk_qct_topic
        FOREIGN KEY (topic_id) REFERENCES topic(topic_id),
    CONSTRAINT fk_qct_construct
        FOREIGN KEY (construct_id) REFERENCES construct(construct_id)
);

-- -----------------------------------------
-- Table: question_relatquestion_choice_misconceptionionship
-- -----------------------------------------
CREATE TABLE IF NOT EXISTS question_choice_misconception (
    question_id INT NOT NULL,
    choice_code VARCHAR(1) NOT NULL,
    choice_text TEXT,
    is_correct TINYINT(1) NOT NULL,
    misconception_id INT,

    PRIMARY KEY (question_id, choice_code),
    CONSTRAINT fk_qcm_question
        FOREIGN KEY (question_id) REFERENCES question(question_id),
    CONSTRAINT fk_qcm_misconception
        FOREIGN KEY (misconception_id) REFERENCES misconception(misconception_id)
);

