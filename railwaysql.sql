create database railway;

use railway;

create table train(

     train_id varchar (20),
     train_name varchar (20),
     no_of_seats varchar (20),
     no_of_stations varchar (20),
     destination varchar (30),
     primary key(train_id)
     );
	

     
     create table tickets (
     
	tickets_no varchar (20),
    tickets_price varchar (20),
    destination varchar (20),
    seats_no varchar (20),
    primary key(tickets_no));
    
    create table passengers(
    passengers_id varchar (20),
    passengers_name varchar (20),
    destination varchar (20),
    tickets_no  varchar (20) references train (train_id),
    seats_no varchar (20),
    primary key(  passengers_id));

    
     
     


