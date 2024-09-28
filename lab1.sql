CREATE TABLE City (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    population INT,
    founded_year INT,
    country VARCHAR(100),
    area DECIMAL(10, 2)
);

CREATE TABLE Saga (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    creation_date DATE,
    genre VARCHAR(100),
    author VARCHAR(100),
    popularity INT,
    duration INT,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(id)
);

CREATE TABLE Audience (
    id INT PRIMARY KEY AUTO_INCREMENT,
    age_group VARCHAR(50),
    interest VARCHAR(255),
    gender VARCHAR(50),
    income_level VARCHAR(50)
);

CREATE TABLE Emotion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    emotion_type VARCHAR(50),
    intensity INT,
    trigger_event VARCHAR(255)
);

CREATE TABLE Saga_Audience (
    saga_id INT,
    audience_id INT,
    engagement_level INT,
    PRIMARY KEY (saga_id, audience_id),
    FOREIGN KEY (saga_id) REFERENCES Saga(id),
    FOREIGN KEY (audience_id) REFERENCES Audience(id)
);

CREATE TABLE Saga_Emotion (
    saga_id INT,
    emotion_id INT,
    duration INT,
    PRIMARY KEY (saga_id, emotion_id),
    FOREIGN KEY (saga_id) REFERENCES Saga(id),
    FOREIGN KEY (emotion_id) REFERENCES Emotion(id)
);
