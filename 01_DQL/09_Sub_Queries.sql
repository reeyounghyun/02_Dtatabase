-- SUBQUERY
-- 다른 SQL문 안에 작성하는 Select 문
-- 서브쿼리의 결과를 메인쿼리의 조건이나 조회 대상
-- FROM 절에 서브쿼리를 작성할 때 별칭을 필수로 작성해야한다.

-- 비상관 서브쿼리는 메인 쿼리가 동작하기 전에
-- 상관 서브쿼리는 메인 쿼리와 동시에 작동한다.

-- 서브 쿼리
select category_code
from tbl_menu
where menu_name = '민트미역국';

-- 메인 쿼리

select *
from tbl_menu
where category_code = (select category_code
                       from tbl_menu
                       where menu_name = '민트미역국');

-- 다양한 위치에서 서브쿼리의 활용
# 1.select 절 : 스칼리 서브쿼리
-- 한행, 한 컬럼의 값을 반환하며 조회의 결과를 컬럼처럼 사용

select a.menu_code,
       a.menu_name,
       a.menu_price,
       (select b.category_name
        from tbl_category b
        where b.category_code = a.category_code) as category_name
from tbl_menu a;


# 2. FROM 절
-- 인라인 뷰 = 파생테이블 이라고도 부름
-- 서브쿼리의 조회 결과를 하나의 테이블처럼 사용 하며, 볊칭을 꼭 지정해야 한다.

select category_summary.category_code,
       category_summary.menu_count,
       category_summary.avg_price
from (select category_code,
             count(*)               as menu_count,
             floor(avg(menu_price)) as avg_price
      from tbl_menu
      group by category_code) as category_summary;


# 3.WHERE 절 : 중첩 서브쿼리
-- 서브쿼리의 결과를 바깥쪽(메인) 쿼리의 조건으로 사용


# [조건] 전체 메뉴의 평균 가격을 구함.
select menu_code,
       menu_name,
       menu_price
from tbl_menu
where menu_price > (select avg(menu_price) -- 전체 메뉴의 평균 가격
                    from tbl_menu);


# 4.HAVING 절

# [조건]이 쿼리는 카테고리별 평균 가격이 전체 메뉴의 평균 가격보다 높은 카테고리만 조회
select category_code,
       floor(avg(menu_price)) -- 카테고리별 평균 가격의 소수점 이하 버림
from tbl_menu
group by category_code -- 카테고리별로 묶기
having avg(menu_price) > (select avg(menu_price) -- 전체 메뉴의 평균 가격
                          from tbl_menu);

-- 상관 서브쿼리
-- 내부 쿼리가 외부 쿼리의 값을 참조하는 형태


#  [조건] 카테고리별로 편균 가격보다 높은 가격의 메뉴 조회
select menu_code,
        menu_name,
       menu_price,
       category_code,
       orderable_status
from tbl_menu a
where menu_price > (select avg(menu_price)
                    from tbl_menu
                    where category_code = a.category_code)

-- EXISTS()
-- 서브쿼리의 조회 결과가 있으면 true
-- 없으면 false

-- [조건] 메뉴가 하나라도 등록된 카테고리의 이름과 코드를 조회
select category_name,
       category_code
from tbl_category a
where exists (select 1
              from tbl_menu b
              where b.category_code = a.category_code);


#  common table expression
select
    a.menu_name,
    b.category_name
from tbl_menu a
         join tbl_category b
              on a.category_code = b.category_code;

-- CTE
with menucate as (
    select
        menu_name,
        category_name
    from tbl_menu a
             join tbl_category b
                  on a.category_code = b.category_code
)select  *
from menucate
order by menu_name;