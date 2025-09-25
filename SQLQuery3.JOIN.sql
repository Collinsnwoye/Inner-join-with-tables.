SELECT M.First_Name, S.Last_Name 
FROM MathematicsStudent M
INNER JOIN School S
ON M.First_Name = S.First_Name;

SELECT 
  t.client_id, 
  t.driver_id, 
  c.users_id AS client_user_id,
  d.users_id AS driver_user_id
FROM Trip t
INNER JOIN Users c
ON t.client_id = c.users_id AND c.banned = 'NO'
INNER JOIN Users d
ON t.driver_id = d.users_id AND d,banned = 'NO'

SELECT
  t.request_at AS Day,
  ROUND(
    SUM(CASE 
          WHEN t.status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 
          ELSE 0 
        END) * 1.0 / COUNT(*),
    2
  ) AS `Cancellation Rate`
FROM Trips t
JOIN Users c ON t.client_id = c.users_id AND c.banned = 'No' AND c.role = 'client'
JOIN Users d ON t.driver_id = d.users_id AND d.banned = 'No' AND d.role = 'driver'
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at
ORDER BY t.request_at;
