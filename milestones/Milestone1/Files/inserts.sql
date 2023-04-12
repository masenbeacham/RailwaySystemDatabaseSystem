-- Script name: inserts.sql
-- Author:		Masen Beacham
-- Purpose:     insert sample data to test the integrity of this database system

-- the database used to insert the data into.
   USE RailwaySystemDB;
   
   -- Train table inserts
INSERT INTO Train (train_id, train_name, num_seats) VALUES (1, 'Express 1', 100), (2, 'Local 1', 50), (3, 'Express 2', 120);

-- Station table inserts
INSERT INTO Station (station_id, station_name, location) VALUES (1, 'Grand Central', 'New York City'), (2, 'Union Station', 'Washington D.C.'), (3, 'Penn Station', 'Newark');

-- Route table inserts
INSERT INTO Route (route_id, route_name, start_station, end_station, distance) VALUES (1, 'NYC-DC Express', 1, 2, 225), (2, 'NYC-Newark Local', 1, 3, 15), (3, 'DC-Newark Express', 2, 3, 250);

-- Schedule table inserts
INSERT INTO Schedule (schedule_id, train_id, route_id, departure_time, arrival_time) VALUES (1, 1, 1, '2023-05-01 08:00:00', '2023-05-01 12:00:00'), (2, 2, 2, '2023-05-01 10:00:00', '2023-05-01 11:00:00'), (3, 3, 3, '2023-05-01 14:00:00', '2023-05-01 18:00:00');

-- Ticket table inserts
INSERT INTO Ticket (ticket_id, user_id, train_id, route_id, schedule_id, seat_number, price) VALUES (1, 1, 1, 1, 1, 'A1', 50), (2, 2, 2, 2, 2, 'B2', 20), (3, 3, 3, 3, 3, 'C3', 100);