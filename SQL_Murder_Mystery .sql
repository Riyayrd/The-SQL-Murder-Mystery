
--Solution step 1
SELECT * FROM crime_scene_report 
WHERE type = 'murder' 
AND city = 'SQL City';

--solution step 2
select *  from crime_scene_report where lower(address_street_name) like'%sql%'and type='murder' and 
description like '%witness%';

/*Security footage shows that there were 2 witnesses.
The first witness lives at the last house on "Northwestern Dr". 
The second witness, named Annabel, lives somewhere on "Franklin Ave".*/

--solution step 3

/*select name from person where lower(address_street_name) 
like 'Northwestern Dr'
and address_number= (select max(address_number) from  person where 
lower(address_street_name) like 'Northwestern Dr');*/


SELECT * FROM person 
WHERE address_street_name = 'Northwestern Dr' 
ORDER BY address_number DESC LIMIT 1;


select name  from person where lower(address_street_name) like 'Franklin Ave' and 
lower(name) like "%Annabel%";

--solution step 4

select b.transcript from person a left join interview b on a.id=b.person_id
where a.name in ('Annabel Miller','Morty Schapiro') 



/* SELECT person.name, interview.transcript
FROM person JOIN interview
ON person.id = interview.person_id
WHERE person.id = 14887 OR person.id = 16371;*/

--solution step 5 Yayy! we found the murderer but now see who was acually behind it in next steps

select name from person where license_id in
(select id from drivers_license where plate_number like '%H42W%')
and name in (select name from get_fit_now_member where id like '48Z%' and 
membership_status like 'gold');

--Jeremy Bowers is the murderer

--solution step 6


select transcript from interview where person_id in (select id from person where license_id in
(select id from drivers_license where plate_number like '%H42W%')
and name in (select name from get_fit_now_member where id like '48Z%' and 
membership_status like 'gold'));
/*I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65")
 or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.*/
--part 1
select id from drivers_license where
gender='female' and (height between 65 and 67)
and hair_color='red' and lower(car_make) like '%tesla%'
and lower(car_model) like '%model s%' )

--part 2
with a as
(select distinct person_id, count (*) as num from facebook_event_checkin  where date like '201712%' and event_name like 
'%SQL Symphony Concert%' group by person_id )
select person_id from a where num=3)

--combining


select id, name from person where license_id in (
select id from drivers_license where
gender='female' and (height between 65 and 67)
and hair_color='red' and lower(car_make) like '%tesla%'
and lower(car_model) like '%model s%' ) and id in (

with a as
(select distinct person_id, count (*) as num from facebook_event_checkin  where date like '201712%' and event_name like 
'%SQL Symphony Concert%' group by person_id )
select person_id from a where num=3);

--Miranda Priestly
 
--found the brains behind the murder!
 
 
 
 
 
 
 ---Naive approach 1 -> does not go to the solution
 
 select * from crime_scene_report limit 10;

select count(*) from crime_scene_report where type='murder';

select * from crime_scene_report where type='murder';

select a.id,a.person_id,a.name from get_fit_now_member a left join person b on a.person_id=b.id;

with C as (select a.id,a.person_id,a.name from get_fit_now_member a left join 
person b on a.person_id=b.id) 
select C.id,C.person_id, d.check_in_date from get_fit_now_check_in d left join C on d.membership_id=C.id;

/*with E as (with C as (select a.id,a.person_id,a.name from get_fit_now_member a left join 
person b on a.person_id=b.id) 
select C.id,C.person_id, d.check_in_date from get_fit_now_check_in d left join C 
on d.membership_id=C.id)
select * from facebook_event_checkin F left join E on F.person_id= E.person_id and 
F.date= E.check_in_date;*/
 
 


