#Using multiple JOIN() clauses display the store ID, city, and country of each store.
select s.store_id,c.city, co.country
from store as s
join address as a
on s.address_id = a.address_id
join city as c
on a.city_id = c.city_id
join country as co
on c.country_id = co.country_id 
;
#Display the total payment amount for each store.
select s.store_id, sum(p.amount) as ttl_payment
from store as s
join staff as st
on s.store_id = st.store_id
join payment as p
on st.staff_id = p.staff_id
group by s.store_id
;
#What is the average film length per each category? Which category of films are the longest?

select c.category_id, avg(f.length) as average, max(f.length) as max
from category as c
join film_category as fc
on c.category_id = fc.category_id
join film as f
on fc.film_id = f.film_id
group by c.category_id
order by max desc
;

#Display the 2 most frequently rented movies in descending order.
select f.title, count(r.rental_id) as count
from film as f
join inventory as i
on f.film_id = i.film_id
join rental as r
on i.inventory_id=r.inventory_id
group by title
order by count desc
limit 2
;
# Display the top 5 categories with highest revenue (payment amount) in descending order.

select c.category_id, sum(p.amount) as ttl
from  category as c
join film_category as fc
on c.category_id = fc.category_id
join film as f
on fc.film_id = f.film_id
join inventory as i
on f.film_id = i.film_id
join rental as r
on i.inventory_id = r.inventory_id
join payment as p 
on r.rental_id= p.rental_id
group by category_id
order by ttl desc
limit 5
;
#Is the Academy Dinosaur movie available for rent from Store 1? If yes, display the title, store_id and inventory_id 
#of the available copies of that movie.

select s.store_id, f.title, i.inventory_id
from store as s
join inventory as i
on s.store_id = i.store_id
join film as f
on i.film_id = f.film_id
where s.store_id = 1 and f.title = 'ACADEMY DINOSAUR'















