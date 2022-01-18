create database DB_HOTEL_MANAGEMENT

use DB_HOTEL_MANAGEMENT

create table Users(
	Id_user int primary key not null identity(1,1),
	First_Name varchar(20) not null,
	Last_Name varchar(20) not null,
	Email varchar(60) not null,
	Pwd varchar(200) not null,
	Roles bit default 0
);

create table Hotels(
	Id_Hotel int primary key not null identity(1,1),
	Name_Hotel varchar(20) not null,
	Address_Hotel varchar(100) not null,
	City_Hotel varchar(40) not null,
	Stars int not null,
	Id_user int not null,
	Descrption_Hotel varchar(1000) not null,
	Image_Hotel varchar(1000) not null,
	Number_Room int not null,
	Telephone varchar(20) not null,
);

create table Comments(
	Id_Comment int primary key not null identity(1,1),
	Opinion bit not null,
	Comment varchar(400) not null,
	Date_Comment datetime default CURRENT_TIMESTAMP not null,
	Id_user int not null,
	Id_Hotel int not null,
);

create table Reservations(
	Id_Reservation int primary key not null identity(1,1),
	Date_Begin datetime default CURRENT_TIMESTAMP not null,
	Date_End datetime not null,
	Date_Reservation datetime default CURRENT_TIMESTAMP not null,
	Bill float NOT NULL,
);

create table Rooms(
	Id_Room int primary key not null identity(1,1),
	Type_Room int not null,
	Price float not null,
	Id_Hotel int not null,
	Image_Romm varchar(400) not null,
);

	--Add foreign keys

--Id_user for the hotels
alter table Hotels add constraint fk_Ht_IdH foreign key (Id_user) references Users(Id_user);

--For the Comments Table
alter table Comments add constraint fk_Ct_IdC_IdU foreign key(Id_user) references Users(Id_user);
alter table Comments add constraint fk_Ct_IdC_IdH foreign key(Id_Hotel) references Hotels(Id_Hotel);

--For the Reservations table
alter table Reservations add constraint fk_Rs_IdR_IdU foreign key(Id_user) references Users(Id_user);
alter table Reservations add constraint fk_Rs_IdR_IdR foreign key(Id_Room) references Rooms(Id_Room);

--For the Rooms table
alter table Rooms add constraint fk_Rm_IdR_IdR foreign key(Id_Reservation) references Reservations(Id_Reservation);
alter table Rooms add constraint fk_Rm_IdR_IdU foreign key(Id_Hotel) references Hotels(Id_Hotel);