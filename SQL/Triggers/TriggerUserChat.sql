DELIMITER $$
CREATE
    TRIGGER my_trig AFTER INSERT
    ON Message
    FOR EACH ROW BEGIN
    Declare id varchar(100);
    Select User_2_ID from chat where Chat_ID = New.Reciever_ID into @id;
    IF (Substring(NEW.Reciever_ID,0,1) = 'c') THEN
        INSERT INTO Chat(`Chat_ID`, `User_1_ID`, `User_2_ID`) 
        VALUES (New.Reciever_ID, New.Email_ID, id);
    END IF;
    END$$
DELIMITER;