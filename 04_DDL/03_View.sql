-- VIEW
-- select문을 이름과 함께 저장해서 테이블처럼 사용하는 가상테이블

-- 장점
-- 복잡한 SELECT 문을 단순하게 재사용 가능하다.
-- 사용자에게 필요한 컬럼과 행만 공개할 수 있다.

create view hansik as
select menu_code,
       menu_name,
       menu_price,
       category_code,
       orderable_status
from tbl_menu
where category_code = 4
with check option;  -- viwe 입력, 수정을 행이 view의 wher 조건을 만족하도록 검사

select * from hansik;

insert into tbl_menu (menu_name, menu_price, category_code, orderable_status)
values ('뷰확인용 닭칼국수 김밥', 5000, 4, 'Y');

set @menu_code = last_insert_id();


select *
from hansik
where menu_code = 37;

-- 테스트 데이터 삭제
delete from tbl_menu
where menu_code = 37;


-- VIEW를 통해 DML
insert into hansik (menu_name, menu_price, category_code, orderable_status)
values ('뷰확인용 닭칼국수 김밥', 5000, 4, 'Y');

-- with check option으로 view의 where절의 조건을 만족하지 못해 생성불가
insert into hansik (menu_name, menu_price, category_code, orderable_status)
values ('뷰확인용 닭칼국수 김밥', 5000, 4, 'Y');

select * from hansik;

set @menu_code = last_insert_id();

select *
from hansik
where menu_code = @menu_code;

select *
from tbl_menu
where menu_code = @menu_code;


-- DML문이 제한되는 VIEW
-- DISTINCT, GROUP BY (Having), 집계 함수, UNION, 계산식
-- 여러 테이블을 JOIN 했을 경우 (VIEW 정의를 어떻게 했느냐, VIEW에서 어떤 컬럼을 변경하려고 하느냐)

CREATE VIEW category_menu_summary AS
SELECT
    category_code,
    COUNT(*) AS menu_count,
    FLOOR(AVG(menu_price)) AS avg_price
FROM
    tbl_menu
GROUP BY
    category_code;


update category_menu_summary
set avg_price = 10000
where category_code = 4;

-- 뷰 재정의
select * from hansik;

create or replace view hansik as
select a.menu_code,
       a.menu_name,
       truncate(a.menu_price / 1000,1) as price_in_thousands,
        b.category_name
from tbl_menu a
join tbl_category b on a.category_code = b.category_code
where b.category_code = 4;

# view 삭제
drop view if exists category_menu_summary;

# select * from category_menu_summary;

show full tables
where table_type = 'VIEW';







