
drop table assigned_vehicle cascade constraints;
drop table driver cascade constraints;
drop table feed_back cascade constraints;
drop table payment cascade constraints;
drop table trip cascade constraints;
drop table "User" cascade constraints;
drop table vehicle cascade constraints;





CREATE TABLE driver (
    driver_id      VARCHAR2(5) NOT NULL,
    driver_name    VARCHAR2(15),
    driver_address VARCHAR2(50),
    driver_phone   NUMBER,
    joined_date    DATE,
    primary key(driver_id)
);


CREATE TABLE "User" (
    user_id       VARCHAR2(5) NOT NULL,
    user_name     VARCHAR2(15),
    joined_date   DATE,
    gender        VARCHAR2(6),
    date_of_birth DATE,
    primary key(user_id)
);


CREATE TABLE vehicle (
    vehicle_id      VARCHAR2(5) NOT NULL,
    registration_no VARCHAR2(15) NOT NULL,
    brand           VARCHAR2(10),
    vehicle_model   VARCHAR2(10),
    primary key(vehicle_id)
);

CREATE TABLE assigned_vehicle (
    assign_id          VARCHAR2(5) NOT NULL,
    assign_date        DATE,
    vehicle_id         VARCHAR2(5),
    driver_id          VARCHAR2(5),
    primary key(assign_id),
    foreign key (vehicle_id) references vehicle(vehicle_id),
    foreign key (driver_id) references driver(driver_id)
);


CREATE TABLE feed_back (
    reviewer_id       VARCHAR2(5) NOT NULL,
    reviewer_name     VARCHAR2(15),
    reviewer_comments VARCHAR2(50),
    rating            NUMBER,
    user_id           VARCHAR2(5),
    primary key(reviewer_id),
    foreign key (user_id) references "User" (user_id)
);


CREATE TABLE trip (
    trip_id          VARCHAR2(5) NOT NULL,
    trip_date        DATE,
    start_location   VARCHAR2(25),
    destination      VARCHAR2(25),
    ammount          NUMBER,
    user_id          VARCHAR2(5),
    driver_id        VARCHAR2(5),
    primary key(trip_id),
    foreign key(user_id) references "User"(user_id),
    foreign key(driver_id) references driver(driver_id)
);



CREATE TABLE payment (
    payment_id     VARCHAR2(5) NOT NULL,
    payment_method VARCHAR2(10),
    trip_id        VARCHAR2(5),
    primary key(payment_id),
    foreign key(trip_id) references trip (trip_id)
);

CREATE UNIQUE INDEX payment__idx ON
    payment (
        trip_trip_id
    ASC );









insert into vehicle	values ('V101',	'2bc123',   'AB' ,  'ab');
insert into vehicle	values ('V102',	'5iu345',   'AB' ,  'ab');
insert into vehicle	values ('V103',	'9gjf56',   'XY' ,  'pq');
insert into vehicle	values ('V104',	'4hjf56',   'CD' ,  'cd');
insert into vehicle     values ('V105',	'3dgxd45',  'AB' ,  'mn');
insert into vehicle	values ('V106',	'1kfj763',  'XY' ,  'mp');
insert into vehicle	values ('V107',	'3j463k',   'PQ' ,  'pr');
insert into vehicle	values ('V108',	'9dhk46',   'PQ' ,  'pr');
insert into vehicle     values ('V109',	'21fsg563', 'PQ' ,  'dq');
insert into vehicle	values ('V110',	'98nfhf45', 'WY' ,  'lp');



insert into driver	values ('D101',	'tom',   'main' ,     991987101 ,  TO_DATE('27/08/2017' , 'DD/MM/YYYY'));
insert into driver	values ('D102',	'jack',  'central' ,  991987102 ,  TO_DATE('14/09/2018' , 'DD/MM/YYYY'));
insert into driver	values ('D103',	'harry', 'rye' ,      991987103 ,  TO_DATE('02/03/2010' , 'DD/MM/YYYY'));
insert into driver	values ('D104',	'jonson','downtown',  991987104 ,  TO_DATE('11/11/2015' , 'DD/MM/YYYY'));
insert into driver      values ('D105',	'mark',  'rye' ,      991987105 ,  TO_DATE('17/10/2020' , 'DD/MM/YYYY'));
insert into driver	values ('D106',	'ford',  'main' ,     991987106 ,  TO_DATE('23/05/2021' , 'DD/MM/YYYY'));
insert into driver	values ('D107',	'henry', 'mianus' ,   991987107 ,  TO_DATE('18/01/2020' , 'DD/MM/YYYY'));
insert into driver	values ('D108',	'kim',   'mianus' ,   991987108 ,  TO_DATE('15/03/2017' , 'DD/MM/YYYY'));
insert into driver      values ('D109',	'brandit','brighton', 991987109 , TO_DATE('09/09/2018' , 'DD/MM/YYYY'));
insert into driver	values ('D110',	'brock',  'central' , 991987110 , TO_DATE('07/12/2013' , 'DD/MM/YYYY'));





