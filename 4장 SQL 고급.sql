# 날짜: 2024-01-04
# 이름: 이가희
# 내용: 4장 SQL 고급

#실습 4-1
CREATE TABLE `Member` (
	`uid`	VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`hp`	CHAR(13) UNIQUE NOT NULL,
	`pos`	VARCHAR(10) default '사원',
	`dep`	TINYINT,
	`rdate`	DATETIME  NOT NULL
);

CREATE TABLE `Department` (
	`depNo`	TINYINT PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`tel`	CHAR(12) NOT NULL
);

CREATE TABLE `Sales` (
	`seq`	INT AUTO_INCREMENT PRIMARY KEY,
	`uid`	VARCHAR(10) NOT NULL,
	`year`	YEAR NOT NULL,
	`month`	TINYINT NOT NULL,
	`sale`	INT NOT NULL
);

#실습 4-2
INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', 101, NOW());
INSERT INTO `Member` VALUES ('a102', '김유신',   '010-1234-1002', '차장', 101, NOW());
INSERT INTO `Member` VALUES ('a103', '김춘추',   '010-1234-1003', '사원', 101, NOW());
INSERT INTO `Member` VALUES ('a104', '장보고',   '010-1234-1004', '대리', 102, NOW());
INSERT INTO `Member` VALUES ('a105', '강감찬',   '010-1234-1005', '과장', 102, NOW());
INSERT INTO `Member` VALUES ('a106', '이성계',   '010-1234-1006', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a107', '정철',     '010-1234-1007', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a108', '이순신',   '010-1234-1008', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a109', '허균',     '010-1234-1009', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a110', '정약용',   '010-1234-1010', '사원', 105, NOW());
INSERT INTO `Member` VALUES ('a111', '박지원',   '010-1234-1011', '사원', 105, NOW());

INSERT INTO `Department` VALUES (101, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (102, '영업2부', '051-512-1002');
INSERT INTO `Department` VALUES (103, '영업3부', '051-512-1003');
INSERT INTO `Department` VALUES (104, '영업4부', '051-512-1004');
INSERT INTO `Department` VALUES (105, '영업5부', '051-512-1005');
INSERT INTO `Department` VALUES (106, '영업지원부', '051-512-1006');
INSERT INTO `Department` VALUES (107, '인사부', '051-512-1007');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1,  98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1,  80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1,  78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1,  93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2,  23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2,  18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2,  19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2,  53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1,  53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1,  24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2,  76000);

#실습 4-3

select * from `member` where `name` ='김유신';   
select * from `member` where `pos` ='차장' and `dep`='101';      
select * from `member` where `pos` ='차장' or `dep`='101';  
select * from `member` where `name` !='김춘추'; #아래와 같음    
select * from `member` where `name` <>'김춘추';   #김춘추를 제외하고 조회하라
select * from `member` where `pos` ='사원' or `pos` = '대리';   #사원하고 대리만 조회해라
select * from `member` where `pos` in ('사원','대리');   #사원하고 대리만 조회해라
select * from `member` where `dep` in (101,102,103);
select * from `member` where `name` like '%신'; # %를 whildcard라고 하는데 앞에 어떤 문자가 와도
# 상관 없고 다만, 뒷 글자가 ~신으로 끝나야함.  
select * from `member` where `name` like '김%';
select * from `member` where `name` like '김__';
select * from `member` where `name` like '_성_';
select * from `member` where `name` like '정_'; #정으로 시작하는 자리수 2글자   
select * from `member` where `name` like '정%'; #정으로 시작하는 모든 직원이 나옴  
select * from `sales` where `sale`>50000;
select * from `sales` where `sale` >= 50000 and `sale` <100000 and `month` =1;
select * from `sales` where `sale` between 50000 and 100000;
select * from `sales` where `sale` not between 50000 and 100000;
select * from `sales` where `year` in(2020);
select * from `sales` where `month` in(1,2);

#실습 4-4
select * from `sales` order by `sale`;
select * from `sales` order by `sale` asc; #기본적으로 오름차순이라 asc 없애도 결과 같음
select * from `sales` order by `sale` desc;
select * from `member` order by `name`;
select * from `member` order by `name` desc;
select * from `member` order by `rdate` asc;
select * from `sales` where `sale` >50000 order by `sale` desc;
select * from `sales` where `sale`>50000 order by `year`, `month`, `sale` desc;
#year, month 는 asc, sale은 desc 임.  year이 같으면 month, month도 같으면 sale 순으로 정렬함.

#실습 4-5
select * from `sales` limit 3;
select * from `sales` limit 0, 3;  # 앞에는 start number 이고 뒤에는 size임. 
select * from `sales` limit 1, 2;  # index 번호는 0부터 시작함.
select * from `sales` limit 5, 3;
select * from `sales` order by `sale` desc limit 3, 5;
select * from `sales` where `sale` <50000 order by `sale` desc	limit 3;
select * from `sales` where `sale`>50000 order by `year` desc, `month`, `sale` desc limit 5;

#실습 4-6
select sum(`sale`) as `합계` from `sales`; #sales 테이블에서 sale 칼럼의 합을 구함 (as는 별칭)
select avg(`sale`) as `평균` from `sales`;
select max(`sale`) as `최대값` from `sales`;
select min(`sale`) as `최소값` from `sales`;
select ceiling(1.2);
select ceiling(1.8); #무조건 올림
select floor(1.2);
select floor(1.8); # 무조건 내림
select round(1.2);
select round(1.8); #반올림함
select rand();
select ceiling(rand()*10); # 1~10까지의 임의의 정수
select count(`sale`) as `갯수` from `sales`; #매출 컬럼의 개수를 count함 (null 값은 세지 않음)
select count(*) as `갯수` from `sales`; # 기본키 컬럼의 개수를 count함
select count(`sale`) as `갯수` from `sales` where sale>=50000;

