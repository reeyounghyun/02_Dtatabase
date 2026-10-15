/* Q1)
tbl_employee 테이블의 사번(사원번호), 이름을 조회하시오.
*/
select
    manager_id,
    emp_name
from tbl_employee;



/* Q2)
tbl_employee 테이블에서 모든 사원의 이름과 급여를 조회하시오.
*/

select
    emp_name,
    salary
from tbl_employee;

/* Q3)
tbl_employee 테이블에서 모든 사원의 이름, 월 급여, 급여에 12를 곱한 연봉을 조회하시오.
단, 연봉을 계산한 컬럼의 별칭은 annual_salary로 지정하시오.
*/

select
    emp_name,
    salary / 12 as 12를나눈값,
    salary * 12 as 12를곱한값,
    salary as annual_salary
from tbl_employee;



