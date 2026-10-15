-- DML Data Manipulation Language
-- 테이블의 데이터를 추가, 수정, 삭제, 조회(DQL)할 때 사용

-- INSERT : 데이터 추가
insert into tbl_menu
values (null, '바나나해장국', 8500, 4, 'y');

-- null 값이 가능하거나 auto_increament가 있는 컬럼을 제외하고
-- insert 하고싶은 데이터컬럼을 지정해서 inser 할 수 있다.

insert into tbl_menu (menu_name, menu_price, category_code, orderable_status)
values ('바나나해장국', 8500, 4, 'y');

-- 컬럼명을 지정해서 값을 넣을 경우에는 데이터 입력 순서를 바꾸어도 된다
insert into tbl_menu (menu_price, category_code, orderable_status, menu_name)
values (8500, 4, 'Y', '바나나해장국');


insert into tbl_menu
values
    (null, '참치맛아이스크림', 3000, 1, 'Y'),
    (null, '김치맛아이스크림', 4500, 4, 'Y'),
    (null, '소시지맛아이스크림', 5500, 5, 'Y');


-- UPDATE : 데이터 수정
update tbl_menu
set -- 어떤대상을 바꿀건지
    orderable_status = 'N',
    menu_name = '김치맛옥수수아이스크림'
where
    menu_code = 41;

-- DELETE : 데이터 삭제
delete from tbl_menu
where
    menu_code = 19;

-- 가장 가격이 저렴한 메뉴 2가지 삭제
delete from tbl_menu
order by menu_price
limit  2;



-- REPLACE
-- 데이터를 입력할때 중복된 데이터는 덮어 쓸수 있도록 허용해줌

REPLACE into tbl_menu
values (1, '바나나해장국', 8500, 4, 'y');
