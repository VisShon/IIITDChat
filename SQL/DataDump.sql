Use iiitdChat;

INSERT INTO `iiitdChat`.`Users` (`Email_ID`, `Phone_No`, `Name`, `Roll_no`, `Department`, `Date_of_joining`, `status`) VALUES ('user1@gmail.com', '941133270', 'Vishnu', '2020414', 'CSD', '2022-02-01', 'UWU');
INSERT INTO `iiitdChat`.`Users` (`Email_ID`, `Phone_No`, `Name`, `Roll_no`, `Department`, `Date_of_joining`, `status`) VALUES ('user2@gmail.com', '941133271', 'Yashwardhan', '2020417', 'CSD', '2022-02-02', 'Hmmm');
INSERT INTO `iiitdChat`.`Users` (`Email_ID`, `Phone_No`, `Name`, `Roll_no`, `Department`, `Date_of_joining`, `status`) VALUES ('user3@gmail.com', '941133272', 'Ambuj', '2020358', 'CSE', '2022-02-02', 'Oh NO');
INSERT INTO `iiitdChat`.`Users` (`Email_ID`, `Phone_No`, `Name`, `Roll_no`, `Department`, `Date_of_joining`, `status`) VALUES ('user4@gmail.com', '941133273', 'Anshul', '2020361', 'CSE', '2022-02-03', 'OOOOOHHHH');
INSERT INTO `iiitdChat`.`Users` (`Email_ID`, `Phone_No`, `Name`, `Roll_no`, `Department`, `Date_of_joining`, `status`) VALUES ('user5@gmail.com', '941133274', 'Eshang', '2020405', 'CSD', '2022-02-03', 'chup kr');
INSERT INTO `iiitdChat`.`Users` (`Email_ID`, `Phone_No`, `Name`, `Roll_no`, `Department`, `Date_of_joining`, `status`) VALUES ('user6@gmail.com', '941133275', 'Abhinav', '2020353', 'CSD', '2022-02-04', 'Yaaaar');
INSERT INTO `iiitdChat`.`Users` (`Email_ID`, `Phone_No`, `Name`, `Roll_no`, `Department`, `Date_of_joining`, `status`) VALUES ('user7@gmail.com', '941133276', 'Mrishika', '202089', 'CSB', '2022-02-04', ';-) hehehaha');

INSERT INTO `iiitdChat`.`Grps` (`Group_ID`, `Date_of_creation`, `GName`, `Creator_ID`, `Descp`) VALUES ('g1', '2022-03-01', 'Maths', 'user1@gmail.com', 'for M4');
INSERT INTO `iiitdChat`.`Grps` (`Group_ID`, `Date_of_creation`, `GName`, `Creator_ID`, `Descp`) VALUES ('g2', '2022-03-02', 'IQB', 'user5@gmail.com', 'Answer bhej dena');
INSERT INTO `iiitdChat`.`Grps` (`Group_ID`, `Date_of_creation`, `GName`, `Creator_ID`) VALUES ('g3', '2022-03-03', 'DBMS', 'user1@gmail.com');

INSERT INTO `iiitdChat`.`Chat` (`Chat_ID`, `User_1_ID`, `User_2_ID`) VALUES ('c1', 'user1@gmail.com', 'user5@gmail.com');
INSERT INTO `iiitdChat`.`Chat` (`Chat_ID`, `User_1_ID`, `User_2_ID`) VALUES ('c2', 'user2@gmail.com', 'user4@gmail.com');
INSERT INTO `iiitdChat`.`Chat` (`Chat_ID`, `User_1_ID`, `User_2_ID`) VALUES ('c3', 'user3@gmail.com', 'user6@gmail.com');

INSERT INTO `iiitdChat`.`Admins` (`User_ID`, `Group_ID`) VALUES ('user1@gmail.com','g1');
INSERT INTO `iiitdChat`.`Admins` (`User_ID`, `Group_ID`) VALUES ('user5@gmail.com', 'g2');
INSERT INTO `iiitdChat`.`Admins` (`User_ID`, `Group_ID`) VALUES ('user1@gmail.com', 'g3');

