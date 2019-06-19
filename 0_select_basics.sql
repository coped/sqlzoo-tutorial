-- 1.

SELECT population
FROM world
WHERE name = 'germany';

-- 2.

SELECT 
  name,
  population
FROM world
WHERE name IN ('sweden', 'norway', 'denmark');

-- 3.

SELECT
  name,
  area
FROM world
WHERE area BEWTEEN 200000 AND 250000;
