# 날짜 : 2024-01-18
# 이름 : 이가희
# 내용 : 8장 트랜잭션과 병행 제어

# 실습 8-1
-- 트랜잭션 시작
start transaction;

select * from `bank_account`;
update `bank_account` set `a_balance` = `a_balance` - 10000
		where `a_no` = '101-11-1001';
update `bank_account` set `a_balance` = `a_balance` + 10000
		where `a_no` = '101-11-1003';
-- 트랜잭션 작업 완료
commit;
select * from bank_account;

# 실습 8-2 트랜잭션 Rollback
-- 트랜잭션 시작
start transaction;

select * from `bank_account`;
update `bank_account` set `a_balance` = `a_balance` - 10000
		where `a_no` = '101-11-1001';
update `bank_account` set `a_balance` = `a_balance` + 10000
		where `a_no` = '101-11-1003';
-- 트랜잭션 작업 실패 처리
rollback;
select * from bank_account;

# 실습 8-3 커밋 OFF
select @@autocommit; #1이라는 것은 true, SQL 연산 하나 하나가 트랜잭션 처리로 된 것이다라는 뜻
set autocommit =1;   
update bank_account set a_balance = a_balance -10000 where a_no='101-11-1001';
#autocommit =0이면 rollback 하면 원래 상태로 되돌아감 (commit 하기전의 상태로), 그런데 autocommit=1이면
#업데이트 등을 했을 때 자동 commit이어서 rollback 해도 값이 이미 반영되어 원래 상태로 돌아가지 않음
select * from bank_account;
rollback;

# 실습 8-4 Lock & UnLock 병행제어 실습 by root
select * from bank_account;
start transaction;
update bank_account
	set a_balance = a_balance - 10000 where a_no = '101-11-1001';
commit;