SELECT title
FROM sakila.film;
select * from sakila.language;
select distinct(name) as language  from sakila.language;
select count(staff_id) from sakila.staff;
select count(*) from sakila.store;
select count(distinct(rental_date))from sakila.rental;
