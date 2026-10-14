-- 1. 테이블 삭제
DROP TABLE IF EXISTS tbl_payment_order CASCADE;
DROP TABLE IF EXISTS tbl_payment CASCADE;
DROP TABLE IF EXISTS tbl_order_menu CASCADE;
DROP TABLE IF EXISTS tbl_order CASCADE;
DROP TABLE IF EXISTS tbl_menu CASCADE;
DROP TABLE IF EXISTS tbl_category CASCADE;

-- 2. 테이블 생성
CREATE TABLE IF NOT EXISTS tbl_category
(
    -- column level constraints
    category_code INT AUTO_INCREMENT COMMENT '카테고리코드',
    category_name VARCHAR(30) NOT NULL COMMENT '카테고리명',
    ref_category_code INT COMMENT '상위카테고리코드',
    -- table level constraints
    CONSTRAINT pk_category_code PRIMARY KEY (category_code),
    CONSTRAINT fk_ref_category_code FOREIGN KEY (ref_category_code) REFERENCES tbl_category (category_code)
) ENGINE=INNODB COMMENT '카테고리';

CREATE TABLE IF NOT EXISTS tbl_menu
(
    -- column level constraints
    menu_code INT AUTO_INCREMENT COMMENT '메뉴코드',
    menu_name VARCHAR(30) NOT NULL COMMENT '메뉴명',
    menu_price INT NOT NULL COMMENT '메뉴가격',
    category_code INT NOT NULL COMMENT '카테고리코드',
    orderable_status CHAR(1) NOT NULL COMMENT '주문가능상태',
    -- table level constraints
    CONSTRAINT pk_menu_code PRIMARY KEY (menu_code),
    CONSTRAINT fk_category_code FOREIGN KEY (category_code) REFERENCES tbl_category (category_code)
) ENGINE=INNODB COMMENT '메뉴';


CREATE TABLE IF NOT EXISTS tbl_order
(
    -- column level constraints
    order_code INT AUTO_INCREMENT COMMENT '주문코드',
    order_date VARCHAR(8) NOT NULL COMMENT '주문일자',
    order_time VARCHAR(8) NOT NULL COMMENT '주문시간',
    total_order_price INT NOT NULL COMMENT '총주문금액',
    -- table level constraints
    CONSTRAINT pk_order_code PRIMARY KEY (order_code)
) ENGINE=INNODB COMMENT '주문';


CREATE TABLE IF NOT EXISTS tbl_order_menu
(
    -- column level constraints
    order_code INT NOT NULL COMMENT '주문코드',
    menu_code INT NOT NULL COMMENT '메뉴코드',
    order_amount INT NOT NULL COMMENT '주문수량',
    -- table level constraints
    CONSTRAINT pk_comp_order_menu_code PRIMARY KEY (order_code, menu_code),
    CONSTRAINT fk_order_menu_order_code FOREIGN KEY (order_code) REFERENCES tbl_order (order_code),
    CONSTRAINT fk_order_menu_menu_code FOREIGN KEY (menu_code) REFERENCES tbl_menu (menu_code)
) ENGINE=INNODB COMMENT '주문별메뉴';


CREATE TABLE IF NOT EXISTS tbl_payment
(
    -- column level constraints
    payment_code INT AUTO_INCREMENT COMMENT '결제코드',
    payment_date VARCHAR(8) NOT NULL COMMENT '결제일',
    payment_time VARCHAR(8) NOT NULL COMMENT '결제시간',
    payment_price INT NOT NULL COMMENT '결제금액',
    payment_type VARCHAR(6) NOT NULL COMMENT '결제구분',
    -- table level constraints
    CONSTRAINT pk_payment_code PRIMARY KEY (payment_code)
) ENGINE=INNODB COMMENT '결제';


CREATE TABLE IF NOT EXISTS tbl_payment_order
(
    -- column level constraints
    order_code INT NOT NULL COMMENT '주문코드',
    payment_code INT NOT NULL COMMENT '결제코드',
    -- table level constraints
    CONSTRAINT pk_comp_payment_order_code PRIMARY KEY (payment_code, order_code),
    CONSTRAINT fk_payment_order_order_code FOREIGN KEY (order_code) REFERENCES tbl_order (order_code),
    CONSTRAINT fk_payment_order_payment_code FOREIGN KEY (payment_code) REFERENCES tbl_payment (payment_code)
) ENGINE=INNODB COMMENT '결제별주문';

-- 3. 데이터 삽입
INSERT INTO tbl_category VALUES (null, '식사', null);
INSERT INTO tbl_category VALUES (null, '음료', null);
INSERT INTO tbl_category VALUES (null, '디저트', null);
INSERT INTO tbl_category VALUES (null, '한식', 1);
INSERT INTO tbl_category VALUES (null, '중식', 1);

