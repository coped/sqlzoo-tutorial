-- 1.

SELECT
  matchid,
  player
FROM goal
WHERE teamid = 'ger';

-- 2.

SELECT
  id,
  stadium,
  team1,
  team2
FROM game
WHERE id = 1012;

-- 3.

SELECT
  player,
  teamid,
  stadium,
  mdate
FROM game
JOIN goal
  ON id = matchid
WHERE teamid = 'ger';

-- 4.

SELECT
  team1,
  team2,
  player
FROM game
JOIN goal
  ON id = matchid
WHERE player LIKE 'Mario%';

-- 5.

SELECT
  player,
  teamid,
  coach,
  gtime
FROM goal
JOIN eteam
  ON teamid = id
WHERE gtime <= 10;

-- 6.

SELECT
  mdate,
  teamname
FROM game
JOIN eteam
  ON eteam.id = team1
WHERE coach = 'fernando santos';

-- 7.

SELECT player
FROM goal
JOIN game
  ON matchid = id
WHERE stadium = 'national stadium, warsaw';

-- 8.

SELECT DISTINCT player
FROM game
JOIN goal
  ON matchid = id 
WHERE
  teamid != 'ger'
  AND (team1 = 'ger'
    OR team2 = 'ger');

-- 9.

SELECT
  teamname,
  COUNT(player)
FROM eteam
JOIN goal
  ON id=teamid
GROUP BY teamname;

-- 10.

SELECT
  stadium,
  COUNT(player)
FROM game
JOIN goal
  ON matchid = id
GROUP BY stadium;

-- 11.

SELECT
  matchid,
  mdate,
  COUNT(player)
FROM game
JOIN goal
  ON matchid = id
WHERE 
  team1 = 'pol'
  OR team2 = 'pol'
GROUP BY matchid, mdate;

-- 12.

SELECT
  matchid,
  mdate,
  COUNT(player)
FROM game
JOIN goal
  ON matchid = id
WHERE teamid = 'ger'
GROUP BY matchid, mdate;

-- 13.

SELECT
  mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
FROM game
LEFT JOIN goal
  ON matchid = id
GROUP BY 
  mdate,
  matchid,
  team1,
  team2;
