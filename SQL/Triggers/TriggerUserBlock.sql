DELIMITER $$
CREATE
    TRIGGER my_trig AFTER INSERT
    ON User_BlockedList
    FOR EACH ROW
    BEGIN
        Update User_Chat Set isBlocked= 1 where User_ID = new.User_Email_ID;
    END$$
DELIMITER;