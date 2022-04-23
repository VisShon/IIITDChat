-- To fetch Chats of a person for chats
USE `iiitd_chat`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fetchC`(
IN id1 varchar(100),
IN id2 varchar(100))
BEGIN
	DECLARE ID int;
    DECLARE RID varchar(100);
    Set @ID = (
        Select Chat_ID From Chat WHERE User_1_id = id AND User_2_id = id2
        );
    Set @RID = CAST(@ID AS CHAR(100));
    Set @RID = CONCAT('c',@RID);
	Select * From Message Where Reciever_ID = @RID;
END$$
DELIMITER ;

call iiitd_chat.fetchC('user1@gmail.com', 'user2@gmail.com');
----------------------------------------------------------------

-- To fetch Chats of a person for groups
USE `iiitd_chat`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fetchG`(
IN id varchar(100))
BEGIN
    DECLARE RID varchar(100);
    Set @RID = CONCAT('g',id);
	Select * From Message Where Reciever_ID = @RID;
END$$
DELIMITER ;

call iiitd_chat.fetchG(1);
----------------------------------------------------------------

--To fetch all the contacts
USE `iiitd_chat`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fetchContacts`(
IN id varchar(100),
IN lim int,
In ofs int)
BEGIN
    Select * From Contacts where Email_ID = id Limit lim offset ofs;
END$$
DELIMITER ;
--tbd
call iiitd_chat.fetchContacts('user1@gmail.com', 5, 0);
----------------------------------------------------------------

--Sending Message
USE `iiitd_chat`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SendMsg`(
IN id varchar(100), IN ReplyID int, IN RecvID varchar(100), IN mssgB varchar, IN TS DateTime, IN FwdID int, IN UpVt int, 
IN isDel int, IN isSnt int, IN isPic int, IN isPin int
)
BEGIN
    INSERT INTO `iiitd_chat`.`Message` (`Message_ID`, `Sender_ID`,`Reply_Msg_ID`, `Reciever_ID`, `Message_Body`, `Sending_Date_Time`,`Forward_Msg_ID` `UpvoteCount`, `isDeletedForEveryone`, `isSent`,`isPicture`,`isPinned`) VALUES (New.Message_ID, id, ReplyID, mssgB, TS, FwdID, UpVt, isDel, isSnt, isPic, isPin);
END$$
DELIMITER ;

call iiitd_chat.SendMsg(New.Message_ID, 'user1@gmail.com', 1, 'bullshit', 2022-02-02, 1, 0, 0, 0, 0, 0);
----------------------------------------------------------------

-- Search for chat/grp by name
USE `iiitd_chat`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchName`(
IN Names varchar(100))
BEGIN
    Declare UID varchar(100);
    set @UID = Select Email_ID from Users where Name=Names;
    CREATE OR REPLACE VIEW temp AS 
    SELECT Chat_ID from chat where User_2_id = UID OR where User_1_id = UID UNION Select Group_ID from Grps where GName=Names;
    
END$$
DELIMITER ;

call iiitd_chat.fetchContacts('user1@gmail.com', 5, 0);
----------------------------------------------------------------

-- Search for contact by name
--
----------------------------------------------------------------