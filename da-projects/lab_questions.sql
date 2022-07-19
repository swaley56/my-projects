select distinct(country) from country;
select count(distinct country) from country;

select * from payment limit 10;
select sum(amount) as total_amount from payment;
select customer_id as cus, sum(amount) as total_amount_per_customer 
from payment
group by cus;

select *
from payment 
left join customer using (customer_id);

select 
(staff_id + customer_id)as sum_of_staff_id,
sum(amount)as amount
from payment
group by sum_of_staff_id
order by sum_of_staff_id;


select * from payment;
select * from customer;

select 
*
From payment
left join customer on payment.customer_id = customer.customer_id;

select
(staff_id + customer_id) as sum_of_staff_id ,
sum(amount) as amount
from sakila.payment
group by sum_of_staff_id 
order by amount desc ;

select c.customer_id, sum(p.amount) as 
total_amount_per_customer
from payment p
left join customer c on p.customer_id = c.customer_id
group by c.customer_id;

select c.first_name, c.last_name, sum(p.amount) as 
total_amount_per_customer
from payment p
left join customer c on p.customer_id = c.customer_id
group by c.first_name, c.last_name;

#Q8
select c.first_name, c.last_name, sum(p.amount) as 
total_amount_per_customer
from payment p
left join customer c on p.customer_id = c.customer_id
group by c.first_name, c.last_name
order by total_amount_per_customer desc limit 5;

select c.first_name, c.last_name, sum(p.amount) as 
total_amount_per_customer, avg(p.amount) as avg_amount_per_customer
from payment p
left join customer c on p.customer_id = c.customer_id
group by c.first_name, c.last_name;

/*select * from film_actor 
limit 10;


select * from actor 
limit 10;


select * from film 
limit 10;


select * from film_category
limit 10;


select * from film_text
limit 10;
*/

select * from actor;
select * from film_actor;
select * from film;
select * from category;

select concat(a.FIRST_NAME,' ', a.LAST_NAME) as Full_name
from ACTOR a
left join FILM_ACTOR fa on a.ACTOR_ID = fa.ACTOR_ID
group by a.ACTOR_ID, a.FIRST_NAME, a.LAST_NAME
order by count(*) desc;

#Q9
select count(film_actor.actor_id) as number_of_movies, actor.first_name as firstname, actor.last_name as lastname
from actor inner join film_actor on actor.actor_id = film_actor.actor_id
group by film_actor.actor_id
order by number_of_movies  desc;


#Q10
select * from film_category;
select * from film;
select * from category;
select * from language;
select * from film_text;

select count(film_category.film_id) as c_category,film.title 
from film inner join film_category on film.film_id = film_category.film_id
group by film_category.film_id
order by film.title;


#Q11

/*select count(language.language_id) as lang, film.title
from film inner join language on film.language_id = language.language_id
group by language.language_id
order by film.title desc;*/

#Q12
select count(film_category.film_id) as c_category,film.title 
from film inner join film_category on film.film_id = film_category.film_id
group by film_category.film_id
order by c_category desc;
#Q13

