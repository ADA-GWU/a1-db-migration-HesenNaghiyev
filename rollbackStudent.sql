begin;
alter table students alter column ST_NAME type varchar(15);
alter table students alter column ST_LAST type varchar(15);
alter table students add column ST_ID int;
update students set ST_ID=STUDENT_ID;
alter table students drop column STUDENT_ID;
select * from students;
commit;
