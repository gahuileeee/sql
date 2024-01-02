# 날짜: 2024/01/02
# 이름: 이가희
# 내용: 2장 SQL 기초

#실습 2-1
use studydb;
#아니면 더블클릭하기
	Create table `User1`(
    `uid` varchar(10),
    `name` varchar(10),
    `hp` char(13),
    `age` int
    );
   # drop table `User1`;
#실습 2-2
	insert into `User1` values ('A101', '김유신', '010-1234-1111',25);
	insert into `User1` values ('A102', '김춘추', '010-1234-2222',23);
	insert into `User1` values ('A103', '장보고', '010-1234-3333',32);
	insert into `User1` (`uid`,`name`,`age`) values ('A104', '강감찬',45);
	insert into `User1` set `uid`='A105', `name`='이순신', `hp`='010-1234-5555';
    
#실습 2-3
	select * from `User1`;
    select * from `User1` Where `uid`='A101';
    select * from `User1` Where `name`='김춘추';
    select * from `User1` Where `age`<30;
    select * from `User1` Where `age`>=30;
    select `uid`,`name`,`age` From `User1`;
    
    
#실습 2-4 테이블 데이터 수정
set sql_safe_updates = 0;
update `user1` set `hp`='010-1234-4444' where `uid`='A104';
update `user1` set `age`=51 where `uid`='A105';
update `user1` set `hp`='010-1234-1001',`age`=27 where `uid`='A101';

#실습 2-5 테이블에 데이터 삭제
delete from `user1` where `uid`= 'A101';
delete from `user1` where `uid`= 'A101' and `age`= 25;
delete from `user1` where `age`>= 25;

#실습 2-6 테이블 수정
#속성 (열) 추가
alter table user1 add `gender` tinyint;
alter table user1 add `birth` char(10) after `name`;

#속성(열) 자료형 변경
alter table user1 modify `gender` char(1);
alter table user1 modify `age` tinyint;
#속성 (열) 삭제
alter table user1 drop column `gender`;

#실습 2-7 
#테이블 복사 CREATE TABLE 새로운 테이블명 like 복사할 테이블명;
create table `User1Copy` like `user1`;

#테이블 데이터 복사 INSERT INTO 테이블명 SELECT * FROM 복사할테이블명;
# INSERT INTO 테이블명 (칼럼명) SELECT 칼럼명 FROM 복사할 테이블명;
Insert into `user1copy` select*from `user1`;
#실습 2-8

create table `TblUser`(
    `user_id` varchar(10),
    `user_name` varchar(10),
    `user_hp` char(13),
    `user_age` int,
    `user_addr` varchar(10)
    );
    create table `TblProduct`(
    `prod_no` varchar(10),
    `prod_name` varchar(10),
    `prod_price` int,
    `prod_stock` int,
    `prod_company` varchar(10),
    `prod_date` date
    );

	insert into `tbluser` values ('p101','김유신','010-1234-1001',25,'경남 김해시');
	insert into `tbluser` values ('p102','김춘추','010-1234-1002',23,'경남 경주시');
	insert into `tbluser` (`user_id`, `user_name`, `user_age`, `user_addr`) values ('p103','장보고',31,'전남 완도군');
	insert into `tbluser` (`user_id`, `user_name`,`user_addr`) values ('p104','강감찬','서울시 중구');
	insert into `tbluser` (`user_id`, `user_name`,`user_hp`, `user_age`) values ('p105','이순신','010-1234-1005',50);
    select * from `tbluser`;
    
    insert into `tblproduct` values ('1001','냉장고', 800000,25,'LG전자', '2022-01-06');
    insert into `tblproduct` values ('1002','노트북', 1200000,120,'삼성전자', '2022-01-07');
    insert into `tblproduct` values ('1003','모니터', 350000,35,'LG전자', '2023-01-13');
    insert into `tblproduct` values ('1004','세탁기', 1000000,80,'삼성전자', '2021-01-01');
    insert into `tblproduct` values ('1005','컴퓨터', 1500000,20,'삼성전자', '2023-10-01');
    insert into `tblproduct`(prod_no, prod_name, prod_price,prod_stock) values ('1006','휴대폰', 950000,102);
    select * from tblproduct;
   
#실습 2-9
select * from tbluser;
select user_name from tbluser;
select user_name, user_hp from tbluser;
select * from tbluser where user_id = 'p102';
select * from tbluser where user_id='p104' or user_id= 'p105';
select * from tblUser where user_addr = '부산시 금정구';
select * from tblUser where user_age > 30;
select * from tbluser where user_hp is null;
Update tbluser set user_age = 42 where user_id='p104';
update tbluser set user_addr = '부산시 진구' where user_id = 'p105';
delete from tbluser where user_id = 'p103';

select * from tblproduct;
select prod_name from tblproduct;
select pord_name , prod_company, prod_price from tblproduct;
select * from tblproduct where prod_company = 'Lg전자';
select * from tblproduct where prod_company = '삼성전자';
update tblproduct set pord_company = '삼성전자', prod_date = '2024-01-01' where pro_no = 10006;