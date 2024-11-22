-- Find dealership where vehicle is located
SELECT name
FROM dealerships AS d
INNER JOIN inventory AS i
		ON d.dealership_id = i.dealership_id
WHERE vin = '2G1FB1E30H9187654';