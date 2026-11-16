-- 1. 테이블 삭제 (외래키 제약 조건으로 인해 참조하는 테이블부터 삭제)
DROP TABLE IF EXISTS tbl_employee CASCADE;
DROP TABLE IF EXISTS tbl_department CASCADE;
DROP TABLE IF EXISTS tbl_job CASCADE;
DROP TABLE IF EXISTS tbl_location CASCADE;
DROP TABLE IF EXISTS tbl_national CASCADE;
DROP TABLE IF EXISTS tbl_sal_grade CASCADE;

-- 2. 테이블 생성 (참조되는 테이블부터 생성)
CREATE TABLE IF NOT EXISTS tbl_national
(
    -- column level constraints
    national_code CHAR(2) NOT NULL COMMENT '국가코드',
    national_name VARCHAR(35) NOT NULL COMMENT '국가명',
    -- table level constraints
    CONSTRAINT pk_national_code PRIMARY KEY (national_code)
) ENGINE=INNODB COMMENT '국가';

CREATE TABLE IF NOT EXISTS tbl_location
(
    -- column level constraints
    local_code CHAR(2) NOT NULL COMMENT '지역코드',
    national_code CHAR(2) NOT NULL COMMENT '국가코드',
    local_name VARCHAR(40) NOT NULL COMMENT '지역명',
    -- table level constraints
    CONSTRAINT pk_local_code PRIMARY KEY (local_code),
    CONSTRAINT fk_national_code FOREIGN KEY (national_code) REFERENCES tbl_national(national_code)
) ENGINE=INNODB COMMENT '지역';

CREATE TABLE IF NOT EXISTS tbl_department
(
    -- column level constraints
    dept_id CHAR(2) NOT NULL COMMENT '부서코드',
    dept_title VARCHAR(35) NOT NULL COMMENT '부서명',
    location_id CHAR(2) NOT NULL COMMENT '지역코드',
    -- table level constraints
    CONSTRAINT pk_dept_id PRIMARY KEY (dept_id),
    CONSTRAINT fk_location_id FOREIGN KEY (location_id) REFERENCES tbl_location(local_code)
) ENGINE=INNODB COMMENT '부서';

CREATE TABLE IF NOT EXISTS tbl_job
(
    -- column level constraints
    job_code CHAR(2) NOT NULL COMMENT '직급코드',
    job_name VARCHAR(35) NOT NULL COMMENT '직급명',
    -- table level constraints
    CONSTRAINT pk_job_code PRIMARY KEY (job_code)
) ENGINE=INNODB COMMENT '직급';

CREATE TABLE IF NOT EXISTS tbl_sal_grade
(
    -- column level constraints
    sal_level CHAR(2) NOT NULL COMMENT '급여등급',
    min_sal INT NOT NULL COMMENT '최소급여',
    max_sal INT NOT NULL COMMENT '최대급여',
    -- table level constraints
    CONSTRAINT pk_sal_level PRIMARY KEY (sal_level)
) ENGINE=INNODB COMMENT '급여등급';

CREATE TABLE IF NOT EXISTS tbl_employee
(
    -- column level constraints
    emp_id VARCHAR(3) NOT NULL COMMENT '사원번호',
    emp_name VARCHAR(20) NOT NULL COMMENT '직원명',
    emp_no CHAR(14) NOT NULL COMMENT '주민등록번호',
    email VARCHAR(25) NOT NULL COMMENT '이메일',
    phone VARCHAR(12) COMMENT '전화번호',
    dept_code CHAR(2) COMMENT '부서코드',
    job_code CHAR(2) NOT NULL COMMENT '직급코드',
    sal_level CHAR(2) NOT NULL COMMENT '급여등급',
    salary INT NOT NULL COMMENT '급여',
    bonus FLOAT COMMENT '보너스율',
    manager_id VARCHAR(3) COMMENT '관리자사번',
    hire_date DATE NOT NULL COMMENT '입사일',
    ent_date DATE COMMENT '퇴사일',
    ent_yn CHAR(1) NOT NULL DEFAULT 'N' COMMENT '퇴직여부',
    -- table level constraints
    CONSTRAINT pk_emp_id PRIMARY KEY (emp_id),
    CONSTRAINT fk_dept_code FOREIGN KEY (dept_code) REFERENCES tbl_department(dept_id),
    CONSTRAINT fk_job_code FOREIGN KEY (job_code) REFERENCES tbl_job(job_code),
    CONSTRAINT fk_sal_level FOREIGN KEY (sal_level) REFERENCES tbl_sal_grade(sal_level)
) ENGINE=INNODB COMMENT '사원';

