/* Q1)
사원명이 '노옹철'인 직원과 같은 부서에 속한 직원의 사원명과 부서코드를 조회하시오.
(힌트: WHERE절의 서브쿼리)
*/

select emp_name,
       dept_code
from tbl_employee
where dept_code = (select dept_code
                   from tbl_employee
                   where emp_name = '노옹철');


/* Q2)
전 직원의 평균 급여보다 많은 급여를 받는 직원의 사번, 사원명, 직급코드,
급여를 조회하고 급여를 기준으로 내림차순 정렬하시오.
(힌트: AVG를 사용한 서브쿼리)
*/

select emp_id,
       emp_name,
       job_code,
       salary
from tbl_employee
where salary > (select avg(salary)
                from tbl_employee)

order by  salary desc;


/* Q3)
부서별 급여 합계를 먼저 구한 뒤, 급여 합계가 가장 큰 부서의 부서명과
급여 합계를 조회하시오.
(힌트: FROM절 서브쿼리, GROUP BY, JOIN, ORDER BY, LIMIT)
*/


/* Q4)
부서가 배정된 직원 중 각 부서의 최고 급여를 받는 직원의 사원명, 직급명,
부서명, 급여를 조회하시오. 최고 급여가 같은 직원은 모두 조회하시오.
(힌트: 상관 서브쿼리, MAX, JOIN)
*/

/* Q5)
보너스를 받는 직원의 부서코드를 CTE로 먼저 정의하시오.
그 CTE와 EXISTS를 사용하여 보너스를 받는 직원이 한 명 이상 있는 부서의
부서코드와 부서명을 조회하고, 부서코드를 기준으로 오름차순 정렬하시오.
(힌트: WITH, EXISTS)
*/

with bonus_depts as (             -- bonus_depts라는 이름의 CTE 정의
    select dept_code             -- 보너스를 받는 직원의 부서코드 조회
    from tbl_employee
    where bonus > 0              -- 보너스가 NULL이거나 0인 직원 제외
)
select
    d.dept_id,                   -- 부서코드
    d.dept_title                 -- 부서명
from tbl_department d            -- 부서 테이블에 d라는 별명 지정

where exists (                   -- 아래 조건에 맞는 행이 하나라도 있으면 부서 조회
    select 1                     -- 값 자체가 아니라 행의 존재 여부만 확인
    from bonus_depts b           -- 위에서 정의한 CTE를 사용
    where b.dept_code = d.dept_id -- 현재 부서에 보너스를 받는 직원이 있는지 확인
)
order by d.dept_id asc;           -- 부서코드 기준 오름차순 정렬