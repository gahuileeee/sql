# 날짜 : 2024-01-08
# 이름 : 이가희
# 내용 : 교재 ch03장 SQL 기본문법

#손코딩 p111
 use market_db;
 
#손코딩 p112
 use market_db;
 select * from member;
 
#손코딩 p114
select mem_name from member;

#손코딩 p115
select addr, debut_date ,mem_name from member;

#손코딩 p116
select * from member where mem_name='블랙핑크';

#손코딩 p117
select * from member where mem_number =4;

select mem_id, mem_name from member where height<=162;
select mem_name, height, mem_number from member where height>=165 and mem_number>6;

#손코딩 p118
select mem_name, height, mem_number from member where height >=165 or mem_number >6;

select mem_name, height from member where height>=163 and height <=165;
select mem_name, height from member where height between 163 and 165;

#손코딩 p119
select mem_name, addr from member where addr= '경기' or addr= '전남' or addr= '경남';
select mem_name, addr from member where addr IN('경기','전남','경남');
select * from member where mem_name like '우%';
select * from member where mem_name like '__핑크';

#손코딩 p125
select mem_id, mem_name, debut_date from member order by debut_date;

#손코딩 p126
select mem_id, mem_name, debut_date from member order by debut_date desc;
# 순서가 틀림. select mem_id, mem_name, deubt_date, height from member order by height desc where height>=164;

#손코딩 p127
select mem_id, mem_name, debut_date, height from member where height>=164 order by height desc; 
select mem_id, mem_name, debut_date, height from member where height>=164 order by height DESC, debut_date asc;
#손코딩 p128
select * from member limit 3;
select mem_name, debut_date from member order by debut_date limit 3;

#손코딩 p129
select mem_name, height from member order by height desc limit 3,2;
select addr from member;

#손코딩 p130
select addr from member order by addr;
select distinct addr from member;

#손코딩 p131
select mem_id, amount from buy order by mem_id;

#손코딩 p132
select mem_id, sum(amount) from buy group by mem_id;
select mem_id "회원 아이디", sum(amount) "총 구매 개수" from buy group by mem_id;

#손코딩 p133
select mem_id "회원 아이디", sum(price*amount) "총 구매 금액" from buy group by mem_id;
select avg(amount) "평균 구매 개수" from buy;

#손코딩 p134
select mem_id, AVG(amount) "평균 구매 개수" from buy group by mem_id;
select count(*) from member;
select count(phone1) "연락처가 있는 회원" from member;
select mem_id "회원 아이디", sum(price*amount) "총 구매 금액" from buy group by mem_id;

#손코딩 p135
select mem_id "회원 아이디", SUM(price*amount) "총 구매 금액" from buy where sum(price*amount)>1000 group by mem_id;
select mem_id "회원 아이디", SUM(price*amount) "총 구매 금액" from buy  group by mem_id having sum(price*amount)>1000;

#손코딩 p136
select mem_id "회원 아이디", sum(price*amount) "총 구매 금액" from buy group by mem_id having sum(price*amount)>1000 order by "총 구매 금액" desc;

#손코딩 p141
use market_db;
create table hongong1 (toy_id INT , toy_name char(4), age int);
insert into hongong1 values(1, '우디', 25);
insert into hongong1 (toy_id, toy_name) values (2,'버즈');
insert into hongong1 (toy_name, age, toy_id) values ('제시',20,3);
#손코딩 p142
create table hongong2(
toy_id int auto_increment primary key,
toy_name char(4),
age INT);

Insert into hongong2 values(null, '보핍', 25);
Insert into hongong2 values(null, '슬랭키', 22);
Insert into hongong2 values(null, '렉스', 21);
select last_insert_id();
#손코딩 p143
alter table hongong2 auto_increment =100;
insert into hongong2 values (null, '재남',35);
select * from hongong2;

create table hongong3 (
toy_id int auto_increment primary key,
toy_name char(4),
age Int);
alter table hongong3 auto_increment=1000;
set @@auto_increment_increment=3;
#손코딩 p144
insert into hongong3 values (null, '토마스', 20);
insert into hongong3 values (null, '제임스', 23);
insert into hongong3 values (null, '고든', 25);

#손코딩 p145
select count(*) from world.city;
desc world.city;
select * from world.city limit 5;

#손코딩 p146
create table city_popul (city_name char(35), population int);
insert into city_popul select `name`, population from world.city;

#손코딩 p147
use market_db;
update city_popul set city_name='서울' where city_name='Seoul';
select * from city_popul where city_name='서울';

#손코딩 p148
Update city_popul set city_name = '뉴욕', population = 0
where city_name = 'new york';
select * from city_popul where city_name='뉴욕';
# update city_popul set city_name = '서울';

#손코딩 p149
delete from city_popul where city_name like 'new%';
#손코딩 p150
delete from city_popul where city_name like 'new%' limit 5;

#손코딩 p151
create table big_table(select*from world.city, sakila.country);
create table big_table2(select*from world.city, sakila.country);
create table big_table3(select*from world.city, sakila.country);

select count(*) from big_table;