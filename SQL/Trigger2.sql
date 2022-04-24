DELIMITER $$
CREATE
    TRIGGER my_trig AFTER INSERT
    ON Message
    FOR EACH ROW BEGIN
    IF (Substring(NEW.Reciever_ID,0,1) = 'c') THEN
        INSERT INTO Chat(`Chat_ID`, `User_1_ID`, `User_2_ID`) 
        VALUES ('1', 'user1@gmail.com', 'user5@gmail.com');
    END IF;
    END$$
DELIMITER ;