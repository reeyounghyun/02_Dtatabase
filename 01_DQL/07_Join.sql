-- JOIN
-- 관련 컴럼을 기준으로 여러 테이블의 데이터를 조회할때 사용

-- JOIN의 종류
-- INNER JOIN:  양쪽 테이블에 모두 존재하는 데이터(행)만 조회
-- LEFT/RIGHT JOIN: 기준 테이블의 일치하지 않는 데이터(행)도 포함

select a.menu_name,
       b.category_code

from tbl_menu as a
# inner join tbl_category b
         join tbl_category b
              on -- 조건
                  a.category_code = b.category_code;

# USING
# 같은 이름의 칼럼을 연결하여 조회할수 있다.
select a.category_name,
       b.menu_name
from tbl_category a
         join tbl_menu b
              USING  (category_code);

# left join
-- tbl_category에 있는 모든 카테고리를 출력하고,
-- tbl_menu에도 같은 카테고리가 있으면!! 해당 메뉴이름을 출력하낟.
select a.category_name,
       b.menu_name
from tbl_category a
#inner join tbl_category b
         left join tbl_menu b
                   on
                       a.category_code = b.category_code;


# RIGHT join
select a.menu_name,
       b.category_code

from tbl_menu  a
         right join tbl_category b   -- 기즌
                    on  -- 조건
                        a.category_code = b.category_code;


# 모든 조합 / 조건 생략 가능하다.
select a.menu_name,
       b.category_code

from tbl_menu  a
         cross join tbl_category b;

-- SELF JOIN
-- 자신의 테이블을 자신이 JOIN

select
    a.category_name as 카테고리명,
    b.category_name as 상위카테고리
from tbl_category a
join tbl_category b

on a.ref_category_code = b.category_code;
