-- 1.

SELECT COUNT(*)
FROM stops;

-- 2.

SELECT id
FROM stops
WHERE name = 'craiglockhart';

-- 3.

SELECT
  stops.id,
  stops.name
FROM stops
JOIN route
  ON route.stop = stops.id
WHERE
  route.num = '4'
  AND route.company = 'LRT';

-- 4.

SELECT
  company,
  num,
  COUNT(*)
FROM route
WHERE
  stop=149
  OR stop=53
GROUP BY
  company,
  num
HAVING COUNT(*) >= 2;

-- 5.

SELECT
  a.company,
  a.num,
  a.stop,
  b.stop
FROM route a
JOIN route b
  ON (a.company=b.company
    AND a.num=b.num)
WHERE
  a.stop=53
  AND b.stop = 149;

-- 6.

SELECT
  a.company,
  a.num,
  stopa.name,
  stopb.name
FROM route a
JOIN route b
  ON (a.company=b.company
    AND a.num=b.num)
JOIN stops stopa
  ON (a.stop=stopa.id)
JOIN stops stopb
  ON (b.stop=stopb.id)
WHERE
  stopa.name='Craiglockhart'
  AND stopb.name = 'London Road';

-- 7.

SELECT
  a.company,
  a.num
FROM route a
JOIN route b
  ON a.company = b.company
    AND a.num = b.num
WHERE
  a.stop = 115
  AND b.stop = 137
GROUP BY a.company, a.num;

-- 8.

SELECT
  a.company,
  a.num
FROM route a
JOIN route b
  ON a.company = b.company
    AND a.num = b.num
JOIN stops stopa
  ON a.stop = stopa.id
JOIN stops stopb
  ON b.stop = stopb.id
WHERE
  stopa.name = 'Craiglockhart'
  AND stopb.name = 'Tollcross';

-- 9.

SELECT DISTINCT
  stopb.name,
  a.company,
  a.num
FROM route a
JOIN route b
  ON a.company = b.company
    AND a.num = b.num
JOIN stops stopa
  ON a.stop = stopa.id
JOIN stops stopb
  ON b.stop = stopb.id
WHERE
  stopa.name = 'Craiglockhart';

-- 10.

SELECT
  from_c.num,
  from_c.company,
  from_c.name,
  to_l.num,
  to_l.company
FROM (
  SELECT DISTINCT
    stopd.name,
    c.company,
    c.num
  FROM route c
  JOIN route d
    ON (c.company = d.company
      AND c.num = d.num)
  JOIN stops stopc
    ON (c.stop = stopc.id)
  JOIN stops stopd
    ON (d.stop = stopd.id)
  WHERE stopc.name = 'Craiglockhart') AS from_c
JOIN (
  SELECT *
    FROM (
      SELECT DISTINCT
        stopb.name,
        a.company,
        a.num
      FROM route a
      JOIN route b
        ON (a.company = b.company
          AND a.num = b.num)
      JOIN stops stopa
        ON (a.stop = stopa.id)
      JOIN stops stopb
        ON (b.stop = stopb.id)
      WHERE stopa.name = 'Lochend') AS from_ca)
to_l ON (from_c.name = to_l.name);
