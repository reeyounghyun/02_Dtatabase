/* Q1)
직원의 사번, 사원명, 직급명을 조회하시오.
사번을 기준으로 오름차순 정렬하시오.
[테이블 정보]
- tbl_employee: 사번(emp_id), 사원명(emp_name), 직급코드(job_code)
- tbl_job: 직급코드(job_code), 직급명(job_name)
(힌트: INNER JOIN)
*/

select a.emp_id,
       a.emp_name,
       b.job_name
from tbl_employee a
         join tbl_job b
              on a.job_code = b.job_code
order by a.emp_id asc;


/* Q2)
모든 직원의 사번, 사원명, 부서명을 조회하시오.
부서가 배정되지 않은 직원도 결과에 포함하고, 사번을 기준으로 오름차순 정렬하시오.
[테이블 정보]
- tbl_employee: 사번(emp_id), 사원명(emp_name), 부서코드(dept_code)
- tbl_department: 부서코드(dept_id), 부서명(dept_title)
(힌트: LEFT JOIN)
*/

select a.emp_id,
       a.emp_name,
       b.dept_title
from tbl_employee a
         left join tbl_department b
                   on a.dept_code = b.dept_id
order by emp_id asc;

/* Q3)
보너스를 받는 모든 직원의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.
부서가 배정되지 않은 직원도 결과에 포함하시오.
[테이블 정보]
- tbl_employee: 사원명(emp_name), 보너스포인트(bonus), 부서코드(dept_code)
- tbl_department: 부서코드(dept_id), 부서명(dept_title), 지역코드(location_id)
- tbl_location: 지역코드(local_code), 근무지역명(local_name)
(힌트: IS NOT NULL, LEFT JOIN)
*/

select a.emp_name, -- 사원명
       a.bonus,  -- 보너스,
       b.dept_title, -- 부서명
       c.local_name -- 근무지역
from tbl_employee a -- 사용할 테이블
         left join tbl_department b -- 왼쪽에 b집합
                   on a.dept_code = b.dept_id
         left join tbl_location c -- 오른쪽에 c집합
                   on b.location_id = c.local_code
where a.bonus is not null;



/* Q4)
한국(KO)과 일본(JP)에 근무하는 직원의 사원명, 부서명, 지역명, 국가명을 조회하시오.
국가코드, 부서코드, 사번 순으로 오름차순 정렬하시오.
[테이블 정보]
- tbl_employee: 사번(emp_id), 사원명(emp_name), 부서코드(dept_code)
- tbl_department: 부서코드(dept_id), 부서명(dept_title), 지역코드(location_id)
- tbl_location: 지역코드(local_code), 지역명(local_name), 국가코드(national_code)
- tbl_national: 국가코드(national_code), 국가명(national_name)
(힌트: 여러 테이블 JOIN, IN)
*/



/* Q5)
모든 직원의 사번, 사원명, 관리자명을 조회하시오.
관리자가 없거나 관리자 정보가 등록되지 않은 직원도 결과에 포함하고,
사번을 기준으로 오름차순 정렬하시오.
[테이블 정보]
- tbl_employee: 사번(emp_id), 사원명(emp_name), 관리자사번(manager_id)
- 같은 tbl_employee 테이블을 서로 다른 별칭으로 두 번 사용한다.
(힌트: SELF JOIN, LEFT JOIN)
*/