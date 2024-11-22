-- Get all dealerships
select *
from dealerships;

-- Find all vehicles for dealership
select * 
from vehicles as v
inner join inventory as i
		on v.vin = i.vin
        inner join dealerships as d
				on i.dealership_id = d.dealership_id

where d.dealership_id = 1;

-- Find a car by vin
select *
from vehicles
where vin = '10112';

-- Find dealership where vehicles is located
select name
from dealerships as d
inner join inventory as i
		on d.dealership_id = i.dealership_id
where vin = '10112';

-- All dealerships with a type of car
select *
from vehicles as v
inner join inventory as i
		on v.vin = i.vin
        inner join dealerships as d
				on i.dealership_id = d.dealership_id
where v.color = 'Red' and v.make = 'Ford' and v.model = 'Explorer';

-- Sales info for a specific dealer for a range of dates
select *
from dealerships as d
inner join sales_contracts as s
		on d.dealership_id = s.id
where d.dealership_id = 1  and s.contract_date between '2020-01-01' and '2021-12-31';
	
		
