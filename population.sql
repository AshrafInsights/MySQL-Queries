SELECT * FROM world_countries.population;






select Country, population, Infant_mortality, Physicians_per_thousand, Life_expectancy
from population
order by Physicians_per_thousand Desc
Limit 4;



select Country, population, Infant_mortality, Physicians_per_thousand, Life_expectancy
from population
order by Physicians_per_thousand Asc
Limit 4;



select Country, population, Urban_population, `Land_Area(Km2)`, Birth_Rate
from population
order by population desc
Limit 4;


select Country, population, Urban_population, `Land_Area(Km2)`, Birth_Rate, Fertility_Rate, Life_expectancy
from population
order by population desc
Limit 4;

select Country, population,GDP, Minimum_wage, `Population_Labor_force_participation(%)`, `Tax_revenue(%)`, Total_tax_rate, Unemployment_rate, Urban_population
from revenue
order by GDP desc
Limit 4;