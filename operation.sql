CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade VARCHAR(10),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
);

select * from students

-- INSERT INTO
students (
    first_name,
    last_name,
    age,
    grade,
    course,
    email,
    dob,
    blood_group,
    country
)
VALUES (
        'Rahim',
        'Uddin',
        20,
        'A',
        'CSE',
        'rahim1@mail.com',
        '2004-01-10',
        'A+',
        'Bangladesh'
    ),
    (
        'Karim',
        'Hasan',
        22,
        'B',
        'EEE',
        'karim2@mail.com',
        '2002-05-12',
        'B+',
        'Bangladesh'
    ),
    (
        'Ayesha',
        'Akter',
        21,
        'A',
        'BBA',
        'ayesha3@mail.com',
        '2003-03-15',
        'O+',
        'Bangladesh'
    ),
    (
        'Tanvir',
        'Ahmed',
        23,
        'C',
        'CSE',
        'tanvir4@mail.com',
        '2001-07-20',
        'AB+',
        'Bangladesh'
    ),
    (
        'Nusrat',
        'Jahan',
        19,
        'B',
        'ENG',
        'nusrat5@mail.com',
        '2005-09-25',
        'A-',
        'Bangladesh'
    ),
    (
        'Sakib',
        'Khan',
        24,
        'A',
        'CSE',
        'sakib6@mail.com',
        '2000-11-30',
        'B-',
        'Bangladesh'
    ),
    (
        'Mitu',
        'Das',
        20,
        'A',
        'BBA',
        'mitu7@mail.com',
        '2004-02-18',
        'O-',
        'Bangladesh'
    ),
    (
        'Rafi',
        'Islam',
        22,
        'C',
        'EEE',
        'rafi8@mail.com',
        '2002-08-22',
        'A+',
        'Bangladesh'
    ),
    (
        'Tania',
        'Sultana',
        21,
        'B',
        'CSE',
        'tania9@mail.com',
        '2003-06-14',
        'B+',
        'Bangladesh'
    ),
    (
        'Arif',
        'Hossain',
        23,
        'A',
        'ENG',
        'arif10@mail.com',
        '2001-12-05',
        'O+',
        'Bangladesh'
    ),
    (
        'Jony',
        'Paul',
        20,
        'B',
        'CSE',
        'jony11@mail.com',
        '2004-04-11',
        'A-',
        'Bangladesh'
    ),
    (
        'Sumaiya',
        'Rahman',
        22,
        'A',
        'BBA',
        'sumaiya12@mail.com',
        '2002-10-01',
        'AB-',
        'Bangladesh'
    ),
    (
        'Imran',
        'Ali',
        25,
        'C',
        'EEE',
        'imran13@mail.com',
        '1999-09-09',
        'B+',
        'Bangladesh'
    ),
    (
        'Lima',
        'Khatun',
        19,
        'B',
        'ENG',
        'lima14@mail.com',
        '2005-01-21',
        'O+',
        'Bangladesh'
    ),
    (
        'Rakib',
        'Mia',
        21,
        'A',
        'CSE',
        'rakib15@mail.com',
        '2003-03-03',
        'A+',
        'Bangladesh'
    ),
    (
        'Fahim',
        'Chowdhury',
        24,
        'B',
        'EEE',
        'fahim16@mail.com',
        '2000-07-17',
        'B-',
        'Bangladesh'
    ),
    (
        'Nabila',
        'Tasnim',
        20,
        'A',
        'BBA',
        'nabila17@mail.com',
        '2004-05-27',
        'O+',
        'Bangladesh'
    ),
    (
        'Shuvo',
        'Roy',
        23,
        'C',
        'CSE',
        'shuvo18@mail.com',
        '2001-02-02',
        'AB+',
        'Bangladesh'
    ),
    (
        'Farhan',
        'Kabir',
        22,
        'B',
        'ENG',
        'farhan19@mail.com',
        '2002-06-19',
        'A+',
        'Bangladesh'
    ),
    (
        'Mariam',
        'Noor',
        21,
        'A',
        'CSE',
        'mariam20@mail.com',
        '2003-08-08',
        'B+',
        'Bangladesh'
    );

SELECT first_name, last_name, email, COUNT(*)
FROM students
GROUP BY
    first_name,
    last_name,
    email

with
    ranked as (
        select *, ROW_NUMBER() over (
                PARTITION BY
                    first_name, last_name, email
                order by student_id
            ) as rn
        from students
    )
delete from students
where
    student_id in (
        select student_id
        from ranked
        WHERE
            rn > 1
    )

select DISTINCT country from students

select * from students where age = '20' or grade = 'A'

select max(age) from students

CREATE TABLE blog (
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students (student_id),
    title VARCHAR(100),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- INSERT INTO blog (student_id, title, description) VALUES
-- (1, 'JS Basics', 'JavaScript is widely used for web development and frontend applications.'),
-- (2, 'Postgres Intro', 'PostgreSQL is a powerful relational database with advanced features.'),
-- (3, 'React Guide', 'React helps build UI using reusable components and state management.'),
-- (4, 'Node.js', 'Node.js runs JavaScript on the server and is event-driven.'),
-- (5, 'Short Blog', 'Simple post'),
-- (6, 'Web Dev', 'Web development includes frontend, backend, and database systems working together.'),
-- (7, 'API Design', 'REST APIs are used to communicate between client and server efficiently.'),
-- (8, 'Database', 'Databases store structured data and allow efficient querying.'),
-- (9, 'Security', 'Web security is important to protect user data and prevent attacks.'),
-- (10, 'Performance', 'Optimizing performance improves user experience significantly.');

select * from blogs

select
    title,
    case
        when length(description) > 30 then substring(
            description
            from 1 for 25
        ) || '...'
        else description
    end as short_description
from blogs

select * from students where first_name like 'M%'

select * from students where first_name like '%a'

select * from students where first_name ilike 'a%'