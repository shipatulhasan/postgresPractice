select *, age (current_date, dob) from students

update students
set
    dob = '1997-01-20'
WHERE
    first_name ilike 'Sakib'

-- it calls type casting
select extract( year from '1999-08-23'::Date )