select
    menu_name,
    menu_price,
    orderable_status
from tbl_menu
where
    orderable_status = 'y';

-- [조건] menu_price가 13000원인 메뉴의 이름과 가격만 보여주세요

select
    menu_name,
    menu_price
    from tbl_menu
where
    menu_price = 13000;


-- [조건] menu_price가 13000원인 메뉴보다 높은 가격만 보여주세요
select
    menu_name,
    menu_price
from tbl_menu
where
    menu_price > 13000;

-- [조건] menu_price가 13000원인 메뉴보다 낮은 가격만 보여주세요
select
    menu_name,
    menu_price
from tbl_menu
where
    menu_price < 13000;

-- [조건] menu_price가 13000원인 아닌 메뉴 가격만 보여주세요
select
    menu_name,
    menu_price
from tbl_menu
where
    menu_price != 13000;


#  논리연산 AND OR
select
    menu_name,
    category_code,
    orderable_status,
    menu_price
from tbl_menu
where
    orderable_status = 'Y' AND
    category_code = 10
ORDER BY menu_price;

select
    menu_name,
    category_code,
    orderable_status,
    menu_price
from tbl_menu
where
    orderable_status = 'Y' or
    category_code = 10
ORDER BY menu_price;

-- 우선순위
select  1 and 0;

-- AND연산이 먼저 수행된다.
select 1 or 0 and 0;

-- OR연산이 먼저 수행하려면 괄호를 해주면 된다.
SELECT (1 OR 0) AND 0;

-- [조건] 메뉴가격이 10000원 이상 25000원 이하 이고 menu 가격순으로 정렬해서 출력
select
    menu_name,
    menu_price,
    category_code
from
    tbl_menu
where menu_price >= 10000 and menu_price <= 25000
order by menu_price;


-- [ 조건 between을 사용하여] 메뉴가격이 10000원 이상 25000원 이하 이고 menu 가격순으로 정렬해서 출력
select
    menu_name,
    menu_price,
    category_code
from
    tbl_menu
where menu_price between 10000 and 25000
order by menu_price;

-- [ 조건 / 부정표현 not not_between 을 사용하여] 메뉴가격이 10000원 이상 25000원 이하 이고 menu 가격순으로 정렬해서 출력
select
    menu_name,
    menu_price,
    category_code
from
    tbl_menu
where menu_price not between 10000 and 25000
order by menu_price;

# 와일드 카드
-- LIKE 연산자 :특정 패턴과 일치하는 데이터를 검색알 때 사용

-- _ 언더바 : 딱 한글자
-- % : 글자수 제한 없음

select menu_name
from tbl_menu
where
    menu_name like '%마늘%'; -- 중간에 마늘이 들어있는 이름을 찾아라 '%메뉴%'

select menu_name
from tbl_menu
where
    menu_name like '_마늘%'; -- 앞에 한 글자를 제외하고 마늘이 들어있는 이름을 찾아라 '_메뉴%'

select menu_name
from tbl_menu
where
    menu_name like '생%'; -- 생으로 시작하는 모든 메뉴이름을 찾아라 '생%'


-- IN: 여러값 중에
select
    menu_name,
    category_code
from tbl_menu
where category_code in (4,5,6);

select
    menu_name,
    category_code
from tbl_menu
where category_code not in (4,5,6)
order by category_code;

-- IS null : NULL값을 확인하는 메소드
select
    category_name,
    ref_category_code
from tbl_category
where ref_category_code is null;

-- [부정] null이 아닌 값만 추출
select
    category_name,
    ref_category_code
from tbl_category
where ref_category_code is not null;