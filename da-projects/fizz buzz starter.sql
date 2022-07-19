

use sakila;

select 
category_id,
CASE 
    when category_id % 3 and category_id % 5  then 'fizzbuzz'
	when category_id % 3 then 'fizz'
    when category_id % 5  then 'buzz'
    else category_id end as fizz_buzz 
FROM sakila.category
LIMIT 100; 

select 
category_id,
CASE 
    when category_id % 3 = 0 and category_id % 5 = 0  then 'fizzbuzz'
	when category_id % 3 = 0 then 'fizz'
    when category_id % 5 = 0  then 'buzz'
    else category_id end as fizz_buzz 
FROM sakila.category
LIMIT 100 