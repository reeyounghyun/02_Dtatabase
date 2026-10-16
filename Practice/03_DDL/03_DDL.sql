/* Q1)
tb1 테이블을 생성하고, pk, fk, col1 컬럼을 추가하시오.
col1 컬럼에 'Y'와 'N'만 허용되도록 CHECK 제약조건을 추가하시오.
*/

create table if not exists tb1
(
    pk int,
    fk int,
    col1 varchar(255)
    check (col1 in ('Y','N'))
);

/* Q2)
tb2 테이블을 생성하고, pk, fk, col1 컬럼을 추가하시오.
그리고 pk 컬럼을 AUTO_INCREMENT로 설정하시오.
*/
create table if not exists tb2
(
    pk int auto_increment key,
    fk int,
    col1 int
);

/* Q3)
위에서 생성한 tb2 테이블에 col2 컬럼을 추가하시오.
col2는 INT형이고, NOT NULL 제약조건이 적용되도록 하시오.
그리고 변경된 tb2 테이블의 구조를 확인하시오.
*/

alter table tb2
    add column col2 int not null default 0;


/* Q4)
위에서 tb2 테이블에 생성한 col2 컬럼을 삭제하시오.
그리고 변경된 tb2 테이블의 구조를 확인하시오.
*/

alter table tb2
    drop column col2;

/* Q5)
위에서 생성한 tb2 테이블에서 fk 컬럼의 이름을 change_fk로 변경하고, NOT NULL 제약조건을 추가하시오.
*/

alter table tb2
    change column fk change_fk BIGINT NOT NULL ;

describe tb2