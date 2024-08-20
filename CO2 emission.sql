SELECT 
    p.Country,
    p.Urban_population AS UrbanPopulationPercentage,
    r.GDP
FROM 
    population p
JOIN 
    revenue r ON p.Country = r.Country
WHERE 
    p.Urban_population IS NOT NULL
    AND r.GDP IS NOT NULL
ORDER BY 
     r.GDP DESC;
     

SELECT 
    Country,
    GDP
FROM 
    revenue
ORDER BY 
    GDP DESC
LIMIT 5;

SELECT 
    Country,
    Co2_Emissions, Urban_population, `Forested_Area(%)`
FROM 
    co2_emission
ORDER BY 
    Co2_Emissions DESC
LIMIT 3;

SELECT 
    ce.Country,
    ce.Co2_Emissions, 
    ce.`Gasoline Price`, 
    ce.`Forested Area (%)`, 
    ce.Population, 
    p.Urban_population
FROM 
    co2_emission ce
JOIN 
    population p ON ce.Country = p.Country
ORDER BY 
    ce.Co2_Emissions DESC
LIMIT 4;

SELECT 
    Country,
    Gasoline_Price
FROM 
    co2_emission
  ORDER BY 
    Gasoline_Price DesC;
    
    select Country, Population
    from co2_emission
    order by Population Desc
    Limit 5;
    
    select Country, GDP, `Tax_revenue(%)`
    from revenue
    order by GDP Desc
    Limit 5;