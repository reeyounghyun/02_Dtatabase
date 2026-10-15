/* Q1)
tbl_employee 테이블에서 사원명, 이메일, 이메일의 '@' 앞부분인 아이디를 조회하시오.
(힌트: substring_index())
*/
select
    emp_name,
    email,
    substring_index(email, '@',1) AS 아이디
from tbl_employee;


/* Q2)
tbl_employee 테이블에서 직원들의 주민번호를 조회하여 사원명, 생년, 생월, 생일을 각각 분리하여 조회할 것.
(단, 컬럼의 별칭은 사원명, 생년, 생월, 생일로 한다.)
(힌트: substring())
*/

select
    emp_name as 사원명,
    substring(emp_no, 1,2)as 생년,
    substring(emp_no, 3,2 )as 생월,
    substring(emp_no, 5,2 )as 생일
from tbl_employee;


/* Q3)
tbl_employee 테이블에서 모든 직원의 입사일과 현재 날짜가 달력 기준으로 몇 개월 차이인지 계산하여 이름과 개월 수를 조회하시오.
(힌트: period_diff(), year(), month(), now())
*/

select
    emp_name,
        period_diff(
         year(now()) * 100 + month(now()),
         year(hire_date) * 100 + month(hire_date)
        ) as 개월수
from tbl_employee;


/* Q4)
tbl_employee 테이블에서 사원명, 급여를 조회하시오.
단, 급여는 '￦9,000,000' 형식으로 표시할 것.
(힌트: concat(), format())
*/
select
    emp_name,
    concat('￦', format(salary, 0)) as 급여
from tbl_employee;


/* Q5)
tbl_employee 테이블에서 2000년도 이후에 입사한 직원들의 급여를 15% 인상했을 때
인상된 급여가 300만원 이상인 직원의 사원명, 급여, 인상급여를 조회하시오.
단, 인상급여는 십만원 미만의 금액을 버릴 것.
(힌트: truncate(), year() / truncate()의 두 번째 인자에 -5를 사용한다.)
*/

select
    emp_name,
    salary,
    truncate(salary * 1.15, -5) as 인상급여
from tbl_employee
where year(hire_date) >= 2000  -- 2000년도 이후에 입사한
  and truncate(salary * 1.15, -5) >= 3000000; -- 인상된 급여가 300만원 이상인