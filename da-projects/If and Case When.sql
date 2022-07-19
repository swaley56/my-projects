use sakila; 

# find name ending with son  or r 
select * from actor 
# where last_name regexp '^.*son$' # s
where last_name regexp '^.*[(son)|r]$'  # 
;
select * from actor  
where lower(last_name) like '%son' 
or lower(last_name) like '%r' 
;

select 
*,
CASE WHEN `length` >= 50 THEN 'long' 
else 'short' end As movie_length, 
IF(`length` >= 50, 'long', 'short') AS movie_length, 
# a movie 100 minutes, super long, 50 long, short 
IF(`length` >= 100, 'super long', 
	IF(`length` >= 50 , 'long', 'short')) AS movie_length_2, 
CASE
	WHEN `length` >= 100 THEN  'super long' 
	WHEN `length` >= 50 THEN  'long'  
    WHEN `length` >= 25 THEN 'short'
	ELSE 'super short' END  as movie_length_3 
from film; 

SELECT 
CASE
	WHEN `length` >= 100 THEN  'super long' 
	WHEN `length` >= 50 THEN  'long'  
    WHEN `length` >= 25 THEN 'short'
	ELSE 'super short' END  as movie_length, 
COUNT(*) AS movie_count, 
SUM(replacement_cost) AS total_cost, 
SUM(replacement_cost) / COUNT(*) AS avg_replacement_cost 
from film 
GROUP BY 1   
ORDER BY 2 DESC;


    