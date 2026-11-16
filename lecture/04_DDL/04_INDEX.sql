-- INDEX
-- 테이블에서 원하는 행을 빠르게 찾기 위해 사용하는 데이터베이스 객체

DROP TABLE IF EXISTS phone;

CREATE TABLE phone
(
    phone_code  INT,
    phone_name  VARCHAR(100) NOT NULL,
    phone_price DECIMAL(10, 2) NOT NULL,
    company     VARCHAR(30) NOT NULL,
    CONSTRAINT pk PRIMARY KEY (phone_code)
);


INSERT INTO phone (phone_code, phone_name, phone_price, company)
VALUES
    (1, 'GalaxyS26',          1250000, 'Samsung'),
    (2, 'iPhone17',           1580000, 'Apple'),
    (3, 'GalaxyFold8',        2300000, 'Samsung'),
    (4, 'GalaxyS26Ultra',     1850000, 'Samsung'),
    (5, 'iPhone17Ultra',      1980000, 'Apple'),
    (6, 'GalaxyZFold8Ultra',  1800000, 'Samsung'),
    (7, 'Pixel11',            1350000, 'Google'),
    (8, 'Pixel11Pro',         1650000, 'Google');

select * from phone;

show index from phone;

# explain
-- select가 어떻게 실행될지 옵티마이지가 세운 계획을 보여줌
-- 옵티마이저 : SQL문을 가장효율적으로 실행할 방법을 선택하는 MYSQL 내부 가능
explain
select * from phone
where phone_name = 'GalaxyS26';

-- 단일컬럼 인덱스
-- 하나의컬럼으로 구성한 인덱스
create index idx_phone_name
on phone (phone_name);

show index from phone;

-- index를 고려할만한 컬러
    -- 1. WHERE 조건에 자주 사용하는 컬럼
    -- 2. JOIN 조건에 자주 사용하는 컬럼
    -- 3. ORDRE BY, GROUP BY 에 자주 사용하는 컬럼
    -- 4. 값의 종류가 충분히 다양해 많은 행을 거를 수 있는 컬럼

-- 데이터가 많아질수록 인텍스로 인해 발생하는 효율이 증가
explain
select
    *
from phone
where phone_name = 'GalaxyS26';
-- type - rel는 레퍼런스 라는 뜻이다.


explain
select
    *
from phone

    -- 강제로 인텍스 사용
    force index (idx_phone_name)
where phone_name = 'GalaxyS26';


-- 복합 인덱스
-- 두개 이상의 컬럼을 순서대로 묶어 만든 인덱스

-- 복합 인덱스
-- 두개 이상의 컬럼을 순서대로 묶어 만든 인덱스
-- phone_name, phone_price 을 복합인덱스로 만든다면
-- 1. phone_name만 사용하는 조건
-- 2. phone_name, phone_price을 함께 사용하는 조건 일경우 사용하기 좋다.
drop index idx_phone_name on phone;

create index idx_phone_name_price
    on phone (phone_name, phone_price);

show index from phone;

explain
select *
from phone
where phone_name = 'iphone17';

-- 커버링 인덱스
-- 필요한 컬럼이 모두 인덱스에 있으면 테이블 행을 추가로 읽지 않음. (실행계획 : USING INDEX)
explain
select
    phone_name ,
    phone_price
from phone
where phone_name = 'iPhone17';

analyze table phone; -- 인텍스 통계 갱신
optimize table phone; -- 테이블 공간을 재구성