-- 3. 데이터 삽입
INSERT INTO tbl_national (national_code, national_name) VALUES ('KO', '한국');
INSERT INTO tbl_national (national_code, national_name) VALUES ('JP', '일본');
INSERT INTO tbl_national (national_code, national_name) VALUES ('CH', '중국');
INSERT INTO tbl_national (national_code, national_name) VALUES ('US', '미국');
INSERT INTO tbl_national (national_code, national_name) VALUES ('RU', '러시아');

INSERT INTO tbl_location (local_code, national_code, local_name) VALUES ('L1', 'KO', 'ASIA1');
INSERT INTO tbl_location (local_code, national_code, local_name) VALUES ('L2', 'JP', 'ASIA2');
INSERT INTO tbl_location (local_code, national_code, local_name) VALUES ('L3', 'CH', 'ASIA3');
INSERT INTO tbl_location (local_code, national_code, local_name) VALUES ('L4', 'US', 'AMERICA');
INSERT INTO tbl_location (local_code, national_code, local_name) VALUES ('L5', 'RU', 'EU');

INSERT INTO tbl_department (dept_id, dept_title, location_id) VALUES ('D1', '인사관리부', 'L1');
INSERT INTO tbl_department (dept_id, dept_title, location_id) VALUES ('D2', '회계관리부', 'L1');
INSERT INTO tbl_department (dept_id, dept_title, location_id) VALUES ('D3', '마케팅부', 'L1');
INSERT INTO tbl_department (dept_id, dept_title, location_id) VALUES ('D4', '국내영업부', 'L1');
INSERT INTO tbl_department (dept_id, dept_title, location_id) VALUES ('D5', '해외영업1부', 'L2');
INSERT INTO tbl_department (dept_id, dept_title, location_id) VALUES ('D6', '해외영업2부', 'L3');
INSERT INTO tbl_department (dept_id, dept_title, location_id) VALUES ('D7', '해외영업3부', 'L4');
INSERT INTO tbl_department (dept_id, dept_title, location_id) VALUES ('D8', '기술지원부', 'L5');
INSERT INTO tbl_department (dept_id, dept_title, location_id) VALUES ('D9', '총무부', 'L1');

INSERT INTO tbl_job (job_code, job_name) VALUES ('J1', '대표');
INSERT INTO tbl_job (job_code, job_name) VALUES ('J2', '부사장');
INSERT INTO tbl_job (job_code, job_name) VALUES ('J3', '부장');
INSERT INTO tbl_job (job_code, job_name) VALUES ('J4', '차장');
INSERT INTO tbl_job (job_code, job_name) VALUES ('J5', '과장');
INSERT INTO tbl_job (job_code, job_name) VALUES ('J6', '대리');
INSERT INTO tbl_job (job_code, job_name) VALUES ('J7', '사원');

INSERT INTO tbl_sal_grade (sal_level, min_sal, max_sal) VALUES ('S1', 6000000, 10000000);
INSERT INTO tbl_sal_grade (sal_level, min_sal, max_sal) VALUES ('S2', 5000000, 5999999);
INSERT INTO tbl_sal_grade (sal_level, min_sal, max_sal) VALUES ('S3', 4000000, 4999999);
INSERT INTO tbl_sal_grade (sal_level, min_sal, max_sal) VALUES ('S4', 3000000, 3999999);
INSERT INTO tbl_sal_grade (sal_level, min_sal, max_sal) VALUES ('S5', 2000000, 2999999);
INSERT INTO tbl_sal_grade (sal_level, min_sal, max_sal) VALUES ('S6', 1000000, 1999999);

