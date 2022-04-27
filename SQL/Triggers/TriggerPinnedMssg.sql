DELIMITER $$
CREATE
    TRIGGER TrigPinned AFTER Insert ON pinned_message
    FOR EACH ROW BEGIN
        Update message set isPinned = 1 where Message_ID = new.Message_ID;
    END$$
DELIMITER ;