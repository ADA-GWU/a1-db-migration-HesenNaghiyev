begin;
alter table interests add column INTERESTS varchar(15) [];
select array_agg(interest) from interests group by(student_id);
insert into interests(student_id, interests) select student_id, array_agg(interest) from interests group by(student_id);
delete from  interests where interests is  null;
alter table interests  drop column interest;
select * from interests;
commit;
