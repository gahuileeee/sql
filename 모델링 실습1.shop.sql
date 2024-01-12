-- 날짜 : 2024-01-12
-- 이름 : 이가희
-- 내용 : Shop 모델링 실습

# 실습 6-2 데이터 입력하기
insert into `customer` values('c101','김유신','010-1234-1001','경남 김해시','2023-01-01');
insert into `customer` values('c102','김춘추','010-1234-1002','경남 경주시','2023-01-02');
insert into `customer` values('c103','장보고','010-1234-1003','전남 완도군','2023-01-03');
insert into `customer` values('c104','강감찬','010-1234-1004','서울시 관악구','2023-01-04');
insert into `customer` values('c105','이순신','010-1234-1005','부산시 금정구','2023-01-05');

insert into `product` values(1, '새우깡', 5000,1500,'농심');
insert into `product` values(2, '초코파이', 2500,2500,'오리온');
insert into `product` values(3, '포카칩', 3600,1700,'오리온');
insert into `product` values(4, '양파링', 1250,1800,'농심');
insert into `product` values(5, '죠리퐁', 2200,null,'크라운');

insert into `order` values (null, 'c102',3,2,now());
insert into `order` values (null, 'c101',4,1,now());
insert into `order` values (null, 'c102',1,1,now());
insert into `order` values (null, 'c103',6,5,now()); #이 친구는 실행되지 않음. 왜냐 외래키가 적용되었기 때문에
insert into `order` values (null, 'c105',2,1,now());
	
# 실습 6-3 다음 데이터를 조회 하시오 
-- 모든 주문의 주문번호, 주문한 고객명, 주문한 상품명, 주문 수량, 주문일을 조회하시오.
select `orderno`,`name`,`prodName`,`orderCount`,`orderDate` from `order` as a join product as b on
a.orderProduct =b.prodNo join customer as c on a.orderID=c.custId;

-- 김유신이 주문한 상품의 주문번호, 상품번호, 상품명, 가격, 주문수량, 주문일을 조호하시오.
select `orderno`,`prodNo`,`prodName`,`price`,`orderDate` from `order` as a join product as b on
a.orderProduct =b.prodNo join customer as c on a.orderID=c.custId where `name`='김유신';

-- 주문한 상품의 총 주문 금액을 조회하시오.
select sum(price*orderCount) "총 주문 굼액" from `order` as a join product as b on
a.orderProduct =b.prodNo join customer as c on a.orderID=c.custId;

# 실습 6-4 아래 테이블 명세서를 참고해서 ERD 를 작성하시오  //작성 완료

# 실습 6-5 아래와 같이 데이터를 입력하시오
insert into `bank_customer` values ('730423-1000001','김유신',1,'010-1234-1001','경남 김해시');
insert into `bank_customer` values ('730423-1000002','김춘추',1,'010-1234-1002','경남 경주시');
insert into `bank_customer` values ('730423-1000003','장보고',1,'010-1234-1003','전남 완도군');
insert into `bank_customer` values ('102-12-51094','(주)정보산업',2,'051-500-1004','부산시 부산진구');
insert into `bank_customer` values ('930423-1000005','이순신',1,'010-1234-1005','서울 종로구');

insert into `bank_account` values('101-11-1001','S1','자유저축예금','730423-1000001',1550000,'2011-04-11');
insert into `bank_account` values('101-11-1002','S1','자유저축예금','930423-1000005',260000,'2011-05-12');
insert into `bank_account` values('101-11-1003','S1','자유저축예금','730423-1000003',75000,'2011-06-13');
insert into `bank_account` values('101-12-1001','S2','기업전용예금','102-12-51094',15000000,'2011-07-14');
insert into `bank_account` values('101-13-1001','S3','정기저축예금','730423-1000002',1200000,'2011-08-15');

