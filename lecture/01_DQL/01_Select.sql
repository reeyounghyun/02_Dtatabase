-- 출력: ctrl + enter
--  * 은 모든 칼럼을 조회할 수 있다.
-- SELECT : 테이블의 데이터를 조회할 때 사용
-- select (조회할 칼럼) from (조회할테이블);
-- 에시) select menu_name from tbl_menu;
-- 기능 1.select  5+10; //연산이 가능하다.


-- 모든 컬럼을 조회하겠다.
-- 문법 select (조회할 칼럼) from (조회할테이블);
SELECT * from tbl_menu;

select menu_name from tbl_menu;

-- 여러 열의 데이터 검색
-- 컬럼 이름변경 " as 제목" 을 붙이면 된다.
select
    menu_code as 코드,
    menu_name as 이름,
    menu_price as 가격
from tbl_menu;

-- select 연산
select  5+10;

-- 내장함수
select now();

-- as: 컬럼의 별칭을 지정 할 수 있다.
select  now() as time; -- 결과컬럼명을 수정

select concat('b,' 'ear');