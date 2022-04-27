DELIMITER $$
CREATE
    TRIGGER TrigUserBlock AFTER INSERT
    ON user_blockedlist
    FOR EACH ROW
    BEGIN
        Update user_chat Set isBlocked= 1 where Email_ID = new.Blocked_Email_ID;
    END$$
DELIMITER ;