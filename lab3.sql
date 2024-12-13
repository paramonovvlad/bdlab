CREATE OR REPLACE FUNCTION update_emotion_type() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.intensity > 5 THEN
      NEW.emotion_type := 'Intense';
    ELSE
      NEW.emotion_type := 'Calm';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
---
CREATE TRIGGER trigger_update_emotion_type
BEFORE INSERT ON Emotion
FOR EACH ROW
EXECUTE FUNCTION update_emotion_type();

SELECT * FROM Emotion;

INSERT INTO Emotion (intensity) VALUES (4);
INSERT INTO Emotion (intensity) VALUES (5);
