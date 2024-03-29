# 날짜 : 2024-01-05
# 이름 : 이가희
# 내용: sql 연습문제1

#실습 1-1 실습 데이터베이스와 사용자를 생성하시오
create database `shop`;
create user 'shop'@'%' identified by '1234';
grant all privileges on shop.*to 'shop'@'%';
flush privileges;

#실습 1-2  아래 표를 참고하여 테이블을 생성하시오
create table Customer(
`custId` varchar(10) not null primary key,
`name` varchar(10) not null ,
`hp` varchar(13) unique default(null),
`addr` varchar(100),
`rdate` date not null
);

create table Product (
	`prodNo` int primary key,
    `prodName` varchar(10) not null,
    `stock` int not null default(0),
    `price` int,
    `company` varchar(20) not null
);

create table `Order`(
	`orderNo` int primary key auto_increment,
    `orderId` varchar(10) not null,
    `orderProduct` int not null,
    `orderCount` int not null default(1),
    `orderDate` datetime not null
);

#실습 1-3 테이블에 아래 그림과 같이 데이터를 입력하시오

insert into `customer` values('c101','김유신','010-1234-1001','김해시 봉황동','2022-01-01');
insert into `customer` values('c102','김춘추','010-1234-1002','경주시 보문동','2022-01-02');
insert into `customer` values('c103','장보고','010-1234-1003','완도군 청산면','2022-01-03');
insert into `customer` values('c104','강감찬','010-1234-1004','서울시 마포구','2022-01-04');
insert into `customer` (custId,name,rdate) values('c105','이성계','2022-01-05');
insert into `customer` values('c106','정철','010-1234-1006','경기도 용인시','2022-01-06');
insert into `customer` (custId,name,rdate) values('c107','허준','2022-01-07');
insert into `customer` values('c108','이순신','010-1234-1008','서울시 영등포구','2022-01-08');
insert into `customer` values('c109','송상현','010-1234-1009','부산시 동래구','2022-01-09');
insert into `customer` values('c110','정약용','010-1234-1010','경기도 광주시','2022-01-10');

insert into `product` values (1,'새우깡', 5000, 1500,'농심');
insert into `product` values (2,'초코파이', 2500,2500,'오리온');
insert into `product` values (3,'포카칩', 3600,1700,'오리온');
insert into `product` values (4,'양파링', 1250,1800,'농심');
insert into `product` (prodno, prodName, stock, company) values (5,'죠리퐁', 2200,'크라운');
insert into `product` values (6,'마가렛트', 3500,3500,'롯데');
insert into `product` values (7,'뿌셔뿌셔', 1650,1200,'오뚜기');

insert into `order` (orderId, orderProduct, orderCount, orderDate) values('c102',3,2,now());
insert into `order` (orderId, orderProduct, orderCount, orderDate) values('c101',4,1,now());
insert into `order` (orderId, orderProduct, orderCount, orderDate) values('c108',1,1,now());
insert into `order` (orderId, orderProduct, orderCount, orderDate) values('c109',6,5,now());
insert into `order` (orderid, orderProduct, orderCount, orderDate) values('c102',2,1,'2022-07-03 09:15:37');
insert into `order` (orderId, orderProduct, orderCount, orderDate) values('c101',7,3,'2022-07-03 12:35:12');
insert into `order` (orderId, orderProduct, orderCount, orderDate) values('c110',1,2,'2022-07-03 16:55:36');
insert into `order` (orderId, orderProduct, orderCount, orderDate) values('c104',2,4,now());
insert into `order` (orderId, orderProduct, orderCount, orderDate) values('c102',1,3,now());
insert into `order` (orderId, orderProduct, orderCount, orderDate) values('c107',6,1,now());



#실습 1-4 고객 테이블에 존재하는 모든 속성을 조회 하시오.
select * from customer;

#실습 1-5 고객 테이블에서 고객 아이디, 이름, 휴대폰 번호를 조회하시오.
select custid, name, hp from customer;

#실습 1-6 제품 테이블에 존재하는 모든 속성을 조회 하시오.
select * from product;

#실습 1-7 제품 테이블에서 제조업체를 조회 하시오.
select company from product;

#실습 1-8 제품 테이블에서 제조업체를 중복 없이 조회 하시오.
select distinct company from product;

#실습 1-9 제품 테이블에서 제품명과 단가를 조회 하시오
select prodname, price from product;

