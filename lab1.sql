-- Таблица для сущности Character
CREATE TABLE Character (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INTEGER,
    backstory TEXT,
    alignment VARCHAR(50)
);

-- Таблица для сущности Emotion
CREATE TABLE Emotion (
    id SERIAL PRIMARY KEY,
    emotion_type VARCHAR(100) NOT NULL,
    intensity INTEGER,
    duration INTEGER,
    is_intense BOOLEAN,
    trigger TEXT
);

-- Таблица для сущности Event
CREATE TABLE Event (
    id SERIAL PRIMARY KEY,
    description VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    date TIMESTAMP,
    consequence VARCHAR(50)
);

-- Таблица для сущности Main_Character
CREATE TABLE Main_Character (
    id SERIAL PRIMARY KEY,
    event_id INTEGER REFERENCES Event(id) ON DELETE SET NULL,
    character_id INTEGER UNIQUE REFERENCES Character(id) ON DELETE CASCADE,
    role_description VARCHAR(100),
    special_traits TEXT,
    story_phase VARCHAR(50),
    priority_level INTEGER
);

-- Таблица для связи между Character и Emotion (M:M)
CREATE TABLE Character_Emotion (
    character_id INTEGER REFERENCES Character(id) ON DELETE CASCADE,
    emotion_id INTEGER REFERENCES Emotion(id) ON DELETE CASCADE,
    timestamp TIMESTAMP,
    context TEXT,
    PRIMARY KEY (character_id, emotion_id)
);

-- Добавление данных в таблицы

-- Добавление персонажей
INSERT INTO Character (name, age, backstory, alignment)
VALUES ('Floyd', 35, 'Former engineer facing a difficult decision', 'Neutral'),
       ('Victor Millson', 40, 'Floyd’s successor with a complex agenda', 'Ambiguous');

-- Добавление эмоций
INSERT INTO Emotion (emotion_type, intensity, duration, is_intense, trigger)
VALUES ('Irritation', 4, 30, TRUE, 'Phone call from Victor'),
       ('Curiosity', 5, 15, FALSE, 'Wondering what Victor wants to discuss'),
       ('Shame', 3, 20, FALSE, 'Self-reflection on his own actions'),
       ('Excitement', 6, 25, TRUE, 'Anticipation of Victor\'s reason for calling');

-- Добавление событий
INSERT INTO Event (description, location, date, consequence)
VALUES ('Phone call from Victor', 'Floyd\'s home', '2023-05-15 10:00:00', 'Internal conflict'),
       ('Public Speech', 'Conference Hall', '2023-06-01 14:00:00', 'Influence on public opinion');

-- Добавление главных персонажей
INSERT INTO Main_Character (event_id, character_id, role_description, special_traits, story_phase, priority_level)
VALUES (1, 1, 'Protagonist', 'Intelligent and determined', 'Beginning', 1),
       (2, 2, 'Antagonist', 'Charismatic and manipulative', 'Climax', 2);

-- Добавление связи между персонажами и эмоциями (таблица Character_Emotion)
INSERT INTO Character_Emotion (character_id, emotion_id, timestamp, context)
VALUES (1, 1, '2023-05-15 10:01:00', 'Reaction to Victor\'s unexpected call'),
       (1, 2, '2023-05-15 10:02:00', 'Wondering about Victor\'s motives'),
       (1, 3, '2023-05-15 10:03:00', 'Self-reflection after conversation'),
       (1, 4, '2023-05-15 10:05:00', 'Excitement about upcoming developments');
