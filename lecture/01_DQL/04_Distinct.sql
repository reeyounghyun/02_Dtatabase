-- DISTINCT
-- 조회한 결과에서 중복된 행을 제거할 때 사용
-- 여러 컬럼을 조회하면 컬럼 값의 조합을 기준으로 중복을 판단.


use menudb;
select category_code
from tbl_menu;

-- 단일 열 중복 제거
select
    distinct category_code
from tbl_menu;

-- null값도 중복 제거가 된다.
select
    distinct ref_category_code
from tbl_category;

-- 열이 여러 개인 경우 distinct
--   category_code, orderable_status가 같을 때 중복 제거
select distinct
    category_code,
    orderable_status
from tbl_menu
order by  category_code;