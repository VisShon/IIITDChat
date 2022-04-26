--To fetch the status of the person 
Use iiitdchat;
Select Name, Log from user where Email_ID= ?;
----------------------------------------------------

--When the user leaves a group 
Use iiitdchat;
Update User_Group Set Date_Of_leaving = CURRENT_TIMESTAMP() where User_ID= ?;
----------------------------------------------------

--When the user deletes a group 
Use iiitdchat;
Update User_Group Set isDeleted = 1 where User_ID= ?;
----------------------------------------------------

--When the user deletes a Chat 
Use iiitdchat;
Update User_Chat Set isDeleted = 1 where User_ID= ?;
----------------------------------------------------

--When the user deletes a message for everyone
Use iiitdchat;
Update Message Set isDeletedForEveryone = 1 where senderId = ?;
----------------------------------------------------

--When the user adds a contact
Use iiitdchat;
Insert into Contact (`User_ID`, `Contact`) values (?,?);
----------------------------------------------------

--When the user creates a tasklist
Use iiitdchat;
INSERT INTO TaskList (`Group_ID`, `Deadline`, `isDone`, `Task`) VALUES (?, ?, '0', ?);
----------------------------------------------------

--When the user creates a board
Use iiitdchat;
INSERT INTO Board (`Group_ID`, `Link`) VALUES (?, ?);
----------------------------------------------------

--When the admin changes grp descp
--check admin beforehand
Use iiitdchat;
Update Grps Set Descp = ? where Group_ID = ? And Credit_ID = ?;
----------------------------------------------------

--When the user pinns message
Use iiitdchat;
INSERT INTO Pinned_Message (`User_ID`, `Group_ID`,`Message_ID`) VALUES (?,?,?);
----------------------------------------------------

--When the user is banned from group
--check admin beforehand
Use iiitdchat;
INSERT INTO Group_BlockedList (`Group_ID`, `Blocked_Email_ID`) VALUES (new.Group_ID, new.User_ID);
----------------------------------------------------

--When the user is made admin
--check admin beforehand
Use iiitdchat;
INSERT INTO Admins (`User_ID`, `Group_ID`) VALUES (?,?);
----------------------------------------------------

--When the user is kicked out of grp
--check admin
Use iiitdchat;
Update User_Group Set Date_Of_leaving = CURRENT_TIMESTAMP() where User_ID= ?;
----------------------------------------------------

--When the user is blocked by another user
Use iiitdchat;
INSERT INTO User_BlockedList (`User_Email_ID`, `Blocked_Email_ID`) VALUES (?,?);
----------------------------------------------------

--Fetching a user's info
Use iiitdchat;
Select * from User where User_ID= ?;
----------------------------------------------------

--Fetching blocklist of a user
Use iiitdchat;
Select Blocked_Email_ID from User_BlockedList where User_Email_ID= ?;
----------------------------------------------------

--Unblocking a user for one person
Use iiitdchat;
Select Blocked_Email_ID from User_BlockedList where User_Email_ID= ?;
----------------------------------------------------

--Unbanning a user for a group
Use iiitdchat;
Select Blocked_Email_ID from User_BlockedList where User_Email_ID= ?;
----------------------------------------------------