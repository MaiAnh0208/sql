create database tester14;
use tester14;
create table `Department`(
de_id int auto_increment primary key,
de_name varchar(50)
);
create table `Position`(
po_id int auto_increment primary key,
po_name varchar(50)
);
create table `Account`(
ac_id int auto_increment primary key,
email varchar(50),
username varchar(70),
fullname varchar(50),
de_id int,
po_id int,
createdate date,
foreign key(de_id) references `Department`(de_id),
foreign key(po_id) references `Position`(po_id)
);
select *from  `Account`;
select *from  `Position`;
create table `group`(
gr_id int auto_increment primary key,
gr_name varchar(40),
create_id int(30),
createdate date
);
select *from  `group`;
create table `GroupAccount`(
gr_id int,
ac_id int,
JoinDate date,
foreign key(ac_id) references`Account`(ac_id),
foreign key(gr_id) references`group`(gr_id)
);
create table `TypeQuestion`(
TypeID int auto_increment primary key,
TypeName enum('essay','Multiple-Choice')
);
create table `CategoryQuestion`(
CategoryID int auto_increment primary key,
CategoryName varchar(40)
);
create table `Question`(
QuestionID int auto_increment primary key,
Content varchar(50),
CategoryID int,
TypeID int,
CreatorID int,
CreateDate date,
foreign key(TypeID) references`TypeQuestion`(TypeID),
foreign key(CategoryID) references`CategoryQuestion`(CategoryID)
);
create table Answer(
AnswerID int auto_increment primary key,
Content varchar(100),
QuestionID int,
isCorrect enum('dung','sai'),
foreign key(QuestionID) references `Question`(QuestionID)
);
create table `Exam`(
ExamID int auto_increment primary key,
code int(2),
title varchar(50),
CategoryID int,
Duration date,
CreatorID int,
CreateDate date
);
create table `ExamQuestion`(
ExamID int,
QuestionID int,
foreign key(ExamID) references `Exam`(ExamID),
foreign key(QuestionID) references `Question`(QuestionID)
);





