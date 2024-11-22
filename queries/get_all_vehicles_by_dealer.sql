-- Find all vehicles for dealership
SELECT * 
FROM vehicles AS v
INNER JOIN inventory AS i
		ON v.vin = i.vin
        INNER JOIN dealerships AS d
				ON i.dealership_id = d.dealership_id
WHERE d.dealership_id = 1;