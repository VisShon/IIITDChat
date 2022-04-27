DELIMITER $$
CREATE
    TRIGGER my_trig AFTER Insert ON Pinned_Message
    FOR EACH ROW BEGIN
        Update Message set isPinned = 1 where MessageID = new.MessageID;
    END$$
DELIMITER;