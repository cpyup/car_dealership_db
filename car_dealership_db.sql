-- Drop existing database if exists
drop database if exists dealership;
create database if not exists dealership;
use dealership;

-- Dealerships Table
create table `dealerships` (
    `dealership_id` integer not null auto_increment,
    `name` varchar(50),
    `address` varchar(50),
    `phone` varchar(12),
    constraint `pk_dealerships` primary key (`dealership_id`)
);

-- Vehicles table
create table `vehicles` (
    `vin` varchar(20) not null,
    `year` integer not null,
    `make` varchar(20) not null,
    `model` varchar(20) not null,
    `type` varchar(20) not null,
    `color` varchar(20) not null,
    `odometer` integer not null,
    `price` float not null,
    `sold` bool not null,
    constraint `pk_vehicles` primary key(`vin`)
);

-- Inventory table
create table `inventory`(
    `dealership_id` integer not null,
    `vin` varchar(20) not null,
    constraint `pk_inventory` primary key(`dealership_id`, `vin`),
    constraint `fk_inventory_dealerships` foreign key (`dealership_id`) references `dealerships`(`dealership_id`),
    constraint `fk_inventory_vehicles` foreign key (`vin`) references `vehicles`(`vin`)
); 

-- Sales contracts table
create table `sales_contracts`(
    `contract_date` date not null,
    `name` varchar(50) not null,
    `email` varchar(50) not null,
    `id` integer not null auto_increment,
    `vin` varchar(20) not null,
    `sales_tax` float not null,
    `recording_fee` float not null,
    `processing_fee` float not null,
    `total_cost` float not null,
    `financed` bool not null,
    `monthly_payment` float not null,
    constraint `pk_sales_contracts` primary key(`id`),
    constraint `fk_sales_contracts` foreign key(`vin`) references `vehicles`(`vin`)
);

-- Lease contracts table
create table `lease_contracts`(
    `contract_date` date not null, 
    `name` varchar(50) not null,
    `email` varchar(50) not null,
    `id` integer not null auto_increment,
    `vin` varchar(20) not null,
    `ending_value` float not null,
    `lease_fee` float not null,
    `total_cost` float not null,
    `monthly_payment` float not null,
    constraint `pk_lease_contracts` primary key(`id`),
    constraint `fk_lease_contracts` foreign key(`vin`) references `vehicles`(`vin`)
);

-- Add data to tables

-- Dealership data
insert into `dealerships`(`name`, `address`, `phone`) 
    values('Car World', '123 Main St', '555-123-4567');

-- Vehicles Data
insert into `vehicles`(`vin`, `year`, `make`, `model`, `type`, `color`, `odometer`, `price`, `sold`)
    values('10234', 2015, 'Toyota', 'Camry', 'Silver','Sedan', 12000, 15995.0, false),
          ('10112', 1993, 'Ford', 'Explorer', 'Red','SUV', 525123, 995.0, true),
          ('37846', 2021, 'Chevrolet', 'Silverado', 'Black', 'Sedan', 2750, 31995.0, true);
          
insert into `inventory`(`dealership_id`,`vin`)
		values(1,'10234'),
			  (1,'10112'),
			  (1,'37846');

-- Sales Contract Data
insert into `sales_contracts`(`contract_date`, `name`, `email`, `vin`, `sales_tax`, `recording_fee`, `processing_fee`, `total_cost`, `financed`, `monthly_payment`)
    values('2021-09-28', 'Dana Wyatt', 'dana@texas.com', '10112', 995.0, 49.75, 100.0, 295.0, false, 0.0);

-- Lease Contract Data
insert into `lease_contracts`(`contract_date`, `name`, `email`, `vin`, `ending_value`, `lease_fee`, `total_cost`, `monthly_payment`)
    values('2021-09-28', 'Zachary Westly', 'zach@texas.com', '37846', 15997.5, 2239.65, 18237.15, 538.43);
