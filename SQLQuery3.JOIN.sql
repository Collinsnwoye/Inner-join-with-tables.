## Joining two seperate data to make an analysis.

SELECT M.First_Name, S.Last_Name 
FROM MathematicsStudent M
INNER JOIN School S
ON M.First_Name = S.First_Name;

WITH TripDetails AS (
    SELECT 
        t.client_id, 
        t.driver_id, 
        c.users_id AS client_user_id,
        d.users_id AS driver_user_id,
        t.status,
        t.request_at AS Day
    FROM Trip t
    INNER JOIN Users c ON t.client_id = c.users_id AND c.banned = 'NO'
    INNER JOIN Users d ON t.driver_id = d.users_id AND d.banned = 'NO'
    WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
)

SELECT 
    Day,
    ROUND(
        SUM(CASE 
              WHEN status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 
              ELSE 0 
            END) * 1.0 / COUNT(*),
        2
    ) AS CancellationRate
FROM TripDetails
GROUP BY Day
ORDER BY Day;
