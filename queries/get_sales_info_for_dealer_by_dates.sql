-- Sales info for a specific dealer for a range of dates
SELECT s.*
FROM sales_contracts AS s
INNER JOIN inventory AS i
		ON s.vin = i.vin
INNER JOIN dealerships AS d
		ON i.dealership_id = d.dealership_id
WHERE d.dealership_id = 1 AND s.contract_date BETWEEN '2020-01-01' AND '2021-12-31';
