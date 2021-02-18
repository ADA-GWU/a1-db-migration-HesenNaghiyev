begin;
alter table students drop column if exists STUDENT_ID;
alter table students add column STUDENT_ID int;
alter table students alter column ST_NAME type varchar(30); 
alter table students alter column ST_LAST type  varchar(30);
update students set STUDENT_ID = ST_ID;
alter table students drop column ST_ID;
select * from students;
commit;


