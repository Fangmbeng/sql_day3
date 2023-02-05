--Question 1
select first_name, last_name, district
from customer c
join address a
on c.address_id = a.address_id
where district = 'Texas';

--Question 2

select first_name, last_name, amount
from customer c
join payment p 
on c.customer_id = p.customer_id 
where amount > 7;

--Question 3
select *
from customer c
where customer_id  in(
	select customer_id
	from payment p
	group by customer_id
	having sum(amount) >175
);

--Question 4

select c.first_name, c.last_name, country
from customer c
join address a 
on c.address_id = a.address_id 
join city c2 
on a.city_id = c2.city_id
join country c3
on c2.country_id = c3.country_id
where country = 'Argentina'

--Question 5
select count(film_id), category_id 
from film_category fc 
group by category_id 
order by count(film_id) desc;

--Question 6

select count(actor_id), fa.film_id, f.title, description 
from film f
join film_actor fa
on fa.film_id = f.film_id 
group by fa.film_id, f.title, description 
order by count(actor_id) desc
limit 1;

--Question 7

select count(a.actor_id) as num, a.first_name, a.last_name
from actor a
join film_actor fa 
on fa.actor_id = a.actor_id
group by a.first_name, a.last_name
order by num asc 
limit 1;

--Question 8

select count(city_id) as num, country
from country c
join city c2
on c2.country_id = c.country_id
group by country
order by num desc
limit 1;

--Question 9

select a.actor_id, a.first_name, a.last_name, count(film_id) 
from actor a
join film_actor fa  
on a.actor_id = fa.actor_id 
group by a.actor_id
having count(film_id) between 20 and 25;


select *
from actor a
where a.actor_id in(
	select actor_id
	from film_actor fa 
	group by fa.actor_id 
	having count(film_id) between 20 and 25
);

