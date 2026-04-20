create table employees (
    employee_name VARCHAR(25),
    department_name VARCHAR(25),
    salary NUMERIC,
    hire_date DATE
)

INSERT INTO
    employees (
        employee_name,
        department_name,
        salary,
        hire_date
    )
VALUES (
        'John Smith',
        'IT',
        85000,
        '2022-03-15'
    ),
    (
        'Ayesha Rahman',
        'HR',
        60000,
        '2021-07-10'
    ),
    (
        'Rajesh Kumar',
        'Accounts',
        70000,
        '2020-11-05'
    ),
    (
        'Fatima Noor',
        'IT',
        90000,
        '2023-01-20'
    ),
    (
        'Michael Lee',
        'Marketing',
        65000,
        '2022-06-12'
    ),
    (
        'Chen Wei',
        'Accounts',
        72000,
        '2021-09-18'
    ),
    (
        'Ahmed Ali',
        'HR',
        58000,
        '2020-02-25'
    ),
    (
        'Sara Khan',
        'IT',
        88000,
        '2023-04-08'
    ),
    (
        'David Brown',
        'Sales',
        67000,
        '2022-08-30'
    ),
    (
        'Maria Garcia',
        'Marketing',
        64000,
        '2021-12-14'
    ),
    (
        'Hiroshi Tanaka',
        'IT',
        95000,
        '2023-02-11'
    ),
    (
        'Olivia Wilson',
        'HR',
        62000,
        '2020-10-01'
    ),
    (
        'Imran Hossain',
        'Accounts',
        73000,
        '2022-05-22'
    ),
    (
        'Sophia Martinez',
        'Sales',
        69000,
        '2021-03-17'
    ),
    (
        'Abdul Karim',
        'IT',
        87000,
        '2023-06-09'
    ),
    (
        'Liam Anderson',
        'Marketing',
        66000,
        '2022-09-27'
    ),
    (
        'Nusrat Jahan',
        'HR',
        61000,
        '2021-01-19'
    ),
    (
        'Carlos Mendes',
        'Accounts',
        71000,
        '2020-07-07'
    ),
    (
        'Emma Davis',
        'Sales',
        68000,
        '2023-03-03'
    ),
    (
        'Mohammad Fahim',
        'IT',
        92000,
        '2022-12-25'
    );

select * from employees

select max(salary)
from employees
where
    department_name ilike ('hr')

select *
from employees
where
    salary > (
        select max(salary)
        from employees
        where
            department_name ilike ('hr')
    )

select department_name, count(*), sum(salary)
from employees
GROUP BY
    department_name

SELECT department_name, sum, count --outer query/main query 
from (
        select department_name, count(*), sum(salary)
        from employees
        GROUP BY
            department_name
    ) as sum_dept_salary