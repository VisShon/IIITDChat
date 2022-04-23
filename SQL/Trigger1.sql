DELIMITER $$
CREATE
    TRIGGER my_trig AFTER INSERT
    ON Message
    FOR EACH ROW BEGIN
        INSERT INTO User_Message(`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) 
        VALUES ('user1@gmail.com','1','0','0','0','0');
    END$$
DELIMITER ;