INSERT INTO `iiitdChat`.`Board` (`Board_ID`, `Group_ID`, `Link`) VALUES ('1', 'g1', 'https://miro.com/app/board/uXjVO7akgXI=/?share_link_id=366854291141');
INSERT INTO `iiitdChat`.`Board` (`Board_ID`, `Group_ID`, `Link`) VALUES ('2', 'g2', 'https://miro.com/app/board/uXjVO7akgYQ=/?share_link_id=402934784639');
INSERT INTO `iiitdChat`.`Board` (`Board_ID`, `Group_ID`, `Link`) VALUES ('3', 'g3', 'https://miro.com/app/board/uXjVO7akgag=/?share_link_id=921260880732');

INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user1@gmail.com','user2@gmail.com');
INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user1@gmail.com','user3@gmail.com');
INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user1@gmail.com','user4@gmail.com');
INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user1@gmail.com','user5@gmail.com');
INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user1@gmail.com','user6@gmail.com');
INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user1@gmail.com','user7@gmail.com');

INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user2@gmail.com', 'user1@gmail.com');
INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user2@gmail.com', 'user3@gmail.com');
INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user2@gmail.com', 'user4@gmail.com');

INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user3@gmail.com', 'user1@gmail.com');
INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user3@gmail.com', 'user2@gmail.com');
INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user3@gmail.com', 'user4@gmail.com');

INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user4@gmail.com', 'user1@gmail.com');
INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user4@gmail.com', 'user2@gmail.com');
INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user4@gmail.com', 'user3@gmail.com');

INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user5@gmail.com', 'user1@gmail.com');
INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user5@gmail.com', 'user6@gmail.com');

INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user6@gmail.com', 'user1@gmail.com');
INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user6@gmail.com', 'user5@gmail.com');

INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user7@gmail.com', 'user1@gmail.com');
INSERT INTO `iiitdChat`.`Contacts` (`Email_ID`, `Contact_Email_ID`) VALUES ('user7@gmail.com', 'user6@gmail.com');

INSERT INTO `iiitdChat`.`Group_BlockedList` (`Group_ID`, `Blocked_Email_ID`) VALUES ('g3', 'user4@gmail.com');

INSERT INTO `iiitdChat`.`User_Group` (`User_ID`, `Group_ID`,`Date_Of_Joining`,`isDeleted`,`Date_Of_leaving`,`isBlocked`) VALUES ('user3@gmail.com','g1','2022-03-01','0',null,'0');
INSERT INTO `iiitdChat`.`User_Group` (`User_ID`, `Group_ID`,`Date_Of_Joining`,`isDeleted`,`Date_Of_leaving`,`isBlocked`) VALUES ('user5@gmail.com','g1','2022-03-01','0',null,'0');
INSERT INTO `iiitdChat`.`User_Group` (`User_ID`, `Group_ID`,`Date_Of_Joining`,`isDeleted`,`Date_Of_leaving`,`isBlocked`) VALUES ('user6@gmail.com','g1','2022-03-02','0',null,'0');
INSERT INTO `iiitdChat`.`User_Group` (`User_ID`, `Group_ID`,`Date_Of_Joining`,`isDeleted`,`Date_Of_leaving`,`isBlocked`) VALUES ('user1@gmail.com','g2','2022-03-02','0',null,'0');
INSERT INTO `iiitdChat`.`User_Group` (`User_ID`, `Group_ID`,`Date_Of_Joining`,`isDeleted`,`Date_Of_leaving`,`isBlocked`) VALUES ('user6@gmail.com','g2','2022-03-03','0',null,'0');
INSERT INTO `iiitdChat`.`User_Group` (`User_ID`, `Group_ID`,`Date_Of_Joining`,`isDeleted`,`Date_Of_leaving`,`isBlocked`) VALUES ('user7@gmail.com','g2','2022-03-02','1','2022-03-03','0');
INSERT INTO `iiitdChat`.`User_Group` (`User_ID`, `Group_ID`,`Date_Of_Joining`,`isDeleted`,`Date_Of_leaving`,`isBlocked`) VALUES ('user1@gmail.com','g3','2022-03-03','0',null,'0');
INSERT INTO `iiitdChat`.`User_Group` (`User_ID`, `Group_ID`,`Date_Of_Joining`,`isDeleted`,`Date_Of_leaving`,`isBlocked`) VALUES ('user2@gmail.com','g3','2022-03-03','0',null,'0');
INSERT INTO `iiitdChat`.`User_Group` (`User_ID`, `Group_ID`,`Date_Of_Joining`,`isDeleted`,`Date_Of_leaving`,`isBlocked`) VALUES ('user3@gmail.com','g3','2022-03-03','0','2022-03-07','1');
INSERT INTO `iiitdChat`.`User_Group` (`User_ID`, `Group_ID`,`Date_Of_Joining`,`isDeleted`,`Date_Of_leaving`,`isBlocked`) VALUES ('user4@gmail.com','g3','2022-03-03','0',null,'0');

