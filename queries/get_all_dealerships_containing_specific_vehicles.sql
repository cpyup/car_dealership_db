-- All dealerships with a type of car
SELECT *
FROM dealerships AS d
INNER JOIN inventory AS i
		ON d.dealership_id = i.dealership_id
        INNER JOIN vehicles AS v
				ON i.vin = v.vin
WHERE v.color = 'Red' AND v.make = 'Ford' AND v.model = 'Explorer';