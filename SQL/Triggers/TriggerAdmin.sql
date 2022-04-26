DELIMITER $$
CREATE
    TRIGGER my_trig AFTER INSERT
    ON Admins
    FOR EACH ROW BEGIN
        INSERT INTO User_Group(`User_ID`, `Group_ID`,`Date_of_Joining`,
        `isDeleted`,`isBlocked`) 
        VALUES (New.Creator_ID,New.Group_ID,New.Date_of_creation'0','0');
    END$$
DELIMITER;