INSERT INTO `iiitdChat`.`TaskList` (`Group_ID`, `Deadline`, `isDone`, `Task`, `Task_ID`) VALUES ('g3', '2022-04-24', '1', 'DBMS Final project eval', '1');


INSERT INTO `iiitdChat`.`Message` (`Message_ID`, `Sender_ID`, `Reciever_ID`, `Message_Body`, `Sending_Date_Time`, `UpvoteCount`, `isDeletedForEveryone`, `isSent`,`isPicture`,`isPinned`) VALUES ('1', 'user1@gmail.com', 'c1', 'hello', '2022-03-01', '3', '0', '1','0','0');
INSERT INTO `iiitdChat`.`Message` (`Message_ID`, `Sender_ID`, `Reciever_ID`, `Message_Body`, `Sending_Date_Time`, `UpvoteCount`, `isDeletedForEveryone`, `isSent`,`isPicture`,`isPinned`) VALUES ('2', 'user2@gmail.com', 'c2', 'offo', '2022-03-01', '0', '0', '1','0','0');
INSERT INTO `iiitdChat`.`Message` (`Message_ID`, `Sender_ID`, `Reciever_ID`, `Message_Body`, `Sending_Date_Time`, `UpvoteCount`, `isDeletedForEveryone`, `isSent`,`isPicture`,`isPinned`) VALUES ('3', 'user3@gmail.com', 'c3', 'hadd hai', '2022-03-01', '0', '1', '1','0','0');
INSERT INTO `iiitdChat`.`Message` (`Message_ID`, `Sender_ID`, `Reciever_ID`, `Message_Body`, `Sending_Date_Time`, `UpvoteCount`, `isDeletedForEveryone`, `isSent`,`isPicture`,`isPinned`) VALUES ('4', 'user3@gmail.com', 'g1', 'hi', '2022-03-03', '0', '0', '1','0','0');
INSERT INTO `iiitdChat`.`Message` (`Message_ID`, `Sender_ID`, `Reciever_ID`, `Message_Body`, `Sending_Date_Time`, `UpvoteCount`, `isDeletedForEveryone`, `isSent`,`isPicture`,`isPinned`) VALUES ('5', 'user4@gmail.com', 'g3', 'bhai dekhle', '2022-03-03', '0', '0', '1','0','0');
INSERT INTO `iiitdChat`.`Message` (`Message_ID`, `Sender_ID`, `Reciever_ID`, `Message_Body`, `Sending_Date_Time`, `UpvoteCount`, `isDeletedForEveryone`, `isSent`,`isPicture`,`isPinned`) VALUES ('6', 'user1@gmail.com', 'g3', 'u will be blocked', '2022-03-03', '0', '1', '1','0','0');
INSERT INTO `iiitdChat`.`Message` (`Message_ID`, `Sender_ID`, `Reciever_ID`, `Message_Body`, `Sending_Date_Time`, `UpvoteCount`, `isDeletedForEveryone`, `isSent`,`isPicture`,`isPinned`) VALUES ('7', 'user4@gmail.com', 'g3', 'dont care', '2022-03-03', '0', '0', '1','0','0');
INSERT INTO `iiitdChat`.`Message` (`Message_ID`, `Sender_ID`, `Reciever_ID`, `Message_Body`, `Sending_Date_Time`, `Forward_Msg_ID`, `UpvoteCount`, `isDeletedForEveryone`, `isSent`,`isPicture`,`isPinned`) VALUES ('8', 'user1@gmail.com', 'g2', 'hello', '2022-03-04', '1', '0', '0', '1','0','0');
INSERT INTO `iiitdChat`.`Message` (`Message_ID`, `Sender_ID`, `Reciever_ID`, `Message_Body`, `Sending_Date_Time`, `UpvoteCount`, `isDeletedForEveryone`, `isSent`,`isPicture`,`isPinned`) VALUES ('9', 'user6@gmail.com', 'g2', 'how are you', '2022-03-04', '0', '0', '1','0','0');
INSERT INTO `iiitdChat`.`Message` (`Message_ID`, `Sender_ID`, `Reciever_ID`, `Message_Body`, `Sending_Date_Time`, `UpvoteCount`, `isDeletedForEveryone`, `isSent`,`isPicture`,`isPinned`) VALUES ('10', 'user1@gmail.com', 'g2', 'https://images.ctfassets.net/hrltx12pl8hq/4f6DfV5DbqaQUSw0uo0mWi/6fbcf889bdef65c5b92ffee86b13fc44/shutterstock_376532611.jpg?fit=fill&w=800&h=300', '2022-03-04', '1', '0', '1','0','1');
INSERT INTO `iiitdChat`.`Message` (`Message_ID`, `Sender_ID`, `Reply_Msg_ID`, `Reciever_ID`, `Message_Body`, `Sending_Date_Time`, `isPinned`) VALUES ('11', 'user1@gmail.com', '10', 'g2', 'this is imp', '2022-03-04 00:00:00', '1');

