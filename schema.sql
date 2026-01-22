DROP DATABASE eedi_question_bank;

CREATE DATABASE IF NOT EXISTS eedi_question_bank;

USE eedi_question_bank;

-- -----------------------------------------
-- Table: misconception
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
-- Table: construct
-- -----------------------------------------
CREATE TABLE IF NOT EXISTS construct (
    construct_id INT NOT NULL,
    construct_name TEXT,
    PRIMARY KEY(construct_id)
);

-- -----------------------------------------
-- Table: topic
-- -----------------------------------------
CREATE TABLE IF NOT EXISTS topic (
    topic_id INT NOT NULL,
    topic_name TEXT,
    PRIMARY KEY(topic_id)
);

-- -----------------------------------------
-- Table: question
-- -----------------------------------------
CREATE TABLE IF NOT EXISTS question (
    question_id INT NOT NULL,
    question_text TEXT,
    correct_answer VARCHAR(1),
    answer_a_text TEXT,
    answer_b_text TEXT,
    answer_c_text TEXT,
    answer_d_text TEXT,
    PRIMARY KEY(question_id)
);

-- -----------------------------------------
-- Table: question_topic
-- -----------------------------------------

CREATE TABLE question_topic (
    question_id INT NOT NULL,
    topic_id INT NOT NULL,
    PRIMARY KEY (question_id, topic_id),
    FOREIGN KEY (question_id) REFERENCES question(question_id),
    FOREIGN KEY (topic_id) REFERENCES topic(topic_id)
);

-- -----------------------------------------
-- Table: question_construct
-- -----------------------------------------
CREATE TABLE question_construct (
    question_id INT NOT NULL,
    construct_id INT NOT NULL,
    PRIMARY KEY (question_id, construct_id),
    FOREIGN KEY (question_id) REFERENCES question(question_id),
    FOREIGN KEY (construct_id) REFERENCES construct(construct_id)
);


-- -----------------------------------------
-- Table: question_relatquestion_choice_misconceptionionship
-- -----------------------------------------
CREATE TABLE IF NOT EXISTS question_choice_misconception (
    question_id INT NOT NULL,
    choice_code VARCHAR(1),
    misconception_id INT,

    PRIMARY KEY (question_id, choice_code),
    FOREIGN KEY (question_id) REFERENCES question(question_id),
    FOREIGN KEY (misconception_id) REFERENCES misconception(misconception_id)
);

