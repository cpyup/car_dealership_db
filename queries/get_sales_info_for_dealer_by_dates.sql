-- Sales info for a specific dealer for a range of dates
SELECT *
FROM dealerships AS d
INNER JOIN inventory AS i
		ON i.dealership_id = d.dealership_id
INNER JOIN sales_contracts AS s
		ON i.vin = s.vin
WHERE d.dealership_id = 1 AND s.contract_date BETWEEN '2020-01-01' AND '2021-12-31';
