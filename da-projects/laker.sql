use labs;
/* select * from lakers;

select mp from lakers;

select 'player name' as lakers;

select 	playername, mp from lakers
order by mp desc
limit 5;

select avg(mp)as avg_min from lakers
order by avg_min desc
limit 5;
select avg(mp) from lakers;
select round(avg(g),0) as avg_games_played from lakers;
*/
/* use lakers;
-- What is the average minutes per game played by the top 5 scorers
Select player_name, pts_g*g as pts, MP FROM lakers_2019_data order by pts desc limit 5;
Select playername, avg(MP), pts_g*g as pts  from lakers where pts >= 900;
Select avg(MP) from
( Select player_name, pts_g*g as PTS, MP FROM lakers_2019_data order by pts desc limit 5) as top5_scorers;
-- Who scored the most points per minute played
select player_name, pts_g/mp as pts_p_m from lakers_2019_data order by pts_p_m desc limit 1;
-- what is the average number of games a lakers players plays?
select avg(G) from lakers_2019_data;
*/

#Q1
select 
playername, 
avg(mp) as avg_minutes_per_game from lakers
group by 1
order by 2 desc
limit 5;

-- select
-- playername,
-- pts_g*g as PTS,
-- mp
-- from lakers 
-- order by 2 desc
-- limit 5;

-- -- select 
-- -- playername, 
-- -- avg(mp),
-- -- pts_g*g as pts 
-- -- from laker
-- -- where pts >= 900;

select
avg(mp) from 
(select playername, pts_g*g as pts,
mp 
from lakers
order by 2 desc
limit 5) as top5_scorers;


#Q2
select playername, 
pts_g/mp as points_mp

from lakers
-- group by 1
order by 2 desc
limit 1;


#Q3
select 
round(avg(g),0) as av_num_of_games 
from lakers;


#Q4
/*select 
playername,
avg(pts_g/g) as average
from lakers
group by 1
order by 2 desc;
*/
select
playername,
sum (pts_g + orb + drb + ast + stl + blk - (fg-fga) - (ft-fga) -tov)/g as efficency_rating
from lakers
group by 1
order by 2 desc
limit 1; 