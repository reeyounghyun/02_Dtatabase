-- GRPUP BY
-- 같은 값을 가진 행을 하나의 그룹으로 묶을 때
-- 통계, 집게를 계상할때 사용

select
    category_code,
    count(*)
from tbl_menu
group by  category_code;


select
    category_code,
    sum(menu_price),
    avg(menu_price)
from tbl_menu
group by  category_code;


-- HAVING: 그룹한 이 이후에 결과를 필터링
-- WHERE: 그룹화를 하기전에 데이터를 필터링

# [조건]
select
    category_code,
    count(*) -- 행(데이터)의 개수를 세는 함수
from tbl_menu
group by category_code
having category_code between 5 and 8;
-- 그룸핑 이후에 having


-- ROLLUP
-- 각 그룹에 대한 소계(중간 합계)나 총계(전체 합계)를 계산하여 resultset에 포함
select
    category_code,
    sum(menu_price)
from tbl_menu
group by category_code
with rollup; -- 위 값들에 대한 총합이 나옴


select
    menu_price,
    category_code,
    sum(menu_price)
from tbl_menu
group by
    menu_price,
    category_code
