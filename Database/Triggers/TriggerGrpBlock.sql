use iiitdchat;
DELIMITER $$
CREATE
    TRIGGER TriggerGrpBlock AFTER INSERT
    ON group_blockedlist
    FOR EACH ROW
    BEGIN
        Update user_Group Set isBlocked = 1 where User_ID= new.Blocked_Email_ID;
    END$$
DELIMITER ;