select left ('HelloWorld',5);
select right ('HelloWorld',5);
select substring('HelloWorld',6,5);
select concat('Hello','World');
select concat(`uid`,`name`,`hp`) as `글자` from `member` where `uid` = 'a108';

select curdate();
select curTime();
select now();
insert into `member` values ('a112','유관순','010-1234-1012','대리',107,now());
select * from `member` where `uid`='a112';

#실습 4-7 (2018년 1월 매출의 총합을 구하시오)
select sum(`sale`) as `2018년 1월 매출의 총합` from `sales` where `year`=2018 and`month`='1' ;

#실습 4-8(2019년 2월에 5만원 이상 매출에 대한 총합과 평균을 구하시오)
select sum(`sale`) as `2019년 2월 5만원 이상 매출 총합`, 
avg(`sale`) as `2019년 2월 5만원 이상 매출 평균` from `sales` 
where month = 2 and sale>=50000;


#실습 4-9  2020년 전체 매출 가운데 최저, 최고 매출을 구하시오.
select `sale` from `sales`  where `year` = 2020 order by `sale`Desc limit 1;
select max( `sale`) as `2020년 최고 매출` from `sales` where `year` = 2020;
select min(`sale`) as `2020년 최저 매출` from `sales` where `year` = 2020;

#실습 4-10 groub by 실습
select * from `sales` group by `uid`;
select `uid`, count(*) as `건수` from `sales` group by `uid`;
select `uid`, sum(`sale`) as `합계` from `sales` group by `uid`;
select `uid`, round(avg(`sale`)) as `평균` from `sales` group by `uid`;

select `uid` , `year`, sum(`sale`) as `합계` from `sales` group by `uid`, `year`;

select `uid`, `year`, sum(`sale`) as `합계` from `sales` group by `uid`, `year`
order by `year` asc, `합계` desc;

select `uid`, `year`, sum(`sale`) as `합계` from `sales` 
where `sale`>=50000 group by `uid`, `year` order by `합계` desc;

#실습 4-11 #그룹화에 검색 조건 설정
select `uid`, sum(`sale`) as `합계` from `sales` group by `uid` having `합계` >= 200000;

select `uid`, `year`, sum(`sale`) as `합계`
from `sales` where `sale` >=10000
Group by `uid`, `year`
Having `합계` >= 20000 order by `합계` desc;

#실습 4-12 # 테이블 집합 
create table `sales2` like `sales`;
insert into `sales2` select * from `sales`;
update `sales2` set `year` = `year`+3; # sales와 구분하기 위해 년도를 수정함

select * from `sales` union select * from `sales2`;
select * from `sales` where `sale` >=100000 union 
select * from `sales2` where `sale` >= 100000;
select `uid`, `year`, `sale` from `sales` union
select `uid`, `year`, `sale` from `sales2`;
select `uid`, `year`, sum(`sale`) as'합계' from `sales` 
group by `uid`, `year`
union select `uid`, `year`, sum(`sale`) as `합계` from `sales2`
group by `uid`, `year` order by `year` asc, `합계` desc;


#실습 4-13 # 테이블 결합 -내부 조인
select * from `sales` inner join `member` on `sales`.`uid` =`member`.`uid`;
#어차피 거의 내부 조인이라 inner 생략해도 됨
select * from `sales` as a join `member`as b on a.uid = b.uid; 
#조회 대상 table이 2개이기 때문에 이것도 조인이며, where 이 on의 역할을 함.
select * from `sales` as a, `member` as b where a.uid =b.uid;
#using 연산자 (sales와 member의 컬럼 이름이 같을 때 사용할 수 있음)
select * from `sales` as a join `member` as b using(`uid`);
select * from `sales` as a join `member` as b on a.uid=b.uid
join `department` as c on b.dep=c.depNo;

select a.`uid`, a.`year`, a.`month`, a.`sale`,
b.`name`, b.`hp`, c.`name` from `sales` as a join `member` as b using(`uid`)
join `department` as c on b.dep= c.depNo;

#실습 4-14 # 테이블 결합 - 외부 조인
select * from `sales` as a left join `member` as b on a.uid = b.uid; 
#왼쪽에 있는 table을 기준으로 하겠다. (왼쪽 table의 모든 data는 조회가 되어야 함)

select * from `sales` as a right join `member` as b on a.uid = b.uid;
# 오른쪽 table의 모든 data는 조회 되어야 함.

select * from `sales` as a inner join `member` as b on a.uid= b.uid;

#실습 4-15 모든 직원의 아이디, 이름, 직급, 부서명을 조회하시오
select a.uid, a.name, a.pos, a.dep from `member` as a;

#실습 4-16 '김유신' 직원의 2019년 매출의 합을 조회하시오
select a.name ,sum(b.`sale`) as'2019년 매출 합' from `member` as a join sales as b using(`uid`)
where b.year=2019 and a.name='김유신';
select * from member;

#실습 4-17 2019년 50,000이상 매출에 대해 직원별 매출의 합이 100,000원 이상인 직원 이름, 
# 부서명, 직급, 년도, 매출 합을 조회하시오. 단, 매출 합이 큰 순서부터 정렬한다.

select a.name , a.dep, a.pos, b.year , sum(b.`sale`) as `매출 합` 
from `member` as a join `sales` as b on a.uid=b.uid
 where b.year =2019 and b.`sale`>=50000  group by a.name
 having `매출 합`>=100000  order by `매출 합` desc;
 
 

 
 
 
 


