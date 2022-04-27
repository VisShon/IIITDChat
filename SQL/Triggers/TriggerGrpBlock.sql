DELIMITER $$
CREATE
    TRIGGER my_trig AFTER INSERT
    ON Group_BlockedList
    FOR EACH ROW
    BEGIN
        Update User_Group Set isBlocked = 1 where User_ID= new.Blocked_Email_ID
    END$$
DELIMITER;