# 날짜 : 2024-01-03
# 이름 : 이가희
# 내용: 3장 제약조건

#실습 : 3-1 (기본키)
 create table `user2` (
 `uid` varchar(10) primary key,
 `name` varchar(10),
 `birth` char(10),
 `addr` varchar(50)
 );
 drop table `user2`;
 
#실습 : 3-2
 insert into `user2` values ('A101', '김유신','1968-05-09','경남 김해시');
 insert into `user2` values ('A102', '김춘추','1972-11-23','경남 경주시');
 insert into `user2` values ('A103', '장보고','1978-03-01','전남 완도군');
 insert into `user2` values ('A104', '강감찬','1979-08-16','서울시 관악구');
 insert into `user2` values ('A105', '이순신','1981-05-23','부산시 진구');
 select * from `user2`;

#실습 : 3-3 (고유키)
create table `user3`(
`uid` varchar(10) primary key,
`name` varchar(10),
`birth` char(10),
`hp` char(13) unique,
`addr` varchar(50)
);
drop table `user3`;

#실습 : 3-4 
 insert into `user3` values ('A101', '김유신','1968-05-09','010-1234-1111','경남 김해시');
 insert into `user3` values ('A102', '김춘추','1972-11-23','010-1234-2222','경남 경주시');
 insert into `user3` values ('A103', '장보고','1978-03-01','010-1234-3333','전남 완도군');
 insert into `user3` values ('A104', '강감찬','1979-08-16','010-1234-4444','서울시 관악구');
 insert into `user3` values ('A105', '이순신','1981-05-23','010-1234-2222','부산시 진구');
 select * from `user3`;
 
#실습 : 3-5