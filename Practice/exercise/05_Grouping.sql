# select *
# from employeedb.tbl_employee;

/* Q1)
전체 직원 수와 전 직원 급여의 합계를 조회하시오.
(힌트: COUNT, SUM)
*/

select count(emp_name),
       sum(salary)
from employeedb.tbl_employee;


/* Q2)
부서코드별로 부서코드, 급여 합계, 평균 급여(소수점 이하 버림), 직원 수를 조회하시오.
부서가 배정되지 않은 직원도 하나의 그룹으로 포함하고,
부서코드를 기준으로 오름차순 정렬하시오.
(힌트: GROUP BY, SUM, AVG, FLOOR, COUNT)
*/
select dept_code,
       sum(salary),
       avg(salary),
       floor(avg(salary)),
       count(*)
from tbl_employee
group by dept_code
ORDER BY dept_code asc;


/* Q3)
보너스를 받는 직원만 대상으로 직급코드별 직원 수를 조회하시오.
직급코드를 기준으로 오름차순 정렬하시오.
(힌트: WHERE, GROUP BY, COUNT)
*/
select job_code,
       count(*) as 직원수
from tbl_employee
where bonus > 0
group by job_code
order by job_code asc;


/* Q4)
부서별 평균 급여가 300만원 이상인 부서의 부서명, 직원 수,
평균 급여(소수점 이하 버림)를 조회하시오.
평균 급여를 기준으로 내림차순 정렬하시오.
(힌트: JOIN, GROUP BY, HAVING)
*/

/* Q5)
직급별 직급명, 직원 수, 급여 합계를 조회하고 마지막 행에 전체 직원 수와
전체 급여 합계가 표시되도록 하시오.
(힌트: JOIN, GROUP BY, WITH ROLLUP, COALESCE)
*/