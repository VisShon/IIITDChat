DELIMITER $$
CREATE
    TRIGGER my_trig AFTER INSERT
    ON Message
    FOR EACH ROW BEGIN
        INSERT INTO User_Message(`Sender_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) 
        VALUES (New.Email_ID, New.Message_ID,'0','0','0','0');
    END$$
DELIMITER ;