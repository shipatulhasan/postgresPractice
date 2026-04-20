select
    description as blog,
    first_name as author
from blogs b
    join students s on b.student_id = s.student_id

create table users (
    id SERIAL PRIMARY key,
    title VARCHAR(25)
);

create table posts (
    id SERIAL PRIMARY key,
    post TEXT,
    user_id INTEGER REFERENCES users (id)
);

insert into
    users (title)
values ('Rahim'),
    ('Karim'),
    ('Hamim'),
    ('Ramim')

insert into
    posts (post, user_id)
values (
        'I would like to be a next level software developer',
        1
    ),
    (
        'I am working so hard to make it happen',
        1
    ),
    ('Hi there ')