create view dept_avg_salary_with_employee_count as
SELECT department_name, sum, count --outer query/main query 
from (
        select department_name, count(*), sum(salary)
        from employees
        GROUP BY
            department_name
    ) as sum_dept_salary

select * from dept_avg_salary_with_employee_count