SELECT ROUND(COUNT(DISTINCT a1.player_id) /(SELECT COUNT(DISTINCT player_id) FROM Activity),2)
AS fraction
FROM Activity a1 INNER JOIN Activity a2 ON a1.player_id = a2.player_id 
AND a2.event_date = DATE_ADD(a1.event_date, INTERVAL 1 DAY)
WHERE a1.event_date = (SELECT MIN(event_date) FROM Activity WHERE player_id = a1.player_id);


-- WITH FirstLogin AS (
--     SELECT 
--         player_id,
--         MIN(event_date) AS first_log
--     FROM Activity
--     GROUP BY player_id
-- )

-- SELECT ROUND(COUNT(a.player_id)/COUNT(f.player_id),2) AS fraction
-- FROM FirstLogin f
-- LEFT JOIN Activity a
--     ON f.player_id = a.player_id
--     AND DATE_ADD(f.first_log, INTERVAL 1 DAY) = a.event_date