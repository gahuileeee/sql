# 날짜: 2024/01/02
# 이름: 이가희
# 내용: 1장 데이터베이스 생성과 사용자 관리
#SQL에서는 주석이 #
#실습 1-1
CREATE DATABASE `StudyDB2`;
Drop Database `StudyDB2`;

#실습 1-2
CREATE USER 'gahui'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `StudyDB`.* To 'gahui'@'%';
Flush privileges;

#실습 1-3
ALter User 'gahui'@'%' Identified by 'abc1234';
drop user 'gahui'@'%';
flush privileges;