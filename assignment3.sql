use assignment3;
#1: thêm  2- 5  loại lĩnh vực câu hỏi vào trong bảng categoryquestion(đã có sẵn dữ liệu test)
insert into `categoryquestion`(`category_id`,`category_name`) values(5,'tiếng anh'),(6,'hóa');
select * from categoryquestion;
#Thêm một 10 câu hỏi 
insert into `question`(`Content`,`Category_ID`,`Type_ID`,`Creator_ID`,`Create_Date`) 
values('kết quả đúng của 1+1=',4,2,1,'2023-07-26'),('__your name?',5,2,2,'2023-05-26'),
('quốc khánh nước Việt Nam vào ngày',3,1,4,'2023-02-26'),('h2+cl2=',6,1,7,'2023-05-26');
select * from `question`;
#và các câu trả lời tương ứng với mỗi câu hỏi sẽ có 4 câu trả lời. Trong 4 câu trả lời đó thì sẽ có 1 câu trả lời đúng
insert into `answer`(`Content`,`Question_ID`,`is_Correct`) values('kết quả là 3',3,'1'),('kết quả là 6',3,'0'),('kết quả là 9',3,'0'),('kết quả là 0',3,'0'),
('who is',4,'0'),('when is',4,'0'),('what is',4,'1'),('whose is ',4,'0'),
('2/9/1945',5,'1'),('1/2/2020',5,'0'),('3/4/1990',5,'0'),('23/12/2020',5,'0'),
('h20',9,'0'),('2hcl',9,'1'),('nacl',9,'0'),('cl',9,'0');
select * from `answer`;
#Lấy toàn bộ danh sách các câu hỏi và câu trả lời đúng. Sắp xếp theo thứ tự thời gian tạo tăng dần. 
select `question`.content,`answer`.is_correct ,`question`.Create_Date from `question` join `answer`
on `question`.Question_ID =`answer`.Question_ID 
where `answer`.is_correct='1'
order by `question`.Create_Date asc;
#Lấy toàn bộ danh sách các câu hỏi được tạo ra trong ngày hôm nay(2023/07/26)
select `question`.content,`question`.Create_Date from `question`
where `question`.Create_Date='2023/07/26';
#Thống kê xem mỗi lĩnh vực câu hỏi ,mỗi lĩnh vực có bao nhiêu câu hỏi khó , bao nhiêu câu hỏi dễ.
select count(*),`categoryquestion`.Category_Name,`question`.Creator_ID from `categoryquestion` join `question`
on `categoryquestion`.Category_ID= `question`.Creator_ID  group by`question`.Creator_ID;

# Tìm trong bảng question có bao nhiêu lĩnh vực câu hỏi đã được thêm.
select count(distinct(`Category_id`)) as linhvucCauhoiduocthem from `question`;










