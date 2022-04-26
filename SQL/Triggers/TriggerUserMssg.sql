DELIMITER $$
CREATE
    TRIGGER my_trig AFTER INSERT
    ON Message
    FOR EACH ROW BEGIN
        Declare i int default 0;
        declare n int default 0;
        select count(*) from User_Group WHERE Group_ID = New.Reciever_ID into @n;
        While i<n
            INSERT INTO User_Message(`Sender_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) 
            VALUES (New.Email_ID, New.Message_ID,'0','0','0','0');
            Set i=i+1;
        End while
    END$$
DELIMITER ;