#Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
where first_name = 'Scarlett';

#How many films (movies) are available for rent and how many films have been rented?
select count(*) from sakila.film;
select count(*) from sakila.rental;

#What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select min(length) as'min_duration', max(length) as max_duration 
from sakila.film;

#What's the average movie duration expressed in format (hours, minutes)?
select concat(floor(round(avg(length))/60),'h ',MOD(round(avg(length)),60),'m') as avglength
from sakila.film;

#How many distinct (different) actors' last names are there?
select distinct(last_name)
from sakila.actor;

#Since how many days has the company been operating (check DATEDIFF() function)?
select datediff(max(rental_date),min(return_date))
from sakila.RENTAL;

#Show rental info with additional columns month and weekday. Get 20 results.
select *, EXTRACT(MONTH FROM return_date) as return_month,
 dayofweek(return_date) as return_day
 from sakila.RENTAL 
 LIMIT 0, 20;
 
 #Add an additional column day_type with values 'weekend' and 'workday' depending 
 #on the rental day of the week.
 select *, 
 dayname(return_date) as return_day
 from sakila.RENTAL 
 LIMIT 0, 20;
 
#How many rentals were in the last month of activity?
select max(return_date)
from sakila.RENTAL; 

select count(return_date)
from sakila.RENTAL
where EXTRACT(MONTH FROM return_date) = 9;

# Get release years
select distinct(release_year)
from film;

#Get all films with ARMAGEDDON in the title.
select *
from film
where locate('ARMAGEDDON',title) <>0;

# Get all films which title ends with APOLLO.
select title, right(title,6) as end
from film
where right(title,6) = 'APOLLO';

# Get 10 the longest films.
select *
from film
order by length desc
limit 10;

#How many films include Behind the Scenes content?
select count(special_features) as speFTcount
from film
where locate('Behind the Scenes',special_features) <>0;

#Drop column picture from staff.
ALTER TABLE staff
  DROP COLUMN picture;
select * from staff;

#A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer.
# Update the database accordingly.
select * from customer;
INSERT INTO customer (first_name,last_name,store_id) VALUES ('TAMMY','SANDERS',1);







