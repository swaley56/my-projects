use portfolio_projects;
select * from coviddeaths 
limit 10;

select *
from coviddeaths
where continent is not null
order by 3,4;

select *
from covidvaccinations
order by 3,4; 


select location, date, total_cases, new_cases,total_deaths, population
from coviddeaths
order by 1;

-- diving into the total cases vs total deaths
-- shows likelihood of dying from covid in your country
select location, date, total_cases,total_deaths, (total_deaths / total_cases)* 100 as Deathpercent
from coviddeaths

order by 1;

select location, date, total_cases,total_deaths, (total_deaths / total_cases)* 100 as Deathpercent
from coviddeaths
where continent is not null
order by 1;

-- total cases vs population
-- shows what percentage of population got covid 
select location, date, population, total_cases , (total_cases / population)* 100 as PercentPopulationInfected
from coviddeaths
order by 1;

-- countries with the highest infection rate in comparison to its population

select location, population, MAX(total_cases) as HighestInfectionCount , MAX((total_cases / population))* 100 as percentpopulationinfected
from coviddeaths
where continent is not null
group by 1,2
order by percentpopulationinfected desc; 

-- showing countries with highest death count per population

select location, MAX(total_deaths) as TotalDeathCount
from coviddeaths
-- where location like %africa% 
where continent is not null 
group by location
order by TotalDeathCount desc;

desc coviddeaths;

-- breakdown by continent 

select continent, MAX(total_deaths) as TotalDeathCount
from coviddeaths
-- where location like %africa% 
 where continent is not null 
group by continent
order by TotalDeathCount desc;


-- global numbers

select date, sum(new_cases) as totalcases, sum(new_deaths) as totaldeaths, sum(new_deaths)/sum(new_cases)* 100 as Deathpercentage -- total_cases, total_deaths, (total_deaths/ total_cases) * 100 as deathpercentage
from coviddeaths
where continent is not null
group by date
order by 1,2;
-- total cases, new deaths and deathpercentage

select sum(new_cases) as totalcases, sum(new_deaths) as totaldeaths, sum(new_deaths)/sum(new_cases)* 100 as Deathpercentage -- total_cases, total_deaths, (total_deaths/ total_cases) * 100 as deathpercentage
from coviddeaths
where continent is not null
-- group by date
order by 1,2;

-- joining covideaths & covidvaccinations tables

select *
from portfolio_projects.coviddeaths de
join portfolio_projects.covidvaccinations vc
	on de.location = vc.location
    and de.date = vc.date; 

 -- looking at total population v vaccinations
 
select de.continent, de.location, de.date, de.population, vc.new_vaccinations

from portfolio_projects.coviddeaths de
join portfolio_projects.covidvaccinations vc
	on de.location = vc.location
    and de.date = vc.date 
where de.continent is not null
order by 2,3;
-- getting count differences on new vaccinations by location

select de.continent, de.location, de.date, de.population, vc.new_vaccinations
, sum(vc.new_vaccinations) over (partition by de.location Order by de.location, de.date) as rollingpeoplevaccinated

from portfolio_projects.coviddeaths de
join portfolio_projects.covidvaccinations vc
	on de.location = vc.location
    and de.date = vc.date 
where de.continent is not null
order by 2,3;

-- using cte

with PopvsVac (continent, location, date, population, new_vaccinations, rollingpeoplevaccinated)
as (
select de.continent, de.location, de.date, de.population, vc.new_vaccinations
, sum(vc.new_vaccinations) over (partition by de.location Order by de.location, 
de.date) as rollingpeoplevaccinated

from portfolio_projects.coviddeaths de
join portfolio_projects.covidvaccinations vc
	on de.location = vc.location
    and de.date = vc.date 
where de.continent is not null
-- order by 2,3
)
select *, (rollingpeoplevaccinated/ population) * 100 as percentagevaccinated
from popvsvac;

-- cte without date

with PopvsVac (continent, location, population, new_vaccinations, rollingpeoplevaccinated)
as (
select de.continent, de.location, de.population, vc.new_vaccinations
, sum(vc.new_vaccinations) over (partition by de.location Order by de.location) as rollingpeoplevaccinated

from portfolio_projects.coviddeaths de
join portfolio_projects.covidvaccinations vc
	on de.location = vc.location
    and de.date = vc.date 
where de.continent is not null
-- order by 2,3
)
select *, (rollingpeoplevaccinated/ population) * 100 as percentagevaccinated
from popvsvac; 

--  temp table

-- create table PercentPopulationVaccinated
-- ( continent nvarchar(255), 	
-- location nvarchar(255)
-- )

-- insert into


-- select de.continent, de.location, de.date, de.population, vc.new_vaccinations
-- , sum(vc.new_vaccinations) over (partition by de.location Order by de.location, de.date) as rollingpeoplevaccinated

-- from portfolio_projects.coviddeaths de
-- join portfolio_projects.covidvaccinations vc
-- 	on de.location = vc.location
--     and de.date = vc.date 
-- where de.continent is not null
-- order by 2,3;

-- 


