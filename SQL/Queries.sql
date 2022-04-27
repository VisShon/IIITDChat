
-- To fetch Chats of a person for chats
USE `iiitdchat`;
DELIMITER $$
CREATE  PROCEDURE `fetchC`(
IN id1 varchar(100),
IN id2 varchar(100))
BEGIN
    DECLARE RID varchar(100);
    Set @RID = (
        Select Chat_ID From Chat WHERE User_1_id = id1 AND User_2_id = id2
        );
	Select * From Message Where Reciever_ID = @RID;
END$$
DELIMITER ;

call iiitdchat.fetchC('user1@gmail.com', 'user2@gmail.com');
----------------------------------------------------------------

-- To fetch Chats of a person for groups
USE `iiitdchat`;
DELIMITER $$
CREATE  PROCEDURE `fetchG`(
IN id varchar(100))
BEGIN

    DECLARE RID varchar(100);
    Set @RID = id;
	Select * From Message Where Reciever_ID = @RID;
END$$
DELIMITER;

call iiitdchat.fetchG();
----------------------------------------------------------------

--Sending Message
USE `iiitdchat`;
DELIMITER $$
CREATE  PROCEDURE `SendMsg`(
IN id varchar(100), IN ReplyID int, IN RecvID varchar(100), IN mssgB varchar(1000), 
IN TS DateTime, IN FwdID int, IN UpVt int, 
IN isDel int, IN isSnt int, IN isPic int, IN isPin int
)
BEGIN
    INSERT INTO `iiitdchat`.`Message` (`Message_ID`, `Sender_ID`,`Reply_Msg_ID`, `Reciever_ID`, `Message_Body`, `Sending_Date_Time`,`Forward_Msg_ID`, `UpvoteCount`, `isDeletedForEveryone`, `isSent`,`isPicture`,`isPinned`) 
    VALUES (New.Message_ID, id, ReplyID, mssgB, TS, FwdID, UpVt, isDel, isSnt, isPic, isPin);
END$$
DELIMITER ;

call iiitdchat.SendMsg(New.Message_ID, 'user1@gmail.com', 1, 'bullshit', 2022-02-02, 1, 0, 0, 0, 0, 0);
----------------------------------------------------------------

-- Search for chat/grp by name
USE `iiitdchat`;
DELIMITER $$
CREATE  PROCEDURE `getChatGroup`(
IN Names varchar(100))
BEGIN
    Declare UID varchar(100) default '';
    Select Email_ID from Users where Name=Names into @UID;
    CREATE TEMPORARY table temp(
        ID varchar(100)
    );
    Insert into temp(ID) SELECT Chat_ID from chat where User_1_ID = @UID OR User_2_ID = @UID;
    Insert into temp(ID) Select Group_ID from Grps where GName=Names; 
    Select Reciever_ID, Message_Body, Sending_Date_Time from Message Inner join temp ON (`ID` = Reciever_ID);
    Drop table temp;

END$$
DELIMITER ;

call iiitdchat.getChatGroup('IQB');
----------------------------------------------------------------

-- fetch recents
USE `iiitdchat`;
DELIMITER $$
CREATE  PROCEDURE `getRecents`(
IN Names varchar(100))
BEGIN
    Declare UID varchar(100) default '';
    Select Email_ID from Users where Name=Names into @UID;
    CREATE TEMPORARY table temp(
        ID varchar(100),
        Name varchar(100)
    );
    Create TEMPORARY table temp2(
        ID varchar(100),
        Email_ID varchar(100)
    );
    Insert INTO temp2(ID, Email_ID) Select Chat_ID,User_2_ID from chat where User_1_ID = @UID;
    Insert INTO temp2(ID, Email_ID) Select Chat_ID,User_1_ID from chat where User_2_ID = @UID;
    Insert into temp(ID,Name) SELECT ID,Name from temp2 Inner join Users on Users.Email_ID = temp2.Email_ID;
    drop table temp2;

    Create TEMPORARY table temp2(
        ID varchar(100)
    );
    Insert INTO temp2(ID) Select Group_ID from User_Group where User_ID = @UID;
    Insert into temp(ID,Name) Select Group_ID, GName from Grps Inner join temp2 on Grps.Group_ID = temp2.ID; 
    drop table temp2;
    Select Reciever_ID, Message_Body, Sending_Date_Time,Name from Message Inner join temp ON (`ID` = Reciever_ID);
    Drop table temp;

END$$
DELIMITER ;

call iiitdchat.getRecents('username');
----------------------------------------------------------------









----------------------------------------------------------------
--To fetch all the contacts
USE `iiitdchat`;
DELIMITER $$
CREATE  PROCEDURE `fetchContacts`(
IN id varchar(100),
IN lim int,
In ofs int)
BEGIN
    CREATE TEMPORARY table tempC(
        CID varchar(100)
    );
    Insert into tempC(CID) Select Contact_Email_ID From Contacts where Email_ID = id;
    Select Email_ID, Status, Log from Users Inner join tempC on Email_ID = CID Limit lim offset ofs;
    Drop table tempC;
END$$
DELIMITER ;

call iiitdchat.fetchContacts('user1@gmail.com', 5, 0);
----------------------------------------------------------------

-- New group is formed
USE `iiitdchat`;
DELIMITER $$
CREATE  PROCEDURE `newGrp`(
IN id varchar(100),
IN lim int,
In ofs int)
BEGIN
    CREATE TEMPORARY table tempC(
        CID varchar(100)
    );
    Insert into tempC(CID) Select Contact_Email_ID From Contacts where Email_ID = id;
    Select Email_ID, Status, Log from Users Inner join tempC on Email_ID = CID Limit lim offset ofs;
    Drop table tempC;
END$$
DELIMITER ;
----------------------------------------------------------------

-- new contact starts a chat

----------------------------------------------------------------