#실습 1-10 제품 테이블에서 제품명과 단가를 조회하되, 단가에 500원을 더해 조정단가로 출력하시오
select prodname, pricekeywardskeywards+500 as 조정단가 from product;

#실습 1-11 제품 테이블에서 오리온이 제조판 제품의 제품명, 재고량, 단가를 조회하시오
select `prodname`, stock, price from `product` where company='오리온';

#실습 1-12 주문 테이블에서 'c102' 고객이 주문한 제품의 제품명, 재고량, 단가를 조회하시오
select `orderproduct`, `ordercount`,`orderdate` from `order` where orderid='c102';

#실습 1-13 주문 테이블에서 'c102'고객이 2개이상 주문한 주문제품, 수량, 주문일자를 조회하시오.
select orderproduct, ordercount, orderdate from `order` where orderid='c102' and ordercount>=2;

#실습 1-14 제품 테이블에서 단가가 1,000원 이상 2,000원 이하인 제품을 조회하시오.
select * from product where price>=1000 and price<=2000;

#실습 1-15 고객 테이블에서 성이 김씨인 고객의 아이디, 이름, 휴대폰, 주소를 조회하시오.
select custid, name, hp, addr from customer where name like '김%';

#실습 1-16 고객 테이블에서 고객 이름이 2자인 고객의 아이디, 이름, 휴대폰, 주소를 조회하시오.
select custid, name, hp, addr from customer where name like '__';

#실습 1-17 고객 테이블에서 휴대폰 번호가 입력되지 않은 고객을 조회하시오.
select * from customer where hp is null;

#실습 1-18 고객 테이블에서 주소가 입력된 고객을 조회하시오
select * from customer where addr is not null;

#실습 1-19 고객 테이블에서 가입일을 내림차순으로 정렬하여 고객을 조회하시오
select * from customer order by rdate desc;

#실습 1-20 주문 테이블에서 수량이 3개 이상인 주문 내용을 조회하시오. 단, 주문 수량으로
# 내림차순 정렬하고, 수량이 같으면 제품번호를 기준으로 오름차순 정렬하시오.
select * from `order` where `ordercount`>=3 order by ordercount desc, orderproduct;

#실습 1-21 제품 테이블에서 모든 제품의 단가 평균을 조회하시오
select avg(price) from product;

#실습 1-22 '농심'에서 제조한 제품의 재고량 합계를 조회하시오
select sum(`stock`) as `재고량 합계` from product where company = '농심';

#실습 1-23 고객 테이블에 고객이 몇 명 등록되어 있는지 조회하시오
select count(`custid`) as '고객수' from customer;

#실습 1-24 제품 테이블에서 제조업체의 수를 조회하시오.
select count(distinct company) as `제조업체 수` from product;

#실습 1-25 주문 테이블에서 주문제품별 수량의 합계를 조회하시오
select orderproduct as `주문 상품번호`, sum(`ordercount`) as `총 주문수량` from
`order` group by orderproduct order by orderProduct;

#실습 1-26 제품 테이블에서 제조업체별 제조한 제품의 개수와 제품 중 가장 비싼 단가를 조회하시오
select company as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가` from product
group by company order by company;

#실습 1-27 제품 테이블에서 제품을 2개 이상 제조한 제조업체별로 제품의 개수와 제품 중 가장 비싼 단가를 조회하시오
select `company` as `제조업체`, count(*) as `제품수` , max(price) as `최고가` from product 
group by company having `제품수`>=2;

#실습 1-28 주문테이블에서 각 주문고객이 주문한 제품의 총 주문수량을 주문 제품별로 조회하시오
select orderproduct, orderid, sum(ordercount) as `총 주문수량` from `order`
group by orderno order by orderproduct, orderid;

#실습 1-29 'c102' 고객이 주문한 제품의 이름을 조회하시오.
select a.orderid, b.prodname from `order` as `a` join product as `b` on `a`.orderproduct=`b`.prodno
where a.orderid='c102'; 

#실습 1-30 주문일자가 7월 3일인 고객의 아이디, 이름, 상품명, 그리고 주문 날짜시간을 조회하시오.
select orderid, name, prodname, orderdate from `order` as `a` join
`customer` as `b` on a.orderid= b.custid
join product as c on a.orderproduct = c.prodno
where a.orderdate like '2022-07-03%';