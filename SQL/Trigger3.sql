DELIMITER $$
CREATE
    TRIGGER my_trig AFTER INSERT
    ON Grps
    FOR EACH ROW BEGIN
        Declare i int default 0;
        
        INSERT INTO User_Group(`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) 
        VALUES ('user1@gmail.com','1','0','0','0','0');
    END$$
DELIMITER ;