SELECT s1.user_id,
       ROUND(
           COALESCE(
               (COUNT(CASE WHEN c1.action LIKE '%confirmed%' THEN 1 END) / 
               NULLIF((COUNT(CASE WHEN c1.action LIKE '%confirmed%' THEN 1 END) + COUNT(CASE WHEN c1.action LIKE '%timeout%' THEN 1 END)), 0)), 0
           ), 2
       ) AS confirmation_rate
FROM Signups s1
LEFT JOIN Confirmations c1
ON s1.user_id = c1.user_id
GROUP BY s1.user_id;