insert into "User" 	values ('U101',	'jesmin', TO_DATE('27/08/2017' , 'DD/MM/YYYY'), 'female', TO_DATE('05/12/1900' , 'DD/MM/YYYY'));
insert into "User" 	values ('U102',	'jacky',  TO_DATE('27/08/2017' , 'DD/MM/YYYY'), 'male' , TO_DATE('12/03/1993' , 'DD/MM/YYYY'));
insert into "User" 	values ('U103',	'jones',  TO_DATE('27/08/2017' , 'DD/MM/YYYY'), 'male' , TO_DATE('12/05/1991' , 'DD/MM/YYYY'));
insert into "User" 	values ('U104',	'smith',  TO_DATE('27/08/2017' , 'DD/MM/YYYY'), 'male' , TO_DATE('14/09/1987' , 'DD/MM/YYYY'));
insert into "User"      values ('U105',	'jackson',TO_DATE('27/08/2017' , 'DD/MM/YYYY'), 'male' , TO_DATE('16/03/1995' , 'DD/MM/YYYY'));
insert into "User" 	values ('U106',	'green',  TO_DATE('27/08/2017' , 'DD/MM/YYYY'), 'male' , TO_DATE('03/01/2000' , 'DD/MM/YYYY'));
insert into "User" 	values ('U107',	'adams',  TO_DATE('27/08/2017' , 'DD/MM/YYYY'), 'male' , TO_DATE('08/10/2005' , 'DD/MM/YYYY'));
insert into "User" 	values ('U108',	'glenn',  TO_DATE('27/08/2017' , 'DD/MM/YYYY'), 'male' , TO_DATE('19/08/1999' , 'DD/MM/YYYY'));
insert into "User"      values ('U109',	'walliams',TO_DATE('27/08/2017' , 'DD/MM/YYYY'),'male',  TO_DATE('29/12/1996' , 'DD/MM/YYYY'));
insert into "User" 	values ('U110',	'brocks',  TO_DATE('27/08/2017' , 'DD/MM/YYYY'),'male' , TO_DATE('27/10/1997' , 'DD/MM/YYYY'));




insert into assigned_vehicle	values ('A101', TO_DATE('27/08/2022' , 'DD/MM/YYYY'), 'V101' , 'D105');
insert into assigned_vehicle	values ('A102', TO_DATE('29/08/2022' , 'DD/MM/YYYY'), 'V102' , 'D106');
insert into assigned_vehicle	values ('A103', TO_DATE('07/09/2022' , 'DD/MM/YYYY'), 'V104' , 'D109');
insert into assigned_vehicle	values ('A104',	TO_DATE('20/09/2022' , 'DD/MM/YYYY'), 'V107' , 'D110');
insert into assigned_vehicle    values ('A105',	TO_DATE('25/10/2022' , 'DD/MM/YYYY'), 'V110' , 'D101');



insert into feed_back	values ('F101', 'jakson' , 'very good', 9 ,  'U105');
insert into feed_back	values ('F102', 'green' ,  'good' ,     6 ,  'U106');
insert into feed_back	values ('F103', 'adams' ,  'bad' ,      2 ,  'U107');


insert into trip	values ('T101', TO_DATE('27/08/2020' , 'DD/MM/YYYY'), 'rye' ,   'palo alto',  2000, 'U101', 'D105');
insert into trip	values ('T102', TO_DATE('29/08/2020' , 'DD/MM/YYYY'), 'stamford','salt lake', 3000, 'U103', 'D101');
insert into trip	values ('T103', TO_DATE('07/09/2020' , 'DD/MM/YYYY'), 'brooklyn','woodside',  6000 , 'U110', 'D107');


insert into payment	values ('P101',  'Bkash' , 'T101');
insert into payment	values ('P102',  'cash'  , 'T102');
insert into payment	values ('P103',  'rocket', 'T103');




