# 날짜: 2024-01-08
# 이름: 이가희
# 내용: 제 5장 데이터베이스 개체

##인덱스 #############################

#실습 6-1
show index from `user1`;  #user1 table엔 PK, UK , FK 등 설정하지 않아서 없음.
show index from `user2`;
show index from `user3`;

#실습 6-2 인덱스 생성 및 적용
create index `idx_user1_uid` on `user1`(`uid`);
show index from `user1`;
analyze table `user1`;

# 실습 6-3 인덱스 삭제
drop index idx_user1_uid on `user1`;

##뷰 ##########################################

# 실습 6-4 뷰 생성
create view `vw_user1` as (select `name`, `hp`, `age` from `user1`);
create view `vw_user4_age_under30` as (select * from `user4` where `age`<30);
create view `vw_member_with_sales` as (
select
 a. `uid` as `지원아이디`,
 b. `name` as `직원이름`,
 b. `pos` as `직급`,
 c. `name` as `부서명`,
 a. `year` as `매출년도`,
 a.`month` as `월`,
 a.`sale` as `매출액`
 from `sales` as a
 join `member` as b on a.uid=b.uid
 join `department` as c on b.dep=c.depNo
);

# 실습 6-5 뷰 조회
select * from `vw_user1`;
select * from `vw_user4_age_under30`;
select * from `vw_member_with_sales`;

# 실습 6-6 뷰 삭제
drop view `vw_user1`;
drop view `vw_user4_age_under30`;
drop view `vw_member_with_sales`;

# 실습 6-7 프로시저 생성 및 실행 기본
# delimiter 선언부터 함 -> procedure 이름 짓기 -> bigin ~ end 사이에 자주 쓰는 쿼리문 넣기

DELIMITER $$ 
 create procedure proc_test1()
BEGIN
	select * from `member`;
    select * from `department`;
END $$
DELIMITER ;

call proc_test1();

# 실습 6-8 매개변수를 갖는 프로시저 생성 및 실행

DELIMITER $$
CREATE PROCEDURE proc_test2(IN _userName VARCHAR(10))
begin
 select * from `member` where `name`= _userName;
end $$
DELIMITER ;
call proc_test2('김유신');

DELIMITER $$
CREATE procedure proc_test3(in _pos varchar(10), in _dep TINYINT)
begin
 select * from `member` where `pos`=_pos and `dep`= _dep;
end $$
DELIMITER ;
call proc_test3('차장',101);

delimiter $$
create procedure proc_test4(in _pos Varchar(10), out _count INT )  # out은 반환 변수
begin
 select count(*) into _count from `member` where `pos`=_pos;
 end $$
 delimiter ;

call proc_test4('대리', @_count); #대리 직급의 count 값을 얻기 
select concat('_count : ', @_count) as `대리 직급`;  

# 실습 6-9 프로시저 프로그래밍
delimiter $$
 create procedure proc_test5(in _name Varchar(10))
 begin
  declare userId varchar(10) ; #변수 선언
  select uid into userId from `member` where `name` = _name; #userid에 uid 값 대입
  select * from `sales` where `uid` = userId;
 end $$
 delimiter ;
 call proc_test5('김유신');
 
 delimiter $$  #if 문
 create procedure procc_test6()
 begin
  declare num1 int;
  declare num2 int;
  
  set num1= 1;
  set num2  =2;
  
  if(num1>num2) then
  select 'num1이 num2 보다 크다.' as `결과2`;
  else
   select 'num1이 num2 보다 작다.'as `결과2`;
   end if;
 end $$
 delimiter ;
 call procc_test6();
 
 delimiter $$
  create procedure proc_test7() #while 문
  begin
	declare sum int;
    declare num  int;
    set sum =0;
    set num =1;
    while(num<=10) do
    set sum= sum+num;
    set num = num+1;
    end while;
    select sum as '1부터 10까지 합계';
end $$
delimiter ;
call proc_test7;

# 실습 6-10 커서를 활용하는 프로시저
delimiter $$
create procedure proc_test8()
begin
#변수 선언
	declare total int default 0 ; #선언과 동시에 초기화
    declare price int;
    declare endOfRow boolean default false;

#커서 선언
    declare saleCursor cursor for select `sale` from `sales`; 
    #cursor type의 saleCursor을 선언.
    # 여기서 cursor는 file pointer라고도 하는데 data를 가르키는 pointer임.
    
#반복 조건 -> cursor가 파일의 끝에 도달하면 (더 이상 내려갈 수 없을 때) endofrow가 true가 됨.
	declare continue handler for not found set endOfrow = true;
    
#커서 열기
open saleCursor;

cursor_loop: LOOP
 #여기서 cursor_loop는 loop문의 이름
	fetch saleCursor into price;
    if endofRow then
    leave cursor_loop; #break문이라고 생각해도 됨
    end if;
    set total = total+price;
	end LOOP;
    
    select total as '전체 합계';
    close saleCursor;
end $$
delimiter ;
DROP PROCEDURE IF EXISTS proc_test8;
call proc_test8();

# 실습 6-11 저장 함수 생성 및 호출
DELIMITER $$
create function func_test1(_userid varchar(10)) returns INT 
begin
	declare total int;
    select sum(`sale`) into total from `sales` where `uid`=_userid;
    return total;
end $$
DELIMITER ;
select func_test1('a101');

delimiter $$
	create function func_test2(_sale INT) returns double
    begin
		declare bonus DOUBLE;
        if(_sale>=100000) then
        set bonus = _sale *0.1;
        else
		set bonus = _sale * 0.05;
        end if;
	return bonus;
    end $$
    delimiter ;
    
    select `uid`,`year`,`month`,`sale`, func_test2(`sale`) as `bonus` from `sales`;
