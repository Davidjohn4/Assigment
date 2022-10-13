SELECT * FROM accidents.cia_facbook;
LOAD DATA INFILE 'D://assigments//sql//exceldata//cia_factbook___FSDA 18th Sept 2022.csv'
INTO TABLE cia_facbook
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
select * from cia_facbook;

-- 1. Which country has the highest population?
select country, max(population) as larget_population from cia_facbook group by country order by 2 desc;

-- 2. Which country has the least number of people?
select country, min(population) as larget_population from cia_facbook group by country order by 2 desc;

-- 3. Which country is witnessing the highest population growth?
select country, max(population_growth_rate) as larget_population from cia_facbook where population_growth_rate between'0' and '10' group by country order by 2 desc;

-- 4. Which country has an extraordinary number for the population?
select country, sum(population) as extraordinary_population from cia_facbook  group by population order by 2 desc;
-- 5. Which is the most densely populated country in the world?

select country , dense_rank()over(order by population) as world_dense_rank
from cia_facbook
order by world_dense_rank ;
