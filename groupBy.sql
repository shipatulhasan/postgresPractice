select grade, count(*) from students group by grade

-- filter groups avg age gteater than 21
select grade, avg(age)
from students
group by
    grade
having
    avg(age) > 21

-- count student born in each year
select extract(
        year
        from dob
    ) as birthYear, count(*)
from students
group by
    birthYear