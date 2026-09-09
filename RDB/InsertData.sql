
insert into Room (RoomNumber, Floor, Seats, Whiteboard, CurrentStatus) values
    ('101', 1, 4, 1, 'Available'),
    ('102', 1, 6, 1, 'Available'),
    ('201', 2, 2, 0, 'In use');
-- IDs assigned: 1 = Room 101, 2 = Room 102, 3 = Room 201
 
insert into AppUser (Email, Password) values
    ('jane.doe@university.edu', 'hashed_password_1'),
    ('sam.lee@university.edu', 'hashed_password_2');
-- IDs assigned: 1 = jane.doe, 2 = sam.lee
 
insert into Reservation (AppUserID, ReservationDateTime, CheckInDateTime, CheckOutDateTime, TotalTime, ReservationStatus) values
    (1, '2026-09-08 10:00:00', '2026-09-09 14:00:00', '2026-09-09 16:00:00', 120, 'Completed'),
    (2, '2026-09-08 11:30:00', NULL, NULL, NULL, 'Confirmed');
-- IDs assigned: 1 = Jane's completed booking, 2 = Sam's upcoming booking
 
insert into RoomAvailability (RoomID, ReservationID, AvailableDate, AvailableStartTime, AvailableEndTime, AvailabilityStatus) values
    (1, 1, '2026-09-09', '14:00', '16:00', 'Booked'),
    (1, NULL, '2026-09-09', '16:00', '18:00', 'Open'),
    (2, 2, '2026-09-10', '10:00', '12:00', 'Booked'),
    (3, NULL, '2026-09-10', '13:00', '15:00', 'Open');
 