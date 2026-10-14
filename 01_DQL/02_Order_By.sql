-- ORDER BY
-- 특정 컬럼이나 값을 기준으로 조회 결과를 정렬할 때 사용
-- ASC : 오름차순 (생략가능), DESC : 내림차순

select
    menu_code,
    menu_name,
    menu_price
from tbl_menu
order by
#     menu_price asc; -- 오름차순
menu_price desc ; -- 내림차순


-- 메뉴 가격으로 내림차순 정렬 후
-- 메뉴 이름으로 오름차순 정렬
select
    menu_code,
    menu_name,
    menu_price
from tbl_menu
order by
    menu_price desc,
    menu_name asc;

-- 메뉴코드, 이름, 가격을 조회
-- 가격은 1000원 단위로 보여주세요.
select
    menu_code,
    menu_name,
    menu_price / 1000 as menu_price천원단위
from tbl_menu
order by
    menu_price천원단위;


select field('A', 'A','B','C');
select field('B', 'A','B','C');

-- N인메뉴를 먼저 출력하고 다음에 Y인 메뉴 출력
select
    *
from
    tbl_menu
order by
    field(orderable_status, 'N', 'Y');