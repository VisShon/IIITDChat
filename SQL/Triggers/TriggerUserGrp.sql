DELIMITER $$
CREATE
    TRIGGER TrigUserGroup AFTER INSERT
    ON grps
    FOR EACH ROW BEGIN

        INSERT INTO user_group(`User_ID`, `Group_ID`,`Date_of_Joining`,
        `isDeleted`,`isBlocked`) 
        VALUES (New.Creator_ID,New.Group_ID,New.Date_of_creation'0','0');

        INSERT INTO admins (`User_ID`, `Group_ID`) 
        VALUES (new.Creator_ID,new.Group_ID);
        
    END$$
DELIMITER ;