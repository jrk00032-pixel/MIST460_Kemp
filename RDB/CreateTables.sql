
/*
-- in your master database

CREATE LOGIN NandaSurendra
WITH PASSWORD = 'MI$T460Instructor';

-- switch to your mist460-rdb-lastname database;

CREATE USER NandaSurendra
FOR LOGIN NandaSurendra;

ALTER ROLE db_owner ADD MEMBER NandaSurendra;
*/

drop table if exists Room;
drop table if exists RoomAvailability;


create table Room
(
    RoomID int identity(1,1) primary key,
    RoomNumber varchar(10) not null,
    Floor int not null,
    Seats int not null,
    Whiteboard bit not null, -- for true or false
    CurrentStatus varchar(20) not null -- 'Available' or 'In use'
);
 
go
 
create table AppUser
(
    AppUserID int identity(1,1) primary key,
    Email varchar(255) not null,
    Password varchar(255) not null
);
 
go
 
create table Reservation
(
    ReservationID int identity(1,1) primary key,
    AppUserID int not null,
    ReservationDateTime datetime not null,
    CheckInDateTime datetime null,
    CheckOutDateTime datetime null,
    TotalTime int null, -- minutes
    ReservationStatus varchar(20) not null,
    constraint FK_Reservation_AppUser foreign key (AppUserID) references AppUser(AppUserID)
);
 
go
 
create table RoomAvailability
(
    RoomAvailabilityID int identity(1,1) primary key,
    RoomID int not null,
    ReservationID int null,
    AvailableDate date not null,
    AvailableStartTime time not null,
    AvailableEndTime time not null,
    AvailabilityStatus varchar(20) not null,
    constraint FK_RoomAvailability_Room foreign key (RoomID) references Room(RoomID),
    constraint FK_RoomAvailability_Reservation foreign key (ReservationID) references Reservation(ReservationID)
);
 