INSERT INTO `iiitdChat`.`Pinned_Message` (`User_ID`, `Group_ID`,`Message_ID`) VALUES ('user1@gmail.com','g3','10');

INSERT INTO `iiitdChat`.`User_BlockedList` (`User_Email_ID`, `Blocked_Email_ID`) VALUES ('user6@gmail.com','user3@gmail.com');

INSERT INTO `iiitdChat`.`User_Chat` (`Email_ID`, `Chat_ID`, `isBlocked`, `isDeleted`) VALUES ('user1@gmail.com','c1','0','0');
INSERT INTO `iiitdChat`.`User_Chat` (`Email_ID`, `Chat_ID`, `isBlocked`, `isDeleted`) VALUES ('user5@gmail.com','c1','0','0');
INSERT INTO `iiitdChat`.`User_Chat` (`Email_ID`, `Chat_ID`, `isBlocked`, `isDeleted`) VALUES ('user2@gmail.com','c2','0','0');
INSERT INTO `iiitdChat`.`User_Chat` (`Email_ID`, `Chat_ID`, `isBlocked`, `isDeleted`) VALUES ('user4@gmail.com','c2','0','0');
INSERT INTO `iiitdChat`.`User_Chat` (`Email_ID`, `Chat_ID`, `isBlocked`, `isDeleted`) VALUES ('user3@gmail.com','c3','1','0');
INSERT INTO `iiitdChat`.`User_Chat` (`Email_ID`, `Chat_ID`, `isBlocked`, `isDeleted`) VALUES ('user6@gmail.com','c3','0','0');


INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user1@gmail.com','1','0','0','1','1');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user2@gmail.com','1','0','0','1','1');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user3@gmail.com','1','0','0','1','1');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user5@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user4@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user6@gmail.com','1','0','0','0','0');

INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user3@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user5@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user6@gmail.com','1','0','0','0','0');

INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user1@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user2@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user3@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user4@gmail.com','1','0','0','0','0');

INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user1@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user2@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user3@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user4@gmail.com','1','0','0','0','0');

INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user1@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user2@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user3@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user4@gmail.com','1','0','0','0','0');

INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user1@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user6@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user7@gmail.com','1','0','0','0','0');

INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user1@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user6@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user7@gmail.com','1','0','0','0','0');

INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user1@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user6@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user7@gmail.com','1','0','0','0','0');

INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user1@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user6@gmail.com','1','0','0','0','0');
INSERT INTO `iiitdChat`.`User_Message` (`Email_ID`, `Message_ID`,`isDeleted`,`isStarred`,`isSeen`,`isRecieved`) VALUES ('user7@gmail.com','1','0','0','0','0');
