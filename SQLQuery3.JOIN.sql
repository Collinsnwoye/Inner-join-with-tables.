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
ON t.client_id = c.users_id AND c.banned = 'NO' AND c.role = 'client'
INNER JOIN Users d
ON t.driver_id = d.users_id AND d,banned = 'NO' AND d.role = 'driver'

