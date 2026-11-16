-- 현재 상태 조회
select @@autocommit;

-- 끄기
set autocommit = 0;
set autocommit = OFF;

-- 켜기
set autocommit = 1;
set autocommit = ON;

use menudb;
select *
from tbl_menu;

-- 트랜잭션 범위 시작
start transaction;

insert into tbl_menu value (null, '바나나해장국', 8500, 4, 'y');
update tbl_menu set menu_name = '수정된 메뉴' where menu_code = 5;
delete from tbl_menu where menu_code = 1;

select
    *
from
    tbl_menu
where menu_code = 5; -- 트랜잭션 안에서는 수정된 메뉴


commit; -- transaction 수정하면 데이터 베이스에 반영이 됨
rollback; -- 아직 comit 되지 않은 사항을 취소한다.