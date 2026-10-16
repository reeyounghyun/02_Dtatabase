-- DDl 데이터 정의어
-- 데이터베이스의 구조를 생성, 변경, 초기화, 삭제 할때 사용한다.

-- CREATE : 새로운 객체를 생성한다
-- ALTER : 기존 객체의 구조를 변경
-- TRUNCATE : 테이블의 구조는 유지하고 모든행을 삭제
-- DROP : 객체의 구조와 데이터를 모두 삭제

# 1.테이블 생성
## if not exists 없을 때만 생성해줌
create table if not exists tb1
(
    pk int,
    fk int,
    col1 varchar(255) -- (용량/크기 작성)
    check ( col1 in ('Y', 'N') ) -- 제약조건
);
-- 구조 출력
describe tb1;
insert into  tb1 ()
values (1,10,'Y');

select * from tb1;


-- tb2
-- auto_increment : 행을 추가할때 자동으로 번호를 생성해주는 기능
-- Primary Key 또는 Unique KEY가 설정된 컬럼에 사용
create table if not exists tb2
(
    pk   int auto_increment key,
    fk   int,
    col1 varchar(255)
        check ( col1 in ('Y', 'N') )
);

describe tb2;

insert into tb2(fk,col1)
values
    (10,'y'),
    (10,'N');

select * from tb2;

# 2.테이블 수정

-- 컬럼 추가
alter table tb2
    add column col2 int not null default 0;

describe tb2; -- 구조 출력

-- 컬럼 삭제
alter table tb2
   drop column col2;

describe tb2; -- 구조 출력

-- 컬럼 수정
-- 이름을 바꾸면서 데이터 타입, 제약조건 다시작성
alter table tb2
    -- change column 전부다 삭제
    -- [조건] 이름, 컬럼정의(데이터타입, 제약조건)
    change column fk change_fk BIGINT NOT NULL ;

describe  tb2; -- 구조 출력


-- 이름은 변경하지 않고, 데이터 타입, 제약조건 다시작성
alter table tb2
modify column change_fk int ;

describe tb2; -- 구조 출력



-- 이름만 변경, 데이터 타입, 제약조건 다시작성
alter table tb2
    rename column change_fk to fk;

describe tb2; -- 구조 출력


-- PRIMARY KRY 제약조건 삭제 및 추가

-- autoincrement 컬럼 : KEY로 추가가 되어있어야함.
-- alter table tb2 drop primary key
alter table tb2
modify column pk int not null;

alter table tb2 drop primary key;

describe tb2;

alter table tb2
add primary key (pk);

alter table tb2
    modify  column  pk int not null  auto_increment;


-- 삭제
create table if not exists tb3
(
    pk   int auto_increment
        primary key,
    fk   int          null,
    col1 varchar(255) null,
    check ( col1 in ('Y', 'N') )
);
    comment '삭제할 tb3입니다.';

create table if not exists tb3
(
    pk   int auto_increment
        primary key,
    fk   int          null,
    col1 varchar(255) null,
    check ( col1 in ('Y', 'N') )
);

create table if not exists tb3
(
    pk   int auto_increment
        primary key,
    fk   int          null,
    col1 varchar(255) null,
    check ( col1 in ('Y', 'N') )
);

create table if not exists tb4
(
    pk   int auto_increment
        primary key,
    fk   int          null,
    col1 varchar(255) null,
    check ( col1 in ('Y', 'N') )
);

create table if not exists tb5
(
    pk   int auto_increment
        primary key,
    fk   int          null,
    col1 varchar(255) null,
    check ( col1 in ('Y', 'N') )
);

-- 테이블 삭제
drop table if exists tb3, tb4, tb5;


-- Truncate
-- 테이블 구조는 유지하면서 모든 행(데이터)는 전부 삭제한다.
-- Auto_Increment의 값도 초기화 된다.


create table if not exists tb3
(
    pk   int auto_increment
        primary key,
    fk   int          null,
    col1 varchar(255) null,
    check ( col1 in ('Y', 'N') )
);

insert into tb3 (fk, col1)
values
    (10, 'y'),
    (20, 'y'),
    (30, 'y'),
    (40, 'y'),
    (50, 'y');

select * from tb3;

delete from tb3
where pk = 5;

insert into  tb3 (fk, col1)
values (50, 'Y');

truncate table tb3;

-- delete: 선택한 행 삭제 하기 위해 사용 /
-- truncate - 테이블구조를 초기화해 행을 삭제하기 위해 사용 /
-- reop - 모든 행과 구조 삭제





