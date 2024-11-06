SELECT eun.unique_id,e.name
FROM Employees e
LEFT JOIN EmployeeUNI AS eun
ON e.id = eun.id;
