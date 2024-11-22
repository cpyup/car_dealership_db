-- Drop existing database if exists
DROP DATABASE IF EXISTS dealership;
CREATE DATABASE IF NOT EXISTS dealership;
USE dealership;

-- Dealerships Table
CREATE TABLE `dealerships` (
    `dealership_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50),
    `address` VARCHAR(50),
    `phone` VARCHAR(12),
    CONSTRAINT `pk_dealerships` PRIMARY KEY (`dealership_id`)
);

-- Vehicles table
CREATE TABLE `vehicles` (
    `vin` VARCHAR(20) NOT NULL,
    `year` INTEGER NOT NULL,
    `make` VARCHAR(20) NOT NULL,
    `model` VARCHAR(20) NOT NULL,
    `type` VARCHAR(20) NOT NULL,
    `color` VARCHAR(20) NOT NULL,
    `odometer` INTEGER NOT NULL,
    `price` FLOAT NOT NULL,
    `sold` BOOL NOT NULL,
    CONSTRAINT `pk_vehicles` PRIMARY KEY(`vin`)
);

-- Inventory table
CREATE TABLE `inventory`(
    `dealership_id` INTEGER NOT NULL,
    `vin` VARCHAR(20) NOT NULL,
    CONSTRAINT `pk_inventory` PRIMARY KEY(`dealership_id`, `vin`),
    CONSTRAINT `fk_inventory_dealerships` FOREIGN KEY (`dealership_id`) REFERENCES `dealerships`(`dealership_id`),
    CONSTRAINT `fk_inventory_vehicles` FOREIGN KEY (`vin`) REFERENCES `vehicles`(`vin`)
); 

-- Sales contracts table
CREATE TABLE `sales_contracts`(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `contract_date` DATE NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `vin` VARCHAR(20) NOT NULL,
    `sales_tax` FLOAT NOT NULL,
    `recording_fee` FLOAT NOT NULL,
    `processing_fee` FLOAT NOT NULL,
    `total_cost` FLOAT NOT NULL,
    `financed` BOOL NOT NULL,
    `monthly_payment` FLOAT NOT NULL,
    CONSTRAINT `pk_sales_contracts` PRIMARY KEY(`id`),
    CONSTRAINT `fk_sales_contracts` FOREIGN KEY(`vin`) REFERENCES `vehicles`(`vin`)
);

-- Lease contracts table
CREATE TABLE `lease_contracts`(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `contract_date` DATE NOT NULL, 
    `name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `vin` VARCHAR(20) NOT NULL,
    `ending_value` FLOAT NOT NULL,
    `lease_fee` FLOAT NOT NULL,
    `total_cost` FLOAT NOT NULL,
    `monthly_payment` FLOAT NOT NULL,
    CONSTRAINT `pk_lease_contracts` PRIMARY KEY(`id`),
    CONSTRAINT `fk_lease_contracts` FOREIGN KEY(`vin`) REFERENCES `vehicles`(`vin`)
);

-- Add data to tables

-- Dealership data
INSERT INTO `dealerships`(`name`, `address`, `phone`) 
    VALUES('Car World', '123 Main St', '555-123-4567'),
          ('Speed Motors', '789 Pine Rd', '555-345-6789'),
          ('Luxury Cars', '321 Maple Dr', '555-456-7890'),
          ('Prime Auto Sales', '987 Cedar Ln', '555-678-9012');

-- Vehicles Data
INSERT INTO `vehicles`(`vin`, `year`, `make`, `model`, `type`, `color`, `odometer`, `price`, `sold`)
    VALUES('2G1FB1E30H9187654', 2015, 'Toyota', 'Camry', 'Sedan', 'Silver', 12000, 15995.0, false),
          ('1FTFW1E56LFA12345', 1993, 'Ford', 'Explorer', 'SUV', 'Red', 525123, 995.0, true),
          ('5NMS2CAD6LH123456', 2021, 'Chevrolet', 'Silverado', 'Truck', 'Black', 2750, 31995.0, true),
          ('1C4RJFAG1LL123456', 2020, 'Jeep', 'Grand Cherokee', 'SUV', 'Black', 25500, 42995.0, false),
          ('3VW4T7AT1JM234567', 2019, 'Volkswagen', 'Golf', 'Hatchback', 'Blue', 18000, 19995.0, true),
          ('2G1WB5E39E1187654', 2017, 'Chevrolet', 'Malibu', 'Sedan', 'White', 35000, 16995.0, false),
          ('5NMS2CAD7LH234567', 2022, 'Hyundai', 'Santa Fe', 'SUV', 'Green', 5000, 35995.0, true),
          ('1FTEX1CB6HK123456', 2018, 'Ford', 'F-150', 'Truck', 'Gray', 22000, 28995.0, true);

-- Inventory Data         
INSERT INTO `inventory`(`dealership_id`, `vin`)
    VALUES(1, '2G1FB1E30H9187654'),
          (1, '1FTFW1E56LFA12345'),
          (1, '5NMS2CAD6LH123456'),
          (2, '1C4RJFAG1LL123456'),
          (2, '3VW4T7AT1JM234567'),
          (3, '2G1WB5E39E1187654'),
          (3, '5NMS2CAD7LH234567'),
          (4, '1FTEX1CB6HK123456');

-- Sales Contract Data
INSERT INTO `sales_contracts`(`contract_date`, `name`, `email`, `vin`, `sales_tax`, `recording_fee`, `processing_fee`, `total_cost`, `financed`, `monthly_payment`)
    VALUES('2021-09-28', 'Dana Wyatt', 'dana@texas.com', '1FTFW1E56LFA12345', 995.0, 49.75, 100.0, 295.0, false, 0.0),
          ('2023-01-21', 'Emily Clark', 'emily.clark@email.com', '3VW4T7AT1JM234567', 1200.0, 55.00, 120.0, 385.0, true, 600.50),
          ('2020-11-05', 'Oliver Harris', 'oliver.harris@email.com', '5NMS2CAD7LH234567', 1050.0, 60.00, 110.0, 350.0, false, 0.0);

-- Lease Contract Data
INSERT INTO `lease_contracts`(`contract_date`, `name`, `email`, `vin`, `ending_value`, `lease_fee`, `total_cost`, `monthly_payment`)
    VALUES('2021-09-28', 'Zachary Westly', 'zach@texas.com', '5NMS2CAD6LH123456', 15997.5, 2239.65, 18237.15, 538.43);
