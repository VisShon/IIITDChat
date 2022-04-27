--To fetch the status of the person 
Use iiitdchat;
Select Name, Log from user where Email_ID= ?;
----------------------------------------------------

--When the user leaves a group 
Use iiitdchat;
Update user_group Set Date_Of_leaving = CURRENT_TIMESTAMP() where User_ID= ?;
----------------------------------------------------

--When the user deletes a group 
Use iiitdchat;
Update user_group Set isDeleted = 1 where User_ID= ?;
----------------------------------------------------

--When the user deletes a Chat 
Use iiitdchat;
Update user_chat Set isDeleted = 1 where User_ID= ?;
----------------------------------------------------

--When the user deletes a message for everyone
Use iiitdchat;
Update message Set isDeletedForEveryone = 1 where senderId = ?;
----------------------------------------------------

--When the user adds a contact
Use iiitdchat;
Insert into contact (`User_ID`, `Contact`) values (?,?);
----------------------------------------------------

--When the user creates a tasklist
Use iiitdchat;
INSERT INTO taskList (`Group_ID`, `Deadline`, `isDone`, `Task`) VALUES (?, ?, '0', ?);
----------------------------------------------------

--When the user creates a board
Use iiitdchat;
INSERT INTO board (`Group_ID`, `Link`) VALUES (?, ?);
----------------------------------------------------

--When the admin changes grp descp
--check admin beforehand
Use iiitdchat;
Update grps Set Descp = ? where Group_ID = ? And Credit_ID = ?;
----------------------------------------------------

--When the user pinns message
Use iiitdchat;
INSERT INTO pinned_Message (`User_ID`, `Group_ID`,`Message_ID`) VALUES (?,?,?);
----------------------------------------------------

--When the user is banned from group
--check admin beforehand
Use iiitdchat;
INSERT INTO group_blockedlist (`Group_ID`, `Blocked_Email_ID`) VALUES (new.Group_ID, new.User_ID);
----------------------------------------------------

--When the user is made admin
--check admin beforehand
Use iiitdchat;
INSERT INTO admins (`User_ID`, `Group_ID`) VALUES (?,?);
----------------------------------------------------

--When the user is kicked out of grp
--check admin
Use iiitdchat;
Update user_group Set Date_Of_leaving = CURRENT_TIMESTAMP() where User_ID= ?;
----------------------------------------------------

--When the user is blocked by another user
Use iiitdchat;
INSERT INTO user_blockedlist (`User_Email_ID`, `Blocked_Email_ID`) VALUES (?,?);
----------------------------------------------------

--Fetching a user's info
Use iiitdchat;
Select * from user where User_ID= ?;
----------------------------------------------------

--Fetching blocklist of a user
Use iiitdchat;
Select Blocked_Email_ID from user_blockedlist where User_Email_ID= ?;
----------------------------------------------------

--Unblocking a user for one person
Use iiitdchat;
Select Blocked_Email_ID from User_BlockedList where User_Email_ID= ?;
----------------------------------------------------

--Unbanning a user for a group
Use iiitdchat;
Select Blocked_Email_ID from User_BlockedList where User_Email_ID= ?;
----------------------------------------------------

--adding  a user to a group
Use iiitdchat;
Select Blocked_Email_ID from User_BlockedList where User_Email_ID= ?;
----------------------------------------------------