INSERT INTO tbl_employee
(emp_id, emp_name, emp_no, email, phone, dept_code, job_code, sal_level, salary, bonus, manager_id, hire_date, ent_date, ent_yn)
VALUES
    ('200', '선동일', '621215-1985634', 'sun_di@ohgiraffers.com', '01099546325', 'D9', 'J1', 'S1', 8000000, 0.3, NULL, '1990-02-06', NULL, 'N'),
    ('201', '송종기', '631106-1548654', 'song_jk@ohgiraffers.com', '01045686656', 'D9', 'J2', 'S1', 6000000, NULL, '200', '2001-09-01', NULL, 'N'),
    ('202', '노옹철', '861015-1356452', 'no_oc@ohgiraffers.com', '01066656263', 'D9', 'J2', 'S4', 3700000, NULL, '201', '2001-01-01', NULL, 'N'),
    ('203', '송은희', '631010-2653546', 'song_eh@ohgiraffers.com', '01077607879', 'D6', 'J4', 'S5', 2800000, NULL, '204', '1996-05-03', NULL, 'N'),
    ('204', '유재식', '660508-1342154', 'yoo_js@ohgiraffers.com', '01099999129', 'D6', 'J3', 'S4', 3400000, 0.2, '200', '2000-12-29', NULL, 'N'),
    ('205', '정중하', '770102-1357951', 'jung_jh@ohgiraffers.com', '01036654875', 'D6', 'J3', 'S4', 3900000, NULL, '204', '1999-09-09', NULL, 'N'),
    ('206', '박나라', '630709-2054321', 'pack_nr@ohgiraffers.com', '01096935222', 'D5', 'J7', 'S6', 1800000, NULL, '207', '2008-04-02', NULL, 'N'),
    ('207', '하이유', '690402-2040612', 'ha_iy@ohgiraffers.com', '01036654488', 'D5', 'J5', 'S5', 2200000, 0.1, '200', '1994-07-07', NULL, 'N'),
    ('208', '김해술', '870927-1313564', 'kim_hs@ohgiraffers.com', '01078634444', 'D5', 'J5', 'S5', 2500000, NULL, '207', '2004-04-30', NULL, 'N'),
    ('209', '심봉선', '750206-1325546', 'sim_bs@ohgiraffers.com', '0113654485', 'D5', 'J3', 'S4', 3500000, 0.15, '207', '2011-11-11', NULL, 'N'),
    ('210', '윤은해', '650505-2356985', 'youn_eh@ohgiraffers.com', '0179964233', 'D5', 'J7', 'S5', 2000000, NULL, '207', '2001-02-03', NULL, 'N'),
    ('211', '전형돈', '830807-1121321', 'jun_hd@ohgiraffers.com', '01044432222', 'D8', 'J6', 'S5', 2000000, NULL, '200', '2012-12-12', NULL, 'N'),
    ('212', '장쯔위', '780923-2234542', 'jang_zw@ohgiraffers.com', '01066682224', 'D8', 'J6', 'S5', 2550000, 0.25, '211', '2015-06-17', NULL, 'N'),
    ('213', '하동운', '621111-1785463', 'ha_dh@ohgiraffers.com', '01158456632', NULL, 'J6', 'S5', 2320000, 0.1, NULL, '1999-12-31', NULL, 'N'),
    ('214', '방명수', '850705-1313513', 'bang_ms@ohgiraffers.com', '01074127545', 'D1', 'J7', 'S6', 1380000, NULL, '200', '2010-04-04', NULL, 'N'),
    ('215', '대북혼', '881130-1050911', 'dae_bh@ohgiraffers.com', '01088808584', 'D5', 'J5', 'S4', 3760000, NULL, NULL, '2017-06-19', NULL, 'N'),
    ('216', '차태연', '770808-1364897', 'cha_ty@ohgiraffers.com', '01064643212', 'D1', 'J6', 'S5', 2780000, 0.2, '214', '2013-03-01', NULL, 'N'),
    ('217', '전지연', '770808-2665412', 'jun_jy@ohgiraffers.com', '01033624442', 'D1', 'J6', 'S4', 3660000, 0.3, '214', '2007-03-20', NULL, 'N'),
    ('218', '이오리', '870427-2232123', 'lee_or@ohgiraffers.com', '01022306545', NULL, 'J7', 'S5', 2890000, NULL, NULL, '2016-11-28', NULL, 'N'),
    ('219', '임시환', '660712-1212123', 'im_sh@ohgiraffers.com', NULL, 'D2', 'J4', 'S6', 1550000, NULL, NULL, '1999-09-09', NULL, 'N'),
    ('220', '이중석', '770823-1113111', 'lee_js@ohgiraffers.com', NULL, 'D2', 'J4', 'S5', 2490000, NULL, NULL, '2014-09-18', NULL, 'N'),
    ('221', '유하진', '800808-1123341', 'yoo_hj@ohgiraffers.com', NULL, 'D2', 'J4', 'S5', 2480000, NULL, NULL, '1994-01-20', NULL, 'N'),
    ('222', '이태림', '760918-2854697', 'lee_tr@ohgiraffers.com', '01033000002', 'D8', 'J6', 'S5', 2436240, 0.35, '100', '1997-09-12', '2017-09-12', 'Y');

COMMIT;