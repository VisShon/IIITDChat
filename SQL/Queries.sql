
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
    Select Reciever_ID, Message_Body, Sending_Date_Time,Name from Message Inner join temp ON (`ID` = Reciever_ID) order by Sending_Date_Time DESC;
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

-- new contact starts a chat
USE `iiitdchat`;
DELIMITER $$
CREATE  PROCEDURE `newChat`(
IN id1 varchar(100),
IN id2 varchar(100),
In newChatID varchar(100))
BEGIN
    Declare isB1 int;
    Declare isB2 int;
    Select count(*) from user_blockedlist where User_ID = id1 and Blocked_Email_ID=id2 into isB2;
    Select count(*) from user_blockedlist where User_ID = id2 and Blocked_Email_ID=id1 into isB1;
    INSERT INTO chat (`Chat_ID`, `User_1_ID`, `User_2_ID`) VALUES (newChatID, id1,id2);
    INSERT INTO user_chat (`Email_ID`, `Chat_ID`, `isBlocked`, `isDeleted`) VALUES (id1,New.Chat_ID,isB1,'0');
    INSERT INTO user_chat (`Email_ID`, `Chat_ID`, `isBlocked`, `isDeleted`) VALUES (id2,New.Chat_ID,isB2,'0');
END$$
DELIMITER ;

call iiitdchat.newChat('user1@gmail.com','user2@gmail.com');
----------------------------------------------------------------


-- fetch blocked email ids
USE `iiitdchat`;
DELIMITER $$
CREATE  PROCEDURE `fetchBlockedEmail`(
IN id varchar(100)
)
BEGIN
    Create TEMPORARY table temp(
        ID varchar(100)
    );
    Insert into temp(ID) Select Blocked_Email_ID from user_blockedlist where User_Email_ID= id;
    Select ID,Name,status,Log from temp Inner join users on ID=Email_ID;
    Drop table temp;
END$$
DELIMITER ;

call iiitdchat.fetchBlockedEmail('user1@gmail.com', 5, 0);
----------------------------------------------------------------

-- newGroup is created
USE `iiitdchat`;
DELIMITER $$
CREATE  PROCEDURE `newGroup`(
    IN Date_of_creation DateTime,
    IN Name varchar(100),
    IN CreatorId varchar(100),
    IN newGroupID varchar(100)
)
BEGIN
    INSERT INTO grps (`Group_ID`, `Date_of_creation`, `GName`, `Creator_ID`) 
    VALUES (newGroupID,Date_of_creation,Name,CreatorId);

    INSERT INTO user_group (`User_ID`, `Group_ID`,`Date_Of_Joining`,`isDeleted`,`Date_Of_leaving`,`isBlocked`) 
    Select Id,temp.Group_ID,Date_of_creation from temp inner join grps ON grps.Group_ID=temp.Group_ID ;
    Drop table temp;
END$$
DELIMITER ;

call iiitdchat.fetchBlockedEmail('user1@gmail.com', 5, 0);
----------------------------------------------------------------