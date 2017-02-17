create table users
(
   email varchar(100) not null,
   password varchar(100) not null,
   first_name varchar(100) null,
   last_name varchar(100) null,
   bday date null,
   drivers_license_number varchar(40),
   connected_facebook_email varchar(100) not null,
   is_facebook_user varchar(1) not null,
   create_date datetime not null,
   update_date datetime not null,
   primary key
   (
      email
   )
);

create table routes
(
   route_id int not null auto_increment,
   email varchar(25) not null,
   start_address varchar(200) not null,
   start_lat double not null,
   start_lng double not null,
   start_google_place_id varchar(200) not null,
   end_address varchar(200) not null,
   end_lat double not null,
   end_lng double not null,
   end_google_place_id varchar(200) not null,
   time_window_start datetime not null,
   time_window_end datetime not null,
   create_date datetime not null,
   status varchar(25) not null,
   type varchar(10) not null,
   primary key
   (
      route_id
   )
);

create table messages
(
   message_id int not null auto_increment,
   route_id int not null,
	thread_name varchar(25) not null ,
   username varchar(25) not null,
	message_text varchar(1000) not null,
   primary key
   (
      message_id
   )
);

create table passenger_list
(
   route_id int not null,
   username varchar(100) not null
);

create table ratings
(
   route_id int not null,
   username_passenger varchar(100) not null,
   rating int not null,
   primary key
   (
      route_id,
      username_passenger
   )
);