INSERT INTO tbl_category VALUES (null, '일식', 1);
INSERT INTO tbl_category VALUES (null, '퓨전', 1);
INSERT INTO tbl_category VALUES (null, '커피', 2);
INSERT INTO tbl_category VALUES (null, '쥬스', 2);
INSERT INTO tbl_category VALUES (null, '기타', 2);

INSERT INTO tbl_category VALUES (null, '동양', 3);
INSERT INTO tbl_category VALUES (null, '서양', 3);

INSERT INTO tbl_menu VALUES (null, '열무김치라떼', 4500, 8, 'Y');
INSERT INTO tbl_menu VALUES (null, '우럭스무디', 5000, 10, 'Y');
INSERT INTO tbl_menu VALUES (null, '생갈치쉐이크', 6000, 10, 'Y');
INSERT INTO tbl_menu VALUES (null, '갈릭미역파르페', 7000, 10, 'Y');
INSERT INTO tbl_menu VALUES (null, '앙버터김치찜', 13000, 4, 'N');

INSERT INTO tbl_menu VALUES (null, '생마늘샐러드', 12000, 4, 'Y');
INSERT INTO tbl_menu VALUES (null, '민트미역국', 15000, 4, 'Y');
INSERT INTO tbl_menu VALUES (null, '한우딸기국밥', 20000, 4, 'Y');
INSERT INTO tbl_menu VALUES (null, '홍어마카롱', 9000, 12, 'Y');
INSERT INTO tbl_menu VALUES (null, '코다리마늘빵', 7000, 12, 'N');

INSERT INTO tbl_menu VALUES (null, '정어리빙수', 10000, 10, 'Y');
INSERT INTO tbl_menu VALUES (null, '날치알스크류바', 2000, 10, 'Y');
INSERT INTO tbl_menu VALUES (null, '직화구이젤라또', 8000, 12, 'Y');
INSERT INTO tbl_menu VALUES (null, '과메기커틀릿', 13000, 6, 'Y');
INSERT INTO tbl_menu VALUES (null, '죽방멸치튀김우동', 11000, 6, 'N');

INSERT INTO tbl_menu VALUES (null, '흑마늘아메리카노', 9000, 8, 'Y');
INSERT INTO tbl_menu VALUES (null, '아이스가리비관자육수', 6000, 10, 'Y');
INSERT INTO tbl_menu VALUES (null, '붕어빵초밥', 35000, 6, 'Y');
INSERT INTO tbl_menu VALUES (null, '까나리코코넛쥬스', 9000, 9, 'Y');
INSERT INTO tbl_menu VALUES (null, '마라깐쇼한라봉', 22000, 5, 'N');

INSERT INTO tbl_menu VALUES (null, '돌미나리백설기', 5000, 11, 'Y');
INSERT INTO tbl_menu VALUES (null, '우주정복 마카롱', 5000, 12, 'Y');
INSERT INTO tbl_menu VALUES (null, '초콜릿 피자', 8000, 7, 'Y');
INSERT INTO tbl_menu VALUES (null, '모험가의 미트볼', 15000, 4, 'Y');
INSERT INTO tbl_menu VALUES (null, '바다의 속삭임 스무디', 6500, 10, 'Y');

INSERT INTO tbl_menu VALUES (null, '달빛 요정 케이크', 7500, 12, 'Y');
INSERT INTO tbl_menu VALUES (null, '해적왕의 보물 상자', 12000, 11, 'Y');
INSERT INTO tbl_menu VALUES (null, '신비로운 유니콘 아이스크림', 5500, 10, 'Y');
INSERT INTO tbl_menu VALUES (null, '드래곤 숨결 핫소스', 3000, 1, 'Y');
INSERT INTO tbl_menu VALUES (null, '불타는 치킨', 9900, 1, 'N');

INSERT INTO tbl_menu VALUES (null, '펭귄의 꿈 파르페', 8500, 10, 'Y');
INSERT INTO tbl_menu VALUES (null, '외계인의 초록 젤리', 4200, 11, 'Y');
INSERT INTO tbl_menu VALUES (null, '마법사의 램버거', 11000, 1, 'Y');
INSERT INTO tbl_menu VALUES (null, '귀신이 곡한 누룽지', 7000, 5, 'Y');
INSERT INTO tbl_menu VALUES (null, '백년초 스무디', 5600, 10, 'Y');

INSERT INTO tbl_menu VALUES (null, '초능력자의 에너지볼', 9500, 2, 'Y');

COMMIT;