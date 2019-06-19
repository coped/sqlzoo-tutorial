-- 1.

SELECT name 
FROM world
WHERE 
  population > (
    SELECT population 
      FROM world
     WHERE name='russia'
  );

-- 2.

SELECT name 
FROM world
WHERE 
  continent = 'europe'
  AND (gdp / population) > (
    SELECT (gdp / population)
      FROM world
     WHERE name = 'united kingdom'
  );

-- 3.

SELECT 
  name,
  continent
FROM world
WHERE continent = (
  SELECT continent
  FROM world
  WHERE name = 'argentina'
  )
  OR continent = (
  SELECT continent
    FROM world
   WHERE name = 'australia'
)
  ORDER BY name;

-- 4.

SELECT 
  name,
  population
FROM world
WHERE 
  population > (
    SELECT population
      FROM world
     WHERE name = 'canada'
  )
  AND population < (
    SELECT population
      FROM world
     WHERE name = 'poland'
  );

-- 5.

SELECT 
  name,
  CONCAT(
    ROUND(
      (population / (
        SELECT population
        FROM world
        WHERE name = 'germany'
        )
      ) * 100,
    0),
  '%')
FROM world
WHERE continent = 'europe';

--6. 

SELECT name
FROM world
WHERE 
  gdp > ALL(
    SELECT gdp
    FROM world
    WHERE
      gdp > 0 
      AND continent = 'europe'
    );

-- I gave up here, perhaps I'll finish it later
