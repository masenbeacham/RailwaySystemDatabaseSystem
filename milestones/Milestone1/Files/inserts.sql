-- Script name: inserts.sql
-- Author:		Masen Beacham
-- Purpose:     insert sample data to test the integrity of this database system

-- the database used to insert the data into.
   USE RailwaySystemDB;
   
-- General User table inserts
INSERT INTO `RailwaySystemDB`.`General User` (`general_user_id`, `username`) VALUES
(1, 'Jose'),
(2, 'Emma'),
(3, 'Kyle');

-- Registered User table inserts
INSERT INTO `RailwaySystemDB`.`Registered User` (`registered_user_id`, `username`, `email_address`, `password`, `contact_details`, `travel_history`) VALUES
(1, 'John', 'john@example.com', 'password1', '1234567890', 'New York'),
(2, 'Emma', 'emma@example.com', 'password2', '9876543210', 'Los Angeles'),
(3, 'Michael', 'michael@example.com', 'password3', '4567890123', 'Chicago');

-- Role table inserts
INSERT INTO `RailwaySystemDB`.`Role` (`role_id`, `role_name`, `user_role`) VALUES
(1, 'Admin', 'admin'),
(2, 'User', 'user'),
(3, 'Employee', 'employee');

-- Account table inserts
INSERT INTO `RailwaySystemDB`.`Account` (`General User`, `Registered User`, `account_id`, `Role`) VALUES
(1, NULL, 1, 1),
(NULL, 1, 2, 2),
(2, NULL, 3, 2);

-- Route table inserts
INSERT INTO `RailwaySystemDB`.`Route` (`route_id`, `distance`, `duration`) VALUES
(1, '100 km', '2023-05-01 10:00:00'),
(2, '150 km', '2023-05-02 12:00:00'),
(3, '200 km', '2023-05-03 15:00:00');

-- Train Station table inserts
INSERT INTO `RailwaySystemDB`.`Train Station` (`station_id`, `name`, `location`, `address`) VALUES
(1, 'Station A', 'Location A', 'Address A'),
(2, 'Station B', 'Location B', 'Address B'),
(3, 'Station C', 'Location C', 'Address C');

-- Passenger table inserts
INSERT INTO `RailwaySystemDB`.`Passenger` (`passenger_id`, `name`, `contact_details`, `train_id`) VALUES
(1, 'Passenger A', '1234567890', 1),
(2, 'Passenger B', '9876543210', 2),
(3, 'Passenger C', '4567890123', 3);

-- Train table inserts
INSERT INTO `RailwaySystemDB`.`Train` (`train_id`, `schedule`, `route`, `capacity`, `current_speed`) VALUES
(1, 1, 1, '200', '100 km/h'),
(2, 2, 2, '150', '120 km/h'),
(3, 3, 3, '300', '80 km/h');

-- Train Schedule table inserts
INSERT INTO `RailwaySystemDB`.`Train Schedule` (`schedule_id`, `departure_time`, `arrival_time`, `origin_station`, `destination`) VALUES
(1, '2023-05-01 10:00:00', '2023-05-01 12:00:00', 'Station A', 2),
(2, '2023-05-02 12:00:00', '2023-05-02 15:00:00', 'Station B', 3),
(3, '2023-05-03 15:00:00', '2023-05-03 17:00:00', 'Station C', 1);

-- Carriage table inserts
INSERT INTO `RailwaySystemDB`.`Carriage` (`carriage_id`, `maximum_capacity`, `maintenance_records`) VALUES
(1, '50', 'Record 1'),
(2, '60', 'Record 2'),
(3, '70', 'Record 3');

-- Employee table inserts
INSERT INTO `RailwaySystemDB`.`Employee` (`employee_id`, `name`, `phone_number`, `job_title`) VALUES
(1, 1234567890, 'Employee A', '1234567890'),
(2, 9876543210, 'Employee B', '9876543210'),
(3, 4567890123, 'Employee C', '4567890123');

-- Maintenance table inserts
INSERT INTO `RailwaySystemDB`.`Maintenance` (`maintenance_id`, `train_number`, `start_date`, `end_date`, `description`) VALUES
(1, 1, '2023-05-01', '2023-05-03', 'Maintenance 1'),
(2, 2, '2023-05-02', '2023-05-04', 'Maintenance 2'),
(3, 3, '2023-05-03', '2023-05-05', 'Maintenance 3');

-- Seat table inserts
INSERT INTO `RailwaySystemDB`.`Seat` (`seat_id`, `class`, `train_id`) VALUES
(1, 'First Class', 1),
(2, 'Business Class', 2),
(3, 'Economy Class', 3);

-- Payment table inserts
INSERT INTO `RailwaySystemDB`.`Payment` (`payment_id`, `ticket_id`, `payment_method`, `amount`) VALUES
(1, 'T001', 'Credit Card', '100.00'),
(2, 'T002', 'Debit Card', '150.00'),
(3, 'T003', 'Cash', '80.00');

-- Ticket table inserts
INSERT INTO `RailwaySystemDB`.`Ticket` (`ticket_id`, `name`, `train`, `seat`, `validity_period`, `ticket_number`, `payment_id`) VALUES
(1, 'Ticket A', 1, 1, '2023-05-01', 1, 1),
(2, 'Ticket B', 2, 2, '2023-05-02', 2, 2),
(3, 'Ticket C', 3, 3, '2023-05-03', 3, 3);
