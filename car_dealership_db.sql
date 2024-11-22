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
	`vin` integer not null,
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
    `vin` integer not null,
    constraint `pk_inventory` primary key(`dealership_id`)
); 

-- Sales contracts table
create table `sales_contracts`(
    `contract_date` varchar(15) not null,
    `name` varchar(50) not null,
    `email` varchar(50) not null,
    `id` integer not null auto_increment,
    `vin` integer not null,
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
	`contract_date` varchar(15) not null,
    `name` varchar(50) not null,
    `email` varchar(50) not null,
	`id` integer not null auto_increment,
    `vin` integer not null,
    `ending_value` float not null,
    `lease_fee` float not null,
    `total_cost` float not null,
    `monthly_payment` float not null,
    constraint `pk_lease_contracts` primary key(`id`),
    constraint `fk_lease_contracts` foreign key(`vin`) references `vehicles`(`vin`)
);

-- Add data to tables
