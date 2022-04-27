CREATE SCHEMA `iiitdChat` ;

USE iiitdChat;
CREATE TABLE Users (
  Email_ID varchar(100) not null,
  Phone_No int unsigned,
  Name varchar(200) not null,
  Roll_no int not null,
  Department varchar(3) not null,
  Date_of_joining date not null,
  status varchar(100),
  Log dateTime,
  PRIMARY KEY (Email_ID)
);
CREATE TABLE Chat (
  Chat_ID varchar(10) not null,
  User_1_ID varchar(100) not null,
  User_2_ID varchar(100) not null,
  PRIMARY KEY (Chat_ID),
  FOREIGN KEY (User_1_ID) REFERENCES Users(Email_ID),
  FOREIGN KEY (User_2_ID) REFERENCES Users(Email_ID)
);
CREATE TABLE Message(
  Message_ID int not null,
  Sender_ID varchar(100) not null,
  Reply_Msg_ID int not null,
  Reciever_ID varchar(100) not null,
  Message_Body varchar(5000) not null,
  Sending_Date_Time datetime not null,
  Forward_Msg_ID int default null,
  UpvoteCount int default 0,
  isDeletedForEveryone boolean,
  isSent boolean,
  isPicture boolean,
  isPinned boolean,
  PRIMARY KEY (Message_ID),
  FOREIGN KEY (Sender_ID) REFERENCES Users(Email_ID),
  FOREIGN KEY (Reply_Msg_ID) REFERENCES Message(Message_ID),
  FOREIGN KEY (Forward_Msg_ID) REFERENCES Message(Message_ID)
);
CREATE TABLE User_Message(
  Email_Id varchar(100) not null,
  Message_ID int not null,
  isDeleted boolean not null,
  isStarred boolean not null,
  isSeen boolean not null,
  isRecieved boolean not null,
  FOREIGN KEY (Email_Id) REFERENCES Users(Email_ID),
  FOREIGN KEY (Message_ID) REFERENCES Message(Message_ID)
);
CREATE TABLE Grps(
  Group_ID varchar(10) not null,
  Date_of_creation date not null,
  GName varchar(100),
  Creator_ID varchar(100) not null,
  Descp varchar(1000),
  PRIMARY KEY (Group_ID),
  FOREIGN KEY (Creator_ID) REFERENCES Users(Email_ID)
);
CREATE TABLE Admins(
  User_ID varchar(100) not null,
  Group_ID varchar(10) not null,
  FOREIGN KEY (Group_ID) REFERENCES Grps(Group_ID),
  FOREIGN KEY (User_ID) REFERENCES Users(Email_ID)
);
CREATE TABLE Board (
  Board_ID int,
  Group_ID varchar(10),
  Link varchar(1000),
  PRIMARY KEY (Board_ID),
  FOREIGN KEY (Group_ID) REFERENCES Grps(Group_ID)
);
CREATE TABLE User_BlockedList (
  User_Email_ID varchar(100),
  Blocked_Email_ID varchar(100),
  FOREIGN KEY (Blocked_Email_ID) REFERENCES Users(Email_ID),
  FOREIGN KEY (User_Email_ID) REFERENCES Users(Email_ID)
  );
CREATE TABLE User_Chat (
  Email_ID varchar(100),
  Chat_ID varchar(10),
  isBlocked boolean,
  isDeleted boolean,
  FOREIGN KEY (Email_ID) REFERENCES Users(Email_ID),
  FOREIGN KEY (Chat_ID) REFERENCES Chat(Chat_ID)
);
CREATE TABLE TaskList (
  Group_ID varchar(10),
  Deadline date,
  isDone boolean,
  Task varchar(1000),
  Task_ID int,
  primary key(Task_ID),
  FOREIGN KEY (Group_ID) REFERENCES Grps(Group_ID)
);
CREATE TABLE Group_BlockedList (
  Group_ID varchar(10),
  Blocked_Email_ID varchar(100),
  FOREIGN KEY (Group_ID) REFERENCES Grps(Group_ID),
  FOREIGN KEY (Blocked_Email_ID) REFERENCES Users(Email_ID)
);
CREATE TABLE Pinned_Message (
  User_ID varchar(100),
  Group_ID varchar(10),
  Message_ID int,
  FOREIGN KEY (User_ID) REFERENCES Users(Email_ID),
  FOREIGN KEY (Group_ID) REFERENCES Grps(Group_ID),
  FOREIGN KEY (Message_ID) REFERENCES Message(Message_ID)
);
CREATE TABLE User_Group (
  User_ID varchar(100),
  Group_ID varchar(10),
  Date_of_joining date,
  isDeleted boolean,
  Date_of_leaving date,
  isBlocked boolean,
  FOREIGN KEY (User_ID) REFERENCES Users(Email_ID),
  FOREIGN KEY (Group_ID) REFERENCES Grps(Group_ID)
);
CREATE TABLE Contacts (
  Email_ID varchar(100),
  Contact_Email_ID varchar(100),
  FOREIGN KEY (Email_ID) REFERENCES Users(Email_ID),
  FOREIGN KEY (Contact_Email_ID) REFERENCES Users(Email_ID)
);
CREATE TABLE Teacher (
  Teacher_Email_ID varchar(100),
  Teacher_Name varchar(100),
  primary key(Teacher_Email_ID)
);
