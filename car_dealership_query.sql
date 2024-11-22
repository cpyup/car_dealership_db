-- Get all dealerships
SELECT *
FROM dealerships;

-- Find all vehicles for dealership
SELECT * 
FROM vehicles AS v
INNER JOIN inventory AS i
		ON v.vin = i.vin
        INNER JOIN dealerships AS d
				ON i.dealership_id = d.dealership_id
WHERE d.dealership_id = 1;

-- Find a car by vin
SELECT *
FROM vehicles
WHERE vin = '2G1FB1E30H9187654';

-- Find dealership where vehicles is located
SELECT name
FROM dealerships AS d
INNER JOIN inventory AS i
		ON d.dealership_id = i.dealership_id
WHERE vin = '2G1FB1E30H9187654';

-- All dealerships with a type of car
SELECT *
FROM dealerships AS d
INNER JOIN inventory AS i
		ON d.dealership_id = i.dealership_id
        INNER JOIN vehicles AS v
				ON i.vin = v.vin
WHERE v.color = 'Red' AND v.make = 'Ford' AND v.model = 'Explorer';


-- Sales info for a specific dealer for a range of dates
SELECT *
FROM dealerships AS d
INNER JOIN inventory AS i
		ON i.dealership_id = d.dealership_id
INNER JOIN sales_contracts AS s
		ON i.vin = s.vin
WHERE d.dealership_id = 1 AND s.contract_date BETWEEN '2020-01-01' AND '2021-12-31';