insert into `bank_transaction` values(null,'101-11-1001',1, 50000,now());
insert into `bank_transaction` values(null,'101-12-1001',2,1000000,now());
insert into `bank_transaction` values(null,'101-11-1002',3,260000,now());
insert into `bank_transaction` values(null,'101-11-1002',2,100000,now());
insert into `bank_transaction` values(null,'101-11-1003',3, 75000,now());
insert into `bank_transaction` values(null,'101-11-1003',1,150000,now());

# 실습 6-6 다음 데이터를 조회하시오
-- 모든 고객의 고객번호, 이름, 연락처, 계죄번호, 계좌상품명, 현재잔액을 조회하시오.
select c_no, c_name, c_phone,a_no,a_item_name,a_balance from bank_customer as a
join bank_account as b on a.c_no=b.a_c_no;

-- 이순신 고객명으로 모든 거래내역 중 거래구분, 거래금액, 거래날짜를 조회하시오.
select t_dist, t_amount, t_datetime from bank_customer as a
join bank_account as b on a.c_no=b.a_c_no join bank_transaction as c
on b.a_no=c.t_a_no where c_name='이순신';

-- 개인 고객 중 현재잔액이 가장 큰 고객의 주민번호, 고객명, 계좌번호, 현재잔액, 계좌개설일을 조회하시오.
select  c_no, c_name, a_no,a_balance, `a_open+date` from bank_customer as a
join bank_account as b on a.c_no=b.a_c_no join bank_transaction as c
on b.a_no=c.t_a_no where c_dist=1 order by a_balance desc limit 1;

# 실습 6-7 ERD 작성

# 실습 6-8 아래와 같이 데이터를 입력하시오.
insert into `student` values ('20201011','김유신','010-1234-1001',3,'경남 김해시'); 
insert into `student` values ('20201122','김춘추','010-1234-1002',3,'경남 김해시'); 
insert into `student` values ('20210213','장보고','010-1234-1003',2,'경남 김해시'); 
insert into `student` values ('20210324','강감찬','010-1234-1004',2,'경남 김해시'); 
insert into `student` values ('20220415','이순신','010-1234-1005',1,'경남 김해시'); 

insert into `lecture` values ('101','컴퓨터과학 개론',2,40,'본301');
insert into `lecture` values ('102','프로그래밍 언어',3,52,'본302');
insert into `lecture` values ('103','데이터베이스',3,56,'본303');
insert into `lecture` values ('104','자료구조',3,60,'본304');
insert into `lecture` values ('105','운영체제',3,52,'본305');

insert into `register` values ('20220415','101',60,30,null,null);
insert into `register` values ('20210324','103',54,36,null,null);
insert into `register` values ('20201011','105',52,28,null,null);
insert into `register` values ('20220415','102',38,40,null,null);
insert into `register` values ('20210324','104',56,32,null,null);
insert into `register` values ('20210213','103',48,40,null,null);

# 6-9 다음 데이터를 조회하시오
-- 이번 학기에 수강신청 하지 않은 학생의 학번, 이름, 연락처, 학년을 조회하시오.
select stdno, stdName, stdhp, stdYear  from Student as a left join register as b
on a.stdno = b.regstdno where reglecno is null;

-- 중간고사 점수와 기말고사 점수의 총합을 구하고, 등급을 구하시오.
update register set regtotalscore= regMidscore +regFinalScore; 
update register set regGrade = if(regtotalscore >=90, 'A',
if (regtotalscore>=80, 'B',
if (regtotalscore>=70, 'C',
if (regtotalscore>=60, 'D','F'))));

-- 2학년 학생의 학번, 이름, 학년, 수강, 강좌명, 중간점수, 기말점수, 총합, 등급을 조회하시오.
select stdNo, stdName, stdYear, lecName, regMidscore, regFinalScore,
regtotalscore, regGrade from student as a join register as b on a.stdno=b.regStdNo
join lecture as c on b.regLecNo = c.lecno where stdYear = 2;