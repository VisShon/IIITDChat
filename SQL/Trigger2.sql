DELIMITER $$
CREATE
    TRIGGER my_trig AFTER INSERT
    ON Message
    FOR EACH ROW BEGIN
        INSERT INTO Chat(`Chat_ID`, `User_1_ID`, `User_2_ID`) 
        VALUES ('1', 'user1@gmail.com', 'user5@gmail.com');
    END$$
DELIMITER ;