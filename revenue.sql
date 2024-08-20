SELECT * FROM world_countries.revenue;

select ï»¿Country, Unemployment_rate, `Population_Labor_force_participation(%)`
from revenue
order by Unemployment_rate Desc
limit 5;

select p.ï»¿Country, p.`Gross_primary_education_enrollment(%)`, p.`Gross_tertiary_education_enrollment(%)`, r.Unemployment_rate
from population p
join revenue r on p.ï»¿Country = r.ï»¿Country
order by r.Unemployment_rate Desc
Limit 3;

select p.ï»¿Country, r.Unemployment_rate, r.`Population_Labor_force_participation(%)`
from population p
join revenue r on p.ï»¿Country = r.ï»¿Country
order by r.Unemployment_rate Desc
limit 3;

select ï»¿Country, population, Urban_population
from population
order by Urban_population Desc
Limit 3;

select ï»¿Country, GDP, `Tax_revenue(%)`
from revenue
order by `Tax_revenue(%)` desc
Limit 3;
select Country, GDP, `Minimum wage`, `Population: Labor force participation (%)` 
from `world-data-2023- final 1`
where `Minimum wage` is not null and `Population: Labor force participation (%)` is not Null
order by `Population: Labor force participation (%)` Desc
Limit 5;

select ï»¿Country, GDP, `Tax_revenue(%)`, Urban_population, Total_tax_rate
from revenue
order by Urban_population desc
Limit 3;

select Country, GDP, `Physicians per thousand`, `Tax revenue (%)`, `Out of pocket health expenditure`
from `world-data-2023- final 1`
order by `Out of pocket health expenditure` Desc
Limit 5;