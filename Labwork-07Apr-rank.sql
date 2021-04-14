#Use the RANK() and the table of your choice rank films by length (filter out the rows that have nulls or 0s in length column). 
#In your output, only select the columns title, length, and the rank.
select title, length, rank() over (order by length) as ranking
from film
where length <>0 and length is not null;

# Build on top of the previous query and rank films by length within the rating category 
#(filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, 
#rating and the rank.
select title, length, rating, rank() over (partition by rating order by length) as ranking
from film
where length <>0 and length is not null
order by rating, ranking;

#How many films are there for each of the categories? 
#Inspect the database structure and use appropriate join to write this query.
select count(f.title) as count, c.category_id
from film as f
join film_category as c
on f.film_id = c.film_id
group by c.category_id;

#Which actor has appeared in the most films?
select a.first_name, a.last_name, a.actor_id, count(f.title) as count
from actor as a
join film_actor as fa
on a.actor_id = fa.actor_id
join film as f
on fa.film_id = f.film_id
group by a.actor_id
order by count desc
;

#Most active customer (the customer that has rented the most number of films)
#c.first_name, c.last_name,
select c.customer_id, first_name, c.last_name, count(r.rental_id) as count
from customer as c
join rental as r
on c.customer_id = r.customer_id
group by c.customer_id
order by count desc





