# SET_OPERATORS
-- 여러 select 결과를 결함할때 사용
-- 컬럼의 갯수와 같은 위치의 데이터 타입 호환되어야한다.
-- UNION : 중복을 제거
-- UNION ALL : 중복을 유지

select menu_code,
       menu_name,
       menu_price,
       category_code,
       orderable_status
from tbl_menu
where category_code = 10
UNION
-- 중복을 제거하고,위와 아래있는 코드를 합해준다.
select menu_code,
       menu_name,
       menu_price,
       category_code,
       orderable_status
from tbl_menu
where category_code < 9000;



select menu_code,
       menu_name,
       menu_price,
       category_code,
       orderable_status
from tbl_menu
where category_code = 10
UNION ALL
-- 중복을 제거하지 않고,위와 아래있는 코드를 합해준다.
select menu_code,
       menu_name,
       menu_price,
       category_code,
       orderable_status
from tbl_menu
where category_code < 9000;


-- 교집합
select a.menu_code,       -- 메뉴 코드
       a.menu_name,       -- 메뉴 이름
       a.menu_price,      -- 메뉴 가격
       a.category_code,   -- 카테고리 코드
       a.orderable_status -- 주문 가능 여부
from tbl_menu a -- 전체 메뉴 테이블에 a라는 별명 지정
         join (select menu_code,
                      menu_name,
                      menu_price,
                      category_code,
                      orderable_status
               from tbl_menu
               where menu_price < 9000 -- 가격이 9,000원 미만인 메뉴만 조회
             -- WHERE는 조건에 맞는 행만 골라내고 싶을 때
) b -- 서브쿼리 결과에 b라는 별명 지정
              on a.menu_code = b.menu_code; -- 메뉴 코드가 같은 행끼리 연결
              -- ON은 JOIN할 때, 두 테이블의 행을 어떤 조건으로 연결할지 정할 때 사용해요.

