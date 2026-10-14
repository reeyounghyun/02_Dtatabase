/* Q1)
tbl_employee 테이블에서 부서코드가 D9인 사원을 조회하시오.
*/
select
    *
from
    tbl_employee
where
    dept_code = 'D9';
/* Q2)
부서코드가 D6이고 급여를 200만원보다 많이 받는 직원의 이름, 부서코드, 급여를 조회하시오.
*/

select
    emp_name,
    dept_code,
    salary
from
    tbl_employee
where
    dept_code = 'D6' AND
    salary > 2000000;

/* Q3)
보너스를 받지 않는 사원에 대해 사번, 직원명, 급여, 보너스를 조회하시오.
*/
select
    manager_id,
    emp_name,
    salary,
    bonus
from
    tbl_employee
where bonus is null;

/* Q4)
tbl_employee 테이블에서 급여를 350만원 이상, 550만원 이하를 받는 직원의
사번, 이름, 급여, 부서코드, 직급코드를 조회하시오.
*/

select
    emp_id,
    emp_name,
    salary,
    dept_code,
    job_code
from
    tbl_employee
where
    salary between 3500000 and 5500000;


/* Q5)
tbl_employee 테이블에서 '하'가 이름에 포함된 직원의 이름, 주민번호, 부서코드를 조회하시오.
*/
select
    emp_name,
    emp_no,
    dept_code
from
    tbl_employee
where
    emp_name like '하%';



/* Q6)
tbl_employee 테이블에서 부서가 배정된 직원들의 부서코드를 중복 없이 조회하시오.
단, 부서코드를 기준으로 오름차순 정렬하시오.
(힌트: WHERE, DISTINCT, ORDER BY)
*/

select distinct
    dept_code
from
    tbl_employee
where
    dept_code is not null
order by
    dept_code asc;


/* Q7)
tbl_employee 테이블에서 급여가 300만원 이상인 직원 중 급여가 높은 5명의
사번, 직원명, 급여를 조회하시오.
단, 급여가 같으면 사번을 기준으로 오름차순 정렬하시오.
(힌트: WHERE, ORDER BY, LIMIT)
*/

select
    emp_id,
    emp_name,
    salary
from
    tbl_employee
where
    salary >= 3000000
order by
    salary desc,
    emp_id asc  -- 급여가 같으면 사번 오름차순
limit 5;

/*
WHERE
- 조건에 맞는 행만 걸러내는 절

IN
- WHERE 안에서 쓰는 연산자로, 값이 괄호 안 목록 중 하나라도 일치하면 참

ORDER BY
- 결과를 정렬하는 절이에요. asc는 오름차순(기본값, 작은 값부터), desc는 내림차순

LIMIT
- 결과에서 위에서부터 몇 행만 가져올지 정하는 절이에요

*/
/* Q8)
tbl_employee 테이블에서 부서코드가 D5 또는 D9이고 2000년 이후에 입사한 직원 중
입사일이 빠른 3명의 사번, 직원명, 부서코드, 입사일을 조회하시오.
(힌트: WHERE, IN, ORDER BY, LIMIT)
*/
select
    emp_id,
    emp_name,
    dept_code,
    hire_date
from
    tbl_employee
where
    dept_code in ('D5', 'D9')
  and hire_date >= '2000-01-01'
order by
    hire_date asc
limit 3;

/* Q9)
tbl_employee 테이블에서 보너스를 받는 직원들의 직급코드를 중복 없이 조회하시오.
단, 직급코드를 기준으로 오름차순 정렬하시오.
(힌트: WHERE, IS NOT NULL, DISTINCT, ORDER BY)
*/

select distinct
    dept_code -- 보너스를 받는 직원들의 "직급코드"
from tbl_employee
where bonus is null  -- "null값이 아닌 값만 추출" = 보너스를 받은사람
order by
    dept_code asc; -- 오름차순




/* Q10)
tbl_employee 테이블에서 퇴직하지 않은 직원을 급여가 높은 순으로 정렬하시오.
급여가 같으면 사번을 기준으로 오름차순 정렬하고, 상위 3명을 건너뛴 다음 3명의
사번, 직원명, 급여를 조회하시오.
(힌트: WHERE, ORDER BY, LIMIT 시작위치, 개수)
*/

select
    emp_id,  -- 아이디
    emp_name, -- 이름
    salary -- 급여
from tbl_employee
where ent_yn = 'N'
order by
    salary desc, -- 급여 내림차순
    emp_id asc -- 아이디 오름차순
limit 3, 3;