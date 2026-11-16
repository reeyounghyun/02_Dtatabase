-- LIMIT
-- 조회할 행의 개수를 제한할 때 사용
-- LIMIT (개수): 처음부터 지정한 개수만큼 조회
-- LIMIT (시작위치), (개수): 시작위치부터 지정한 개수만큼 조회

#  방법1
select
    menu_code,
    menu_name,
    menu_price
from tbl_menu
order by
    menu_price
limit 5;
-- 특정한 개수를 원한다면 order by를 먼저 정렬한 후 사용해야 한다.

# 방법2
select
    menu_code,
    menu_name,
    menu_price
from tbl_menu
order by
    menu_price -- 원하는 순서의 일부 행을 조회하려면 order by 인지사용
limit 1,4
