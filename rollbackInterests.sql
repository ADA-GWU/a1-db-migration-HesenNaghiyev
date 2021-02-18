begin;
alter table interests add column interest text;
insert into interests(interest,student_id) select u.* from interests, unnest(interests) with ordinality as u;
delete from interests where interest is null;
alter table interests drop column interests;
select * from interests;
commit;
