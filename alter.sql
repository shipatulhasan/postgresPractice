SELECT * from person

alter table person
add column email varchar(25) DEFAULT ('person@mail.com') not null;

alter table person drop column email

alter table person rename column age to userAge