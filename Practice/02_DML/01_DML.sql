/* Q1)
사원 테이블(tbl_employee)에 새로운 사원을 추가하시오.
사번: 901, 이름: 이지영, 주민등록번호: 910123-1234567, 이메일: lee_jy@gmail.com,
전화번호: 01055551234, 부서코드: D2, 직급코드: J2, 급여등급: S3,
급여: 3500000, 보너스: 0.15, 관리자사번: 201, 입사일: 현재 날짜,
퇴사일: NULL, 퇴직여부: N
(힌트: INSERT INTO, VALUES, CURDATE())
*/

insert into tbl_employee (emp_id, emp_name, emp_no, email, phone,
                          dept_code, job_code, sal_level, salary,
                          bonus, manager_id, hire_date, ent_date, ent_yn)
VALUES ('901', '이지영', '910123-1234567', 'lee_jy@gmail.com', '01055551234',
        'D2', 'J2', 'S3', 3500000,
        0.15, '201', curdate(), null, 'N'
       );


/* Q2)
사원 테이블(tbl_employee)에서 방명수 사원의 급여와 보너스를
   유재식 사원과 동일하게 변경하시오.
   -- 214,방명수,850705-1313513,bang_ms@ohgiraffers.com,01074127545,D1,J7,S6,1380000,,200,2010-04-04,,N
   -- 204,유재식,660508-1342154,yoo_js@ohgiraffers.com,01099999129,D6,J3,S4,3400000,0.2,200,2000-12-29,,N


(힌트: UPDATE, 서브쿼리, JOIN을 이용한 임시 테이블)
*/

update tbl_employee a
    join (
        select salary, bonus       -- 유재식의 급여와 보너스 조회
        from tbl_employee
        where emp_id = '204'
    ) b on a.emp_id = '214'         -- 변경 대상: 방명수
set
    a.salary = b.salary,       -- 유재식의 급여로 변경
    a.bonus = b.bonus;


/* Q3)
사원 테이블(tbl_employee)에서 노옹철, 전형돈, 정중하, 하동운 사원의 급여와 보너스를 유재식 사원과 동일하게 변경하시오.
(힌트: UPDATE, 서브쿼리, JOIN을 이용한 임시 테이블, IN)
*/




/* Q4)
사원 테이블(tbl_employee)에서 사번이 901인 사원을 삭제하시오.
(힌트: DELETE FROM, WHERE)
*/

/* Q5)
사원 테이블(tbl_employee)에서 부서코드가 D1인 모든 사원을 삭제하시오.
(힌트: DELETE FROM, WHERE)
*/