-- * Heaviest Hitters
-- SELECT
--     AVG(people.weight),
--     teams.name,
--     batting.yearid
-- FROM
--     people
--     INNER JOIN batting ON people.playerid = batting.playerid
--     INNER JOIN teams ON batting.team_id = teams.id
-- GROUP BY
--     teams.name,
--     batting.yearid
-- ORDER BY
--     yearid,
--     avg DESC;
-- * Shortest Sluggers
-- SELECT
--     AVG(people.height),
--     teams.name,
--     batting.yearid
-- FROM
--     people
--     INNER JOIN batting ON people.playerid = batting.playerid
--     INNER JOIN teams ON batting.team_id = teams.id
-- GROUP BY
--     teams.name,
--     batting.yearid
-- ORDER BY 
--     yearid,
--     avg;
-- * Biggest Spenders
-- SELECT
--     salaries.yearid,
--     teams.name,
--     SUM(salary)
-- FROM
--     salaries
-- LEFT JOIN teams
--     ON teams.yearid = salaries.yearid
--     AND teams.teamid = salaries.teamid
-- GROUP BY
--     salaries.yearid,
--     teams.name
-- ORDER BY 1, 3 DESC;
-- * Most Bang For Their Buck In 2010
-- SELECT
--     salaries.yearid,
--     teams.name,
--     ROUND(SUM(salaries.salary) / teams.w) AS costperwin
-- FROM
--     salaries
--     LEFT JOIN teams ON teams.yearid = salaries.yearid
--     AND teams.teamid = salaries.teamid
-- GROUP BY
--     salaries.yearid,
--     teams.name,
--     teams.w
-- HAVING
--     salaries.yearid = 2010
-- ORDER BY
--     SUM(salaries.salary) DESC;

-- * Pricest Starter
SELECT
    people.namefirst,
    people.namelast,
    ROUND(salaries.salary / pitching.gs) as cost_per_game,
    salaries.yearid,
    pitching.gs
FROM
    salaries
    INNER JOIN pitching ON salaries.playerid = pitching.playerid
    AND salaries.yearid = pitching.yearid
    AND salaries.teamid = pitching.teamid
    INNER JOIN people ON salaries.playerid = people.playerid
WHERE
    pitching.gs > 10
ORDER BY
    3 DESC;