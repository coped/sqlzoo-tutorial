-- 1.

SELECT
  id,
  title
FROM movie
WHERE yr=1962;

-- 2.

SELECT yr
FROM movie
WHERE title = 'citizen kane';

-- 3.

SELECT
  id,
  title,
  yr
FROM movie
WHERE title LIKE 'star trek%';

-- 4.

SELECT id
FROM actor
WHERE name = 'glenn close';

-- 5.

SELECT id
FROM movie
WHERE title = 'casablanca';

-- 6.

SELECT name
FROM actor
JOIN casting 
  ON actorid = id
WHERE movieid = 11768;

-- 7.

SELECT actor.name
FROM actor
JOIN casting
  ON casting.actorid = actor.id
  JOIN movie
    ON casting.movieid = movie.id
WHERE movie.title = 'alien';

-- 8.

SELECT movie.title
FROM movie
JOIN casting
  ON movie.id = casting.movieid
  JOIN actor
    ON actor.id = casting.actorid
WHERE actor.name = 'harrison ford';

-- 9.

SELECT movie.title
FROM movie
JOIN casting
  ON movie.id = casting.movieid
  JOIN actor
    ON actor.id = casting.actorid
WHERE actor.name = 'harrison ford'
  AND casting.ord != 1;

-- 10.

SELECT movie.title,
  actor.name
FROM movie
JOIN casting
  ON movie.id = casting.movieid
  JOIN actor
    ON actor.id = casting.actorid
WHERE casting.ord = 1
  AND movie.yr = 1962;

-- 11.

SELECT
  yr,
  COUNT(title)
FROM movie
JOIN casting
  ON movie.id=movieid
  JOIN actor
    ON actorid=actor.id
WHERE name='John Travolta'
GROUP BY yr
HAVING COUNT(title) > 2;

-- 12.

SELECT
  movie.title,
  actor.name
FROM movie 
JOIN casting
  ON movie.id = casting.movieid
  JOIN actor
    ON actor.id = casting.actorid
WHERE casting.ord = 1
  AND movie.id IN (
    SELECT movieid
    FROM casting
    WHERE actorid IN (
      SELECT actor.id
      FROM actor
      WHERE name = 'julie andrews'
    )
  );

-- 13.

SELECT name
FROM actor
JOIN casting
  ON id = actorid
WHERE ord = 1
GROUP BY name
HAVING COUNT(name) >= 30
ORDER BY name;

-- 14.

SELECT
  title,
  COUNT(actorid)
FROM movie
JOIN casting
  ON id = movieid
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title;

-- 15.

SELECT actor.name
FROM actor
JOIN casting
  ON actor.id = casting.actorid
  JOIN movie
    ON casting.movieid = movieid
WHERE actor.name != 'Art Garfunkel'
  AND casting.movieid = ANY(
    SELECT casting.movieid
    FROM casting
    WHERE casting.actorid = (
      SELECT actor.id
      FROM actor
      WHERE actor.name= 'Art Garfunkel'
    )
  )
GROUP BY actor.name;
